
//Homework 9
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
               
void setup() {
  size(400, 400);
  background(255);
  smooth();
  noStroke();
  for (int i = 0; i < x.length; i++) {
    fill(col[i]);
    ellipse(x[i], y[i], d[i], d[i]);
  }
}


