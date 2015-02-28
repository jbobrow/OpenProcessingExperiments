
void setup(){
  size(500,500); 
  background(0);
  strokeWeight(12);
  stroke(255);
}

void draw (){
  background(0);
  stroke(random(255), random(255), random(255));
  line(random(0,500), random(0,500), mouseX, mouseY);
}
