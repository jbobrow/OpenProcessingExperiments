
void setup(){
  size(400,400);
}

void draw(){
  float x = random(width);
  float y = random(height);
  float d1 = random(40);
  float d2 = random(40);
  float c1 = random(255);
  float c2 = random(255);
  float c3 = random(255);
  fill(c1,c2,c3);
  ellipse(x, y, d1, d2);
  if(keyPressed && key == ' '){
    noLoop();
  }
}


