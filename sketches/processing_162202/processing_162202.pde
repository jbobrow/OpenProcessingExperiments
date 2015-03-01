
float speed = 1.5;
int diameter = 25;
float x;
float y;
private int valueR = 0;
private int valueG = 0;
private int valueB = 0;


void setup(){
  size(600, 400);
  smooth();
  noStroke();
  background(204);
}

void draw() {
  if (mousePressed && (mouseButton == LEFT)) {
    fill(valueR, valueG, valueB);
    valueR = (int)random(255);
    valueG = (int)random(255);
    valueB = (int)random(255);
    x += random(-speed , speed);
    y += random(-speed, speed);
    translate(mouseX, mouseY);
    ellipse(x, y, diameter, diameter);
  }
    else if (mousePressed && (mouseButton == RIGHT)){
    fill(204);
    ellipse(mouseX, mouseY, diameter*2, diameter*2);
    }
  else {
    x = 0;
    y = 0;
    fill(valueR, valueG, valueB);
    valueR = (int)random(255);
    valueG = (int)random(255);
    valueB = (int)random(255);
    ellipse(mouseX, mouseY, 15, 15);
  }
}  
