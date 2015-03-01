
int counter;

void setup() {  //setup function called initially, only once
  size(700, 700);
  background(255);
}

void draw() {  //draw function loops 
  noStroke();
  fill(mouseX+mouseY,mouseY-mouseX,mouseX-mouseY);
  ellipseMode(CENTER);
  ellipse(350,350,mouseX,mouseY);

}
