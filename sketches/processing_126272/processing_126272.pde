
//Will run until stopped!
//Plots each number n according to the function in getNumLoc
//Default uses polar coordinates n |-> (sqrt(n), n)
//Also, Red and Green for primes of form 4k+1 and 4k-1 -- It's Christmas time!
float scale = 1;
void setup() {
  size(700, 700);
  background(0);
}
int num = 6;
void draw() {
  translate(width/2, height/2);
  noStroke();
  fill(255);
  if (isPrime(num-1))
   plotNum(num-1);
  else if (isPrime(num+1))
    plotNum(num+1);
  num += 6;
}

void plotNum(int n){
    if(n%4 == 1)
      fill(255,0,50);
    else
      fill(100, 255, 0);
    PVector loc = getNumLoc(n);
    ellipse(loc.x, loc.y, 2, 2); 
}

PVector getNumLoc(int p) {
  float theta = scale*p;
  float rad = sqrt(scale*p);
  return new PVector(rad*cos(theta), rad*sin(theta));
}



boolean isPrime(int p)
{
  if (p<2)
    return false;
  if (p == 2 || p == 3)
    return true;
  if (p%2 == 0 || p%3 == 0)
    return false;
  int maxcheck = floor(sqrt(p))+1;
  for (int f = 6; f<maxcheck; f += 6) {
    if (p%(f-1) == 0 || p%(f+1)==0) //Uses the fact that all primes are one more or one less than a multiple of 6 (past 2, 3)
      return false;
  }
  return true;
}

