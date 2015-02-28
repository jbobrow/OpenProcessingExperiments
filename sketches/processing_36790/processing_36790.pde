
void setup() {
  size(400, 400);
  smooth();
  noStroke();
}
void draw() {
  
  float mX = mouseX / 400.0;  
  float x = random (200 - 200 * mX,mX*200+200);
  float y = random (200 - 200 * mX,mX*200+200);
  
  float r = random(128 - mX * 128,128 + mX * 127);
  float b = random(128 - mX * 128,128 + mX * 127);
 
  fill(r,b,r);
  ellipse (x,y, 50,50);
  fill(b,b,r);
  ellipse (y,x,30,30);
   
  fill (255, 255, 255, (1-mX)*20);
  rect (0,0,400,400);
 
}
