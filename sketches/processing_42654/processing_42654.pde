
void setup() {
 size(400,400);
background(250,250,164);
}

void draw() {
  noStroke();
  background(250,250,164);
  if(mousePressed) {
    fill(15,3,137);
    ellipse(mouseX,mouseY,220,220);
  }else{
    fill(137,3,119);
  }
  
  ellipse(mouseX,mouseY,80,80);
}
                
                
