
int mouseClicks = 0; //Keeping track on the number of clicks
int x1, y1, x2, y2;
int startRed, startGreen, startBlue; 
Vector[] vectors; 
int index = 0;

//Button fields
int rectStartX = 10;
int rectStartY = 10;
int rectWidth = 90;
int rectHeight = 30;
void makeTip2TailButton()
{
  stroke(128);
  strokeWeight(1);
  fill(128);
  rect(rectStartX, rectStartY, rectWidth, rectHeight, 5);
  fill(255);
  textSize(15);
  text("Tip to Tail", 20, 30);
}

void makeSumButton()
{
  stroke(128);
  strokeWeight(1);
  fill(128);
  rect(rectStartX, rectStartY+rectHeight + 15, rectWidth, rectHeight, 5);
  rectMode(CENTER);
  fill(255);
  textSize(15);
  text("Sum", 20, 30 + rectHeight + 15);
  rectMode(CORNER);
}

void makeResetButton()
{
  stroke(128);
  strokeWeight(1);
  fill(128);
  rect(rectStartX, rectStartY+rectHeight + 15 + rectHeight + 15, rectWidth, rectHeight, 5);
  rectMode(CENTER);
  fill(255);
  textSize(15);
  text("Reset", 20, 30 + rectHeight + 15 + rectHeight + 15);
  rectMode(CORNER);
}

boolean overTip2Tail() //Returns true if the mouse is currently over the Flip button
{
  return((mouseX > rectStartX) && (mouseX < rectStartX + rectWidth) && (mouseY > rectStartY) && (mouseY < (rectStartY + rectHeight)));
}

boolean overSum() //Returns true if the mouse is currently over the Flip button
{
  return((mouseX > rectStartX) && (mouseX < rectStartX + rectWidth) && (mouseY > rectStartY + rectHeight + 15) && (mouseY < (rectStartY + rectHeight + 15 + rectHeight)));
}


boolean overReset() //Returns true if the mouse is currently over the Flip button
{
  return((mouseX > rectStartX) && (mouseX < rectStartX + rectWidth) && (mouseY > rectStartY + rectHeight + 15 + rectHeight + 15) && (mouseY < (rectStartY + rectHeight + 15 + rectHeight + 15 + rectHeight)));
}

void setup()
{
  size(800, 600);
  background(255);
  makeTip2TailButton();
  makeSumButton();
  makeResetButton();
  vectors = new Vector[2];
}

void draw()
{
  makeTip2TailButton();
  makeSumButton();
  makeResetButton();
}

void mousePressed()
{
  if (!overTip2Tail() && mouseClicks < 4) //We're just drawing vectors because w did not click the button. 
  {
    int randRed = int(random(0, 256));
    int randGreen = int(random(0, 256));
    int randBlue = int(random(0, 256));
    if (mouseClicks % 2 == 0) //Initial point on vector
    {
      //background(255); //Wipes the screen clean for the new vector. Comment out to allow multiple vectors drawn at once. 
      x1 = mouseX;
      y1 = mouseY;
      strokeWeight(10);
      stroke(randRed, randGreen, randBlue);
      point(x1, y1);
      mouseClicks++;
      startRed = randRed; // Need to save these random RGB values for the Vector constructor 
      startGreen = randGreen;
      startBlue = randBlue;
    } else //second point on vector
    {
      x2 = mouseX;
      y2 = mouseY;
      vectors[index] = new Vector(x1, y1, x2, y2, startRed, startGreen, startBlue);
      vectors[index].drawVector(true);
      index++;
      x1 = 0;
      y1 = 0;
      x2 = 0;
      y2 = 0; //Clear out all the fields to prepare for the next vector. 
      mouseClicks++;
    }
  }

  if (overTip2Tail())
  {
    vectors[1] = slideVector(vectors[0], vectors[1]);
    background(255);
    //makeTip2TailButton();
    vectors[0].drawVector(true);
    vectors[1].drawVector(true);
  }
  if (overSum())
  {
    //In case the user hasn't tip-to-tail'd it yet, let's go ahead and do that. 
    vectors[1] = slideVector(vectors[0], vectors[1]);
    background(255);
    vectors[0].drawVector(true);
    vectors[1].drawVector(true);
    //Draw the resultant vector
    Vector resultant = new Vector(vectors[0].x1, vectors[0].y1, vectors[1].x2, vectors[1].y2, 0, 0, 0);
    resultant.drawVector(true);
  }
    
  if(overReset())
  {
    background(255);
    mouseClicks = 0;
    index = 0;
  }
}

void tip2tail()
{
  background(255); //Clear the screen
  vectors[0].drawVector(true);
}

static Vector slideVector(Vector v1, Vector v2)
{
  int xcomp = int(v2.x2 - v2.x1);
  int ycomp = int(v2.y2 - v2.y1);
  v2.x1 = v1.x2;
  v2.y1 = v1.y2; //Redefine new initialpoint for v2
  v2.x2 = v2.x1 + xcomp;
  v2.y2 = v2.y1 + ycomp;
  return v2;
}

//Vector class
class Vector
{
  float x1, y1, x2, y2;
  int red, green, blue;

  Vector(float x1, float y1, float x2, float y2, int red, int green, int blue)
  {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.red = red;
    this.green = green;
    this.blue = blue;
  }



  float getMag()
  {
    return sqrt(pow(x2-x1, 2) + pow(y2-y1, 2));
  }

  void drawVector(boolean topArrow)
  {
    stroke(red, green, blue);
    strokeWeight(10);

    drawArrow(x1, y1, x2, y2, 0, 3, true);

    //    fill(255); //White text
    //    textSize(15);
    //    text("||m|| = " +  getMag(), magWidth, magHeight);
  }
}

//Drawing an arrow
void drawArrow(float x0, float y0, float x1, float y1, float beginHeadSize, float endHeadSize, boolean filled) 
{

  PVector d = new PVector(x1 - x0, y1 - y0);
  d.normalize();

  float coeff = 1.5;

  strokeCap(ROUND);

  line(x0+d.x*beginHeadSize*coeff/(filled?1.0f:1.75f), 
  y0+d.y*beginHeadSize*coeff/(filled?1.0f:1.75f), 
  x1-d.x*endHeadSize*coeff/(filled?1.0f:1.75f), 
  y1-d.y*endHeadSize*coeff/(filled?1.0f:1.75f));

  float angle = atan2(d.y, d.x);

  if (filled) {
    // begin head
    pushMatrix();
    translate(x0, y0);
    rotate(angle+PI);
    triangle(-beginHeadSize*coeff, -beginHeadSize, 
    -beginHeadSize*coeff, beginHeadSize, 
    0, 0);
    popMatrix();
    // end head
    pushMatrix();
    translate(x1, y1);
    rotate(angle);
    triangle(-endHeadSize*coeff, -endHeadSize, 
    -endHeadSize*coeff, endHeadSize, 
    0, 0);
    popMatrix();
  } else {
    // begin head
    pushMatrix();
    translate(x0, y0);
    rotate(angle+PI);
    strokeCap(ROUND);
    line(-beginHeadSize*coeff, -beginHeadSize, 0, 0);
    line(-beginHeadSize*coeff, beginHeadSize, 0, 0);
    popMatrix();
    // end head
    pushMatrix();
    translate(x1, y1);
    rotate(angle);
    strokeCap(ROUND);
    line(-endHeadSize*coeff, -endHeadSize, 0, 0);
    line(-endHeadSize*coeff, endHeadSize, 0, 0);
    popMatrix();
  }
}



