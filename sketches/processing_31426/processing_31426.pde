
/*
The prime factors of 13195 are 5, 7, 13 and 29.
 What is the largest prime factor of the number 600851475143 ?
 */


int n = 60;
int d = 2;
int r = 0;

void setup()
{
  while(n >= d)
  {
  r = n % d;
  if(r == 0 && isPrime(d))
  {
  //println(d);
  }
  d++;
  }
}

boolean isPrime(int a)
{
boolean b = true;
int r = 0;

for(int i = 2; i < n; i++)
{
r = a % i;
println(a + " % " + i + " = " + r);
if(r == 0)
{
break;
b = false;
println(a + "is not a prime.");
}
}
return b;
}               
