
float x = 0;
float geschwindigkeitX = random(8);

float y = 0;
float geschwindigkeitY = random(3);

float esize = 10;
 
float r = 200;
float g = 200;
float b = 200;

void setup() {
  size(200, 200);
  smooth();
  background(255);
}
void draw() {
  x = x + geschwindigkeitX;
  y = y + geschwindigkeitY;
  if (x > width || x < 0) {
    geschwindigkeitX = -geschwindigkeitX;
  }
  if  (y > height || y < 0) {
    geschwindigkeitY = -geschwindigkeitY;
    esize = random(50);
  }
   
   r = random (0,250);
   g = random (-10,50);
   b = random (70,180);
  
 // Display circle at x location
  noStroke();
  fill(r,g,b);
  ellipse(x, y, esize, esize);
  
  
}


