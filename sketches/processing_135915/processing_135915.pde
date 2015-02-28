
int x;
void setup(){
  background (255,255,255);
  size(400,400); 
  fill(0,50); 
  stroke(0,0,0,10); 
  //noStroke(); 
  smooth();
}
void draw(){ //background(255);
}
void mouseMoved() {
  float r=random(400);
  for (int i=0; i<400; i+=10) {
    line(i,r,mouseX,400-i);
  }
}
