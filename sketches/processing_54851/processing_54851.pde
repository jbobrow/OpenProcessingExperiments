
// 마우스따라다니기
void setup() {
  size(400,400);
  frameRate(20);
  smooth();
  noStroke();
}
 
 
float dotX = 2000;
float dotY = 2000;
 
void draw() {
  float R = random(256);
  float G = random(256);
  float B = random(256);
  background(R,G,B);
 
  dotX = (mouseX-dotX)/7 + dotX;
  dotY = (mouseY-dotY)/7 + dotY;
  ellipse(dotX+100,dotY+20,20,20);
  ellipse(dotY,dotX,30,30);
  ellipse(dotY+100,dotX+100,10,10);
  ellipse(30,dotX,30,30);
  ellipse(50,dotY,30,30);
  ellipse(dotY,30,30,30);
  ellipse(dotX,30,50,50);
  ellipse(dotX,dotY+10,30,30);
  ellipse(dotX+150,dotY,30,30);
 
 
}


