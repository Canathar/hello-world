
#include "utility.h"


int main (int argc, char* argv[])
{
   // Function return value
   int32_t mainRtn = Utility::STANDARD_LINUX_SUCCESS;

   // Common message
   string msg = "Hello World";

   if (argc > 1)
   {
      // We have command line options/arguments, process them
      if (Utility::processCommandLine(argc, argv) == false)
      {
         mainRtn = Utility::STANDARD_LINUX_ERROR;
      }
   }
   else
   {
      cout << msg << endl;
   }

   return mainRtn;
}

