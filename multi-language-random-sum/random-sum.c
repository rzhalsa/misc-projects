/* random-sum.c
 *
 * Randomly selects two numbers between 0 and 1000, adds them, and prints out the sum
 * Author: Ryan McHenry
 */

#include <stdlib.h>  // srand(), rand()
#include <time.h>    // time()

int random_sum() {
    const int max = 1000;
    srand(time(NULL));
    return (rand() & (max + 1)) + (rand() & (max + 1));
}