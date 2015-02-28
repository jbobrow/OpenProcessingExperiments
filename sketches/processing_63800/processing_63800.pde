

float x = 0;
float geschwindigkeitX = random(5);
 
float y = 0;
float geschwindigkeitY = random(8); 
  
  
void setup() {
  size(400,400);
  smooth();
  background(200,0,0);
}


void draw() {
  x = x + geschwindigkeitX;
  y = y + geschwindigkeitY;
  if(x > width || x < 0) {
    geschwindigkeitX = -geschwindigkeitX;
  }
  if(y > height || y < 0) {
    geschwindigkeitY = -geschwindigkeitY;
  }


  // Display circle at x location
  noStroke();
  fill(222,222,222,20);
  ellipse(x,y,70,70);
  
}

