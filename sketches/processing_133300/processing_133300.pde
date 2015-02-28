
void setup() {
  size(500,50);
}

float x = 1;

void draw() {
  
  background(100);
  
  x = x+1;
  ellipse(x,10,10,10);

  // this won't work :(
  for (int x2 = 1; x2<width; x2++) {
    ellipse(x2,20,10,10);
  } 
}
