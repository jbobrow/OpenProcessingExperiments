
PImage [] pictures;
PImage logo;
int j;
color c;
int n;
int nx;
int ny;
int f;

void setup() {
  size(1920, 1080);
  logo = loadImage("EDPlogo.png");
  pictures = new PImage[6];
  pictures[0] = loadImage("rainbowhand1.jpg");
  pictures[1] = loadImage("strands.jpg");
  pictures[2] = loadImage("finalproject.jpg");
  pictures[3] = loadImage("3dprint.jpg");
  pictures[4] = loadImage("robotdoll.jpg");
  pictures[5] = loadImage("projection.jpg");


  for (int i = 0; i < 6; i++) {
    pictures[i].loadPixels();
  }
}

void draw() {
  f++;
  if (f > 0 && f < 2 )
    image(pictures[0], 0, 0);
  if (f > 0 && f < 1000)  
    j=0;
  if (f > 1000 && f < 1002 ) 
    image(pictures[1], 0, 0);
  if (f > 1000 && f < 2000) 
    j = 1;
  if (f > 2000 && f < 2002 ) 
    image(pictures[2], 0, 0);
  if (f > 2000 && f < 3000)
    j = 2;
  if (f > 3000 && f < 3002 )
    image(pictures[3], 0, 0);
  if (f > 3000 && f < 4000)
    j = 3;
  if (f > 4000 && f < 4002 ) 
    image(pictures[4], 0, 0);
  if (f > 4000 && f < 5000)
    j = 4;
  if (f > 5000 && f < 5002 ) 
    image(pictures[5], 0, 0);
  if (f > 5000 && f < 6000)
    j = 5;
  if (f%6000 == 0) f = 0;

  nx = int(random(0, width));
  ny=int(random(0, height));
  n = nx*ny;
  c = color(red(pictures[j].pixels[n]), green(pictures[j].pixels[n]), blue(pictures[j].pixels[n]));
  stroke(c);
  line(nx, ny, 0, 0);
  line(nx, ny, 1920, 0);
  line (nx, ny, 0, 1080);
  line(nx, ny, 1920, 1080);

  image(logo, 100, 100);
}



