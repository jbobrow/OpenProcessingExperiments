
//tomas de camino
//simple fibonacci number generator
//basis for homework

int fib =2;
int fibAnt=1;

void setup() {
  size(300, 300);
  textAlign(CENTER);
}

void draw() {
  frameRate(1);//so you can see the numbers
  background(255);
  textSize(68);
  fill(232, 153, 255, 166);
  text(fib, width/2, height/2);
  //next fibonacci number
  fib+=fibAnt;
  fibAnt=fib;
  /*set a top limit since integers 
  can only hold numbers <=2,147,483,647
  this case resets at 1000*/ 
  if (fib>1000 ) {
    fib =2;
    fibAnt=1;
  }
}
