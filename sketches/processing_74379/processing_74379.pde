
//Martin C, CP1, Mods 4-5
//One Hundred Random Shapes

int x = 0;
int x1, y1, x2, y2, x3, y3, r, g, b, o;

void setup () {
  size(500, 500);
  background(0);
  frameRate(10);
  noStroke();
  smooth();
}

void draw() {
  background(0);
  while (x<100) {
    x1 = int(random(500));
    y1 = int(random(500));
    x2 = int(x1+random(-100, 100));
    y2 = int(y1+random(-100, 100));
    x3 = int(x1+random(-100, 100));
    y3 = int(y1+random(-100, 100));
    r = int(random(256));
    g = int(random(256));
    b = int(random(256));
    o = int(random(256));
    fill(r, g, b, o);
    triangle(x1, y1, x2, y2, x3, y3);
    x++;
  }
  x=0;
}
