
void setup(){
  size(500,500);


}

void draw(){
  ellipse(mouseX,mouseY,mouseX,mouseY);
}

void mousePressed(){
  fill(255,3,3);
}

void mouseReleased(){
  fill(random(255),20,20);
}

