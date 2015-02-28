
Box[] boxes;

void setup() {

  size(1000, 800);
  smooth();

  colorMode(HSB, 360, 100, 100, 100);
  rectMode(CENTER);
  background(0, 0, 100);
  noStroke();


  int counter = 0;
  int num = ((width / 40) + 1) * ((height / 40) + 1); 
  boxes = new Box[num];

  for (int i = 0; i <= width; i+=40) {
    for (int j = 0; j <= height; j+=40) {
      boxes[counter] = new Box(i, j);
      counter++;
    }
  }
}

void draw() {

  fill(0, 0, 100);
  rect(width/2, height/2, width, height);

  for (int i = 0; i < boxes.length; i++) {
    boxes[i].draw();
  }
}

class Box {

  int x;
  int y;

  Box(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void draw() {

    float d = dist(mouseX, mouseY, x, y);
    float c = map(d, 0, 1131, 100, 275);
    float r = 30;

    pushMatrix();

    float atan = atan2(mouseX-x, mouseY-y);
    translate(x, y);


    rotate(atan);

    fill(c, 85, 75, 70);
    rect(0, 0, r, r);

    popMatrix();
  }
}
