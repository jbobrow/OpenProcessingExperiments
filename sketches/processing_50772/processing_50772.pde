
float angle;

void setup() {
  size(900, 500);
  smooth();
  strokeJoin(MITER);
  strokeCap(SQUARE);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  background(0,0,90);
  for (float i=20; i< width; i+=40) {
      for (float j=20; j< height; j+=40) {
        angle = atan2(mouseY - j, mouseX - i);
        float vicinanza = dist(mouseX, mouseY, i, j);
        float border = map(vicinanza,0,width,0.5,3);
        color c = color(
                    map(i,0,width,0,360),
                    map(vicinanza,0,width/1.25,100,50),
                    map(vicinanza,0,width/1.25,100,50)
                  );
        stroke(c);
        arrow(i, j, border);
      }
  }
}

void arrow(float x_, float y_, float border) {
  pushMatrix();
  translate(x_, y_);
  rotate(angle);
  strokeWeight(border);
  noFill();
  line(0,5,20,5);
  beginShape();
  vertex(15,0);
  vertex(20,5);
  vertex(15,10);
  endShape();
  popMatrix();
  strokeWeight(1);
}


void keyReleased() {
 if (key == 's' || key == 'S') saveFrame("frame.png"); 
}
