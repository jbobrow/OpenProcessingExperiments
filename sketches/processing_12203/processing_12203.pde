
Zoog zoog1;
Zoog zoog2;

float x = 150;
float y = 100;
 
void setup() {
  size(400,400);
  smooth();
  zoog1 = new Zoog(75,135,40,40,10,random(255),random(255),random(255));
  zoog2 = new Zoog(150,270,80,80,20,random(255),random(255),random(255));
}
 
void draw() {
  background(255);
  // mouseX position determines speed factor
  float factor = constrain(mouseX/10,0,5);
  float d = dist(x,y,mouseX,mouseY);
  color c = color(d);
  zoog1.jiggle(factor);
  zoog1.display(c);
  zoog2.jiggle(factor);
  zoog2.display(c);
}
 
void mousePressed() {
  setup();
}
 
class Zoog {
  // Zoog's variables
  float x,y,w,h,eyeSize,bodyColor1,bodyColor2,bodyColor3;
   
  // Zoog constructor
  Zoog (float tempX, float tempY, float tempW, float tempH, float tempEyeSize, float tempBodyColor1, float tempBodyColor2, float tempBodyColor3) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    eyeSize = tempEyeSize;
    bodyColor1 = tempBodyColor1;
    bodyColor2 = tempBodyColor2;
    bodyColor3 = tempBodyColor3;
  }
 
  // Move Zoog
  void jiggle(float speed) {
    // Change the location of Zoog randomly
    x = x + random(-2,2)*speed;
   
    // Constrain Zoog to window
    x = constrain(x,0,width-2);
    y = constrain(y,0,height-2);
  }
 
  // Display Zoog
  void display(color eyeColor) {
    // Set ellipses and rects to CENTER mode
    ellipseMode(CENTER);
    rectMode(CENTER);
   
    // Draw Zoog's arms with a for loop
    for (float i = y - h/3; i < y + h/2; i += 10) {
      stroke(0);
      line(x-w/4,i,x+w/4,i);
    }
   
    // Draw Zoog's body
    stroke(0);
    fill(bodyColor1,bodyColor2,bodyColor3);
    rect(x,y,w/6,h);
   
    // Draw Zoog's head
    stroke(0);
    fill(255);
    ellipse(x,y-h,w,h);
   
    // Draw Zoog's eyes
    fill(eyeColor);
    ellipse(x-w/3,y-h,eyeSize,eyeSize*2);
    ellipse(x+w/3,y-h,eyeSize,eyeSize*2);
   
    // Draw Zoog's legs
    stroke(0);
    line(x-w/12,y+h/2,x-w/4,y+h/2+10);
    line(x+w/12,y+h/2,x+w/4,y+h/2+10);
  }
}


