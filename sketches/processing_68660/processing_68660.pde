
void setup(){
  size (600,600);
  rectMode(CENTER);
}

void draw(){
  background(0,255,0);
  pushMatrix();
  translate(width/2, height/2);
  for(int i=1; i<360; i++){
  scale (.9);
    rotate(i);
    fill(255,0,0);
    rect(0, 0, 100, 100);
  }
  popMatrix();
}

