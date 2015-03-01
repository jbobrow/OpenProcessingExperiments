
float i=0;
float arroz=154;
float papa=45;
float cebolla;
void setup() {
  size(500, 500);

  colorMode(HSB);
}
void draw() {
  background(0, 0, 255);

  arroz=arroz*1.00084;
  if (random(width/2)>1) {
    background(mouseX, mouseY, 255);
  }

  if (mouseX>width/2) {
    fill(random(255), random(255), 250);
    ellipse(arroz, 155, 185, 180);
    triangle(25, 154, 487, 168, 295, 475);
  }
  if (mouseY>height/2) {
    fill(random(255), random(255), 252);
    ellipse(101, 246, 335, 425);
  }
  else {
    rect(154, 254, 154, 165);
  }  
  if (mousePressed) { 
    fill(random(255), random(255), 255);
    ellipse(pmouseX, pmouseY, cebolla, cebolla);
    line(height/2, width/2, random(width), random(height));
    float posicionX = 100*sin(i);
    float posicionY = 100*cos(i);
    ellipse(width/2+posicionX, height/2+posicionY, 46, 46);
  }

  i=i+0.05;
  float posicionX = 100*sin(i);
  float posicionY = 100*cos(i);
  ellipse(width/2+posicionX, height/2+posicionY, 20, 20);
}

void mouseReleased() {
  cebolla=random(height);
}

