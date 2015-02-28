
/* @pjs preload="comic.png"; */
PImage img;
int xspacing = 2;
int w;              
float theta = 90.0; 
float amplitude = 40.0;  
float period = 125.0; 
float dx;  
float[] yvalues; 
float a = 3.0;
void setup(){
  size(451,151);
  img = loadImage("comic.png");
  w = width+4;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
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
  noStroke();
  fill(238,100,245);
  for (int x = 0; x < yvalues.length;x++) {
    ellipse(x*xspacing, height/1.6+yvalues[x], 3, 3);
  }
}

void draw(){
image(img,0,0);
calcWave();
renderWave();
noStroke();
smooth();
}


