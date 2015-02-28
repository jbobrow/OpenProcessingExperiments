
float r;
float g;
float b;
float a;
float diam;
float x;
float y;

int mouseX=80;
int mouseY=100;

int circleX=420;
int circleY=400;

void setup(){
  size(500,500);
  
  smooth();

}
void draw(){
 background(49,120,198);
  //Draw fish a's body
  fill(245,226,171,255);
  stroke(0);
  frameRate(8);
  ellipse(mouseX,mouseY,50,40);
  mouseX=mouseX+1;
 
  //Draw fish a's tail
  fill(245,226,171,255);
  stroke(0);
  frameRate(8);
  ellipse(mouseX-35,mouseY,20,20);
  mouseX=mouseX+1;
  
  
  //Draw fish a's eye
  fill(0);
  frameRate(8);
  ellipse(mouseX+10,mouseY,3,3);
  mouseX=mouseX+1;
  
  //Draw fish b's body
  fill(185,75,68,255);
  stroke(0);
  ellipse(circleX,circleY,50,40);
  circleX=circleX-1;
  
  //Draw fish b's tail
  fill(185,75,68,255);
  stroke(0);
  ellipse(circleX+35,circleY,20,20);
  circleX=circleX-1;
  
  
  //Draw fish b's eye
  fill(0);
  ellipse(circleX-10,circleY,3,3);
  circleX=circleX-1;
  
  // Fill all variables with random values
  r = random(0);
  g = random(0);
  b = random(255);
  a = random(150);
  diam = random(250);
  x = random(width);
  y = random(height);
  // Use values to draw an ellipse
  noStroke();
  fill(r,g,b,a);
  frameRate(4);
 
  ellipse(x,y,diam,diam);
  
  


}


