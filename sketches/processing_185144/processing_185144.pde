
void setup(){
  size(640, 640);
  stroke(255, 150, 0, 10);
  strokeWeight(10);
}

void draw(){
  background(0);
  translate(width/2, height/2-60);
  branch(320);
}

void branch(float len){
  len *= 0.66;
  line(0, 0, 0, 40);
  fill(0);
  ellipse(0, 0, 10, 10);
  
  translate(0, 40);
  if(len > 2){
    pushMatrix();
    rotate(radians(60));
    branch(len);
    popMatrix();
    
    pushMatrix();
    rotate(radians(-60));
    branch(len);
    popMatrix();
  }
}


