
void setup() {
  size(400,400);
}

void draw() {
  background(#0088FF);
  noStroke();
  //stroke(#0088FF);
  //noFill();
  fill(255);
  translate(width/2,height/2);
  
  for(int i=0; i < 600; i++) {
    rect(i/2,400*tan(i+sin(frameCount/43f)),(i+70)*0.02,i);
    rotate(frameCount/5000f);
  }
}
