
PFont font;
float x = 0;
float y = 0;
float a = 0;
float b = 0;
float c = 0;
float d = 255;
float angle = 0.0;
 

 
void setup () {
  size (800, 500, P3D);
  smooth ();
  x = 250; y = 250;
  background (0);
}
 
void draw () {
  
  c = random (1, 100);
  font = createFont ("bambu", 20);
  pushMatrix();
  translate(a, b, c);
  textFont (font, 30);
  textAlign (CENTER);
  text ("M E L", mouseX, mouseY);
  popMatrix();
   
   pushMatrix();
  translate(mouseX, mouseY);
  rotate(angle);
  fill(random(255));
  textSize(random(50));
  text("M E L", random(50), random(50));
  angle += 0.01;
  popMatrix();
  translate(mouseX, mouseY);
  rotate(angle);
  fill(random(250));
  textSize(random(10));
  text("Spin", random(20), random(20));
  angle -= 0.5;
}




