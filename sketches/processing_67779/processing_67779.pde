
float a = 300;
float b = 300;
float c = 300;
void setup() 
{
  

  size (1000, 1000);
  stroke(0);
  smooth();
}
void draw () {
  background (255);
  
  fill (255);
  ellipse (200, 200, 200, 200); // head
 
fill (random (1,255), random(1,255), random(1,255), random(1,255));
ellipse (150, 150, 50, 50); // left eye 

fill (random (1,255), random(1,255), random(1,255), random(1,255));
ellipse (225, 150, 50, 50); // right eye




line (160, 260, 190, 260); // torse
  
  line (220, 300, 220, 500); // mouth
  
   b = b - 3.9;
   if (b < 250)
   b = 340;
  line (220,300,320,b); // right arm
  
  a = a - 3.9;
  if (a < 250)
   a = 340;
line (220,300,90,a); // left arm

fill (0,0,255);
rect (0,320,1000,1000); // ocean


}





