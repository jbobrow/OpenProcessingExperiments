
//direction
int k = 1;

//velocity
float dx1 = 10;
float dx2 = 7.5;
float dx3 = 5;
float dx4 = 3.85;
float dx5 = 1.2;
float dx6 = 5;

//tree x-integers
float x1 = 400;
float x2 = 400;
float x3 = 400;
float x4 = 400;
float x5 = 400;
float x6 = 400;

//tree y-integers
float y1 = 500;
float y2 = 400;
float y3 = 340;
float y4 = 300;
float y5 = 280;
float y6 = 340;

//functions

void draw_background () {
  int x = 20;
  //SUN
noStroke ();
fill (220);
ellipse (400, 35, 100, 100);
  //MOUNTAIN
noStroke ();
fill (180);
rect (-20, 150, 820, 520);
  //HILLS
while (x <= 880) {
  triangle (x-40, 150, x, 100, x+40, 150);
  x = x + 80;
  } 
}

void draw_planes () {
  //PLANES OF FEILD
noStroke ();
fill (160);
rect (0, 520, 800, 245);
//fill (140);
//rect (0, 520, 800, 300);
fill (100);
rect (0, 520, 800, 325);
fill (60);
rect (0, 520, 800, 385);
}

void draw_tree (float x, float y, float c) {
  noStroke ();
  fill (c);
  triangle (x-25, y, x, y-30, x+25, y);
  triangle (x-20, y-20, x, y-50, x+20, y-20);
  if (mousePressed) {
    fill (0, 100);
  ellipse (x,y+5,50, 10);
  }
}

void draw_woods (float y, float c) {
  fill (c);
  draw_tree (100, y, c);
  draw_tree (200, y, c);
  draw_tree (300, y, c);
  draw_tree (400, y, c);
  draw_tree (500, y, c);
  draw_tree (600, y, c);
  draw_tree (700, y, c);
}



///////SETUP

void setup (){
  size (800, 520);
  smooth ();
  background (255);
}

//////DRAW 

void draw (){
  ellipseMode (CENTER);
  rectMode (CORNERS);
  draw_background ();
  draw_tree (200, 400, 90);
  
if (keyPressed == true) {
   draw_woods (400, 90);
}  

if (mousePressed && (mouseButton == RIGHT)) {
   if ((x1+dx1)>600||(x1+dx1)<200) {
    k = k*-1;
  }
  x1 = x1+dx1 *k;
  x2 = x2+dx2 *k;
  x3 = x3+dx3 *k;
  x4 = x4+dx4 *k;
  x5 = x5+dx5 *k;
draw_planes();  
  //tree
draw_tree (x5, y5, 170);
//draw_tree (x4, y4, 120);
draw_tree (x3, y3, 130);
draw_tree (x2, y2, 80);
draw_tree (x1, y1, 30);
}

if ( mousePressed  &&  ( mouseButton == LEFT)){
  if ((x6+dx6)>475||(x6+dx6)<325) {
    k = k*-1;
  }
  x6 = x6+dx6 *k;
draw_planes();  
  //tree
draw_tree (x6, y6, 80);
}


}
