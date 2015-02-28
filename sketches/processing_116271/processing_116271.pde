
/* @pjs preload= "arrow.png, arrow2.png"; */
float x;
float y;
float easingX = 0.05;
float easingY = 0.03;
PImage arrow;
PImage arrow2;
int w = 70;
int h = 48;
float d = 24;

void setup() {
  size(720,480);
  smooth();
  x = width/2;
  y = height/2;
  //frameRate(500);
  strokeWeight(2);
}
 
void draw(){
  if (mousePressed){
    background(0,139,92);
    fill(190,89,57);
  } else{
    background(190,89,57);
    fill(0,139,92);
  }
  float targetX = mouseX;
  float targetY = mouseY;
  if (mouseX>x) {
    x += (targetX - x) * easingX;
  }
  if (mouseX<x) {
    x -= (x - targetX) * easingX;
  }
  if (mouseY>y) {
    y += (targetY - y) * easingY;
  }
  if (mouseY<y) {
    y -= (y - targetY) * easingY;
  }
  
  rect(x, 0, 10, height);
  rect(0, y, width, 10);
  if ((mouseY>y-2) && (mouseY<y+2) && (mouseX>x-2) && (mouseX<x+2)){
        w = 20;
        h = 12;
        d = 6;
    } else if ((mouseX>x-2) && (mouseX<x+2)){
        w = 40;
        h = 30;
        d = 15;
    } else {
        w = 70;
        h = 48;
        d = 24;
    }
  if (mouseX > width/2){
    arrow = loadImage("arrow.png");
    image(arrow, mouseX-w+6, mouseY-d+6, w,h);
  } else {
    arrow2 = loadImage("arrow2.png");
    image(arrow2, mouseX+4, mouseY-d+6, w, h);
    }
   
}


