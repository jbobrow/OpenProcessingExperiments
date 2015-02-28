
/**
<p>Code optimisation by <a href="http://subpixels.com">subpixel</a>
to allow faster drawing for realtime animation, animating the last fold over time and interactive with mouse movement.</p>
<p>Based on the fabulous <a href="http://openprocessing.org/visuals/?visualID=1185" title="Origami Butterfly by Kyle McDonald">Origami Butterfly</a> by <a href="http://openprocessing.org/portal/?userID=838" title="OpenProcessing.org: Kyle McDonald">Kyle McDonald</a>.</p>
<p>Keys:<br/>
[space] to pause<br/>
[1]-[5] to switch the source image (with the same folding),<br/>
[f] to create a new folding (with a random number of folds),<br/>
[e] to display extra information: the folded paper and points used to animating the last fold.</p>
<hr/>
<p>A modification of the <a href="http://www.jonathanmccabe.com/The_Front/">Origami Butterfly Method</a> by Jonathan McCabe. The original algorithm can be paraphrased:</p>
<ol>
 <li>Fold a piece of paper (a few times)</li>
 <li>Note the new position of each point on the paper</li>
 <li>Unfold the paper</li>
 <li>For each point, use the noted (folded) position to determine that point's color</li>
</ol>
<p>The primary modification is the last step: instead of a point in color space, the positions represent a sample from an image space - painting some unexpected organic patterns, and leading to a simpler metaphor for the algorithm:</p>
<ol>
 <li>Fold a piece of paper (a few times)</li>
 <li>Project an image onto the paper (like tie-dye)</li>
 <li>Unfold the paper</li>
</ol>
<hr/>
<p>Performance metrics compared to original code (470x353, 32 folds).
Note: these times are merely quickest times observed from debug output
and are cumulative in the order presented.</p>
<ul>
 <li>Original time: ~460ms</li>
 <li>Replace folds[][2][2] with foldsx0, foldsy0, foldsx1, foldsy1: 420ms (-41ms)</li>
 <li>Replace closest[2] with closestx, closesty: 351ms (-69ms)</li>
 <li>Inline refelct(): 220ms (-131ms)</li>
 <li>Replace foldedImage[][][] with foldedImagex[], foldedImage[y]: 150ms (-70ms)</li>
</ul>
<p>An approximately 3x speed improvement overall, allowing for
rendering as a realtime animation, especially with fewer folds.</p>
*/

int paperSizex, paperSizey;
int totalPixels;  // paperSizex * paperSizey
int nfolds;
float[] foldsx0, foldsy0, foldsx1, foldsy1;
float[] foldedImagex, foldedImagey;
PImage img;

String[] images = {"fisk.jpg", "jewels.jpg", "bark.jpg", "dp.jpg", "jeff.jpg"};
int curImage = 0;

boolean paused = false;
boolean displayExtras = false;

float tx, ty;  // target x, y
float mx, my;  // "mousex and mousey", eased towards tx, ty

float omega0 = 0.002;
float theta0 = random(PI);
float omega1 = 0.005;
float theta1 = random(PI);


void setup() {

  //size(paperSizex, paperSizey, P3D); 
  size(470, 353);
  colorMode(HSB, 1);

  frameRate(30);
  
  cursor(CROSS);

  setImage(0);
  foldPaper();
}

void setImage(int imageIndex)
{
  curImage = constrain(imageIndex, 0, images.length - 1);

  img = loadImage(images[curImage]);
  paperSizex = img.width;
  paperSizey = img.height;

  totalPixels = paperSizex * paperSizey;
  foldedImagex = new float[totalPixels];
  foldedImagey = new float[totalPixels];
}

void foldPaper() {
  nfolds = (int) random(4,32);
  foldsx0 = new float[nfolds];
  foldsy0 = new float[nfolds];
  foldsx1 = new float[nfolds];
  foldsy1 = new float[nfolds];

  for(int i = 0; i < nfolds; i++)
  {
    float[] xy;

    xy = randomPosition(i);
    foldsx0[i] = xy[0];
    foldsy0[i] = xy[1];

    xy = randomPosition(i);
    foldsx1[i] = xy[0];
    foldsy1[i] = xy[1];
  }

  mx = tx = random(paperSizex);
  my = ty = random(paperSizey);
}

float[] randomPosition(int level) {
  return foldPoint(random(paperSizex), random(paperSizey), level);
}

float[] getMinMax(float[] values){
  float minVal = values[0];
  float maxVal = values[0];
  float val;

  for(int i = 1; i < values.length; i++)
  {
    val = values[i];

    if (val < minVal)
      minVal = val;
    else if (val > maxVal)
      maxVal = val;
  }

  return new float[] {minVal, maxVal};
}

