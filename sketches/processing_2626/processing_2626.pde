
/**
 * lineas nika. 
 * 
 * cambiar una variable para crear una linea.  
 */
 
float a = 300;

void setup() 
{
  size(500,500);
  stroke(255);
}

void draw() 
{
  background(0);
  a = a - 2;
  if (a < 0) { 
    a = height; 
  }
  rect(0, a, width,a);  
}

