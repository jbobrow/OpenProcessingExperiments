
/*

Washing Machine
Daria Lanz
daria@darialanz.com
June 2009
*/

float x = 300;
float y = 75;
float w = 250;
float h = 300;
float machineSize = 16;

void setup() {
  size(700,400);
  smooth();
};

void draw() {
  background(#B3E8FF);
  
  //mouseX position determines speed factor for moveMachine function
  float factor = constrain(mouseX/10, 0, 5);
  jiggleMachine(factor);
  
  //color
  float d = dist(x,y,mouseX,mouseY);
  color c = color(d);
  drawMachine(c);
  
};

void jiggleMachine (float speed) {
  
  //Change x and y location of machine randomly
  x = x + random(-1,1)*speed;
  y = y + random(-1,1)*speed;
  
  //constrain machine to window
  x = constrain(x,0,width);
  y = constrain(y,0,height);
  
};

void drawMachine (color machineColor) {
  
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //Washing Machine
  stroke(0);
  fill(255);
  
  rect(x,y+150,w,h);
  fill(230);
  rect(x,y,w,h/6);
  //Washing Machine Buttons
  fill(200);
  ellipse(x+90,y,30,30);
  ellipse(x+50,y,30,30);
  rect(x-90,y,30,20);
  //Washing Machine door
  fill(50);
  ellipse(x,y+160,190,190);
  fill(machineColor);
  ellipse(x,y+160,140,140);
  
};

