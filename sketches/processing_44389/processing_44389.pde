
//  R.A. Robertson 2009.09 "Tendril Branches" ~ www.rariora.org ~
void setup() {
  size (600, 400);
  background(30, 30, 11);
  noFill();
  stroke (255, 75, 0, 50);
  smooth();
}

void draw() {
  for (int j = 0; j < 1; j++) { // Tendril cluster.
    float x = width/2;
    float y = height * .91;

    float seg = 250; // # segments (iterations)
    float d = 15; // diameter
    float dim = d; // reduce proportionally to diameter
    float spaceX = 2 * random(-1, 1); // spacing between segments
    float spaceY = -2; // * random(-1, -1);
    float angleX = PI * 1.5;
    float angleY = PI * 1.5;
    float ampX = (random(1, 4)); // Trig function amplitude. Default = 2.
    float ampY = (random(1, 4));
    float tight = random(.99, 1.001);
    float freqX = random(.01, .1); // Trig function frequency. Default = .08. Range .01 up to .1.
    float freqY = random(.01, .1);

    for (int i=0; i < seg; i++) { // Single tendril.

      d = d - (dim/seg); // Reduce diameter proportional to # iterations
      x = x + spaceX;
      y = y + spaceY;
      x = x + sin(angleX) * ampX; // Add values to angle for variation. + 0.4 is a good default.*
      y = y + sin(angleY) * ampY; // Also, add multipliers to amp. > 1 < 2 is a good range.

      angleX = angleX + freqX;
      angleY = angleY + freqY; // Use multiplier on freq for Lissajous effects.

      ampX = ampX * tight; // Tighten or loosen coils. Default .993.
      ampY = ampY * tight;

      ellipse (x, y, d, d); // Main trunk.

      float n = .25; // Proportion where branching occurs...
      float loc = (seg * n); // ... along the length of segments at this location (loc).
      float m = 1.3; // 2nd order branching factor.
      int toggle = 1; // Optional variable to switch between left and right branches.

      for (int k = 0; k < 3; k++) { // Number of branches.

        if (i >= loc) { // When original growth reaches value loc...
          ellipse (x + (i - loc) * toggle, y + (i - loc) * toggle, d, d); // ... make new branch (x,y - loc = 0 initial offset.
          //    ellipse (x - (i - loc), y - (i - loc), d, d); // Optional bifurcation. Turn off toggle below.

          if (i >= loc * m) { // 2nd Order branching.
            ellipse (x + (i - loc) * toggle + (i - loc * m), y + (i - loc) * toggle + (i - loc * m), d, d);

            loc = loc * 1.7; // Set next location value (Do not exceed max i value!).
            toggle = toggle * -1; // Turn off for right only branches, change value above to -1 for left only.
          }
        }
      }
    }
  }
  noLoop();
}
void mousePressed() {
  setup();
  loop();
}

