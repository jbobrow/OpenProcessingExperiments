
//Homework 10
//Sabrina Li
//Copyright Sabrina Li March 2013 Pittsburgh, PA

int[] x = {int(random(400)), int(random(400)), int(random(400)),
           int(random(400)), int(random(400)), int(random(400)),
           int(random(400)), int(random(400)), int(random(400)),
           int(random(400))};
           
int[] y = {int(random(400)), int(random(400)), int(random(400)),
           int(random(400)), int(random(400)), int(random(400)),
           int(random(400)), int(random(400)), int(random(400)),
           int(random(400))};
           
int[] d = {int(random(10, 40)), int(random(10, 40)), int(random(10, 40)),
           int(random(10, 40)), int(random(10, 40)), int(random(10, 40)),
           int(random(10, 40)), int(random(10, 40)), int(random(10, 40)),
           int(random(10, 40))};
           
color[] col = {color(random(255), random(255), random(255)),
               color(random(255), random(255), random(255)),
               color(random(255), random(255), random(255)),
               color(random(255), random(255), random(255)),
               color(random(255), random(255), random(255)),
               color(random(255), random(255), random(255)),
               color(random(255), random(255), random(255)),
               color(random(255), random(255), random(255)),
               color(random(255), random(255), random(255)),
               color(random(255), random(255), random(255))};
               
int[] dx = {int(random(-4, 4)), int(random(-4, 4)), int(random(-4, 4)),
            int(random(-4, 4)), int(random(-4, 4)), int(random(-4, 4)),
            int(random(-4, 4)), int(random(-4, 4)), int(random(-4, 4)),
            int(random(-4, 4))};
            
int[] dy = {int(random(-4, 4)), int(random(-4, 4)), int(random(-4, 4)),
            int(random(-4, 4)), int(random(-4, 4)), int(random(-4, 4)),
            int(random(-4, 4)), int(random(-4, 4)), int(random(-4, 4)),
            int(random(-4, 4))};          
               
void setup() {
  size(400, 400);
  background(255);
  smooth();
  noStroke();
  for (int i = 0; i < x.length; i++) {
    fill(col[i]);
    ellipse(x[i], y[i], d[i], d[i]);
    x[i] += dx[i];
    y[i] += dy[i];
  }
}

void draw() {
  background(255);
  for (int i = 0; i < x.length; i++) {
    fill(col[i]);
    ellipse(x[i], y[i], d[i], d[i]);
    if (x[i] < 0 || x[i] > width) {
      dx[i] *= -1;
    };
    if (y[i] < 0 || y[i] > height) {
      dy[i] *= -1;
    };
    x[i] += dx[i];
    y[i] += dy[i];
  }
};

void mousePressed() {
  saveFrame("hw10.jpg");
}


