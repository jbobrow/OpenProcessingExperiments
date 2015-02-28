
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/51935*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PImage b;
PFont latha48;
void setup() {
    b = loadImage("mixing.jpg");
  size(310,240);
  smooth();
  latha48 = loadFont("Latha-48.vlw");
}

void draw() {
  background(255);
  float ease = .5;
  int a = 1;
  a += (mouseX - a) * ease;
  fill(0);
  textFont(latha48,25+a);
  textAlign(3,7);
   

    image(b, 0, 0);
    
  pushMatrix();
  translate(width/2,height/2);
  rotate(radians(millis()/3));
  text("mixing",4,4);
  textFont(latha48,20+a);
  fill(162,69,17);
  text("mixing",4,4);
  popMatrix();
}


