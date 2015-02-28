
int x =0;

void setup() {
  size(100,100);
}


void draw() {
  background(200);
  x = x + 1;
  translate(50,50);
  
  rotate(radians(x));
  translate(-50,-50);
  
  rect(50,50,20,20);
}

