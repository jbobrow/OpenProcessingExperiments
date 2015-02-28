
/* @pjs preload= "apartment03.jpg"; */
PImage photo;
int x;
int y;
color pix;
float pointillize = 6;
float x2;
float y2;
float m;
PFont mono;
float c;

void setup() {
  size(700, 600);
  photo = loadImage("apartment03.jpg");
  noStroke();
  x2=0;
  y2=560;
  m=0;
  c=0.25;
  mono=loadFont("AmericanTypewriter-Bold-20.vlw");
  photo.resize(700, 600);
  image(photo, 0, 0, 700, 600);
}

void draw() {
pix=photo.get(mouseX, mouseY);
  copy(mouseX-50, mouseY-50, 100, 100, 450, 350, 250, 250);
  fill(pix);
   textFont(mono);
  textSize(50);
  text("Click to snow!", 350, 60);
  noFill();
}

void mousePressed() {
  background(255); 
  fill(pix);
  textFont(mono);
  textSize(25);
  text("It's snowing...", width/2, height/2);
  c+=0.5;
  strokeWeight(c);
}

void mouseReleased() {
  {
    background(0);
    image(photo, 0, 0, 700, 600);
    for (y=0; y<=photo.height; y+=6) {
      for (x=0; x<=photo.width;x+=6) {
        pix=photo.get(x, y);
        fill(pix);
        stroke(255);
        ellipse( x, y, pointillize, pointillize);
      }
    }
  }
  }
  void keyPressed() {
    if (key=='c');
    c=0;
  }
