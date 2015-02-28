
int num = 100; //number of required variables

//create the arrays
float[] x = new float[num]; // radius of the orbit
float[] s = new float[num]; // size of the planet
float[] rot = new float[num]; // rotation
float[] speed = new float[num]; // rotating speed
color[] c = new color[num]; // planet color


void setup() {
  size(300, 300);
  colorMode(RGB, width);
  smooth();

  //seeding the array

  for (int i=0; i < num; i++) {
    x[i] = random(width);
    s[i] = random(2, 10);
    rot[i] = random(radians(360)); // 0-360 converted to radians
    speed[i] = random(0.1, 0.5);
    c[i] = color(int(random(100)), 20, 100);
  }
}


void draw() {
  background(17);

  for (int i=0; i < num; i++) {
    pushMatrix();
    translate(150, 150);

    //draw an orbit ring
    stroke(255, 15);
    noFill();
    ellipse(0, 0, 2 * x[i], 2 * x[i]);

    rotate(rot[i]);
    rot[i] = rot[i] + radians(speed[i]);

    //draw the planets
    noStroke();
    fill(c[i]);

    ellipse (x[i], 0, s[i], s[i]);

    popMatrix();
  }
}

