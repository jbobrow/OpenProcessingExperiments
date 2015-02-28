
/**
 * Noise1D. 
 * 
 * Using 1D Perlin Noise to assign location. 
 */
 
float xoff = 0.0;
float xincrement = 0.02; 
float xoff2 = 0.5;
float xincrement2 = 0.01; 

void setup() {
  size(800,200);
  background(0);
  frameRate(20);
  smooth();
  noStroke();
  
}

void draw()
{fill(0, 10);
rect(0, 0, width, height);
eyes(100, 100, 80, 8);}

 void eyes(float x, float y, int radius, int level)

{
  
   float n = noise(xoff)*width;
  float n2 = noise(xoff2)*height;
  
  xoff += xincrement;
  xoff2 += xincrement2;
  
  
  

  
  
  
  float tt = 126 * level/6.0;
  fill(tt, 153);
  ellipse(n, n2, radius*2, radius*2);      
  if(level > 1) {
    level = level - 1;
    int num = int(random(2, 6));
    for(int i=0; i<num; i++) {
      float a = random(0, TWO_PI);
      float xoff = n + cos(xincrement) * 6.0 * level;
      float xoff2 = n2 + sin(xincrement2) * 6.0 * level;
      eyes(xoff, xoff2, radius/2, level);
  
    }
  
    }

}



