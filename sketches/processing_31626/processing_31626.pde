
void setup() {
  size(400,400);
}

void draw() {
 background(255);
 
 strokeWeight(15);
 line(width/2, 0, width/2, height);
 line(0, height/2, width, height/2);
 
 strokeWeight(5);
 line(0, 0, width, height);
 line(0, height, width, 0);
  
}

