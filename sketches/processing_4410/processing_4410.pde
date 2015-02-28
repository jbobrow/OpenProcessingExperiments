
//Nikolina Borak- Architectural Computing-ARCH1391-Module Two

//inspired by ancientsoundby josé henrique padovani 
//http://www.openprocessing.org/visuals/?visualID=3831 


int w=792,z=99;

void setup()
{background(255);//background different from 0-255
size(w,w);} 

 //instead of noStroke stroke was added to allow extra squares to be drawn when mouse clicked


void draw(){ 

//mousepressed added to make the sketch interactive


if (mousePressed){ 
  stroke(110,193,16); 
}else { 
  stroke (0);} 
  rect (100,100, 0,0); 
rotate(r(.04));rect(i(),i(),z,z);}  

// the rest of the code is the same but instead of rotation by 8 its 10
//to create more rotated squares.

float r(float a)
{return random(-a,a);}float i(){return int(r(10))*z;}  
 


