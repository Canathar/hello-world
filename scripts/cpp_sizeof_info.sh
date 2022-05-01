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
#include <stdio.h>
int main()
{
   printf("     Sizes Of Types In g++ For This Platform\n");
   printf("=================================================\n");
   printf("           void* %3lu byte(s) - %3lu bits\n", sizeof(void*), sizeof(void*) * 8);
   printf("-------------------------------------------------\n");
   printf("           char  %3lu byte(s) - %3lu bits\n", sizeof(char), sizeof(char) * 8);
   printf("-------------------------------------------------\n");
   printf("          short  %3lu byte(s) - %3lu bits\n", sizeof(short), sizeof(short) * 8);
   printf("-------------------------------------------------\n");
   printf("            int  %3lu byte(s) - %3lu bits\n", sizeof(int), sizeof(int) * 8);
   printf("-------------------------------------------------\n");
   printf("           long  %3lu byte(s) - %3lu bits\n", sizeof(long), sizeof(long) * 8);
   printf("-------------------------------------------------\n");
   printf("      long long  %3lu byte(s) - %3lu bits\n", sizeof(long long), sizeof(long long) * 8);
   printf("-------------------------------------------------\n");
   printf("         double  %3lu byte(s) - %3lu bits\n", sizeof(double), sizeof(double) * 8);
   printf("-------------------------------------------------\n");
   printf("    long double  %3lu byte(s) - %3lu bits\n", sizeof(long double), sizeof(long double) * 8);
   printf("-------------------------------------------------\n");
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

