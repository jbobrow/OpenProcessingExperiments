
color[] farben = null;

void setup() {
  size(600, 600);
  smooth();
  frameRate (30);
  initalizeArray();
  writeValuesToArray();
  background(#57385c);
}

void draw() {
  stroke(255);
  strokeWeight(2);
  int randomIndex = (int) random(0, farben.length);
  color fuellFarbe = farben[randomIndex];
  fill(fuellFarbe);
  
  float x = random(0, width);
  float y = random(0, height);
  float d = random(10, 30);
  ellipse(x, y, d, d);
}

void initalizeArray() {
  int arrayGroesse = (int) random(3, 10);
  farben = new color[arrayGroesse];
}

void writeValuesToArray() {
  int i = 0;
  while (i < farben.length)
  {
    float r = random (0, 255);
    float g = random (0, 255);
    float b = random (0, 255);

    color currentColor = color(r, g, b);

    farben[i] = currentColor ;
    i = i + 1;
  }
}

void mousePressed() {
  background(#57385c);
  initalizeArray();
  writeValuesToArray();
}

