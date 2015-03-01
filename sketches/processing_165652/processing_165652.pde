
PFont fonty;
int xspacing = 16;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

void setup() {
  size(816,900);
  fill(0,0,0);
  noStroke();
  rect(0,0,width,height);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  fonty = loadFont("HiraKakuPro-W6-48.vlw");
}

void draw() {
  background(0);
  back();
  mainPage();
}

void back() {
  calcWave();
  renderWave(color(75,142,255,150),1);
  renderWave(color(92,216,149,150),-1);
  renderWave(color(231,234,85,150),-0.5);
  renderWave(color(60,222,199,150),0.5);
}
void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave(color c1, float dudly) {
  noStroke();
  fill(c1);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    rect(x*xspacing, 140+yvalues[x]*dudly, 14, 3);
  }
}

void mainPage() {
  rectMode(CENTER);
  textFont(fonty,75);
  
  fill(255,255,255);
  rect(width/2,height/2+10,width-150,height-90);
  
  fill(0);
  line(width/2,0,width/2,height);
  text("Who have you",140,150);
  text("killed off today?",125,250);
  
  buttonOne();
}

void buttonOne() {
  rectMode(CENTER); 
  textFont(fonty,35);
  rect(width/2, height*0.85, 150,75);
  fill(255);
  text("Begin",width/2-48, height*0.85+10);
}
