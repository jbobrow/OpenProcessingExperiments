
int xspacing = 8;   
int w;              

float theta = 0.0;  
float amplitude = 75.0;  
float period = 500.0;  
float dx;  
float[] yvalues;  

void setup() {
  size(400,400);
  frameRate(30);
  colorMode(RGB,255,255,255,100);
  smooth();
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw() {
  background(0);
  calcWave();
  renderWave();

}

void calcWave() {
  theta += 0.02;

  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  for (int x = 0; x < yvalues.length; x++) {
    noStroke();
    fill(255,50);
    textMode(CENTER);
    text("depth",x*xspacing,width/2+yvalues[x],40,16);
  }
}


