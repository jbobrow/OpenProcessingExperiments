
PImage img; 
int mysize = 50;
float xpos = 250;
float ypos = 200;

void setup(){
  img=loadImage("fog.JPG");
  size(425,275);
  smooth();
  noStroke();
  colorMode (HSB, 255);
}

void draw(){
  image(img, 0,0);
fill (255,40);
ellipse(xpos, ypos, mysize, mysize);
xpos = xpos + (mouseX - xpos)/20;
}

void mouseMoved(){
  if (mouseX < width/2){
    mysize = mysize + 2; }
}


