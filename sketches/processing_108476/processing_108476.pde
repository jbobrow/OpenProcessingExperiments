
void setup(){
  size(1000, 1000);
  background(0);
  noStroke();
}

void draw(){
  fill(random(255) , random(255) , random(255) , random(200));
  rect(mouseX + random(-200, 200) , mouseY + random(-200, 200) , 200, 200);
}
