
void setup() {
  size(400,400);
  background(214,37,114);
}

void draw(){

  fill(37,126,214);
  ellipse(width/2, height/2, mouseX+10, mouseY+10);
}

void mousePressed(){
background(mouseX,0,mouseY);
  background(random(255), random(255), random(255));
}


