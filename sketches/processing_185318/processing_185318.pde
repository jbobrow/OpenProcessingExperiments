

void setup() {  
  size(500, 500);
  background(0);
  }
  
void draw() {
  float x = width/4;
  float y = height/4;
  fill(150, 250, 200, 17);
  rect(0, 0, x, y);
  rect(0, x, x, y);
  rect(0, 2*x, x, y);
  rect(0, 3*x, x, y);
  rect(x, 0, x, y);
  rect(2*x, 0, x, y);
  rect(3*x, 0, x, y);
  rect(3*x, 3*x, x, y);
  rect(3*x, 2*x, x, y);
  rect(3*x, x, x, y);
  rect(2*x, 3*x, x, y);
  rect(x, 3*x, x, y);
   
  fill(random(250), random(250), random(250), random(250));
  rect(x, x, x, y);
  rect(x, 2*x, x, y);
  rect(2*x, x, x, y);
  rect(2*x, 2*x, x, y);
  
  if (key == 's' && keyPressed == true) {
    fill(0);
    rect(0, 0, 4*x, 4*x);
    
  }
  
  
  }

