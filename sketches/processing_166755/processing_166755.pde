
void setup() {
  size(500, 500, P3D);
  rectMode(CENTER);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotateY(frameCount*PI/90);
  rect(0, 0, width/2, height/2);
  if(frameCount%90 == 0){
    fill(random(200,230), random(200), random(255));
  }
  
}



