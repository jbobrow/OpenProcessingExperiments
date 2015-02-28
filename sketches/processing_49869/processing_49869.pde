
float Redval = 192; // background red
float Grnval = 64;  // background green
float Bluval = 0;   // background blue
color MyColor;

void setup() {
  size(600, 400);
  MyColor = color(Redval, Grnval, Bluval);
  smooth();
  noStroke();
}

void draw() {
  background(#ffffcc);
  pushMatrix();
  translate(width/2, height/2);
  fill(MyColor);
  drawStar();
  popMatrix();
  
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(TWO_PI * frameCount/800);
  fill(MyColor);
  drawStar();
  popMatrix();
}

void drawStar() {
  int numSpokes = 100;
  for (int i=0; i<numSpokes; i++) {
     float t0 = map(i, 0, numSpokes-1, 0, TWO_PI);
     float t1 = t0 + (TWO_PI/(2*numSpokes));
     arc(0, 0, 1000, 1000, t0, t1);
  }
}

void mouseMoved() {
   Redval = map(mouseX, 0, 599, 0, 255);
   Grnval = map(mouseY, 0, 399, 0, 255);
   MyColor = color(Redval, Grnval, Bluval);
}

void mouseDragged() {
   updateBlueValue();
}

void mouseClicked() {
   updateBlueValue();
}

void updateBlueValue() {
   if (mouseButton == LEFT) {
      Bluval = map(mouseX, 0, 599, 0, 255);
   } else {
      Bluval = 0;
   }
   MyColor = color(Redval, Grnval, Bluval);
}             
                                
