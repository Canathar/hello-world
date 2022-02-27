/*
 * utility.cpp
 *
 *  Created on: Feb 27, 2022
 *      Author: jlaccone
 */

#include <stdio.h>

#include "utility.h"


// Declarations necessary for processing arguments/options
extern char *optarg;
extern int optind, opterr, optopt;


namespace Utility
{

   bool processCommandLine(int32_t& argc, char* argv[])
   {
      // Function return value
      bool pclRtn = true;

      // The option that was provided
      int32_t opt = 0;

#ifdef DEBUG
      cout << msg << ": We have command line arguments" << endl;

      for (int i = 1; i < argc; i++)
      {
         cout << "Argument " << i << ": " << argv[i] << endl;
      }
#endif

      // Define the short options the program will accept
      const char* short_opts = "h";

      // Define the long options the program will accept
      const struct option long_opts[] =
      {
         // Option: help
         {"help", no_argument, NULL, 1},

         // The last option MUST be null
         {NULL, 0, NULL, 0}
      };

      // Process the provided options/arguments
      while ((opt = getopt_long(argc, argv, short_opts, long_opts, NULL)) != STANDARD_LINUX_ERROR)
      {
         switch (opt)
         {
            case 1:
            case 'h':
            {
               cout << "Help" << endl;
               break;
            }

            case '?':
            default:
            {
               printf ("Unable to process unknown option\n");
               pclRtn = false;
               break;
            }
         }
      }

      return pclRtn;
   }
}
