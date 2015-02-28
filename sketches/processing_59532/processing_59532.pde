
/**
 * Noise1D. 
 * 
 * Using 1D Perlin Noise to assign location. 
 */
 
float xoff = 0.0;
float xincrement = 0.01; 
float xoff2 = 0.5;
float xincrement2 = 0.02; 

void setup() {
  size(800,200);
  background(0);
  frameRate(30);
  smooth();
  noStroke();
}

void draw()
{
  // Create an alpha blended background

  
  //float n = random(0,width);  // Try this line instead of noise
  
  // Get a noise value based on xoff and scale it according to the window's width
 
  
  // With each cycle, increment xoff
  xoff += xincrement;
  xoff2 += xincrement2;
  
   float n = noise(xoff)*width;
  float n2 = noise(xoff2)*height;
  
  
  fill(200 + n, 15);
  ellipse(n,n2,13,7);
  ellipse(n + 15,n2,13,7);
  fill(10, 25);
  ellipse(n,n2,5,5);
  ellipse(n + 15,n2,5,5);
  
}



