
/* @pjs preload= "m.jpg"; */
PImage photo;
int x;
int y;
color pix;
float pointillize = 6;
float x2;
float y2;
float m;
PFont mono;

void setup() {
  size(600, 600);
  photo = loadImage("m.jpg");
  imageMode(CENTER);
  noStroke();
  x2=0;
  y2=560;
  m=0;
  mono=loadFont("AmericanTypewriter-Bold-20.vlw");
}

void draw() {
  photo.resize(600, 600);
  background(0);
  
  
  for (y=0; y<=photo.height; y+=6) {
    for (x=0; x<=photo.width;x+=6) {
      pix=photo.get(x, y);
      fill(pix);
      if (dist(mouseX, mouseY, x, y)<=3) {
        pointillize=100;
      }
      else {
        pointillize=6;
      }
      ellipse( x, y, pointillize, pointillize);
    }
  } 
  fill(0);
      textFont(mono);
      textSize(60);
      text("Click!",width/40,height/8);
  
  if (mousePressed) {
    pix=photo.get(mouseX, mouseY);
    background(0); 
    for (y=50; y<=photo.height-50; y+=100) {
    for (x=50; x<=photo.width-50;x+=100) {
      fill(pix+150);
      noStroke();
      ellipse(x,y,75,75);
      fill(255);
      textFont(mono);
      textSize(25);
      text("m",x-10.5,y+8);
      }
    }
  }
  
  
  if (keyPressed) {
    if (key==' ');
    {
      photo.filter(BLUR, m);
      m+=4;
    }
  }
}

