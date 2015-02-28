
import guicomponents.*;
import fisica.*;

GWSlider sdr1, sdr2, sdr3, sdr4, sdr5, sdr6, sdr7;
FWorld world;

int stage;
GLabel GravityLabel;
GLabel Author;
float mainSize = 40;
int maxBoxes = 1;
float Gravity;

void setup() {
  stage = 1;
  size(400, 400);
  smooth();
  GravityLabel = new GLabel(this, "Gravity", 60, 36, 260, 5);
  Author = new GLabel(this, "Written By Ali Cooper", 36, height-25, 260, 5);
  if (stage == 1){
  Fisica.init(this);
  world = new FWorld();
  world.setEdges();
  sdr1 = new GWSlider(this,25,25,260); 
  sdr1.setValueType(GWSlider.INTEGER);
  sdr1.setLimits(0f, 1000f, 0f);
  sdr1.setPrecision(1);
}
}
void draw() {  
  background(255);
  world.step();
  world.draw();
  world.setGravity(0,Gravity);
  Gravity = sdr1.getValue();
}
void contactPersisted(FContact contact) {
   // Draw in green an ellipse where the contact took place
   fill(0, 170, 0);

   //ellipse(contact.getX(), contact.getY(), 20, 20);
 }
void keyPressed(){
  initializedStuff();
}


