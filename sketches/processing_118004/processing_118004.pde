
void setup(){
  size(500,500);
  smooth();
}

void draw(){
  stroke(random(255),random(255),random(255));
  line(mouseX, mouseY, 450,450);
  line(mouseX, mouseY, 50,50);
}


