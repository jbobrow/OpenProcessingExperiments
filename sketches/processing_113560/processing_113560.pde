
PShader blur;

int w = 800;
int h = 600;
float rad = 14;

  float r;
  float g;
  float b;

  float lastW;
  float lastH;

void setup()
{
  size(w, h, P2D);
  smooth();
  blur = loadShader("blur.glsl");
  //stroke(120, 120, 255);
  rectMode(CENTER);
  background(255);
  ellipseMode(CENTER);
  reset();
}

void draw()
{
  if (lastH - rad/2 > -10)
  {
   // filter(blur);
    filter(blur);

// Great colour mode
    stroke(g, b, r);
    fill(r, g, b);
    randomise();
   
    ellipse(lastW, lastH - rad, rad, rad);
    //lastW += random(-4, 4);
    lastH += random(-2, 1.8);
    float t = random(-4, 4);
    lastW += random(map(t, -4, 4, -width/100 - 10/lastH, width/100 + 10 / lastH));

    //rad += (43/lastH);
    rad += 0.02 * map(lastH, 0, height, 43, 0);
    print("Rad: " + rad);
    printRGB();
  }
 
  if (mousePressed)
  {
    reset();
    background(255);
    rad = 14;
  }
}

void randomise()
{
  if (random(2) >= 1)
    r += random(3);
  else
    r -= random(3);
   
  if (int(random(2)) == 1)
    g += random(3);
  else
    g -= random(3);
 
  if (int(random(2)) == 1)
    b += random(3);
  else
    b -= random(3);
}
// 310, 130, 330; // Blue-pink light
// 420, -30, 290; // Blue-pink dark
// 60, 120, 105; // Great grey
void printRGB()
{
  print("R: " + r + "  G: " + g + "  B: " + b + '\n');
}

void reset()
{
  //r = random(50, 70);
  //g = random(110, 130);
  //b = random(95, 115);
  r = random(200, 255);
  g = random(0, 10);
  b = random(0, 10);

  lastW = w/2;
  lastH = random(h - 50, h);
}
