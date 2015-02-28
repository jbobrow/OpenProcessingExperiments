
PShape amclogo;
PShape circle;
PShape tri;
PImage still;

//color generator variables
int numElements = 200;
color[] colors = new color[numElements];

float spacer, spacer2;
int num=0;
float bg = 255; // BACKGROUND COLOR
float lc = 0; // LOGO COLOR

//color change timer
int threshold2;
int threshold = 150;
int prevMillis = 0;
float t = 0;
int time;

//EASE FADE
float c_ease = 0.05; //ease speed
float f, patFade;
float lg, logoFade;

void setup()
{
  smooth();
  noCursor();
  size(1310, 590);

  amclogo = loadShape("mainlogo.svg");
  circle = loadShape("circle.svg");
  tri = loadShape("triangle.svg");
  amclogo.disableStyle();
  circle.disableStyle();
  tri.disableStyle();

  noStroke();

  //colorgenerator
  still = loadImage("image.png");
  for (int i=0; i<numElements; i++)
  {
    int rx = int(random(still.width));
    int ry = int(random(still.height));
    colors[i] = still.get(rx, ry);
  }
}

void draw()
{

  //present mode 
 /* background(frameCount % 255); // for present mode background
  fill(bg);
  rect(0, 0, width, height);
  //end present mode
*/
  background(bg);
  num=0;

  //color change timer
  if (millis() - prevMillis >= threshold)
  { 
    t+=50;
    prevMillis += threshold;

    for (int i=0; i<numElements; i++)
    {
      int rx = int(random(still.width));
      int ry = int(random(still.height));
      color c = still.get(rx, ry);
      colors[i] = c;
    }
  }

  //fader
  float f = map(mouseX, 0, width+150, 250, 0);
  patFade += (f - patFade) * c_ease;

  //Circle1
  pushMatrix();
  for (int x=0; x<=width; x=x+120)
  {
    for (int y=0; y<=height; y=y+40)
    {
      pushMatrix();
      fill(colors[num%numElements], patFade);
      shape(circle, x+0, y);
      popMatrix();
      num++;
    }
  }
  popMatrix();

  //Circle2
  pushMatrix();
  for (int x=0; x<=width; x=x+120)
  {
    for (int y=0; y<=height; y=y+40)
    {
      pushMatrix();
      fill(colors[num%numElements], patFade);
      shape(circle, x+40, y);
      popMatrix();
      num++;
    }
  }
  popMatrix();

  //Triangle
  pushMatrix();
  for (int x=0; x<=width; x=x+120)
  {
    for (int y=0; y<=height; y=y+40)
    {
      pushMatrix();
      fill(colors[num%numElements], patFade);
      shape(tri, x+80, y);
      popMatrix();
      num++;
    }
  }
  popMatrix();

  //Logo
  logo();
}

// Logo
void logo()
{
  pushMatrix();
  float lg = map(mouseX, 0, width, 0, 255);
  logoFade += (lg - logoFade) * c_ease;
  translate(width/2-55, height/2-15);
  fill(lc, logoFade);
  shape(amclogo);
  popMatrix();
}

//Fade-In Intro
void introFade()
{
  pushMatrix();
  float fade = 0;
  time = time+1;
  fade = map(time, 0, 300, 255, 0);
  fill(bg, fade);
  rect(0, 0, width, height);
  popMatrix();
}

//Image Palette Changes
void keyPressed()
{
  if (key == '1')
  {
    still = loadImage("image1.png");
  }
  if (key == '2')
  {
    still = loadImage("image2.png");
  }
  if (key == '3')
  {
    still = loadImage("image7.png");
  }
  if (key == '4')
  {
    still = loadImage("image4.png");
  }
  if (key == '5')
  {
    still = loadImage("image5.png");
  }
  if (key == '6')
  {
    still = loadImage("image6.png");
  }
}


