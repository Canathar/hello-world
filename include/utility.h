/*
 * utility.h
 *
 *  Created on: Feb 27, 2022
 *      Author: jlaccone
 */

#ifndef INCLUDE_UTILITY_H_
#define INCLUDE_UTILITY_H_

#include <bits/stdint-intn.h>
#include <bits/stdint-uintn.h>
#include <getopt.h>
#include <iostream>
#include <unistd.h>


using std::cout;
using std::endl;
using std::string;

namespace Utility
{
   // ---------- Constants ----------

   // Common Linux error return value
   const int32_t STANDARD_LINUX_ERROR = -1;

   // Common Linux success return value
   const int32_t STANDARD_LINUX_SUCCESS = 0;


   // ---------- Methods ----------

   bool processCommandLine(int32_t& argc, char* argv[]);
}


#endif /* INCLUDE_UTILITY_H_ */
