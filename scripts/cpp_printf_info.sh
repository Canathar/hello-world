#!/bin/sh

# Create a temporary file
binary=$(mktemp)

# Use the following HERE document to generate source code to feed into the compiler
# Compiler Options:
#     -m -- Compilation time build machine bit size (23 or 64)
#     -o -- Binary output file
#     -x -- Source language (c or c++ for our uses)
#     -  -- Use stdin for the source of the compilation (instead of a file)
cat <<-EOF | g++ -m64 -o $binary -x c++ -
#include <limits.h>
#include <math.h>
#include <stdio.h>
#include <stdint.h>
int main()
{
   printf("       Conversion Specifiers For printf In g++ For This Platform (see: man 3 printf - search for specifiers)\n");
   printf("==================================================================================================================\n");
   printf("\n");
   printf("                      Description                       Specifier                        Example\n");
   printf("   ------------------------------------------------   ------------    -----------------------------------------\n");
   printf("                                              char        (%%c)          %c\n", 'z');
   printf("------------------------------------------------------------------------------------------------------------------\n");
   printf("                                            string        (%%s)          %s\n", "Cool Beans");
   printf("------------------------------------------------------------------------------------------------------------------\n");
   printf("      signed short int (displayed in decimal base)    (%%hi or %%hd)     %hi to %hi\n", SHRT_MIN, SHRT_MAX);
   printf("------------------------------------------------------------------------------------------------------------------\n");
   printf("    unsigned short int (displayed in decimal base)       (%%hu)          %hu to %hu\n", 0, USHRT_MAX);
   printf("------------------------------------------------------------------------------------------------------------------\n");
   printf("            signed int (displayed in decimal base)     (%%i or %%d)      %i to %i\n", INT_MIN, INT_MAX);
   printf("------------------------------------------------------------------------------------------------------------------\n");
   printf("          unsigned int (displayed in decimal base)        (%%u)          %u to %u\n", 0, UINT_MAX);
   printf("------------------------------------------------------------------------------------------------------------------\n");
   printf("       signed long int (displayed in decimal base)    (%%li or %%ld)     %li to %li\n", LONG_MIN, LONG_MAX);
   printf("------------------------------------------------------------------------------------------------------------------\n");
   printf("     unsigned long int (displayed in decimal base)       (%%lu)          %lu to %lu\n", 0, ULONG_MAX);
   printf("------------------------------------------------------------------------------------------------------------------\n");
   printf("         signed double (displayed in Eng notation)     (%%e or %%E)      %e\n", -atan(1) * 4);
   printf("------------------------------------------------------------------------------------------------------------------\n");
   printf("         signed double (displayed in decimal base)      (%%.17g)        %.17g\n", -atan(1) * 4);
   printf("------------------------------------------------------------------------------------------------------------------\n");
   printf("    signed long double (displayed in decimal base)      (%%.21Lf)       %.21Lf\n", static_cast<long double>(-atan(1) * 4));
   printf("------------------------------------------------------------------------------------------------------------------\n");
   printf("\n");
}
EOF

# Display the target type of the executable
echo
echo "Binary File Is Compiled For The Following"
echo "========================================="
file $binary | sed -r 's/.*:(.*)/\1/' | awk -F ',' '{print $1 $2}'
echo

# Execute the compiled binary
$binary

# Remove the compiled binary
rm $binary

