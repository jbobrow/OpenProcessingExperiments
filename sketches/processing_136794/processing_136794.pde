
void setup() {
  size(250, 250);
  smooth();
  noStroke();
  noCursor();
  colorMode(RGB);
  rectMode(CENTER);
  n = (long)random(mouseX+mouseY);
}
 
boolean sketchFullScreen() {
  return true;
}
 
float xn, yn, zn;
float xstart;
long n;
 
void draw() {
  background(0);
  noiseSeed(n);
  xn=noise(n); 
  yn=noise(n); 
  xstart=xn;
  for (int i = 0; i <= height/10; i++) {
    yn+=.02;
    zn+=.02/40;
    xn = xstart;
    for (int j = 5; j <= (height/2)/10; j++) {
      xn+=.02;
      float distancia = 300-dist(mouseX,mouseY,i,j);
      float rs = noise(xn, yn, zn)*18;
      
      fill(255/rs*3, 250, 247);
      rect(i*10+5, j*10+5,distancia/10,distancia*2);
    }
  }
}
