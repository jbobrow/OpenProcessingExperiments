
int a;
int b;

void setup() {
  background(255, 242, 207);
  size(400, 400);
  smooth();
  frameRate(25);
  a = 0;
  b = 0;
}

void draw() {
  fill(0, 200, 0);
  ellipse(width/4 * a, height/2, 20, 20);
  a++;
  ellipse(width/2, height/4*b, 20, 20);
  b++;

  fill(random(190, 255), 242, 207, 20);

  noStroke();
  rect(0, 0, 400, 400);
  
  stroke(mouseX, mouseY, 0);
  strokeWeight(5);
  line(mouseX, mouseY, pmouseX, pmouseY);
  strokeWeight(120);
  rect(0, 0, width, height);
  println("R = " + mouseX + " G = " + mouseY + " B = 255");

  ellipse(mouseX, mouseY, 10, 10);

  if (mouseX < 60 || mouseX > 340 || mouseY < 60 || mouseY > 340 )
    stroke(255);
  ellipse(mouseX, mouseY, 10, 10);
}


