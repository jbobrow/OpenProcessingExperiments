
Boolean PJ; // choose variavle PJ

void setup() {
  size (300, 300);
  background (255);
  smooth();
  colorMode (HSB, width); //Colormode HSB 300 as 100%
  PJ = false; // PJ is flase for conditional situation
}
int x = 0; // Integer x is variavle for color
int a = 0; // 1st rectangle's size variation  
int b = 0; // 2nd rectangle's size variation 
int c = 0; // 3rd rectangle's size variation 
int d = 0; // 4th rectangle's size variation 
//Equally divide the screen into four sections, and each square is getting bigger   
void draw() {
  rectMode (CENTER); //center on the each section
  strokeWeight (6); //outline of squares  
  fill (300-x, width, width); // colorscale starts from the end 

  rect (width/4, 3*height/4, a, a);
  a++; // growing up
  if (a > 300) {
    a=300;// limitation of the rectangle size
  }  
  strokeWeight (5);
  rect (width/4, height/4, b, b);
  b++; // growing up
  if (b > 150) {
    b=150;// limitation of the rectangle size
  }
  strokeWeight (4);
  rect (3*width/4, 3*height/4, c, c);
  c++; // growing up
  if (c > 300) {
    c=300;// limitation of the rectangle size
  }
  strokeWeight (3);
  rect (3*width/4, height/4, d, d);
  d++; // growing up
  if (d > 300) {
    d=300;// limitation of the rectangle size
  }
  x++; //color change

  if (mouseX > width/4) {
    rectMode (CORNER);
    strokeWeight (1);
    fill (50, width, width); // fill the withe  
    rect (0, 0, width/4, height/2);
    fill (200, width, width); // fill the withe
    rect (width/4, 3*height/4, 3*width/4, height);
  } 
  else {
    rectMode (CORNER);
    fill (300); // fill with the white 
    rect (width/4, 0, 3*width/4, 3*height/4);
  }
}


