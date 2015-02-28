

void setup(){
  size (400, 400);
  mouseX= width/2;
  mouseY= height/2;
  background (0);
}

void draw(){
  stroke(mouseX, 0, mouseY, 40);
  line(width/2, height/2, mouseX, mouseY); 
}

