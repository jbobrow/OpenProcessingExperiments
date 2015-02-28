
// changeable --- from here ---
String IMAGE_PATH = "Lenna.png";
int IMAGE_WIDTH  = 256;
int IMAGE_HEIGHT = 256;
// changeable ---  to here  ---

int BUTTON_WIDTH  = 32;
int BUTTON_HEIGHT = 32;
int GRAPH_MAX_HEIGHT = 127;
color BLACK = color(0);
color WHITE = color(255);
color RED   = color(255, 0, 0);
color GREEN = color(0, 255, 0);
color BLUE  = color(0, 0, 255);

int searchLine = -1;
int selected = 0;
int buttonAreaX = 0;
int buttonAreaY = 0;
color[][] displayImage = new color[IMAGE_HEIGHT][IMAGE_WIDTH];

color lineColor;
PImage originalImage;
PImage[] buttonImages = new PImage[6];

float[][] REGULAR_FILTER = {{0,0,0},
                            {0,1,0},
                            {0,0,0}};
float[][] SHARP_FILTER = {{ 0,-1, 0},
                          {-1, 5,-1},
                          { 0,-1, 0}};
float[][] UNSHARP_FILTER = {{1.0/9.0, 1.0/9.0, 1.0/9.0},
                            {1.0/9.0, 1.0/9.0, 1.0/9.0},
                            {1.0/9.0, 1.0/9.0, 1.0/9.0}};
float[][] LAPLACIAN_FILTER = {{ 0,-1, 0},
                              {-1, 4,-1},
                              { 0,-1, 0}};
float[][] X_DIFFERENTIAL_FILTER = {{0, 0,0},
                                   {0,-1,1},
                                   {0, 0,0}};
float[][] Y_DIFFERENTIAL_FILTER = {{0, 0,0},
                                   {0,-1,0},
                                   {0, 1,0}};
float[][][] FILTERS = {REGULAR_FILTER,
                       SHARP_FILTER,
                       UNSHARP_FILTER,
                       LAPLACIAN_FILTER,
                       X_DIFFERENTIAL_FILTER,
                       Y_DIFFERENTIAL_FILTER};

boolean first = true;

void setup() {
  size(IMAGE_WIDTH + BUTTON_WIDTH, IMAGE_HEIGHT + GRAPH_MAX_HEIGHT);
  frameRate(10);

  originalImage = loadImage(IMAGE_PATH);

  buttonImages[0] = loadImage("f.png");
  buttonImages[1] = loadImage("f-sharp.png");
  buttonImages[2] = loadImage("f-unsharp.png");
  buttonImages[3] = loadImage("f-line.png");
  buttonImages[4] = loadImage("f-dash-x.png");
  buttonImages[5] = loadImage("f-dash-y.png");

  buttonAreaX = IMAGE_WIDTH;
  buttonAreaY = 0;
}

void draw() {
  background(BLACK);

  if (first) initialDraw(); // executed only in the first loop

  drawButton(buttonAreaX, buttonAreaY);
  drawImage();
  drawGraph();
  drawSearchLine();
}

void mousePressed() {
  if (first) initialDraw();
  setSearchLine();
  checkButtonPressed();
}

void mouseDragged() {
  setSearchLine();
}

void initialDraw() {
  applyFilter(0);
  first = false;
}

void drawButton(int x, int y) {
  for (int i = 0; i < buttonImages.length; i++) {
    if (i == selected) {
      // pushed button becomes darker
      tint(100);
      image(buttonImages[i], x, y);
      noTint();
    } else {
      image(buttonImages[i], x, y);
    }
    y += BUTTON_HEIGHT;
  }
}

void drawImage() {
  loadPixels();
  for(int y = 0; y < IMAGE_HEIGHT; y++) {
    for(int x = 0; x < IMAGE_WIDTH; x++) {
      pixels[x + (y * (IMAGE_WIDTH + BUTTON_WIDTH))] = displayImage[y][x];
    }
  }
  updatePixels();
}

int drawGraph() {
  if (searchLine < 0) {
    return -1;
  }
  float curYR = 0, curYG = 0, curYB = 0;
  float prevYR = height, prevYG = height, prevYB = height;
  color c;

  for (int x = 0; x < IMAGE_WIDTH; x++) {
    c = displayImage[searchLine][x];
    curYR = normalize(red(c));
    drawLine(x, prevYR, curYR, RED);
    curYG = normalize(green(c));
    drawLine(x, prevYG, curYG, GREEN);
    curYB = normalize(blue(c));
    drawLine(x, prevYB, curYB, BLUE);

    prevYR = curYR;
    prevYG = curYG;
    prevYB = curYB;
  }

  return 0;
}

float normalize(float v) {
  return height - (v * GRAPH_MAX_HEIGHT / 255);
}

void drawLine(float x, float py, float cy, color c) {
  stroke(c);
  line(x-1, py, x, cy);
}

void drawSearchLine() {
  if (searchLine > 0) {
    stroke(WHITE);
    line(0, searchLine, IMAGE_WIDTH, searchLine);
  }
}

void applyFilter(int n) {
  for(int y = 0; y < IMAGE_HEIGHT; y++) {
    for(int x = 0; x < IMAGE_WIDTH; x++) {
      int r = 0, g = 0, b = 0;
      float weight = 0;
      color tmpc = originalImage.get(x, y);
      for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
          if ((x + j > 0) && (y + i > 0)) {
            tmpc = originalImage.get(x + j, y + i);
          }
          weight = FILTERS[n][i + 1][j + 1];
          r += red(tmpc)   * weight;
          g += green(tmpc) * weight;
          b += blue(tmpc)  * weight;
        }
      }
      r = normalizeColor(r);
      g = normalizeColor(g);
      b = normalizeColor(b);

      displayImage[y][x] = color(r, g, b);
    }
  }
}

int normalizeColor(int v) {
  v = abs(v);
  return (v > 255) ? 255 : v;
}

void checkButtonPressed() {
  int x = mouseX, y = mouseY;
  int nextSelected = selected;

  for (int i = 0; i < buttonImages.length; i++) {
    int top    = buttonAreaY + BUTTON_WIDTH * i;
    int bottom = buttonAreaY + BUTTON_WIDTH * (i + 1);
    if (inButtonArea(x) && (y > top) && (y < bottom)) {
      nextSelected = i;
    }
  }

  if (selected != nextSelected) {
    selected = nextSelected;
    applyFilter(selected);
  }
}

boolean inButtonArea(int x) {
  return (buttonAreaX <= x) && (x < width);
}

int setSearchLine() {
  int x = mouseX;
  int y = mouseY;

  if (x >= IMAGE_WIDTH) {
    return -1;
  }

  if (y >= height - GRAPH_MAX_HEIGHT) {
    searchLine = height - GRAPH_MAX_HEIGHT - 1;
  } else if (y <= 0 ) {
    searchLine = 0;
  } else {
    searchLine = y;
  }

  return 0;
}


