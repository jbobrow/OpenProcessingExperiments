
int x[] = new int[10];
int y[] = new int[10];
int c = 20;
int w = 60;
int speed[]= new int[10];


void setup() {
  size(400, 400);
  smooth();

  for (int i=0; i < x.length; i=i+1) {
    x[i] = int(random(width));
    y[i] = int(random(height));

    speed[i] = int(random(2,4));
  }
}

void draw() {
  noStroke();
  fill(32, 83, 100);
  rect(0, 0, width, height);

  for (int i=0; i < x.length; i=i+1) {
    if (dist(x[i], y[i], mouseX, mouseY) <=50) {
      if (x[i] > width || x[i]<0) {
        if (y[i] > height || y[i]<0) {
          speed[i]= speed[i]*-1;
        }
      }
        fill(x[i]/2, y[i]/2, 100);
        x[i] = x[i] + speed[i];
        y[i] = y[i] - speed[i];
      }
      else {
        fill(147, 77, 110);
      }
      ellipse(x[i], y[i], w, w);
    }


    fill(192, 255, 49);
    stroke (147, 77, 110, 30);
    strokeWeight(c);
    if (c > 50) { 
      c = 20;
    }
    else {
      c=c+1;
    }
    noCursor();
    ellipse (mouseX, mouseY, 10, 10);
  }

