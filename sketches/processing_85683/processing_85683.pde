
void setup() {
  background(random);
  size(500, 500);
  
}

void draw() {
  if (mousePressed){
    fill(0);
  }else{
    fill(random(130));
  }
  ellipse(mouseX,mouseY,80,80);
}


