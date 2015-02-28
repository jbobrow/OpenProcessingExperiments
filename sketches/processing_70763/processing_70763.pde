
int dots = 500;

int [] x = new int[dots];
int [] y = new int [dots];
int [] z = new int [dots];
int xvel = 3;
int yvel = 3;


void setup () {

  size (500, 500, P3D);
  background(0);
  noFill();
  stroke(255);
  for (int i = 0; i<dots; i++) {
    x[i] = int(random (-150, 150));
    y[i] = int(random (-150, 150));
    z[i] = int(random (-150, 150));
  }
}

void draw() {
  background(0);

  translate(width/2, height/2);

  rotateY(frameCount / 100.0);
  fill(0, 15);
  box(300);
  fill(255);
  for (int i = 0; i < dots; i++) {
    point (x[i], y[i], z[i]);
  }
}


