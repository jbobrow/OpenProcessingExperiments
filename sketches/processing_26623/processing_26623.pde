
float [] radius = new float[250000];
float [] theta = new float[250000];
int [] swirlImage = new int[250000];
PImage img;
boolean showSwirls = false;
float sx = 1;
float sy = 1/50;


void setup()
{
  size(500,500);
  img = loadImage("trees.jpg");
  for(int y = 0; y < height; y++)
  {
    for(int x = 0; x < width; x++)
    {
      float dx = x - 250;
      float dy = y - 250;
      radius[y*width + x] = sqrt(dx*dx + dy*dy);
      theta[y*width + x] = atan2(dy,dx);
    }
  }
  updateSwirl();
  drawImage();
}

void draw() {}

void drawSomething() 
{
  if(showSwirls) drawSwirls();
  else drawImage();
}


void drawImage()
{
  sobel();
}

void drawSwirls()
{
  loadPixels();
  arrayCopy(swirlImage, pixels);
  updatePixels();
}

void updateSwirl()
{
  sy = 10.0 / (height - mouseY);
  sx = mouseX / 16;
  for(int i = 0; i < width*height; i++)
    swirlImage[i] = color(swirl(i)); 
}


void mouseMoved()
{
  updateSwirl();
  drawSomething();
}

void keyPressed()
{
  if(key == ' ')
  {
    showSwirls = !showSwirls;
    drawSomething();
  } 
}

float swirl(int i)
{
  return 255*sin(6*cos(radius[i]*sy) - sx*theta[i]);
}

void sobel()
{
  loadPixels();
  float v = 1.0/9.0;
  float [][] kernelx = {{3, 10, 3}, {0, 0, 0}, {-3, -10, -3}};
  float [][] kernely = {{3, 0, -3}, {10, 0, 10}, {3, 0, -3}};
  
  for(int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      float Gx = 0;
      float Gy = 0;
      for(int j = 0; j < 3; j++) {
        for(int i = 0; i < 3; i++) {
          int index = (y-j-1)*width + x - i - 1;
          if(index >= 0 && index < width*height) {
            float gray = swirlImage[index] & 0xFF;
            Gx += kernelx[i][j] * gray;
            Gy += kernely[i][j] * gray;
          }
        }
      }
      int px = int(constrain(Gx/200 + x, 0, width - 1));
      int py = int(constrain(Gy/200 + y, 0, height - 1));
      pixels[y*width + x] = img.pixels[py*width + px];
    }
  }
  updatePixels();
}


