
float a = 100;

void setup() 
{
  
    PImage b;
b = loadImage("skullface.jpg");

/*style of line*/

  size(300, 300);
  strokeWeight (30);
  stroke(255,220,100);
  

  
    
}

void draw() 
{
  background(0);
  a = a - 50; /*speed set at very high level to create the pulse effect*/ 
  if (a < 6) { 
    a = height; 
  }
  line(0, a, width, a);  
}

