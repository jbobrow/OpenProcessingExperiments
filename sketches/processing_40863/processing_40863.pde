
/**
 * HAHA by bArt
 */

PloingA arm;
PloingH arm2;
PloingA arm3;
PloingH arm4;


void setup() 
{
  size(210, 90);
  smooth();
  arm = new PloingA(30, 2*height/3, 0.01);
 arm2 = new PloingH(80, 2*height/3, 0.01);
  arm3 = new PloingA(130, 2*height/3, 0.01);
    arm4 = new PloingH(180, 2*height/3, 0.01);
}

void draw() 
{

  background(242,230,10);
 
   strokeWeight(0);

 arm.update();
   arm.display();
 
    arm2.update();
   arm2.display();
 
    arm3.update();
   arm3.display();

       arm4.update();
   arm4.display();
}

class Bounce 
{
  float x, y, speed;
  float angle = 0.0;
  Bounce(float xpos, float ypos, float s) {
    x = xpos;
    y = ypos;
    speed = s;
  }
  void update() {
    angle += speed;
  }
}

class PloingA extends Bounce 
{
  PloingA(float x, float y, float s) {
    super(x, y, s);
  }
  void display() {
        pushMatrix();
    translate(x, y);
    strokeWeight(0);
      fill(15,14,36);
      rect(-20,-50,40,60);
      
      strokeWeight(0);
      fill(242,230,10);
      rect(-10,-10,20,20);
   
    strokeWeight(0);
      fill(242,230,10);
speed = 0.19;
   
    angle += speed;
     
      rect(-10,cos(angle)*8-45,20,20);
      
    popMatrix();
  }
}
class PloingH extends Bounce 
{
  PloingH(float x, float y, float s) {
    super(x, y, s);
  }
  void display() {
        pushMatrix();
    translate(x, y);
    strokeWeight(0);
      fill(15,14,36);
      rect(-20,-50,40,60);
      
      strokeWeight(0);
      fill(242,230,10);
      rect(-10,-10,20,20);
   
    strokeWeight(0);
      fill(242,230,10);
speed = 0.13;
   
    angle += speed;
     
      rect(-10,cos(angle-3.14)*8-45,20,20);
      
    popMatrix();
  }
}

