
float xLast;
float yLast;
boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;
  
  
void setup() {
  size(600, 600);
  smooth();
  background(0);
  frameRate(15);
}

void draw()  {
   ellipseMode(CENTER);
   noStroke();
   fill(200, 100);
  ellipse(mouseX-30, mouseY-30, 150, 150);
  ellipse(mouseX-10, mouseY-10, 30, 30);
  ellipse(mouseX+40, mouseY+40, 20, 20);
  ellipse(mouseX-100, mouseY-100, 10, 10);


}

