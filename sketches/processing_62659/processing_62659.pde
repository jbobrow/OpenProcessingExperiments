
float x = 0;
float geschwindigkeitX = random(3);

float y = 0;
float geschwindigkeitY = random(3);


 
void setup() {
  size(200, 200);
  smooth();
  background(255);
}
void draw() {
   background(255);
  x = x + geschwindigkeitX;
  y = y + geschwindigkeitY;
  if (x > width || x < 0) {
    geschwindigkeitX = -geschwindigkeitX;
  }
  if  (y > height || y < 0) {
    geschwindigkeitY = -geschwindigkeitY;

  }
   
  
  
 // Display circle at x location
 stroke(0);
  fill(175);
  ellipse(x, y, 23, 23);
  
  
}


