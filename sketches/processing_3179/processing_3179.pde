
// Set Vars
/// Set Defaults
int MAX = 200;
float aSize = 0;
float bSize = 0;
int xSpeed = 0;
int ySpeed = 0;

/// Create Arrays
int[] xCord = new int[MAX];
int[] yCord = new int[MAX];
float[] growth = new float[200];

// Prepare the Landscape
void setup () {
  size(500,500);
  smooth();
  // Populate the array with random controlled values
  for (int i = 0; i < MAX; i++) {
    xCord[i] = int (random(0,width));
    yCord[i] = int (random(0,height));
    growth[i] = random(1.001,1.006);
  }
}

// Create the Blobs and bring them to life
void draw() {
  background(0);
  stroke(255);
  fill(255);
  // Start the loop for creating life
  for (int i = 0; i < MAX; i++) {
    ellipse(xCord[i],yCord[i],aSize,bSize);
    xCord[i] = xCord[i] + xSpeed;
    yCord[i] = yCord[i] + ySpeed;
    xSpeed = int (random(-5,5));
    ySpeed = int (random(-5,5));
    aSize = random(-5,5) * growth[i];
    bSize = random(-5,5) * growth[i];
    growth[i] = growth[i] + .001;
    // Attempt to keep blobs from killing themselves
    if ((xCord[i] > (width - 10)) || (xCord[i] < 10)) {
      xSpeed = xSpeed * -1;
    }
    if ((yCord[i] > (height - 10)) || (yCord[i] < 10)) {
      ySpeed = ySpeed * -1;
    }
  }
}

