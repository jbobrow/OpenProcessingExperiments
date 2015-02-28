
//Emily Rose 
//Assignment 3
//September 23, 2010
//erose@brynmawr.edu

float r ;
float g ;
float b ;
float a ;  
 
float x ;
float y ;
float w ; 
float h ;

void setup () {
  size(500,500) ;
  background (0) ;
  smooth () ; 
}

void drawMyRect () {
  
  
  r = random(255) ;
  g = random(255) ;
  b = random(255) ;
  a = random(255) ;
  
  x = random(width) ;
  y = random(height) ; 
  w = random(10,100) ; 
  h = random(10,100) ;
  
  noStroke () ;
  fill (r,g,b,a) ;
 rect (x,y,w,h); 
 
}
  void draw () {
  drawMyRect() ;
   if (keyPressed) {
    background (0) ; 
     noFill() ;
    rect (0,0, 499,499) ;
    fill (r,g,b,a) ;
    quad(mouseX,mouseY,mouseX-50,mouseY-50,mouseX-100,mouseY,mouseX-50,mouseY+150);
  }
  if (mousePressed) {
    background(255) ;
    noFill() ;
    rect (0,0, 499,499) ;
    fill (r,g,b,a) ;
    quad(mouseX,mouseY,mouseX-50,mouseY-50,mouseX-100,mouseY,mouseX-50,mouseY+150);
     
  }
  
  }

