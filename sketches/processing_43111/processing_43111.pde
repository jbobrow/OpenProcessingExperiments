
int num = 20;
int s=20;

color [] c = new color[num];
int [] x = new int [num];
int [] y = new int [num];

void setup() {
  size(500, 500);
  smooth();
  for (int i = 0; i < num; i++) {
    x[i] = int(random(width));
    y[i] = int(random(height));
    c[i] = color(random(256), random(256), random(256));
  }
}

void draw() {
  background(#A09A99);
  frameRate(210);
  for (int i = 0; i < num; i++) {
    x[i]++;
    if (x[i] > (width + s)) {
      x[i]=-s;
      y[i]= int(random(height));
    }

    cube(x[i], y[i], c[i]);
  }
}



void cube(int x, int y, color c) {
  fill(c);
  noStroke();
  rect(x, y, 100, 100);
  fill(255);
  ellipse(x+20, y+40, 40, 40);
  ellipse(x+80, y+40, 40, 40);
  fill(0);
  ellipse(x+20, y+40, 20, 20);
  ellipse(x+80, y+40, 20, 20);
  rect(x+10, y+80, 60,5);

}

