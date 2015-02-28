
class FloodWave {

  int xspacing;   // How far apart should each horizontal location be spaced
  int w;              // Width of entire wave
  float theta;  // Start angle at 0
  float amplitude;  // Height of wave
  float period;  // How many pixels before the wave repeats
  float dx;  // Value for incrementing X, a function of period and xspacing
  float[] yvalues;
  float angularVelocity;
  float y;
  color wColor;

  FloodWave(float theta, float angularVelocity, float y, color wColor) {
    this.angularVelocity = angularVelocity;
    this.y = y;
    this.theta = theta;
    this.wColor = wColor;

    xspacing = 5;
    //theta = 0.0;
    amplitude = 30.0;
    period = 400.0;
    w = width+16;
    dx = (TWO_PI / period) * xspacing;
    yvalues = new float[w/xspacing];
  }


  void display() {
    this.calcWave();
    this.renderWave();
  }

  void calcWave() {
    // Increment theta (try different values for 'angular velocity' here
    theta += angularVelocity;

    // For every x value, calculate a y value with sine function
    float x = theta;
    for (int i = 0; i < yvalues.length; i++) {
      yvalues[i] = sin(x)*amplitude;
      x+=dx;
    }
  }

  void renderWave() {
    // A simple way to draw the wave with an ellipse at each location
    //  for(int y = 0; y < height; y += 25) {
    for (int x = 0; x < yvalues.length; x++) {
      noStroke();
      fill(wColor);
      ellipseMode(CENTER);
      ellipse(x*xspacing, yvalues[x] + y, 20, 20);
    }
  }

  void fillWave() {

    for (int yPos = 0; yPos < 100; yPos += 10) {
      for (int x = 0; x < yvalues.length; x++) {
        noStroke();
        fill(wColor);
        ellipseMode(CENTER);
        ellipse(x*xspacing, yvalues[x] + y + yPos, 20, 20);
      }
    }
  }

  void fillLastWave() {

    for (int yPos = 0; yPos < height - y + amplitude; yPos += 10) {
      for (int x = 0; x < yvalues.length; x++) {
        noStroke();
        fill(wColor);
        ellipseMode(CENTER);
        ellipse(x*xspacing, yvalues[x] + y + yPos, 20, 20);
      }
    }
  }
}


