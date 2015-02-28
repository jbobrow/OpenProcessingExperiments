
int minimumValue = 0;
int maximumValue = 20;
int minimumCategories = 2;
int maximumCategories = 12;
int maximumSum = (maximumValue * maximumCategories);
float minimumRadius = 80.0;
float maximumRadius = 160.0;

int[] data;
int categories;

// colorbrewer.org discrete-set-3-12
color[] colors = new color[]
  {
    color(141, 211, 199),
    color(255, 255, 179),
    color(190, 186, 218),
    color(251, 128, 114),
    color(128, 177, 211),
    color(253, 180, 98),
    color(179, 222, 105),
    color(252, 205, 229),
    color(217, 217, 217),
    color(188, 128, 189),
    color(204, 235, 197),
    color(255, 237, 111)
  };

void setup() {
  size(480, 270);
  smooth();
  background(250);
  ellipseMode(CENTER);
  hint(ENABLE_STROKE_PURE);

  createData();
}

void draw() {
  fill(250);
  noStroke();
  rect(0, 0, width, height);

  int sum = 0;
  for (int datum : data)
  {
    sum += datum;
  }

  float cx = width / 2.0;
  float cy = height / 2.0;
  float centerRadius = lerp(minimumRadius, maximumRadius, (float) sum / (float) maximumSum);

  fill(240);
  stroke(220);
  strokeWeight(1);
  ellipse(cx, cy, centerRadius * 2.0, centerRadius * 2.0);

  float alpha = -1 * HALF_PI;
  for (int i = 0; i < data.length; i++)
  {
    float delta = lerp(0.0, TWO_PI, (float) data[i]/(float) sum);
    noFill();
    stroke(colors[i]);
    strokeWeight(centerRadius / 4.0);
    // todo: strokes need work, should be 
    arc(cx, cy, centerRadius * 2.0, centerRadius * 2.0, alpha, alpha + delta, PIE);

    alpha += delta;
  }

  // hack, paint over pie strokes
  fill(240);
  noStroke();
  ellipse(cx, cy, centerRadius * 2.0 - (centerRadius / 8.0), centerRadius * 2.0 - (centerRadius / 8.0));
}

void mousePressed() {
  createData();
}

void createData() {
  int c = (int) random(minimumCategories, maximumCategories);
  data = new int[c];
  for (int i = 0; i < c; i++)
  {
    data[i] = (int) random(minimumValue, maximumValue);
  }
  categories = data.length;
}
