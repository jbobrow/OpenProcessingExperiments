
int x1 = 250;
int y1 = 250;
 
void setup() {
  size(500, 500);
  background(255);
  stroke(10);
  strokeWeight(10);
 
  point(x1,y1);
 
  strokeWeight(.5);
}
 
void draw() {
  
  line(x1,y1,random(0,500),random(0,500));
}

