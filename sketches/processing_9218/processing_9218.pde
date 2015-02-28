
int y=0;

void setup () {
  size (200,200);
  background(0);
  frameRate(5);
}
void draw () {
  //draw a line
  stroke(255);
  line(0,y,width,y);
  //increment y!
  y += 10;
}








/*
int count=0;

void setup () {
  size (200,200);
}
void draw () {
  count = count +1;
  background(count);
 
}
*/

