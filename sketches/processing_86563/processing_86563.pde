

float[] x = {0,-300,300};
float[] y = {-300,300,300};
float lineColor;
float randomBound = 2;

void setup () {
  size (900,900);
  smooth ();
  colorMode (HSB,300,100,100);
  background (0,0,100);
  strokeWeight (1);
  noFill ();
}

void draw () {
  translate (width/2,height/2);
  
  randomBound = randomBound+0.0005*sq(randomBound);
  
  lineColor = sin(frameCount)*20+25;
  stroke (lineColor,100,100,33);
  
  beginShape (TRIANGLES);
  for (int i=0; i<3; i++) {
    float randomX = random (-randomBound,randomBound);
    float randomY = random (-randomBound,randomBound);
    vertex (x[i],y[i]);
    x[i] = x[i]+randomX;
    y[i] = y[i]+randomY;
  }
  endShape ();
  
}

void mousePressed () {
  x[0]=0; x[1]=-300; x[2]=300;
  y[0]=-300; y[1]=300; y[2]=300;
  background (0,0,100);
  randomBound = 2;
}
  

