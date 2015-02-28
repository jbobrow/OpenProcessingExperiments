
//the keys that chnge the color of the lines are r, g, b, p, t, y, z


int R = 255;
int G = 255;
int B = 255;

void setup() {
  size(500, 500);
  background(0);
}

void draw() {
}

void keyPressed() {
  if (key == 'r') {
    R = 255;
    G = 0;
    B = 0;
  }
  background(0);


  if (key == 'g') {
    R = 0;
    G = 255;
    B = 0;
  }
  background(0);

  if (key == 'y') {
    R = 255;
    G = 255;
    B = 0;
  }
  background(0);

  if (key == 'p') {
    R = 225;
    G = 0;
    B = 255;
  }
  background(0);

  if (key == 't') {
    R = 0;
    G = 255;
    B = 255;
  }
  background(0);  

  if (key == 'z') {
    R = 200;
    G = 100;
    B = 200;
  }
  background(0);

  if (key == 'b') {
    R = 0;
    G = 0;
    B = 255;
  }
  background(0);
}

void mouseDragged() {
  stroke(R, G, B);
  line(pmouseX, pmouseY, mouseX, mouseY);
}
