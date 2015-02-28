

float x = 0;
float geschwindigkeit = 2;
  
  
void setup() {
  size(1200,400);
  smooth();
  background(200,0,0);
}


void draw() {
  x = x + geschwindigkeit;
  if(x > width || x < 0) {
    geschwindigkeit = geschwindigkeit * -1;
  }


  // Display circle at x location
  noStroke();
  fill(222,222,222,40);
  ellipse(x,random(height),20,170);
  
}

