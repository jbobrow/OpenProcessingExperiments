
float a = 0;
float r, g, b;
float ri, gi, bi;

void setup()
{
  size(800, 800, P3D);
  colorMode(RGB, 255);
  background(255);
  smooth();
  
  camera(255, 255, 255,
         0, 0, 0,
         0, 1, 0);
  
  ri = 8;
  gi = 4;
  bi = 2;
}

void draw()
{
  stroke(255, 8);
  background(255);
  lights();
  rotateZ(a*4);
  color c;
  for(int j=0; j<24; j++) {
    c = color(r, g, b);
    fill(c, 32);
    rotateX(a);
    rotateY(a*2);
    beginShape();
    for (int i=0; i<17; i++)
    {
      curveVertex(cos(i*(PI/16))*128, sin(i*(PI/16))*128, 0);
    }
    endShape();
    r+=ri;
    g+=gi;
    b+=bi;
  }
  a+=0.001;
  
  r = 32;
  g = 48;
  b = 64;
}


