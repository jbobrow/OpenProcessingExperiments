
float x = 0;
float geschwindigkeitX = 8;
 
float y = 0;
float geschwindigkeitY = 43;
 
float grosse = 10;
  
float r = 1000;
float g = 1000;
float b = 1000;
 
void setup() {
  size(100, 666);
  smooth();
  background(22);
}
void draw() {
  x = x + geschwindigkeitX;
  y = y + geschwindigkeitY;
  if (x > width || x < 0) {
    geschwindigkeitX = -geschwindigkeitX;
  }
  if  (y > height || y < 0) {
    geschwindigkeitY = -geschwindigkeitY;
    grosse = random(66);
  }
    
   r = random (0,255);
   g = random (70,255);
   b = random (70,180);
   
  noStroke();
  fill(r,g,b);
  rect(x, y, grosse, grosse);
  ellipse(x, y, grosse, grosse);
   
   
}


