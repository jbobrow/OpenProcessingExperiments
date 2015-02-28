
int[] sentences = new int[55];

int xspacing = 2;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 200.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

void setup() {
  size(600, 600);
  smooth();
  textSize(20);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw() {
  background(50, 80, 150);
  calcWave();
  renderWave();
  
  // text
  fill(240, 35, 30, 150);
  for (int i = 0; i < sentences.length; i += 2) {
    sentences[i] = i * frameCount;
    text(sentences[i], i * 9 + int(random(-2, 2)), i * 11 + int(random(-5, 5)));
  }

  // lines
  strokeWeight(4);
  for (int i = 0; i < sentences.length; i++) {
    stroke(240, 35, 30);
    line(i * 9 + 4, height, i * 9 + 1, height - (i * frameCount / 20) % height);
    stroke(240, 220, 20);
    line(i * 9, height, i * 9, height - (i * frameCount / 20) % height);
  }

  // ellipses
  noFill();
  strokeWeight(4);
  for (int y = 0; y < height; y += 100) {
    for (int i = 0; i < 200; i += 20) {
      stroke(240, 20 * i % 150 + 50, 15);
      ellipse(width - 10, y + 50, (i * frameCount / 30) % 210, (i * frameCount / 30) % 210);
    }
  }
}






void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += frameCount / 200;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    noStroke();
    fill(250, 250, 175);
    ellipse(x*xspacing,amplitude+yvalues[x],2,2);
  }
}


