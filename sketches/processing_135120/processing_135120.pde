
int x, y;
int b = 1;
int n = 30;
Tri [] t = new Tri[n];

void setup() {
  size(700, 700, P3D);
  for (int i=0; i<n; i++) {
    t[i] = new Tri();
  }
}

void draw() {
  background(255);
  for (int i=0; i<n; i++) {
    t[i].stuff();
  }
}

class Tri {
  int x, y, w;
  Tri() {
    w = 400;
    x = 30;
    y = 550;
  }
  void stuff() {
    int ty = y;
    int tw = w;

    for (int i =0; i<40; i++) {
      pushMatrix();
      translate(x+300, ty, 0);
      if (mousePressed == false) {
        fill(random(255), random(255), random(255));
      } 
      else {
        fill(255);
      }
      if (mousePressed == true ) {
        stroke(random(255), random(255), random(255));
      } 
      else {
        stroke(0);
      }
      box(tw, 10, tw);
      ty -= 12;
      tw -= 10;
      popMatrix();
    }
  }
}



