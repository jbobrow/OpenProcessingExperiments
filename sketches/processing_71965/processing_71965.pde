
void setup() {
  size(600, 600);
  fill(255);
  background(0);
  //5 frames a second
  frameRate(5);
}

//t this is the angle which we will change everytime one is dr
int t=0;
void draw() {
  
  ellipse(width/2, height/2, 10, 10);
  
  float x = 50 * cos(radians(t));
  float y = 50 * sin(radians(t));
  
  ellipse(width/2+x, height/2+y, 10, 10);
  t+=10;
}


