
/***********************************************
Click and drag to have pixels spew from the cursor.
The pixels will fall down and come to rest on the edges of 
an invisible image.

Uses Sobel filters to determine the magnitude of the edges.
************************************************/

// image stuff
PImage myImage;
int imageW;
int imageH;

// pixel array stuff
color origPixels[];
color newPixelsV[];
color newPixelsH[];
color newPixelsMagnetude[];

// kernal stuff
float[][] kernelV = new float[3][3];
float[][] kernelH = new float[3][3];
float kernelVSum = 0;
float kernelHSum = 0;

// dot stuff
int dotCount = 0;
final float BRIGHT_TOLERANCE = 0.07; //0 to 1;
Vector myDots = new Vector();

// forces stuff
final float GRAVITY_X = 0;
final float GRAVITY_Y = 0.55;
final float FRICTION = 0.006;

void setup()
{
  background(255);
  smooth();

  myImage = loadImage("face9.jpg");
  myImage.loadPixels();
  imageW = myImage.width;
  imageH = myImage.height;

  size(imageW, imageH);

  //image(myImage,0,0);

  applySobelFilters();

  createMagnetudeLayer(); // use V & H layers to produce magnetude layer

  //displayPixels(newPixelsH);
  //displayPixels(newPixelsV);
  //displayPixels(newPixelsMagnetude);
}

void draw()
{
  background(255);
  
  //displayPixels(newPixelsMagnetude);
  
  //create new dot if dot pressed
  if (mousePressed)
  {
    for(int i = 0 ; i < 40; i++) // spit out dots in a for loop so it will make lots of them
    {
      Dot d = new Dot(dotCount);
      myDots.add(d);
      ((Dot)(myDots.get(dotCount))).x = mouseX;
      ((Dot)(myDots.get(dotCount))).y = mouseY;
      ((Dot)(myDots.get(dotCount))).renderDot();
      dotCount++;
    }
  }

  applyForcesToDots();
}

void applyForcesToDots()
{

  for(int i = 0; i < dotCount; i++)
  {
    // only drop dot if doesn't meet stick condition
    int dotX = ((Dot)(myDots.get(i))).x;
    int dotY = ((Dot)(myDots.get(i))).y;
    boolean dropDot = false;

    // decide if we should keep droping dot
    if (dotX < imageW && dotX > 0 && dotY < imageH && dotY > 0) // make sure dot isn't out of bounds
    {
      color c = newPixelsMagnetude[(dotY*imageW) + dotX];
      float dotBrightness = (((Dot)(myDots.get(i))).r + ((Dot)(myDots.get(i))).b + ((Dot)(myDots.get(i))).g)/3.0/255.0; // 0...1
      float brightnessOfMagnetudeLayerUnderDot = (red(c) + blue(c) + green(c))/3.0/255.0; //0...1
      

      if (abs(dotBrightness - brightnessOfMagnetudeLayerUnderDot) > BRIGHT_TOLERANCE
      && ((Dot)(myDots.get(i))).y <= imageH - 5) // not at bottom of screen
      {
        dropDot = true;
      }
      else
      {

        // don't stop dot if there's already a relevant pixel there      
        float brightnessOfVisibleLayerUnderDot = (red(get(dotX,dotY)) + green(get(dotX,dotY)) + blue(get(dotX,dotY)))/3.0/255.0; //0...1
        if (brightnessOfVisibleLayerUnderDot == dotBrightness
        || brightnessOfMagnetudeLayerUnderDot < 0.2) // don't stick dot if on dark pixel
        {
          dropDot = true;
        }
        else
        {         
          ((Dot)(myDots.get(i))).renderDot();
        }
        
      }
    }

    // drop dot
    if (dropDot)
    {
      ((Dot)(myDots.get(i))).applyJitterForce();
      ((Dot)(myDots.get(i))).applyGravityForce();
      ((Dot)(myDots.get(i))).applyDragForce();      
      ((Dot)(myDots.get(i))).updateDot();
      ((Dot)(myDots.get(i))).renderDot();
    }

  }
}

void applySobelFilters()
{
  // Sobel vert edge kernel
  kernelV[0][0]  = -1;
  kernelV[0][1]  = 0;
  kernelV[0][2]  = 1;
  kernelV[1][0]  = -2;
  kernelV[1][1]  = 0;
  kernelV[1][2]  = 2;
  kernelV[2][0]  = -1;
  kernelV[2][1]  = 0;
  kernelV[2][2]  = 1;

  // sobel horiz edge kernel
  kernelH[0][0]  = -1;
  kernelH[0][1]  = -2;
  kernelH[0][2]  = -1;
  kernelH[1][0]  = 0;
  kernelH[1][1]  = 0;
  kernelH[1][2]  = 0;
  kernelH[2][0]  = 1;
  kernelH[2][1]  = 2;
  kernelH[2][2]  = 1;

  //store your original array of pixels in the image
  origPixels = new color[imageW*imageH];
  for (int x=0; x < imageW; x++)
  {
    for (int y=0; y < imageH; y++)
    {
      int loc = (y * imageW) + x;
      origPixels[loc] = getColorAtXYFromImage(x, y, myImage);
    }
  }

  // now apply the kernel to each pixel, for both the V & H new pixel
  newPixelsV = new color[imageW*imageH];
  newPixelsH = new color[imageW*imageH];

  for (int x=0; x < imageW; x++)
  {
    for (int y=0; y < imageH; y++)
    {
      applyKernel(x, y, myImage, kernelV, newPixelsV); // vertical edge detection kernal
      applyKernel(x, y, myImage, kernelH, newPixelsH); // horiz edge detection kernal
    }
  }
}

