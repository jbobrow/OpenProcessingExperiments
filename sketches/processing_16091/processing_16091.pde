
/*
This is: Lightning-like patterns between two terminals. This one has a barrier
added in the center that the lightning will tend to move around.

Move the mouse to set one point of voltage. Click the mouse to set
the other point of voltage.

At a technical level:
You define two terminals and the voltage between them. Each cell also
has a resistance which is greatly decreased by a particle recently
being present.
A particle chooses a new cell randomly but with a stronger voltage and
a lower resistance being preferred.
Particles have a limited lifetime.
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

// Where particles gravitate to:
int term_x, term_y;
float voltage;
float distance;

// How long particles live for
int lifetime;

// Rectangular barrier that is unlikely to be crossed
int bx1, by1, bx2, by2;

PGraphics tintLayer;


// Exponential decay rate
// Higher values mean that paths that were just taken, are more likely
// to be taken again. That is, this parameter controls the probability
// that a path just used will be used again.
float decay = 0.5;

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
  seed_x = width/4;
  seed_y = height/4;
  // Set terminal.
  term_x = 3*width/4;
  term_y = 3*height/4;
  
  bx1 = floor(width * 0.4);
  bx2 = floor(width * 0.6);
  by1 = floor(height * 0.4);
  by2 = floor(height * 0.6);
  
  distance = sqrt((term_x-seed_x)*(term_x-seed_x) + (term_y-seed_y)*(term_y-seed_y));
  voltage = distance;
  lifetime = floor(distance * 2);

  //smooth();
  background(0);
  stroke(255);
  frameRate(30);
  t = 0;
  
    // The tint layer is just black with an alpha channel.
  // At each frame, it is copied to the existing particle trails,
  // which creates the decay as it gradually is forced to black.
  tintLayer = createGraphics(width, height, P2D);
  tintLayer.beginDraw();
  tintLayer.background(0,25);
  tintLayer.endDraw();
}

void draw() {
  seed_x = mouseX;
  seed_y = mouseY;
  iterate();
  stroke(50,0,0);
  fill(0);
  rect(bx1,by1,bx2-bx1,by2-by1);
  stroke(255);
}

void iterate() {
  // Add a particle. Move it until it hits a border.
  pos_x = seed_x;
  pos_y = seed_y;
  int life = lifetime;
  while (borderCheck() && life >= 0) {
    computeNextBranch();
    --life;
    point(pos_x, pos_y);
  }
  ++t;
  // Dim the old display by a certain amount (tintLayer has an
  // alpha channel that influences this)
  image(tintLayer, 0, 0);
}

void mouseClicked() {
  if (mouseButton == LEFT) {
    term_x = mouseX;
    term_y = mouseY;
  }
}

boolean borderCheck() {
  return   (pos_x > 1)
        && (pos_x < width - 1)
        && (pos_y > 1)
        && (pos_y < height - 1);
}

// These two arrays store the "directions" to each of the 8
// neighbor cells to the current cell.
// Odd-indexed elements (and remember that indexing starts at 0)
// are for diagonal neighbors and they are treated differently
static final int deltaX[] = { -1,  0,  1,  1,  1,  0, -1, -1 };
static final int deltaY[] = { -1, -1, -1,  0,  1,  1,  1,  0 };
  
void computeNextBranch() {
  // We will populate 'probs' with the probability of transition to
  // the corresponding neighbor cell.
  float probs[] = new float[deltaX.length];
  float total = 0;
  float v_min = voltage;
  for(int i = 0; i < deltaX.length; ++i) {
    int nx = pos_x + deltaX[i];
    int ny = pos_y + deltaY[i];
    // How much time passed since this neighbor cell last saw a particle?
    float lastSeen = t - cells[nx][ny];
    // Compute (unnormalized) probability of a branch to here from resistance:
    float p_r = exp(-decay * lastSeen);

    // Do the same for voltage difference:
    float v_i;
    // Check barrier first.
    if (nx > bx1 && nx < bx2 && ny > by1 && ny < by2) {
      v_i = -10000;
    } else {
      float dist_i = dist(nx, ny, term_x, term_y);
      v_i = voltage * ((distance - dist_i)/distance);
    }
    if (v_i < v_min) v_min = v_i;
    
    float p = v_i + p_r;
    // Diagonal elements are made less likely, in accordance with distance
    //if (i % 2 == 0) p /= sqrt(2);
    
    total += p;
    probs[i] = p;
    //print(probs[i] + " " + v_i + " " + p_r + " " + dist_i + " " + distance + " " + (distance - dist_i)/distance);
    //print("\n");
  }
  //print("\n");
  
  // Subtract out the voltage minimum from the total so that its effect is positive only.
  // It is subtracted once for each iteration.
  total -= deltaX.length * v_min;
  
  // Normalize probabilities, and generate a cumulative distribution function
  float cdf[] = new float[deltaX.length + 1];
  cdf[0] = 0.0;
  for(int i = 0; i < deltaX.length; ++i) {
    // Get rid of the bias too (as we did with total)
    probs[i] = (probs[i] - v_min) / total;
    cdf[i + 1] = cdf[i] + probs[i];
    //print(cdf[i]);
    //print("\n");
  }

  float sample = random(1);
  // Figure out which bin of the CDF this sample goes into.
  int i;
  for(i = 1; i < deltaX.length && cdf[i] <= sample; ++i);
  // Update position.
  pos_x += deltaX[i - 1];
  pos_y += deltaY[i - 1];
  cells[pos_x][pos_y] = t;
  
}

