
void setup(){
 size(785, 785);
}

void draw(){
  fill(random(255),random(255),random(255));
  ellipse(mouseX, mouseY, 50, 50);
triangle(mouseX, mouseY,50, 60, 60, 50);
}
