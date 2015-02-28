
int pnum = 250000; // max particle count
float px[] = new float[pnum]; // particle x
float py[] = new float[pnum]; // particle y
float vs[] = new float[pnum]; // particle velocity

int pused = 50000; // particles in use

float nz = 0;   // noise z
float ns = .01; // noise scale
boolean draw_vecs = false; // draw vector field?
int g = 4; // vector field half-grid size

PGraphics gvec; // image of vector field

// initialize particles
void initParticles(int num)
{
  for(int i = 0; i < num; ++i)
  {
    px[i] = random(0, width);
    py[i] = random(0, height);
    vs[i] = pow(10, random(-1, 1));
  }
}

// get vector angle at (x, y)
float getAngle(float x, float y)
{
  return (noise(x * ns, y * ns, nz) - .5) * TWO_PI * 2;
}

// render vector field to image
void renderVecs()
{
  if(gvec == null)
  {
    gvec = createGraphics(width, height, JAVA2D);
  }

  gvec.beginDraw();
  gvec.background(0);
  gvec.smooth();
  gvec.stroke(160);

  for(int i = 0; i < height; i += g * 2)
  {
    for(int j = 0; j < width; j += g * 2)
    {
      float a = getAngle(j, i);
      float dx = cos(a) * g;
      float dy = sin(a) * g;

      gvec.line(j +g - dx, i + g - dy, j +g + dx, i + g + dy);

    }
  }

  gvec.endDraw();
}

void setup()
{
  size(400, 400);
  colorMode(HSB, 1.0);
  frameRate(30);

  initParticles(pnum);
  renderVecs();
}

// randomize noise parameters and re-render vector field
void mousePressed()
{
  nz = random(-100, 100);
  ns = pow(10, random(-3, -1));

  renderVecs();
}

void keyPressed()
{
  char k = key;
  switch(k)
  {
  case 'v':
    draw_vecs = !draw_vecs;
    break;
    
  case '+':
    {
      int tmp = pused * 2;
      if(tmp > pnum)
      {
        pused = pnum;
      }
      else
      {
        pused = tmp;
      }
    }
    break;

  case '-':
    {
      int tmp = pused / 2;

      if(tmp < 10)
      {
        pused = 10;
      }
      else
      {
        pused = tmp;
      }
    }
    break;

  case 'r':
    initParticles(pused);
    break;

  default:
    break;
  }
}

void draw()
{
  background(0);

  if(draw_vecs)
  {
    image(gvec, 0, 0);
  }

  loadPixels();

  for(int i = 0; i < pused; ++i)
  {
    float x = px[i] + random(-.5, .5);
    float y = py[i] + random(-.5, .5);

    float a = getAngle(x, y);

    float dx = cos(a) * vs[i];
    float dy = sin(a) * vs[i];

    x += dx;
    y += dy;

    if(x < 0)
    {
      x += width;
    } 
    else if(x >= width)
    {
      x -= width;
    }

    if(y < 0)
    {
      y += height;
    } 
    else if(y >= height)
    {
      y -= height;
    }

    px[i] = x;
    py[i] = y;

    color c = color((a + PI) / TWO_PI, 1, 1);

    int pix_x = (int)x;
    int pix_y = (int)y;

    if(pix_x < 0 || pix_x >= width) continue;
    if(pix_y < 0 || pix_y >= height) continue;

    pixels[pix_x + pix_y * width] = c;

  }

  updatePixels();
}



