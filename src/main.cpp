#include <iostream>

using std::cout;
using std::endl;
using std::string;

int main (int argc, char* argv[])
{
   string msg = "Hello World";

   if (argc > 1)
   {
      cout << msg << ": We have command line arguments" << endl;

      for (int i = 1; i < argc; i++)
      {
         cout << "Argument " << i << ": " << argv[i] << endl;
      }
   }
   else
   {
      cout << msg << endl;
   }

   return 0;
}

