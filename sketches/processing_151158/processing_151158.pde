

void setup() {
  size(1000, 800);
  smooth();
}


void draw() {
  background(125);

  float d = 400;
  float a = dist(width/2-(d/2), height/2, mouseX, height/2);
  float b = dist(width/2+(d/2), height/2, mouseX, height/2);

  if (mouseX>width/2+(d/2)) {
    a = 0;
    b = 0;
  }

  if (mouseX<width/2-(d/2)) {
    a = 0;
    b = 0;
  }

  fill(200);
  rect(0, 0, width, height/2);
  strokeWeight(.1);

  line(width/2-(d/2), height/2, width/2+(d/2), height/2);
  ellipseMode(CENTER);
  fill( 255, 0, 2, 95);
  arc(width/2, height/2, d, d, -PI, 0);
  fill(185);
  arc(mouseX-(a/2), height/2, a, a, -PI, 0);
  arc(mouseX+(b/2), height/2, b, b, -PI, 0);



  fill(155);
  rect(0, height/2, width, height/2);
  logo();
}
void logo() {
  pushMatrix();                     
  fill(255, 255, 255, 95);
  noStroke();
  rect(width-80, height-55, 10, 10);
  rect(width-60, height-55, 10, 10);
  rect(width-70, height-45, 10, 10);
  rect(width-60, height-35, 10, 10);
  popMatrix();
}

