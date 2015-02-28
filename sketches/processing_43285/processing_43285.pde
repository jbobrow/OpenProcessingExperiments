
int xDiam = width/2;
int yDiam = height/2;
float xPosition = 250;
float yPosition = 250;
float speedA = 1.75;
int speedB = 3;
 PImage img;
 PImage img0;
void setup() {
  size(320,475); 
  img = loadImage("cross_eyed_boy_textmedium.jpg");
  img0 = loadImage("green-butterfly.png");
}
 
void draw() {
 image(img,0,0);
  fill(255);
  xPosition = xPosition + speedA;
  yPosition = yPosition + speedA;

 
  if(xPosition > 400) {
    speedA = -2;
  }
  else if(xPosition < 250) {
    speedA = 2;
  }
  if(yPosition > 400) {
    speedA = -2;
  }
  else if (yPosition < 250) {
    speedA = 2;
  }
  xDiam = xDiam + speedB;
  yDiam = yDiam + speedB;
  translate(20,20);
  image(img0,width/2, height/2, xDiam,yDiam);
 
  if(speedA > -2){
    speedB = -3;
  }
  else if(speedA < 2) {
    speedB = 3;
  }
}


