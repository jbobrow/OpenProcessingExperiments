
void setup() {
  size(400,400);
}

void draw(){
  background(mouseX,0,mouseY);
    map(mouseX, 0, width, 0, 255);
  fill(37,126,214);
  ellipse(width/2, height/2, mouseX+10, mouseY+10);
}

