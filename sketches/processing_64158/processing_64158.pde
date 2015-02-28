
import guicomponents.*;
import fisica.*;

GWSlider sdr1, sdr2, sdr3, sdr4, sdr5, sdr6, sdr7,  friction;
FWorld world;
float backgrounder = 256;
int stage = 1;
GLabel GravityLabel;
GLabel instructions;
GLabel Author;
float mainSize = 40;
int maxBoxes = 1;
float Gravity;
float Friction;

void setup() {
  stage = 1;
  size(400, 400);
  smooth();
  GravityLabel = new GLabel(this, "Gravity", 60, 36, 260, 5);
  Author = new GLabel(this, "Written By Ali Cooper", 36, height-25, 260, 5);
  if (stage == 1) {
    Fisica.init(this);
    world = new FWorld();
    world.setEdges();
    world.remove(world.top);
    sdr1 = new GWSlider(this, 25, 25, 260); 
    friction = new GWSlider(this, width-30, height-350, 20); 
    friction.setValueType(GWSlider.INTEGER);
    sdr1.setLimits(0f, 1000f, 90f);
    friction.setLimits(0f, 1000f, 0f);
    sdr1.setPrecision(1);
  }
}
void draw() {  
  background(backgrounder);
  world.step();
  world.draw();
  world.setGravity(0, Gravity);
  Gravity = sdr1.getValue();
  Friction = friction.getValue();
}
void contactResult(FContact contact) {
  // Draw in green an ellipse where the contact took place
  fill(0, 170, 0);
  //ellipse(contact.getX(), contact.getY(), 20, 20);
}
void keyPressed() {
//  instructions = new GLabel(this, "left and right arrow keys create boxes and circles while slider controls gravity and you can move them around with your mouse", 60, 36*2, 260, 200);
//  instructions = new GLabel(this, "", 60, 36*2, 260, 200);
        initializedStuff();
  if (key == 'c'){
      world.clear();
      world.setEdges();
      world.remove(world.top);
  
  }
}


