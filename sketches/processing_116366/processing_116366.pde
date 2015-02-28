
float r; 
 
void setup() {
  size(800, 350);
  smooth();
  r=random(0, 255);
}
 
void draw() {
  background(255);
 
  dresser(70, 120, 30);
  dresser(100, 0, 100);
  dresser(250, -100, 50);
  dresser(320, 0, 60);
  dresser(460, -100, 40);
  dresser(540, 0, 80);
  dresser(480, 120, 40);
  dresser(275, 120, 50);
   
 
}
 
void dresser(float x, float y, float c) {
  pushMatrix();
  translate(x, y);
//dresser
  beginShape();
  rect(0, 0, 190, 100);
  fill(random(255), random (255), random (255));
  rect(10,10, 50,10);
  ellipse(35,15,3,3);
  rect(10,30, 50,20);
  rect(10,60, 50,20);
  rect(70,10, 50,10);
  ellipse(95,15,3,3);
  rect(70,30, 50,20);
  rect(70,60, 50,20);
  rect(130,10, 50,10);
  ellipse(155,15,3,3);
  rect(130,30, 50,20);
  rect(130,60, 50,20);
  popMatrix();
}



