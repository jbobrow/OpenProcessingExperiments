
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
    color(141, 211, 199, 200),
    color(255, 255, 179, 200),
    color(190, 186, 218, 200),
    color(251, 128, 114, 200),
    color(128, 177, 211, 200),
    color(253, 180, 98, 200),
    color(179, 222, 105, 200),
    color(252, 205, 229, 200),
    color(217, 217, 217, 200),
    color(188, 128, 189, 200),
    color(204, 235, 197, 200),
    color(255, 237, 111, 200)
  };

void setup() {
  size(800, 450);
  smooth();
  background(250);
  ellipseMode(CENTER);
  strokeWeight(1.0);

  createData();
}

void draw() {
  fill(250);
  rect(0, 0, width, height);

  int sum = 0;
  for (int datum : data)
  {
    sum += datum;
  }

  float cx = width / 3.0;
  float cy = height / 2.0;

  // "smile" diagram

  float centerRadius = lerp(minimumRadius, maximumRadius, (float) sum / (float) maximumSum);
  float valuesRadius = centerRadius * 0.75;
  float maximumValueRadius = centerRadius / (float) categories;

  fill(220);
  stroke(200);
  ellipse(cx, cy, centerRadius * 2.0, centerRadius * 2.0);

  noFill();
  stroke(240);
  //ellipse(cx, cy, valuesRadius * 2.0, valuesRadius * 2.0);

  float alpha = (float) Math.PI/(float) categories;
  for (int i = 0; i < data.length; i++)
  {
    float d = 2.0 * lerp(0.0, maximumValueRadius, (float) data[i]/(float) maximumValue);
    float theta = (float) i * alpha + (alpha / 2.0);
    float x = cx + ((float) Math.cos(theta)) * valuesRadius;
    float y = cy + ((float) Math.sin(theta)) * valuesRadius;
    fill(colors[i]);
    noStroke();
    ellipse(x, y, d, d);
  }

  // "solar system" diagram

  cx = 2.0 * width / 3.0;
  valuesRadius = centerRadius * 1.5;

  fill(220);
  stroke(200);
  ellipse(cx, cy, centerRadius * 2.0, centerRadius * 2.0);

  noFill();
  stroke(240);
  //ellipse(cx, cy, valuesRadius * 2.0, valuesRadius * 2.0);

  for (int i = 0; i < data.length; i++)
  {
    float d = 2.0 * lerp(0.0, maximumValueRadius, (float) data[i]/(float) maximumValue);
    float theta = (float) i * alpha + (alpha / 2.0);
    float x = cx + ((float) Math.cos(theta)) * valuesRadius;
    float y = cy + ((float) Math.sin(theta)) * valuesRadius;
    fill(colors[i]);
    noStroke();
    ellipse(x, y, d, d);
  }
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
