


float y;
float x;
 

void setup() {
  size(500, 500);  
  strokeWeight(5);
  stroke(random(0,255),random(0,255),random(0,255));     
  //noLoop();
  
  y = height * 0.5;
  x = width * 0.5;
}


void draw() { 
  background(0);   
  line(0, y, width, y);  
  line(x, 0, x, height);

  x = x - 1;
  if (x < 0) {
    x = width;
  }
  y = y - 1; 
  if (y < 0) { 
    y = height; 
  }
 

} 

void mousePressed() {
  //loop();
  stroke(random(0,255),random(0,255),random(0,255));     
}


