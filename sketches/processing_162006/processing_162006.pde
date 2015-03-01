
void setup(){
  size(578,572);
  background(#0b5c83);
}

void draw(){
  background(#0b5c83);
  for(int i = 100; i<=520; i+=20){
    stroke(0);
    strokeWeight(1);
    fill(#c1c6c8,50);
    ellipseMode(CENTER);
    ellipse(289,286,i,i);
  }
}








