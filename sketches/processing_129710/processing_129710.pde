
//Samantha Chiu copyright 2014 hw#3
float x, y;  
float w, h;
float easingCoef; 
float cx;
float cy;
float diameter;
float xdist, ydist;
float r, g, b;

void setup()
{
  size (400,400);
  smooth ();
 background (179,162,203,10);
  easingCoef = .5;
  cx = x/2;
  cy = y/2;
  frameRate(7);
}


void draw()
{
//  x= mouseX;
//  y= mouseY;
  w= width - mouseX;
  h= height - mouseY;
  xdist = mouseX - x;
  ydist = mouseY - y;
  x = x +xdist*easingCoef;
  y = y + ydist*easingCoef;
  diameter = x*.45;
 
  //random colours
  r = random(0,255);
  g = random(0,255);
  b = random(0,255);
  

  fill (r,g,b,100);
  stroke (g,r,b,100);
  strokeWeight ((random (0,10)));
  ellipse(x,y, diameter, diameter);
  

} 
//press mouse to draw quads
  void mousePressed(){
  stroke (100, 200);
  fill(random(255), random(255), random(255), 50);
  quad(random(0,400), random(0,400), random(0,400), random(0,400),g, w, h, xdist);
  

}

//change background colour by pressing any key
void keyPressed(){
  background (r,g,b,200);
}


