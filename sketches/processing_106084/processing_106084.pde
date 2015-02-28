

void setup() {
size(600, 600);
}

void draw() {
  background(0);
  int s = second();  
  int m = minute();  
  int h = hour();    
  
  
  fill(200, 30, 40);
  ellipse(m, width/2, m, 300);
  fill(255);
  ellipse(h, width/2, h, 400);
  fill(0, 255, 0);
  ellipse(s, width/2, s, 50);
}


