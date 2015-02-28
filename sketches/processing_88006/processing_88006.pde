
int RED = 50;
int GREEN = 50;
int BLUE = 50;

void setup(){
  size(600, 300);
  background(RED, GREEN, BLUE);
}

void draw(){
  fill(RED, 100, 80);
  rect(mouseX, 50, 20, 100);
  ellipse(mouseX, height/2, 50, 50);
  quad(400, 100, 500, 50, 550, 200, 380, 225);
  
  stroke(0);
  line(10, mouseY, 400, mouseY);
}


