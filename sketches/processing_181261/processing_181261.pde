
/* @pjs preload="IMGP1596.jpg"; */

final int nbW = 40;
int imageW, imageH, mode = 0;
float l, theta, i;
PImage pi;

void setup()
{
  size(500, 450, OPENGL);
  noStroke();
  pi = loadImage("IMGP1596.jpg");
  imageW = pi.width;
  imageH = pi.height;
  l = imageW/nbW;
}

void draw()
{
  background(30);
  translate(0, 50, -100);
  PVector prev, curr;
  beginShape(QUAD);
  texture(pi);
  tint(255, map(mouseX, 0, width, 120, 255));
  theta = 0;
  prev = new PVector(0, 0, 0);
  curr = prev.get();
  for (i = 0; i < nbW; i ++)
  {
    if (mode == 1 && i>float(mouseX)*nbW/width)
      theta += map(i, 0, nbW-1, PI/15, PI/6);
    else if (mode == 0)
      theta += i*map(mouseX, 0, width, HALF_PI*.6, 0)/nbW;

    curr.x = prev.x + l * cos(theta);
    curr.z = prev.z + l * sin(theta);

    vertex(prev.x, 0, prev.z, i*imageW/nbW, 0);
    vertex(curr.x, 0, curr.z, (i+1)*imageW/nbW, 0);
    vertex(curr.x, imageH, curr.z, (i+1)*imageW/nbW, imageH);
    vertex(prev.x, imageH, prev.z, i*imageW/nbW, imageH);

    prev = curr.get();
  }
  endShape();
}

void mousePressed()
{
  mode = (mode+1)%2; 
}



