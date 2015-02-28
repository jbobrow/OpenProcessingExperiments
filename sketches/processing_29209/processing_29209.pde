
void setup(){
  size(300,300);
  background(255);
}

void draw(){
  stroke(random(255),random(255),random(255));
  strokeWeight(7);
  line(width/2,height/2,mouseX,mouseY);
}

