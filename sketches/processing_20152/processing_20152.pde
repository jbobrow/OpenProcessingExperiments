
class Spore {

  PVector spores;

  PVector loc;
  PVector vel;
  PVector acc;
  float topspeed;

  Spore () {
    loc = new PVector (random(width), random(height));
    vel = new PVector (0,0);
    topspeed = 4;
  }

  void update () {
    // vector based on mouseX, mouseY
    PVector mouse = new PVector (mouseX, mouseY);
    // vector for direction towards mouse vector from the location vector ::
    // SUBTRACTION between the two vectors to get the "direction" towards mouse
    // "STATIC" :: creates a new vector
    PVector dir = PVector.sub (mouse, loc);
    // normalize
    dir.normalize ();
    // multiple by 50%
    dir.mult (0.2);

    // set acceleration in this vector direction
    acc = dir;
    // add acceleration to velocity
    vel.add (acc);
    // limit that velocity
    vel.limit (topspeed);
    // add velocity to location
    loc.add (vel);

    // this causes the location of the spore to tend towards the mouse
  }

  // add "jitter" to spore
  void jitter () {
    PVector jitter = new PVector (random (-7, 7), random (-7, 7));
    // add jitter to the location of the spore
    loc.add (jitter);

    // make sure to stay on screen
    loc.x = constrain (loc.x, 0, width-1);
    loc.y = constrain (loc.y, 0, height-1);
  }

  // now the PVector loc both tends towards the mouse and jitters

  void render () {

    noStroke ();
    fill (0, 255, 0, 100);
    smooth ();

    spores = loc.get();

    float [] sporesArray = spores.array ();

    //  for (int i = 1; i < num; i++ ) {
    //    sporesArray [i-1] = sporesArray [i];
    //  }
    // array out of bounds because the array only hold 2 values... x,y

      // for (int i = 1; i < num; i++ ) {
    ellipse (sporesArray [0], sporesArray [1], 3, 3);
    //   }
  }
}


