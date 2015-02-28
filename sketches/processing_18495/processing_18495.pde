
void setup() {
  size(250, 250);
  background(173, 146, 160);
  noStroke();
  frameRate(30);	
}

int a = 0;

void draw() {
 
stroke(183, 6, 38);
rect(a++%250, 100, 0, 10); 

stroke(183, 6, 38);
rect(10, 0, 100, a++%100);
}

