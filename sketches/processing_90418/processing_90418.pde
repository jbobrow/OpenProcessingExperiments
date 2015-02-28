
void setup(){
size(400,300);
background(255);
}

void draw(){
  stroke(random(255),random(255),random(255));
  line(pmouseX,pmouseY,mouseX,mouseY);
  
}
