
/*
This is: Vaguely lightning-like patterns cropping up while old ones fade.
It looks slow, but really it's just jerky because of the unpredictable
nature of things.
At a technical level: Each same-colored-block or update represents a
random walk of a particle. The direction it takes is biased (see the
'decay' parameter) toward cells that have seen particles recently.

Click to start a random walk.

*/


// Each element here stands for the latest time (as in the value of 't')
// that the cell saw a particle.
int[][] cells;
// Where particles come from:
int seed_x, seed_y;
// Where the current particle is:
int pos_x, pos_y;
// Current time-value
int t;

PGraphics tintLayer;


// Exponential decay rate (test values were around 0.0002)
// Higher values mean that paths that were just taken, are more likely
// to be taken again. That is, this parameter controls the probability
// that a path just used will be used again.
float decay = 0.0005;

static final int NeverSeen = -1000;

void setup() {
  size(600,600);
  
  cells = new int[width][height];
  for(int x = 0; x < width; ++x) {
    for(int y = 0; y < height; ++y) {
      cells[x][y] = NeverSeen;
    }
  }
 
  // Set seed.
  cells[width/2][height/2] = 0;
  seed_x = width/2;
  seed_y = height/2;
  
  //smooth();
  background(0);
  stroke(255);
  //frameRate(30);
  t = 0;
  
    // The tint layer is just black with an alpha channel.
  // At each frame, it is copied to the existing particle trails,
  // which creates the decay as it gradually is forced to black.
  tintLayer = createGraphics(width, height, P2D);
  tintLayer.beginDraw();
  tintLayer.background(0,50);
  tintLayer.endDraw();
}

void draw() {
  // Uncomment for automated operation:
  // iterate();
}

void iterate() {
  // Add a particle. Move it until it hits a border.
  pos_x = seed_x;
  pos_y = seed_y;
  while (borderCheck()) {
    computeNextBranch();
    point(pos_x, pos_y);
  }
  ++t;
  // Dim the old display by a certain amount (tintLayer has an
  // alpha channel that influences this)
  image(tintLayer, 0, 0);
}

void mouseClicked() {
  seed_x = mouseX;
  seed_y = mouseY;
  iterate();
}

boolean borderCheck() {
  return   (pos_x > 1)
        && (pos_x < width - 1)
        && (pos_y > 1)
        && (pos_y < height - 1);
}

void computeNextBranch() {
  // These two arrays store the "directions" to each of the 8
  // neighbor cells to the current cell.
  // Odd-indexed elements (and remember that indexing starts at 0)
  // are for diagonal neighbors and they are treated differently
  int deltaX[] = { -1,  0,  1,  1,  1,  0, -1, -1 };
  int deltaY[] = { -1, -1, -1,  0,  1,  1,  1,  0 };
  
  // We will populate 'probs' with the probability of transition to
  // the corresponding neighbor cell.
  float probs[] = new float[deltaX.length];
  float total = 0;
  for(int i = 0; i < deltaX.length; ++i) {
    // How much time passed since this neighbor cell last saw a particle?
    float lastSeen = t - cells[pos_x + deltaX[i]][pos_y + deltaY[i]];
    // Compute (unnormalized) probability of a branch to here
    float p = exp(-decay * lastSeen);
    // Diagonal elements are made less likely, in accordance with distance
    if (i % 2 == 0) p /= sqrt(2);
    total += p;
    probs[i] = p;
  }
  
  // Normalize probabilities, and generate a cumulative distribution function
  float cdf[] = new float[deltaX.length + 1];
  cdf[0] = 0.0;
  for(int i = 0; i < deltaX.length; ++i) {
    probs[i] /= total;
    cdf[i + 1] = cdf[i] + probs[i];
    //print(cdf[i]);
    //print("\n");
  }

  float sample = random(1);
  // Figure out which bin of the CDF this sample goes into.
  int i;
  for(i = 1; cdf[i] <= sample; ++i);
  // Update position.
  pos_x += deltaX[i-1];
  pos_y += deltaY[i-1];
  cells[pos_x][pos_y] = t;
  
}

