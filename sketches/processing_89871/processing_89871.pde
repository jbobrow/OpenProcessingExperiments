
int RED = 150;
int GREEN = 185;
int BLUE = 95;
int ellipseSize = 50;

void setup(){
  size(300, 600);
  background(RED, GREEN, BLUE);
}

void draw(){
  background(RED, GREEN, BLUE);
  println(mouseX + " " + mouseY);
  fill(50, 100, 100);
  noStroke();
rect(mouseY, mouseX, 65,300);  
ellipse(50, 50, ellipseSize, ellipseSize);

strokeWeight(10);
stroke(mouseX, mouseY, mouseY-mouseX);
line(40, 50, 200, 500);
}


