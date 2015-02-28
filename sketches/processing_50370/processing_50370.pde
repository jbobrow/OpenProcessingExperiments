
static final int ROWS = 32;
static final int COLS = 32;
static final int CELLSIZE = 10;

static final int T = 2000; // Time per step (in milliseconds)

int[][] old_buf, new_buf;

int step = 0;

color colorMap[] = new color[256];

// Generate the next iteration of the pattern.
void iterate() {
  int[][] tmp_buf = new int[ROWS][COLS];
  
  // Rotate buffers
  old_buf = new_buf;
  new_buf = new int[ROWS][COLS];
  
  // Generate the next iteration by first summing adjacent columns,
  // then adjacent rows.
  for (int i = 0; i < ROWS; i++) {
    for (int j = 0; j < COLS; j++) {
      int j_p = (j == 0) ? COLS - 1 : j - 1;
      int j_n = (j == COLS - 1) ? 0 : j + 1;
      tmp_buf[i][j] = (old_buf[i][j_p] + old_buf[i][j] + old_buf[i][j_n]) & 0xff;
    }
  }
  for (int i = 0; i < ROWS; i++) {
    int i_p = (i == 0) ? ROWS - 1 : i - 1;
    int i_n = (i == ROWS - 1) ? 0 : i + 1;
    for (int j = 0; j < COLS; j++) {
      new_buf[i][j] = (tmp_buf[i_p][j] + tmp_buf[i][j] + tmp_buf[i_n][j]) & 0xff;
    }
  }
}

void setup() {
  // Initialise grid with random value at centre point.
  new_buf = new int[ROWS][COLS];
  new_buf[ROWS/2][COLS/2] = (int) random(255);
  iterate();

  // Set entries in colorMap to define the colors used:
  colorMode(HSB);
  for (int i = 0; i < 256; i++) {
    colorMap[i] = color(i/6, 0xff, 0x80 + i/2);
  }

  size(CELLSIZE * COLS, CELLSIZE * ROWS);
}

void draw() {
  int t = millis();
  
  while (t / T > step) {
    iterate();
    step += 1;
    t = millis();
  }
  
  // Amount to interpolate between old and new
  float amt = float(t % T) / T;

  loadPixels();
  for (int y = 0; y < height; y++) {
    int y_width = y * width;
    int row = ((y + CELLSIZE / 2) / CELLSIZE) % ROWS;
    for (int x = 0; x < width; x++) {
      int col = ((x + CELLSIZE / 2) / CELLSIZE) % COLS;
      color c1 = colorMap[old_buf[row][col]];
      color c2 = colorMap[new_buf[row][col]];
      pixels[y_width + x] = lerpColor(c1, c2, amt);
    }
  }
  updatePixels();
}

