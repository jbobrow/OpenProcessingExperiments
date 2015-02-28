
int xspacing = 10;   
int w;              

float theta = 1.0;       
float amplitude = 75.0;  
float period = 500.0;   
float dx;                 
float[] yvalues;          
float[] cosyvalues;
float[] tanyvalues;

void setup() {
  size(600,400);
  frameRate(15);
  colorMode(RGB,255,255,255,100);
  smooth();
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  cosyvalues = new float[w/xspacing];
  tanyvalues = new float[w/xspacing];
}

void draw() {
  background(0);
  calcWave();
  renderWave();

}

void calcWave() {
  theta += 0.2;

  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    cosyvalues[i] = cos(x)*amplitude;
    x+=dx;
    tanyvalues[i] = -tan(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  for (int x = 0; x < yvalues.length; x++) {
    fill(0);
    ellipseMode(CENTER);
    float el = random(3,40);
    strokeWeight(4);
    stroke(128,200,255); 
    ellipse(x*xspacing,height/2+yvalues[x],el,el);//sin 
    stroke(255,255,0);
    ellipse(x*xspacing,height/2+cosyvalues[x],el,el);//cos
    stroke(255,100,0);
    ellipse(2*x*xspacing,height/2+tanyvalues[x],el,el);//tan
  }
}



