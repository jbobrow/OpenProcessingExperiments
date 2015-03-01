
color col = color(119, 136, 153);
float lineLength = 50;
float angle = 0;
float angleSpeed = 1.0;

void setup() {
  size(500, 500);
  background(190, 190, 190);
ellipse(110, 120, 70, 0);
ellipse(110, 140, 90, 0);
ellipse(110, 160, 110, 0);
ellipse(110, 180, 130, 0);
ellipse(110, 200, 150, 0);
ellipse(110, 250, 170, 0);
ellipse(110, 300, 170, 0);
ellipse(110, 320, 130, 0);
ellipse(110, 340, 110, 0);
ellipse(110, 360, 90, 0);
ellipse(110, 380, 70, 0);
}

void draw() {
  if (mousePressed) {
    pushMatrix();
    strokeWeight(1.0);
    noFill();
    translate(mouseX,mouseY);
    rotate(radians(angle));
    line(0, 0, lineLength, 80);
    popMatrix();
    color(211,211,211); 
    angle += angleSpeed;
  }
}
void keyPressed() {

  if (key == 's') {
    save ("capture.png");
    save ("capture-###.png");
  }
  
}
