
float theta = 0;
float seed = 0;
void setup() {
  size(600, 600);
}

void draw() {
  fill(200,200);
  rect(0,0,width,height);
//  randomSeed(seed);
//  background(200);
  seed = map(mouseY,height,0,0,1);
  translate(width/2, height);
  theta = map(constrain(mouseX,0,width),0,width,0,PI);
  branch(height/4);
}
void mouseClicked() {
//  seed++;
//  seed+=0.1;
}

void branch(float len) {
  strokeWeight(len/10);
  line(0, 0, 0, -len);
  translate(0, -len);
  
  len *= .67;
  
  if ( len > 2 ) {
//    theta += random(-PI/122.0,PI/122.0);
    theta += map(noise(seed),0,1,-PI/200,PI/200);
    pushMatrix();
      rotate(theta);
      branch(len);
    popMatrix();
    
//    theta += random(-PI/12.0,PI/12.0);
    pushMatrix();
      rotate(-theta);
      branch(len);
    popMatrix();
  }
}



