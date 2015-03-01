
int r;
float x, y;
ValueThread[] threads;
int threadCount;
int wait;

void setup()
{
  size(640, 480);
  background(0);
  
  threadCount = 15;
  threads = new ValueThread[threadCount];
  
  for(int i=0; i<threadCount; i++) {
    threads[i] = new ValueThread(i+1, "V"+i);
  }
}

void draw() {
  frameRate(10);
  background(0);
  //clear();
  int radius;
  for(int i=0;i<threadCount; i++) {
    radius = threads[i].getR();
    brushCircle(threads[i].getX(), threads[i].getY(), radius);
    threads[i].nextR();      
  }
}

void brushCircle(float x,float y, int r) {
  float red = map(x, 0, width, 0, 255);
  float blue = map(y, 0, width, 0, 255);
  float green = dist(x,y,width/2,height/2);
 
  
  strokeWeight(2);
  fill(green, blue, red, 100);
  stroke(red, green, blue, 255);
  ellipse(x,y,r,r);
  return;
}

class ValueThread {
 int wait; //wait before changing values
 float x, y; // center of circle
 int r; //radius of circle
 String name; //name of thread
 boolean running; //if thread is running
 int addition; //value to increment
 
 ValueThread(int rd, String s) {
   addition = rd;
   name = s;
   r = 5;
   x = random(550);
   y = random(450);
 }
 
 int getR() {
   return r;
 }
 
 float getX() {
   return x;
 }
 
 float getY() {
   return y;
 }
 
 void nextR() {
   r = r+addition;
   if(r >= 150) {
     r = 5;
     x = random(550);
     y = random(450);
   }
   return;
 }  
}

