
float[] x = new float[1983];
/*xsize = random*12;
ysize = random*12;
*/
void setup() 
{ 
  size(500, 500); 
  smooth(); 
  noStroke(); 
  fill(#fff600, 200); 
  
  for (int i = 0; i < x.length; i++) 
  {
x[i] = random(-1000, 200);
  }
}

void draw() 
{ 
  background(0); 
  
  for (int i = 0; i < x.length; i++) 
  {
    x[i] += 0.5; 
    
    float y = i * 0.4; 
    arc(x[i], y, 12, 12, 0.52, 5.76);
}
}

