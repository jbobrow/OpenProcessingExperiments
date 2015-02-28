
//isla hansen   ihansen@andrew.cmu.edu
//Homework 4
//copyright 2012
//Press any letter key to make pizza.
//Press CONTROL to throw on the cheese.
//Drag (& right click) the mouse to melt the cheese.
//Click the mouse (right) over and over to watch the
//melty cheese slide off the pizza.

//Press SHIFT to watch the mouth eat the pizza. (THIS WON'T WORK ON openPROCESSING... only out of processing folder with loaded img mouth2.jpg)

float x, y, r, g, b, c, m, p, i;
PImage img;

void setup()
{
  size (400,400);
  smooth();
 
  x=200;
  y=200;
  r=225;
  g=215;
  b=200;
  
  c=0.01;
  m=1;
  p=-100;
  i=300;
  img = loadImage("mouth2.jpg");
 
  background(225,215,200);
 
}

void draw() {
  if (keyPressed == true) {
    fill(200,0,0);
    r=200;
    g=0;
    b=0;
  } else {
    fill(225,215,200);
    r=225;
    g=215;
    b=200;
  }
  if (key == CODED) {
    if (keyCode == CONTROL) {
      r=240;
      g=230;
      b=0;
    }
  }
  if (key == CODED){
    if (keyCode == SHIFT) {
      //mouth image drags accross bottom 
      p=frameCount%height;
      i=350;
    }
  }
 
  image(img, p, i);
  
  noStroke();
  triangle(.2*x, .2*y,.6*x,.2*y,.4*x,.6*y);
  triangle(.8*x,.2*y,1.2*x,.2*y,x,.6*y);
  triangle(1.4*x,.2*y,1.8*x,.2*y,1.6*x,.6*y);
  triangle(.5*x,.8*y,.9*x,.8*y,.7*x,1.2*y);
  triangle(1.1*x,.8*y,1.5*x,.8*y,1.3*x,1.2*y);
  triangle(.8*x,1.4*y,1.2*x,1.4*y,x,1.8*y);
 
 
  fill(r,g,b);
  //triangle 1 cheese
   ellipse(.3*x,(.25*y)+m,c*x,c*y);
   ellipse(.4*x,(.25*y)+m,c*x,c*y);
   ellipse(.5*x,(.25*y)+m,c*x,c*y);
   ellipse(.35*x,(.35*y)+m,c*x,c*y);
   ellipse(.45*x,(.35*y)+m,c*x,c*y);
   ellipse(.4*x,(.45*y)+m,c*x,c*y);
   //triangle 2 cheese
   ellipse(.9*x,(.25*y)+m,c*x,c*y);
   ellipse(x,(.25*y)+m,c*x,c*y);
   ellipse(1.1*x,(.25*y)+m,c*x,c*y);
   ellipse(.95*x,(.35*y)+m,c*x,c*y);
   ellipse(1.05*x,(.35*y)+m,c*x,c*y);
   ellipse(x,(.45*y)+m,c*x,c*y);
   //triangle 3 cheese
   ellipse(1.5*x,(.25*y)+m,c*x,c*y);
   ellipse(1.6*x,(.25*y)+m,c*x,c*y);
   ellipse(1.7*x,(.25*y)+m,c*x,c*y);
   ellipse(1.55*x,(.35*y)+m,c*x,c*y);
   ellipse(1.65*x,(.35*y)+m,c*x,c*y);
   ellipse(1.6*x,(.45*y)+m,c*x,c*y);
   //triangle 4 cheese
   ellipse(.6*x,(.85*y)+m,c*x,c*y);
   ellipse(.7*x,(.85*y)+m,c*x,c*y);
   ellipse(.8*x,(.85*y)+m,c*x,c*y);
   ellipse(.65*x,(.95*y)+m,c*x,c*y);
   ellipse(.75*x,(.95*y)+m,c*x,c*y);
   ellipse(.7*x,(1.05*y)+m,c*x,c*y);
   //triangle 5 cheese
   ellipse(1.2*x,(.85*y)+m,c*x,c*y);
   ellipse(1.3*x,(.85*y)+m,c*x,c*y);
   ellipse(1.4*x,(.85*y)+m,c*x,c*y);
   ellipse(1.25*x,(.95*y)+m,c*x,c*y);
   ellipse(1.35*x,(.95*y)+m,c*x,c*y);
   ellipse(1.3*x,(1.05*y)+m,c*x,c*y);
   //triangle 6 cheese
   ellipse(.9*x,(1.45*y)+m,c*x,c*y);
   ellipse(x,(1.45*y)+m,c*x,c*y);
   ellipse(1.1*x,(1.45*y)+m,c*x,c*y);
   ellipse(.95*x,(1.55*y)+m,c*x,c*y);
   ellipse(1.05*x,(1.55*y)+m,c*x,c*y);
   ellipse(x,(1.65*y)+m,c*x,c*y);
   
   
}

void mouseDragged()
{
  c = c+0.005;
  if (c > 0.7){
    c = 0.01;
  }
}

void mouseReleased() {
  m = m+1;
  if (m>80){
    m = 1;
  }
}
