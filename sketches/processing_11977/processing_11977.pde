
void setup(){
  size(400,400);
  frameRate (30); 
  background(0,160);
  smooth();
}
void draw(){
  noStroke();
  fill(random(255),55+random(150),random(255),random(255));
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,random(30),random(30));
}
void keyPressed() {
  background(0);
}

