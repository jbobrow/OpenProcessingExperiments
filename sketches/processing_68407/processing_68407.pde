
int barWidth = 5;
int lastBar = -1;

float x[] = new float[550];
float y[] = new float[550];
  
void setup() {
  size(650, 650);
  colorMode(HSB, 360, 100, height);
  noStroke();
  background(0);
  fill(170,75,75, 5);
  smooth();
  stroke(219);
 
  for (int i=0; i < x.length; i++) {
    x[i] = random(width);
    y[i] = random(height);
  }
}
  
void draw() {
  background(255);
  
  for (int i=0; i < x.length; i++) {
    float dia = dist(x[i], y[i], mouseX, mouseY);
    rect(x[i], y[i], dia, dia);
    {
  int whichBar = mouseX / barWidth;
  if (whichBar != lastBar) {
    int barX = whichBar * barWidth;
    fill(barX, 100, mouseY,10);
    rect(barX,10, barWidth, height);
    lastBar = whichBar;
  }
}


  }
}
void keyPressed() {
 
}

