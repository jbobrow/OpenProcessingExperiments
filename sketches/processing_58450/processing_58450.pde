


ParticleSystem ps;
PImage b;


void setup() {
  size(1500, 1000);
  b = loadImage("fatal_error_on_windows-HD.jpg");
  background(0);
  fill(255);

  ps = new ParticleSystem ( new PVector (width/2, height/2), 200 );
}

void draw() {
  ps.update();  
  if (keyPressed) {
    ps = new ParticleSystem ( new PVector (random(width), random(height)), 200 );
  }
  if (key == '+') {
    background(0);
  }
  if (key == 'w') {
    image(b, 0, 0);

  }
}


