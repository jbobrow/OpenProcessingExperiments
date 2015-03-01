
// Hex colors for the bars.
color fills[] = {#8000FF, #0040FF, #00FF00, #FFFF00, #FF8000};

// Number of searches per service in millions.
float searches[] = {1450000, 14470000, 450000, 860000, 480000};

// Array to store the hits per second.
float hits[] = {0, 0, 0, 0, 0};

// Length of the searches array.
int len = 5;

// Number of seconds in the month of December.
int sec = 2678400;

// Initialzing variables.
int x = 0;
int y = 0;
int w;

void setup() {
  // Creates a 3620x800 window.
  size(500, 400);
  noStroke();
  
  // Sets w (the width of each column) to the value needed to divide the window into 5 columns.
  w = width / len;
}

void draw() {
  for (x = 0; x < len; x++) {
    // Finds the number of hits per second in ten thousands
    hits[x] = (searches[x] / sec); 

    // Fills the correct column from top to bottom as the sum of searches increases    
    fill(fills[x]);
    rect(x * w, 0, w, y * hits[x]);      
  }
    // Increments to help calculate the column increase properly
    y++;
}
