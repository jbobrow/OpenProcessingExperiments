
Particle [] pickles = new Particle [0];
PImage particleImage;

void setup () {

  size (500, 500);
  smooth ();
  noStroke ();

  particleImage = loadImage("particle.png");

  //  for (int i = 0; i < pickles.length; i++) {
  //
  //    pickles[i] = new Particle ();
  //  }
}

void draw () {

  background (60);

  for (int i = 0; i < 5; i++) {

    pickles = (Particle []) append (pickles, new Particle () );
  }

  for (int i = 0; i < pickles.length; i++) {

    pickles[i].update ();
  }

  while (pickles.length > 5000) {

    pickles = (Particle []) subset (pickles, 1);
  }
}

class Particle {

  float x;
  float y;
  float s;

  float velX;
  float velY;

  float drag;

  color c;

  int opacity;
  int fade;

  float shrink;

  float gravity;

  Particle () {

    x = mouseX;
    y = mouseY;

    velX = random (-10, 10);
    velY = random (-10, 10);

    drag = 0.94;

    c = color(0, random(20, 70), random(150, 200));

    opacity = 255;
    fade = 5;

    s = random(10, 30);

    shrink = 0.98;

    gravity = 0.6;
  }

  void update () {

    velX *= drag;
    velY *= drag;

    velY -= gravity;

    x += velX;
    y += velY; 

    s *= shrink;
    opacity -= fade;

    if (opacity < 0) {

      opacity = 0;
      // fade = 0;
    }    

    fill (c, opacity);
    ellipse (x, y, s, s);
    // image (particleImage, x, y);
  }

  void mousePressed () {

    c = color(0, random(150, 200), random(20, 70));
  }
}

