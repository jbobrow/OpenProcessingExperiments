
int x = 0;
int y = 0;

void setup() {
  size(400, 400);
  smooth();
  background(255);
}

void draw() {
  fill(0);
  smooth();
  noStroke();

  fill(5, 204, 237);
  stroke(255);
  ellipse(mouseX, mouseY, 20, 20);
  
  if(mousePressed){
    stroke(0);
  }
  fill(5, 204, 237);
  ellipse(20, 20, mouseX, mouseY);

  fill(5, 204, 237);
  ellipse(380, 380, mouseX, mouseY);
}

     
