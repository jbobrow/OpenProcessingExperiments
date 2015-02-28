
PImage hotTub;
int i;


void setup() {
  size(640, 640);
  smooth();
  hotTub = loadImage("HotTub.jpeg");
  image(hotTub, 0, 0);
  
}

void mousePressed() {
 int mX1 = int(mouseX + random(10, 0));
 int mY1 = int(mouseY + random(0, 10));
 int mX2 = int(mouseX + random(0, 10));
 int mY2 = int(mouseY + random(0, 20));
  mX1 = constrain(mX1, 0, width);
  mY1 = constrain(mY1, 0, height);
  mX2 = constrain(mX2, 0, width);
  mY2 = constrain(mY2, 0, height); 
  PImage crop = hotTub.get(mX1, mY1, mX2, mY2);
      image(crop, mX1, mY1);
      image(crop, mX2, mY2);
      
      
}

void draw() {
  for(i=0; i<height; i++) {
  mousePressed();
  }
}




