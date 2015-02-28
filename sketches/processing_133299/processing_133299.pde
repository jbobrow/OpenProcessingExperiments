
void setup() {
  size(500,500);
  rect(100,100,100,100);
}

void draw() {

  float x = random(width);
  float y = random(height); 
  ellipse(x,y,10,10);
  
}
