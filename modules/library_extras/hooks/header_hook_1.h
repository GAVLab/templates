

#include <map>

// define macro to pack structures correctly with both GCC and MSVC compilers
#ifdef _MSC_VER // using MSVC
  #define PACK( __Declaration__ ) __pragma( pack(push, 1) ) __Declaration__ __pragma( pack(pop) )
#else
  #define PACK( __Declaration__ ) __Declaration__ __attribute__((__packed__))
#endif