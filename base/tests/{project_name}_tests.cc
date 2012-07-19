#include "gtest/gtest.h"

// Allow universal access to classes
#define private public
#define protected public

#include "{project_name}/{project_name}.h"
using namespace {project_name};

TEST(GenericTest, ConstructorTest) {{
  {project_name_camel} my_{project_name};
}}

int main(int argc, char **argv) {{
  try {{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
  }} catch (std::exception &e) {{
    std::cerr << "Unhandled Exception: " << e.what() << std::endl;
  }}
  return 1;
}}