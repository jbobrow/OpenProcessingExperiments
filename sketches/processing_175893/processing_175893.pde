
Lines[] candycane = new Lines[60];
 
void setup() {
  size(600, 600);
  smooth(); 
  noStroke(); 
 // stroke(random (0, 255), random (0, 255), random (0, 255), 50 );
 
  for (int i=0; i<candycane.length; i++) {
 
   candycane[i] = new Lines(i*.05, color(255));
  }
}
 
void draw() {
 
  background(250, 10,  26);
  for (int i=0; i<candycane.length; i++) {
 
    candycane[i].update();
    candycane[i].drawLines();
  }
}
 
 
class Lines
{
 
  float x;
  float w;
  float xover;
  color c;
 
 
 
  
  Lines(float xpos, color col) 
  {
 
    x = xpos;
    w = random(5, 25);
    c = col;
    xover = random(.05, 2);
     
   
  } 
 
  void update() {
    x+=xover;
    if (x>width) {
      x = -w;
    }
  }
  void drawLines() 
  {
    rect(x, 0, w, height);
  }
   }
