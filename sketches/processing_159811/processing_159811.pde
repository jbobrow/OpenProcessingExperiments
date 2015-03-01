
void setup()
{
  size(640, 360);

 }

void draw()
{
  background(50, 100, 250);
  int x; // x-translation constant
  x = mouseX;
  int y; // y-translation constant
  y = mouseY;
  

  float a = 5; // x-scale factor
  float b = a; //  y-scale factor, in this case equal to x to maintain proportionality   

  fill(255);
  stroke (0);
  strokeWeight(6);
  ellipse((0.1*a)+x,(2.5*b)+y,2*a,2*b); // monkey's ears

  fill(255);
  stroke (0);
  strokeWeight(6);
  ellipse((9*a)+x,(2.5*b)+y,2*a,2*b); // monkey's ears
  
  fill(0);
  ellipse((4.5*a)+x,(2.5*b)+y,9*a,5*b); // Monkey's head's hair

  fill(0);
  ellipse((4.5*a)+x,(6.5*b)+y,4.5*a,4.5*b); // Monkey's beard
 


  fill(255);                  // Monkey's face
  stroke(102);
  strokeWeight(1);
    beginShape();
    vertex((1*a)+x,(3*b)+y);
    vertex((1*a)+x,(2*b)+y);
    vertex((2*a)+x,(1*b)+y);
    vertex((3*a)+x,(1*b)+y);
    vertex((4*a)+x,(2*b)+y);
    vertex((5*a)+x,(2*b)+y);
    vertex((6*a)+x,(1*b)+y);
    vertex((7*a)+x,(1*b)+y);
    vertex((8*a)+x,(2*b)+y);
    vertex((8*a)+x,(3*b)+y);
    vertex((7*a)+x,(4*b)+y);
    vertex((5*a)+x,(5*b)+y);
    vertex((6*a)+x,(6*b)+y);
    vertex((6*a)+x,(7*b)+y);
    vertex((5*a)+x,(8*b)+y);
    vertex((4*a)+x,(8*b)+y);
    vertex((3*a)+x,(7*b)+y);
    vertex((3*a)+x,(6*b)+y);
    vertex((4*a)+x,(5*b)+y);
    vertex((2*a)+x,(4*b)+y);
    vertex((1*a)+x,(3*b)+y);
  endShape();                 

fill(0);
ellipse((3.5*a)+x,(4*b)+y,0.5*a,0.7*b); // monkey's eyes

fill(0);
ellipse((5.5*a)+x,(4*b)+y,0.5*a,0.7*b); // monkey's eyes

fill(0);
noStroke();
ellipse((4.2*a)+x,(5.5*b)+y,0.1*a,0.3*b); // Monkey's nose

fill(0);
noStroke();
ellipse((4.8*a)+x,(5.5*b)+y,0.1*a,0.3*b); // Monkey's nose

fill(250,0,0);
arc((4.5*a)+x,(6.5*b)+y, 2*a, 2*b, 0, PI, CHORD);
}










