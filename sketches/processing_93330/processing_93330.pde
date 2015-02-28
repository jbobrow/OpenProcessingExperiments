
int baseAngle;
color backgroundCol, strokeCol, fillCol;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 50, 100);
  smooth();
}

void draw() {
  baseAngle = random(0,360); //Grundfarbe setzen
  backgroundCol = color(baseAngle, 30, 50+random(50));
  strokeCol = color((baseAngle+120) % 360, 30, 50+random(50));
  fillCol = color((baseAngle+240) % 360, 30, 50+random(50));
  stroke(strokeCol, 90);
  fill(fillCol, 90);
  
  if(mouseButton == LEFT){
    line(mouseX+4, mouseY+4, mouseX-4, mouseY-4);
    line(mouseX-4, mouseY+4, mouseX+4, mouseY-4);
    line(mouseX-5, mouseY, mouseX+5, mouseY);
    line(mouseX, mouseY+5, mouseX, mouseY-5);
  } else {
    //noStroke();
    ellipse(mouseX, mouseY, 10, 10);
  }
}


