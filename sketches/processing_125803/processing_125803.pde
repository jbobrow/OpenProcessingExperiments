
// Left mouse button to save a screenshot, right mouse button to reset
// 1 for red mode, 2 for green mode, 3 for blue mode, 4 for random mode

int Xmax = 640;
int Ymax = 480;
int originX = Xmax/2;
int originY = Ymax/2;
float hue = 0;
float cRadius = random(10,40);
int s = 0;
float cMode = 1;

void setup() {
  size(Xmax,Ymax);
  background(random(255));
  colorMode(HSB,360,100,100);
  stroke(random(360),100,100);
  fill(random(360),100,100,192);
  ellipse(originX,originY,cRadius,cRadius);
}

void draw() {
    float x = random(Xmax);
    float y = random(Ymax);
    float radius = random(10,50);
    setColor();
    if (cMode == 1) {
      stroke(random(0,60),100,100);
      fill(random(0,60),100,100,192);
      ellipse(x,y,radius,radius);
      stroke(random(0,60),100,100);
      strokeWeight(random(1,5));
      line(originX,originY,x,y);
    }
    if (cMode == 2) {
       stroke(random(90,145),100,100);
       fill(random(90,145),100,100,192);
      ellipse(x,y,radius,radius);
      stroke(random(90,145),100,100);
      strokeWeight(random(1,5));
      line(originX,originY,x,y);
    }
    if (cMode == 3) {
      stroke(random(180,260),100,100);
      fill(random(180,260),100,100,192);
      ellipse(x,y,radius,radius);
      stroke(random(180,260),100,100);
      strokeWeight(random(1,5));
      line(originX,originY,x,y);
    }
    if (cMode == 4) {
      stroke(random(360),100,100);
      fill(random(360),100,100,192);
      ellipse(x,y,radius,radius);
      stroke(random(360),100,100);
      strokeWeight(random(1,5));
      line(originX,originY,x,y);
  }
  if (mousePressed && (mouseButton == LEFT)) {
    saveFrame("frame-##.png");
  }
  if (mousePressed && (mouseButton == RIGHT)) {
    setup();
  }
}  
  
void setColor() {
 if (keyPressed && (key == '1')) {
   cMode = 1;
 }
 if (keyPressed && (key == '2')) {
   cMode = 2;
 }
 if (keyPressed && (key == '3')) {
   cMode = 3;  
 }
 if (keyPressed && (key == '4')) {
   cMode = 4;
 }

}

