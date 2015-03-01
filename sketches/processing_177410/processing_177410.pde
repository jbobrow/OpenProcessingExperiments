
int xspacing = 40;   // distance btwn circles 
int w;              // width of wave
int h;
float theta;  // starting angle
float amplitude = 75.0;  // height of wave
float period = 500.0;  // length of wave before repeat
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // array for y values of sin wave
float v1; //value for blue translating sin wave


void setup() {
  size(1067, 600);
  w = width+50; //since ellipses are 50 wide
  h = height;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  //create xvalues for array
}

void draw() {
  fill(0, 10);
  rect(0, 0, w, h);

  translate(0, -105);
  calcWave();
  renderWave();

  translate(0, 245);
  calcInverse();
  renderInverse();

  calcInverse();
  renderInverse();

  translate(0, -600);
  translate(0, v1);
  v1+=1; 
  if (v1 > h) {
    v1 = -600;
  }
  calcInverse();
  renderInverse();
}


void calcWave() {
  // velocity
  theta += 0.01;
  // for every x, sin y
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  // draw wave with ellipses at each point
  for (int x = 0; x < yvalues.length; x++) {
    
    stroke(0, random(155), random(10), random(50));
    strokeWeight(15);
    strokeCap(ROUND);
    line(x*xspacing, height/2+yvalues[x]+100, x*xspacing, yvalues[x]+500); 

    noStroke();
    fill(random(0), random(155), random(100), random(100));
    ellipse(x*xspacing, height/2+yvalues[x], 50, 50);
  }
}
///////////////////////////////////
// calculate/draw the inverse wave
///////////////////////////////////
void calcInverse() {
  // velocity
  theta += 0.01;
  // for every x, sin y
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = -(sin(x)*amplitude);
    x+=dx;
  }
}

void renderInverse() {
  noStroke();
  fill(0, 183, 169);
  // draw wave with ellipses at each point
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/2+yvalues[x], 5, 5);
  }
}



