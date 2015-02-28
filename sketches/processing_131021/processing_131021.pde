
void setup(){
  size(600,900);
}
void draw(){
  circle();
  background(100);
  circle();circle();circle();circle();circle();circle();circle();
}

void circle(){
  noStroke();
  fill(random(255),random(255),random(255),random(255));
  ellipse(random(600),random(900),random(400),random(500));
}


