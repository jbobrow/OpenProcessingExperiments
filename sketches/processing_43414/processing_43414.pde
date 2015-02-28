
/*
This uses randomly sized and randomly transparent circle strokes
to mkae an image from the pixel color values of a base image.
The shape a noFill ellipse creates is not perfectly circlular but more like a sprocket or whatever.

Click the screen to increase the circle size and stroke weight.
*/

PImage myImage;
int imageW;
int imageH;

float circleWidth;
float circleHeight;

//float timerPrev;
//float timerNow;

Vector circles = new Vector();
int circleCount = 0;

int maxCircleSize = 3;
int maxStrokeW = 4;

void setup()
{
  background(255);

  myImage = loadImage("face3.jpg");
  myImage.loadPixels();
  imageW = myImage.width;
  imageH = myImage.height;

  size(imageW, imageH);
  //ellipseMode(CENTER);
  smooth();

  assignCircles();
  //timerPrev = millis()/1000.0;
  
  //showOriginalImage();
  renderNewPixels();
  
}

void draw()
{
  //background(255);
  
  /*
  timerNow = millis()/1000.0;
  if (timerNow - timerPrev > 0.30)
  {    
    //renderNewPixels();
    timerPrev = timerNow;
  }
  */
}

void mouseClicked()
{
  maxCircleSize += 3;
  maxStrokeW++;
  renderNewPixels();
}

void assignCircles()
{
  for (int x=0; x < imageW; x+=4)
  {
    for (int y=0; y < imageH; y+=4)
    {
      // grab original image color values
      float r = red(getColorAtXYFromImage(x, y, myImage));
      float g = green(getColorAtXYFromImage(x, y, myImage));
      float b = blue(getColorAtXYFromImage(x, y, myImage));
      
      // create new circle object using those values
      Circle crc = new Circle(r, g, b, x, y);
      circles.add(crc);
      circleCount++;
    }
  }
}

void renderNewPixels()
{
  for(int i = 0; i < circleCount; i++)
  {
    ((Circle)(circles.get(i))).render();
  }
}


void showOriginalImage()
{
  image(myImage, 0, 0);
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

//::::::::::::::::::::::::::::::::::::::::::::::::::
class Circle
{
  float r,g,b;
  int x,y;
  float circleSize;
  
  Circle(float inR, float inG, float inB, int inX, int inY)
  {
    this.r = inR;
    this.g = inG;
    this.b = inB;
    this.x = inX;
    this.y = inY;        
  }

  void render()
  {
    stroke(this.r, this.g, this.b, random(105,255));     
    this.circleSize = random(0, maxCircleSize);
    noFill();
    strokeWeight(random(maxStrokeW/2, maxStrokeW));
    //strokeWeight(4);
    ellipse(this.x, this.y, this.circleSize, this.circleSize);
  }
}


