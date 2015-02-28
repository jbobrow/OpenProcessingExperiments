


void setup (){
  size(300, 300);
  background(0);
  noStroke();
  smooth();
  rectMode(CENTER);
}

void draw(){
  background(0);
  for(int i=0; i<=width; i+=20){
    for(int j=0; j<=height; j+=20){
      fill(255);
      pushMatrix();
      translate(i, j);
      float d = dist(i, j, mouseX, mouseY);
      rotate(radians(45));
      rect(0, 0, d/5, d/5);
      popMatrix();
    }
  }
}

