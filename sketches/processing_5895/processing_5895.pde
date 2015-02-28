
/***
 *
 *  Simple Tree
 *
 *
 * Ideas:
 * * Is it possible to draw a 3D tree? How you could you rotate this sketch?
 * * Trace the path of a single leaf. what kind of shapes do the leaves draw?
 * * Focus on realism, how could you make the tree more realistic?
 *   - prune non-upwards angling branches, or give branches at the sides 
 *   lower divergence values.
 *   - randomize splitting (not always two branches)
 *   - how would you draw an evergreen? a poplar?
 *
 */
float MAX_LIMB = 40;// branch length
float MAX_DEPTH = 7;// branches
float DIVERGE = 0.3;// branch split
float DIVERGENCE_STEP = 0;// tree difference
boolean MOUSE_DIVERGENCE = true;

void setup() {
  size(600, 600, P2D);
  background(0);
  noStroke();
  // smooth();
}

void draw() {
  background(0);

  float temp_divergence = DIVERGE;

  //// Fade background
  //fill(0, 20);
  //rect(0, 0, width, height);

  // right
  translate(width / 2, height / 2);
  tree(0, 0, 0, 0, MAX_LIMB);

  // down
  DIVERGE += DIVERGENCE_STEP;
  pushMatrix();
  rotate(HALF_PI);
  tree(0, 0, 0, 0, MAX_LIMB);

  // left
  DIVERGE += DIVERGENCE_STEP;
  pushMatrix();
  rotate(HALF_PI);
  tree(0, 0, 0, 0, MAX_LIMB);

  // up
  DIVERGE += DIVERGENCE_STEP;
  pushMatrix();
  rotate(HALF_PI);
  tree(0, 0, 0, 0, MAX_LIMB);

  DIVERGE = temp_divergence;
  // return to default
  popMatrix();
  popMatrix();
  popMatrix();

  /// Cycle divergence value
  if (!MOUSE_DIVERGENCE) DIVERGE += 0.02;
}

boolean LOOPING = true;// pause
void mousePressed() {
  if (LOOPING) {
    noLoop();
    LOOPING = false;
  } else {
    loop();
    LOOPING = true;
  }
}

void mouseMoved() {
  if (MOUSE_DIVERGENCE) {
    /// Vertical mouse: overall spread
    DIVERGE = map(mouseY, 0, height, 0, TWO_PI);
    /// Horizontal mouse: difference between trees;
    //DIVERGENCE_STEP = map(mouseX, 0, width, 0, .5);
  }
}

void tree(float startx, float starty, float level, float direction, float length) {
  //// Set branch divergence randomly.
  // DIVERGE = random(0, 1.0);

  //// Set branch length randomly.
  // length = random(5, length * 2);

  if (length > 0 && level < MAX_DEPTH) {
    /// Polar to Rectangular coordinate conversions.
    /// x = r cos(q), y = r sin(q), where r is radius and q is angle in radians.
    float endx = startx + (length * cos(direction)),
          endy = starty + (length * sin(direction));

    // String fmt = "tree: level %f;startx %f;starty %f;endx %f;endy %f;r %f;q %f";
    // println(String.format(fmt, level, startx, starty, endx, endy, r, direction));

    /// Draw tree
    stroke(255);
    strokeWeight(MAX_DEPTH - level);
    line(startx, starty, endx, endy);

    /// Left tree
    tree(endx, endy, level + 1, direction - DIVERGE, length);
    /// Right tree
    tree(endx, endy, level + 1, direction + DIVERGE, length);
  } else {
    /// Draw a leaf at the end of each branch.
    noStroke();
    fill(0, 255, 0);
    ellipse(startx, starty, 10, 10);
  }
}

// Save image and quit.
void keyPressed() {
  if (key == ' ') {
    // saveFrame("background.png");
    // exit();
    background(0);
  }
}

