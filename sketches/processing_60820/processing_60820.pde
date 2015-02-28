
void setup() {

  size(600, 600);
  smooth();
  ellipse(width/2, height/2, 20, 20);
  background(20, 50, 80);
  noCursor();
  noStroke();
}

void draw() {

  rect(mouseX, mouseY, 70, 30);
  
  if (mousePressed){
    fill(20,50,80);}
  else {
    fill(250, 40, 40, 10);
  }
}


