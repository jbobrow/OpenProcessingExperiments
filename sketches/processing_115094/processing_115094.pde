
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

void setup() {
  size(700, 600);
  photo = loadImage("apartment03.jpg");
  noStroke();
  x2=0;
  y2=560;
  m=0;
  mono=loadFont("AmericanTypewriter-Bold-20.vlw");
}

void draw() {
  photo.resize(700, 600);

image(photo,0,0,700,600);
  copy(mouseX-50, mouseY-50, 100, 100, 450, 350, 250, 250);


  if (mousePressed) {
    {
       background(0);
     for (y=0; y<=photo.height; y+=6) {
    for (x=0; x<=photo.width;x+=6) {
      pix=photo.get(x, y);
      /*if (pix != color(0, 0, 0)) {
       noStroke();*/
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
    }
  }

  


  /*if (keyPressed) {
   if (key==' ');
   {
   photo.filter(BLUR, m);
   m+=4;
   }
   }*/
}



