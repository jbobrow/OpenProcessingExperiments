
//Spring assignment
//fall,2013, NCKu
//HorusWang

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  colorMode(HSB, 120);
  rectMode(CENTER);
  n = (long)random(1000);
  frameRate(70);
}


float xn, yn, zn;
float xstart;
long n;
float a = random(50,255);

void draw() {
  background(0);
  noiseSeed(n);
  xn=noise(n); 
  yn=noise(n); 
  
  xstart=xn;
  for (int i = 0; i <= width/5; i++) {
    yn+=.02;
    zn+=.02/40;
    xn = xstart;
    for (int j = 0; j <= height/5; j++) {
      xn+=.02;
      float rs = noise(xn, yn, zn)*20;
      fill(255/rs*3, a, a, a);
      ellipse(mouseX/100*i*5, mouseY/100*j*5, rs, rs);
    }
  }
}





