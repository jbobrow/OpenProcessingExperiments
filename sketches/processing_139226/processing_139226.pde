
// this random function is slightly attracted towards the middle
// Cc Aw, March 14
Bug myBug;
void setup() {
  size(300,300);
  background(255);
  myBug=new Bug();
}

void draw() {
  myBug.move();
  fill(255,10);noStroke();
  rect(0,0, width, height);
}

class Bug {
  int x=width/2;
  int y=height/2;
  int speed=18;
  Bug() {
  }
 
 void move() {
   int oldx=x;
   int oldy=y;
   x=x + myRandom(speed, x-width/2);
   y=y + myRandom(speed, y-height/2);
   stroke(0);
   line(x,y,oldx,oldy);
 }
 
 int myRandom(float upper) {
   int mr=int(random(-upper, upper));
   return mr;
 }
 
 int myRandom(float upper, float sigma) {
   // overload, 2 params
   float factor=.2*sigma/width; 
   int mr=int(random(-upper*(1+factor), upper*(1-factor)));
   random(-upper, upper);
   //println(factor);
   return mr;
 }
  
}
