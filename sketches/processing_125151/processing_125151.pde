


import ddf.minim.*;

Minim minim;
AudioSample bounce;

//Global variables
color[] cl = {
  #0E6870, #C6B599, #C65453, #FFDDB4, #EDAA7D
};
float x = 0;
float y = 0;

float counter = 0;

//setup

void setup() {
  minim = new Minim(this);
  bounce = minim.loadSample("bounce.wav");
  size(800, 600);
  background(cl[0]);
  smooth();
  noLoop();
}


//draw random circles and rectangles
void draw() {

  for (int i = 0; i < 100; i++) {
    noFill();
    float r = random(1, 3);
    stroke(cl[int(r)]);
    strokeWeight(random(2));
    ellipse(x, y, 50, 50);
    x = random(width);
    y = random(height);
  }


  while (counter < 50) {
    float r = random(1, 5);
    noFill();
    strokeWeight(random(3));
    stroke(cl[int(r)]);
    x = random(width);
    y = random(height);
    float d = random(100);
    rect(x, y, d, d);

    counter++;
  }
}

void keyPressed() {
  if (key== 'b') bounce.trigger();
  if (key== 's') bounce.stop();
}





