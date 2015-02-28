
import java.util.Random;

Random gen;
float xg;
float yg;
float xr;
float yr;
float xn;
float yn;
float xsr;
float ysr;
float xsg;
float ysg;
float xsb;
float ysb;
float counter;
PImage img;
int t;
int o;

void setup() {

  size(1080, 720);
  gen = new Random();
  o=255;


  counter = 0;
  frameRate(300);
  background(255);
}


void draw() 

{

  noStroke();
  fill(255, 18);
  rect(0, 0, 430, 720);
  rect(650, 0, 1080, 720);
  rect(430, 0, 650, 92);
  rect(430, 628, 650, 720);

  noStroke();
  fill(255, o);
  rect(0, 0, 430, 720);
  rect(650, 0, 1080, 720);
  rect(430, 0, 650, 92);
  rect(430, 628, 650, 720);



  {
    if (t%270000 == 0)
    {
      background(255);
      xr = random(431, 649);
      yr = random(94, 626);
      xg = random(431, 649);
      yg = random(94, 626);
      xn = random(431, 649);
      yn = random(94, 626);
    }
    t++;


    //red - random{
    stroke(255, 
    map(abs(xr - 1 * width/4), 0, width/4, 196, 0), 
    map(abs(yr - height/4), 0, height/2, 196, 0), 
    28);
    point(xr, yr);

    xr += random(-1, 1);
    yr += random(-1, 1);

    if (xr < 0) xr = width;
    if (xr > width) xr = 0;
    if (yr < 0) yr = height;
    if (yr > height) yr = 0;

    //green - gaussian
    stroke(map(abs(xg - 2 * width/4), 0, width/4, 196, 0), 
    220, 
    map(abs(yg - height/4), 0, height/2, 196, 0), 
    28);
    point(xg, yg);

    xg += (float) gen.nextGaussian();
    yg += (float) gen.nextGaussian();

    if (xg < 0) xg = width;
    if (xg > width) xg = 0;
    if (yg < 0) yg = height;
    if (yg > height) yg = 0;

    //blue - perlin noise
    stroke(map(abs(xn - 3 * width/4), 0, width/4, 196, 0), 
    map(abs(yn - height/4), 0, height/2, 196, 0), 
    255, 28);
    point(xn, yn);

    xn += (noise(counter, -counter, frameCount * 0.01) * 2) - 0.9375;
    yn += (noise(frameCount * 0.01, -counter, counter) * 2) - 0.9375;
    counter += 0.008;
    if (xn < 0) xn = width;
    if (xn > width) xn = 0;
    if (yn < 0) yn = height;
    if (yn > height) yn = 0;
  }
}
void mousePressed()
{
  o=0;
}

void mouseReleased()
{
  o=255;
}



