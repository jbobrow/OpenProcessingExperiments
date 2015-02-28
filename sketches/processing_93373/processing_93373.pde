
float r = 100;
float g = 150;
float b = 200;
float a = 200;


void setup() {
  size (400,400);
}

void draw() {
  background(255);
  rectMode(CENTER);
  
  //grass
  rect (200, 200, 100, 100);
  
  
  //body
  stroke(0);
  fill(230, 210, 220);
  rect(mouseX, mouseY, 20, 100);
  
  //head
  fill(200, 200, 290);
  ellipse(mouseX, mouseY-30, 60, 60);
  
  //eyes
  fill(0);
  fill(r, g, b, a);
  ellipse(mouseX-19, mouseY-30, 16, 32);
  ellipse(mouseX+19, mouseY-30, 16, 32);
  
  //legs?
  stroke(0);
  line(mouseX-10, mouseY+50, mouseX-20, mouseY+60);
  line(mouseX+10, mouseY+50, mouseX+20, mouseY+60);
}

void mousePressed(){
fill(0);
  fill(r, g, b, a);
  r = int (random (0, 200));
  g = int (random (0, 200));
  b = int (random (0, 200));
  ellipse(mouseX-19, mouseY-30, 16, 32);
  ellipse(mouseX+19, mouseY-30, 16, 32);
println(RGB);
}




