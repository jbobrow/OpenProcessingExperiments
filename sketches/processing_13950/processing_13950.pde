
void setup() {
  size(600,600);
  background(180,170,255);
  smooth();
}

void draw() {
  if(mousePressed) {
  stroke(230,0,100);
  fill(255,255,0,210);
  }
  else{
    stroke(230,0,100);
    fill(random(255),80,0,100);
  }
  triangle(mouseX-50,mouseY-50,mouseX+50,mouseY+50,mouseX-50,mouseY+50);
}
                
                
