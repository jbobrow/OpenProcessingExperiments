
import processing.video.*;
Capture myCapture;
PImage C1;
int x,y,prevX,prevY;
float angle,easing;
float inc = 0;

void setup() 
{
  size(640, 480, P2D);
  myCapture = new Capture(this, width, height, 30);
  smooth();
  float myFill = noise(inc)*255;
  inc+=01;
    noiseDetail(8);
  for(int i = 0; i < 100000; i++) {
    x = int(random(width));
    y = int(random(height));
  }
  prevX = x;
  prevY = y;
}
void captureEvent(Capture myCapture) {
  myCapture.read();
}

void draw() {
  image(myCapture, pmouseX, 0);
  tint(33,22,mouseX);
  filter(INVERT);
  filter(BLUR);
}
{
  if (keyPressed == true) {
    image(myCapture,0,0);
  }
}
    

void mouseClicked() {
  for(int x= 0; x < width; x+=10){
    for(int y = 0; y < height; y+=10){
      strokeWeight(0.1);
      if(mouseX > x && mouseX < x+10 && mouseY > y && mouseY < y+10){
        fill(255,10);
  float speedX = abs(mouseX-pmouseX);
  for(int i = 0;i < speedX; i++){
    strokeWeight(random(255));
    ellipse(mouseX,mouseY,i*2,i);
    fill(random(255),random(255),random(255));
  }
      }
      }
  }
    }