void draw() {
  int startTime = millis();
  
  float[] xy;

  float r0 = min(paperSizex, paperSizey) / 4.0;
  float r1 = r0 / 4.0;

  theta0 += omega0;
  theta1 += omega1;

  mx = lerp(mx, tx, 0.2);
  my = lerp(my, ty, 0.2);

  float x0 = mx + r0 * cos(theta0);
  float y0 = my - r0 * sin(theta0);
  
  float x1 = x0 + r1 * cos(theta1);
  float y1 = y0 - r1 * sin(theta1);
  
  xy = foldPoint(x0, y0, nfolds - 1);
  foldsx0[nfolds - 1] = xy[0];
  foldsy0[nfolds - 1] = xy[1];

  xy = foldPoint(x1, y1, nfolds - 1);
  foldsx1[nfolds - 1] = xy[0];
  foldsy1[nfolds - 1] = xy[1];

  for(int i = 0, y = 0; y < paperSizey; y++)
  {
    for(int x = 0; x < paperSizex; x++, i++)
    {
      xy = foldPoint((float) x, (float) y, nfolds);
      foldedImagex[i] = xy[0];
      foldedImagey[i] = xy[1];
    }
  }

  float[] minmax;
  
  minmax = getMinMax(foldedImagex);
  float boundsx0 = minmax[0];
  float boundsx1 = minmax[1];
  
  minmax = getMinMax(foldedImagey);
  float boundsy0 = minmax[0];
  float boundsy1 = minmax[1];
  
  float rangex = (paperSizex - 1) / (boundsx1 - boundsx0);
  float rangey = (paperSizey - 1) / (boundsy1 - boundsy0);

  background(0);

  loadPixels();
  for(int i = 0, y = 0; y < paperSizey; y++)
  {
    for(int x = 0; x < paperSizex; x++, i++)
    {
      foldedImagex[i] = (foldedImagex[i] - boundsx0) * rangex;
      foldedImagey[i] = (foldedImagey[i] - boundsy0) * rangey;
      pixels[i] = img.get((int) foldedImagex[i], (int) foldedImagey[i]);
    }
  }
  
  // Renders approximation of folded shape
  if (displayExtras)
  {
    color paperColour = 0x3fffffff;  // White, 25% opacity
    for(int i = 0; i < totalPixels; i++)
      pixels[paperSizex * (int) foldedImagey[i] + (int) foldedImagex[i]] = paperColour;

    color edgeColour = 0xffff0000;  // Red, 100% opacity
    for(int i = 0, j = totalPixels - paperSizex; i < paperSizex; i++, j++)
    {
      // Top edge
      pixels[paperSizex * (int) foldedImagey[i] + (int) foldedImagex[i]] = edgeColour;
      
      // Bottom edge
      pixels[paperSizex * (int) foldedImagey[j] + (int) foldedImagex[j]] = edgeColour;
    }
  
    for(int i = paperSizex; i < totalPixels; i++)
    {
      // Left edge
      pixels[paperSizex * (int) foldedImagey[i] + (int) foldedImagex[i]] = edgeColour;
      
      // Right edge
      i += paperSizex - 1;
      pixels[paperSizex * (int) foldedImagey[i] + (int) foldedImagex[i]] = edgeColour;
    }
  }

  updatePixels();

  // Renders points used to animate the last fold
  if (displayExtras)
  {
    noStroke();
    fill(0, 0, 1);
    ellipse(mx, my, 10, 10);
    ellipse(x0, y0, 5, 5);
    ellipse(x1, y1, 2, 2);
  }

  println(millis() - startTime);
}

float[] foldPoint(float x, float y, int level) {
  float c0a0, b0a0, c1a1, b1a1;
  float t;

  for(int i = 0; i < level; i++)
  {
    c0a0 = x - foldsx0[i];
    b0a0 = foldsx1[i] - foldsx0[i];
    c1a1 = y - foldsy0[i];
    b1a1 = foldsy1[i] - foldsy0[i];

    if((b0a0 * c1a1) - (b1a1 * c0a0) > 0) // orientation (determinant)
      continue;

    t = ((c0a0 * b0a0) + (c1a1 * b1a1)) /
        ((b0a0 * b0a0) + (b1a1 * b1a1));
  
    // Reflect about closest point on line
    x = (b0a0 * t + foldsx0[i]) * 2 - x;
    y = (b1a1 * t + foldsy0[i]) * 2 - y;
  }

  return new float[] {x, y};
}

void keyPressed() {
  switch(key) {
    case ' ':
      paused = !paused;
      if (paused)
        noLoop();
      else
        loop();
      break;
    case 'e': displayExtras = !displayExtras; break;
    case 'f': foldPaper(); break;
    case '1': setImage(0); break;
    case '2': setImage(1); break;
    case '3': setImage(2); break;
    case '4': setImage(3); break;
    case '5': setImage(4); break;
  }
}

void mouseClicked()
{
  foldPaper();
}


void mouseMoved()
{
  tx = mouseX;
  ty = mouseY;
}


