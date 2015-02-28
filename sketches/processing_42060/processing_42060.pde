
Ripple ripple1;

void setup() {
  size(600,600);
  background(0);
}
  
  void draw(){
    ripple1.age();
    ripple1.display();
  }
  
  void mousePressed() {
   ripple1 = new Ripple(mouseX,mouseY);
  }
  
  //see page 159 in "Learning Processing" - is this how I would achieve this?
class Ripple {
  float x;
  float y;
  float w;
  color c;
  float fade;
  
  Ripple(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    w = 0;
    fade = 255;
    c = color(random(255), random(255), random(255));
  }
  
  void age(){
    fade--;
    w++;
  }    
    
  void display(){
    noFill();
    stroke(c, fade);
    ellipse(x,y,w,w);
  }
}


