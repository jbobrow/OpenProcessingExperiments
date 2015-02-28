
int SIZE = 800;

int scale = 8;
Flower flower;

void setup()
{
  size(SIZE, SIZE);
  frameRate(60);
  flower = new Flower(SIZE / scale);
}
 
void draw()
{
  background(0);
  flower.draw();
  fill(255);
  textSize(16);
  textAlign(LEFT);
  text("Flakes: "  + int(flower.rFlakes) + "/" + int(flower.gFlakes) + "/" + int(flower.bFlakes), 10,  20);
  text("Waves: "   + int(flower.rWaves)  + "/" + int(flower.gWaves)  + "/" + int(flower.bWaves),  10,  40);
  text("Quality: " + int(scale / 2),                                                              10,  60);
  text("Zoom: "    + int(flower.z),                                                               10,  80);
  text("FPS: "     + int(frameRate),                                                              10, 100);
  textSize(14);
  textAlign(RIGHT);
  text("Hit the space bar for a new Mandala.", width - 10, 20);
  text("Up/down arrow keys to zoom.",          width - 10, 40);
  text("Keys 1-9 change quality.",             width - 10, 60);
  text("Click to invert zoom.",                width - 10, 80);
}

void keyPressed()
{
  if(key == ' ')
  {
    flower.randomize();
    redraw();
  }
  else if(key >= '1' && key <= '9')
  {
    scale = (key - '0') * 2;
    flower = new Flower(int(SIZE / scale));
  }
  else if(keyCode == UP)   flower.z *= 1.25;
  else if(keyCode == DOWN) flower.z /= 1.25;
}

void mousePressed()
{
  flower.z = -flower.z;
}

class Flower
{
  PGraphics img;
  int rFlakes, gFlakes, bFlakes;
  int rWaves,  gWaves,  bWaves;
  int rSpeed,  gSpeed,  bSpeed;
  int   s; // Size (radius) of the circle.
  float a; // Computed angle around the circle, used for rendering.
  float r; // Computed polar radius, used during rendering.
  float z; // How zoomed in is the camera.
  int age;

  Flower(int radius)
  {
    s = radius;
    z = 500;
    img = createGraphics(radius * 2, radius * 2);
    randomize();
  }

  void render()
  {
    age++;
    img.loadPixels();
    for(int i = -s; i < s; i++)
    {
      int jR = int(sqrt(s * s - i * i));
      for(int j = -jR; j < jR; j++)
      {
        a = -atan(j / (i + 0.001));
        if(i >= 0) a += PI;
        if(i < 0 && j < 0) a += TWO_PI;
        r = dist(0, 0, i, j);
        int cR = colorAt(rFlakes, rWaves, rSpeed);
        int cG = colorAt(gFlakes, gWaves, gSpeed);
        int cB = colorAt(bFlakes, bWaves, bSpeed);
        int p = s + i;
        int q = s + j;
        img.pixels[p + img.width * q] = color(cR, cG, cB);
      }
    }
    img.updatePixels();
  }

  int colorAt(int waves, int flakes, int speed)
  {
    float aa = a * flakes * (age / 60.0);
    aa += age * speed / 100.0;
    float c1 = map(sin(aa), -1, 1, 0, 255);
    float c2 = sin(z * (r / s) / waves * (1 + age / 300.0));
    float c3 = 0.5 * (s / r);
    float c = c1 * c2 * c3;
    return int(c);
  }

  void draw()
  {
    render();
    image(img, 0, 0, width, height);
  }

  void randomize()
  {
    age = 1;
    rFlakes = (int) random(0, 100);
    gFlakes = (int) random(0, 100);
    bFlakes = (int) random(0, 100);
    rWaves  = (int) random(0, 10);
    gWaves  = (int) random(0, 10);
    bWaves  = (int) random(0, 10);
    rSpeed  = (int) random(-80, 40);
    gSpeed  = (int) random(-80, 40);
    bSpeed  = (int) random(-80, 40);
  }
}

