#include "types.h"
#include "user.h"

int main(void) {
  int zomb_prog_count = getzombcount();
  printf(1, "zombie processes count: %d\n", zomb_prog_count);
  exit();
}
