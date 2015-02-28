
/* @pjs preload="pict.jpg"; */
PImage img;
int xspacing = 16;
int w;              
float theta = 130.0; 
float amplitude = 75.0;  
float period = 300.0; 
float dx;  
float[] yvalues; 
float a = 3.0;
void setup(){
  size(988,800);
  img = loadImage("pict.jpg");
  w = width+32;
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
  fill(170,0,0);
  for (int x = 0; x < yvalues.length;x++) {
    ellipse(x*xspacing, height/4+yvalues[x], 12, 12);
    ellipse(x*xspacing, height/1.3+yvalues[x], 12, 12);
  }
}

void draw(){
image(img,0,0);
calcWave();
renderWave();
noStroke();
smooth();
float radius = .0;
for (int deg = 0; deg < 360*72; deg += 11) {
  float angle=radians(deg);
  float x = 90+(cos(angle) *radius);
  float y = 70+(sin(angle) *radius);
  ellipse(x+300,y+600,4,4);
  fill(0,155,255);
  radius=radius+0.34;
}
}


