
void setup(){
 size(250,250);
 background(200,20,110);
}

void draw(){
  stroke(random(255),random(255),0);
  smooth();
  line(mouseX,mouseY,125,250);
  ellipse(mouseX,mouseY,10,10);
}



