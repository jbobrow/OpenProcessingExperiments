
//Homework 7 - 60-257
// copyright Eric Mackie September 2011 Pittsburgh, PA 15221
float xPos=width/2, yPos=height/2, dia, deltaX, deltaY;
void setup() {
  size(700, 700);
}

void draw() {
  background(255);
  pidgImage();
  birdMove();
  chooseSpeed();
  showSpeed();
}

void pidgImage() {
  dia = 200;
  PImage pidg;
  imageMode(CENTER);
  pidg = loadImage("p2.png");
  image(pidg, xPos, yPos, dia, dia);
}

void birdMove() {
  xPos=xPos+deltaX;
  yPos=yPos+deltaY;
  if ((xPos - dia/2)>width){
    xPos = -1*dia/2;
  }
  if ((xPos+dia/2)<0){
    xPos=width + dia/2; 
  }
  if ((yPos - dia/2)>height){
    yPos = -1*dia/2;
  }
  if ((yPos+dia/2)<0){
    yPos=height + dia/2;
  }
}


void chooseSpeed(){
 
  deltaX = map(mouseX,0,width, -20,20);
  deltaY = map(mouseY,0,height, -20, 20);
}  

void showSpeed(){
  fill(0);
  textAlign(CENTER);
  text("Horizontal Speed =" + deltaX, width/2, 19*height/20);
  text("Vertical Speed =" + deltaY, width/2, 39*height/40);
}

void keyPressed(){
  deltaX=0;
  deltaY=0;
  xPos=width/2;
  yPos=width/2;
}

