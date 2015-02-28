
PImage koch;


void setup() {
  size(700,100);
  koch = loadImage("Koch 4.png");
}


void draw() {
line(0,0,700,100);
line(700,0, 0,100);
  fill(mouseX,0,0, mouseX);
  ellipse(0, 50, 25, 25);
  ellipse(50, 50, 25, 25);
  ellipse(100, 50, 25, 25);
  ellipse(150, 50, 25, 25);
  ellipse(200, 50, 25, 25);
  ellipse(250, 50, 25, 25);
  ellipse(300, 50, 25, 25);
  ellipse(350, 50, 25, 25);
  ellipse(400, 50, 25, 25);
  ellipse(450, 50, 25, 25);
  ellipse(500, 50, 25, 25);
  ellipse(550, 50, 25, 25);
  ellipse(600, 50, 25, 25);
  ellipse(650, 50, 25, 25);
  ellipse(700, 50, 25, 25);
  
  fill(mouseY, 0, 0, mouseX);
  rect(mouseX, 15, 20, 20); 
 rect(mouseX, 65, 20, 20);
 
}

