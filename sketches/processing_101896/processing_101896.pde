
float spacing = 0.5;
float rotation =0.01;
float radius = 10;
float magnify = 300;

int elements = 8000;

void setup () {
  size(1200,700);
  
}

void draw() {
  translate (width/2, height/2);
  background (80);
  
  noFill();
  for (int i = 0; i < elements; i++) {
   
    pushMatrix();
    stroke(map(sin(i), 1, -1, 0, 255));
    rotate(spacing*i*rotation);
    translate(sin(spacing*i*radius)*magnify, 0);
    ellipse(0, 0, 3, 3);
    popMatrix();
  }
 radius = map(mouseX, 0, width, 2, 200);
 magnify = map(mouseY, 0, height, 50, 500);
}

void mousePressed() {
  saveFrame("imageRosette-####.png");
}
