
/*
Project Euler problem number 3:
The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?

Solved successfully on the first attempt on 29 July 2011.
I was the 98391st person to have solved this problem.

This is a prime division algorithm.
 */


int n = 600851475143;  // The given number (the dividend)
int d = 2;  // Divisor; initially 2 (the smallest prime)

void setup()
{
  pd(n); // Calls the function, i.e. divides n into prime numbers
}

// This function recursively divides n into prime factors
// The prime factors appear in order of increasing size
void pd(int n)
{
  while (n > 1 && n >= d) // Execute until n is divided into a prime number:
  {
    if (n%d == 0) // If n is divisible by d,
    {
      println(n + " = " + n/d + " * " + d);
      n = n / d;  // take the quotient
      pd(n);      // as the dividend in the next iteration.
      break;
    }
    else          // If n is not divisible by d,
    {
      d++;        // increase d by 1 and reiterate.
    }
  }
}
                                                
