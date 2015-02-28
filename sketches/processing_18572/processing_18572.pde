
float y = 0.0;
float x= 0.0;
void setup() {
  size(250, 250);
  background(#000000);
  stroke(#45EACB);
  noFill();
}
void draw(){
  frameRate(80);
  rect(x, y, 20, y);  
  rect(x, 25, 30, y);
  rect(x, 50, 40, y);

}

void mouseMoved() {
  y = y + 1; 
  x= x + 2;
}


