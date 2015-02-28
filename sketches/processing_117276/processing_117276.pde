
float x=width/3;
float y=height/3;
float xchange=1;
float ychange=1;
int xspacing = 1;  
int w;              
float xoff = 0.0;
float theta = 0.0; 
float amplitude = 225; 
float period = 700;  
float dx;  
float[] yvalues;  
void setup() {
  size(700, 450);
  background(0);
  frameRate(5000);
  rectMode(CENTER);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}
void draw() {
  //noStroke();
  if(focused){
  calcWave();
  renderWave();
  if (keyPressed) {
    saveFrame("wallpaperFinalWave-####.tif");
  }
  }
}
void renderWave() {
  noStroke();
  fill(255, 255*noise(xoff), 0, 50);
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/2+yvalues[x], 1, 1);
  }
}
void calcWave() {
  theta += 0.02;
  xoff = xoff + .01;
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude*noise(xoff);
    x+=dx;
  }
}