void displayPixels(color[] pixelArray)
{
  for (int x=0; x < imageW; x++)
  {
    for (int y=0; y < imageH; y++)
    {
      int loc = (y * imageW) + x;
      float r = red(pixelArray[loc]);
      float g = green(pixelArray[loc]);
      float b = blue(pixelArray[loc]);

      stroke(r, g, b, 125);
      point(x,y);
    }
  }
}

void applyKernel(int x, int y, PImage img, float kernel[][], color[] destinationArray)
{
  float avgR, avgG, avgB;

  float totR = 0.00;
  float totG = 0.00;
  float totB = 0.00;
  float totPixels = 0.00;

  int counterX = 0;
  int counterY = 0;

  //go around do a weighted averge of the 8 pixels around it
  for (int checkX = (x - 1); checkX < (x + 2); checkX++)
  {
    counterY = 0;

    // boundry condition
    if ((checkX >= 0) && (checkX < imageW))
    {
      for (int checkY = (y -1); checkY < (y + 2); checkY++)
      {
        //boundry condition
        if ((checkY >= 0) && (checkY < imageH))
        {
          int loc = (checkY * img.width) + checkX;

          // grab the rgb of the original image
          float r = (red(origPixels[loc]));
          float g = (green(origPixels[loc]));
          float b = (blue(origPixels[loc]));

          // here's where we apply the kernel weight
          float weight = kernel[counterX][counterY];
          //float weight = 2;
          //if (x < 100 && x > 90 && y < 100 && y > 90) println("xcount: " + counterX + "   ycount: " + counterY + "  kernel wight: " + weight);
          totR += weight * r;
          totG += weight * g;
          totB += weight * b;
          // to make sure we're dividing the total by the weighted average
          totPixels += weight;
          counterY++;
        }
      }
    }
    counterX++;
  }

  // make sure we're not diving by 0:
  if (totPixels == 0) totPixels = 1;

  // store the shifted value here rather than just spitting out the point
  avgR = (totR / totPixels);
  avgG = (totG / totPixels);
  avgB = (totB / totPixels);

  int checkedLoc = (y * img.width) + x;
  color newColor = color(avgR, avgG, avgB);
  destinationArray[checkedLoc] = newColor;
}

void createMagnetudeLayer()
{
  newPixelsMagnetude = new color[imageW*imageH]; //magnitude layer

  // combines horiz and vert edge detection layers
  for (int x=0; x < imageW; x++)
  {
    for (int y=0; y < imageH; y++)
    {      

      int loc = (y * imageW) + x;

      float rV = red(newPixelsV[loc]);
      float rH = red(newPixelsH[loc]);
      float gV = green(newPixelsV[loc]);
      float gH = green(newPixelsH[loc]);
      float bV = blue(newPixelsV[loc]);
      float bH = blue(newPixelsH[loc]);

      float rNew = sqrt((rV*rV) + (rH*rH));
      float gNew = sqrt((gV*gV) + (gH*gH));
      float bNew = sqrt((bV*bV) + (bH*bH));

      color newColor = color(rNew, gNew, bNew);

      newPixelsMagnetude[loc] = newColor;
    }
  }
}

color getColorAtXYFromImage(int x, int y, PImage img)
{
  int maxloc= img.width*img.height;
  int loc = (y * img.width) + x;
  if (loc < maxloc)
  {
    return img.pixels[loc];
  }
  else
  {
    return 0;
  }
}

//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
class Dot
{
  int x;
  int y;
  int index;
  float trans;
  float w;
  float h;
  float r,g,b;

  float vx, vy;

  Dot(int inIndex)
  {
    this.index = inIndex;
    this.trans = random(1,255);
    //this.trans = 50;
    this.w = random(0, 3);
    this.h = random(0, 3);

    this.r = 0;
    this.g = random(0,200);
    this.b = random(0,225);

  }

  void renderDot()
  {
    noStroke();
    fill(r,g,b, this.trans);    
    ellipse(this.x, this.y, w, h);
  }

  void applyGravityForce()
  {
    vx += GRAVITY_X;
    vy += GRAVITY_Y;
  }

  void applyJitterForce()
  {
    x = int(x * random(0.999, 1.001));
    y = int(y * random(0.999, 1.001));
  }

  void applyDragForce()
  {
    float fdragx = vx * FRICTION * -1.0;
    float fdragy = vy * FRICTION * -1.0;
    vx += fdragx;
    vy += fdragy;
  }
  
  void increaseHeight()
  {
    this.h += 0.05;
  }

  void applyRandomMotionForce()
  {
    int ranNum = int(random(0,.5));
    int ranNum2 = int(random(0,.5));

    if (ranNum == 1)
    {
      vx += random(0,0.1);
    }
    else
    {
      vx -= random(0,0.1);
    }

    if (ranNum2 == 1)
    {
      vy += random(0,0.1);
    }
    else
    {
      vy -= random(0,0.1);
    }
  }

  void updateDot()
  {
    // makes dots bounce
    /*
    if (((this.x + vx) <= 0) //left wall
    || ((this.x + vx) >= imageW) // right wall
    || ((this.y + vy) >= imageH) // bottom wall
    || ((this.y + vy) <= 0)) // top wall
    {
      vx *= -1;
      vy *= -1;
    }
    */

    //prevent from going past bottom
    /*
    if (!((this.y + vy) >= imageH))
    {
      x += vx;
      y += vy;
    }
    */

    x += vx;
    y += vy;
  }
}

