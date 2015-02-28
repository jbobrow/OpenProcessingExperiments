
//zeinab Haidar digital computation studio
//reference monstrous moonshine 'moving shower tiles' http://openprocessing.org/visuals/?visualID=1753
float iter; 
int bg; 
int xdiv; 
int ydiv; 
int r; 
 
void setup() { 
  bg = 17; 
  background(bg); 
  size(400,600); 
  noStroke(); 
  smooth(); 
  colorMode(HSB, 147, 64, 64); 
  fill(55, 100, 100, 100); 
  iter = 0; 
  xdiv = width / 10; 
  ydiv = height / 10; 
  r = int(xdiv * 0.99); 
} 
 
void draw() { 
  background(bg); 
  iter += 0.02; 
  int xpos = 0; 
  int ypos = 0; 
  for(int y = 0; y < ydiv; y++) { 
    ypos =  y * ydiv; 
    for(int x = 0; x < xdiv; x++) { 
      xpos = y % 2 == 0 ? x * xdiv + int(r / 2) : x * xdiv;       
      int b = 100; 
      int h = 150 + int(noise(x + iter, y + iter) * 100); 
      int s = 66 + int(noise(x - iter, y - iter) * 50); 
      int grow = int((2 * r * (noise(x, y) * 2 - 1)) * sin(iter * 2)); 
      fill(h , s, b, 57); 
     rect(xpos, ypos, r + grow, r + grow); 
      ellipse(xpos, ypos, r + grow, r + grow);
    } 
  } 
} 

