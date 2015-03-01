
float r;
float g;
float b;
float a;


float x;
float y;



float diam;
int count;
int state;

void setup() {
  count = 0;
  state = 0;

  size(400, 400);
  background(255);
  smooth();
}

void draw() {
  r = random(255); //after convening with my friends on why I got this wrong, I decided to appraoch this differently, using a simpler appraoch 
  g = random(255);
  b = random(255);
  a = random(255);
  diam = 40;
  x = diam*int(random(1, 10)); 
  y = diam*int(random(1, 10));

  noStroke();
  fill(r, g, b, a);
  ellipse(x, y, diam, diam);

  count++;
  if (count > 60) {
    count = 60; //this is where I changed the rate of the reset counter in order to make it look like a dance party!!!
    state++; //it makes it more fun if you beatbox to this
    if (state > 8) { //and they never touch which is cool!
      state = 0;
      background(random(255), random(255), random(255), random(255));
    }
  }
}

