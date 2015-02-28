
//Heidi Peterson
//Lick-Wilmerding High School, Building and Programming Intelligent Machines: Level 2: Block G
//April 2014
//Helped a lot by teacher Natalie Freed.
//Used Processing website for tutorials on different functions/operations, such as void mousePressed(), void mouseDragged(), void mouseReleased(), and color().
//Used code from the Processing Mouse Functions tutorial <http://processing.org/examples/mousefunctions.html> to improve the drag function of the washcloth.
//Interact with this program to learn how to mix colors. Discover what color is created when you combine red and blue, or what two (or more) colors mix to create aqua. 
//Explore and experiment to find and create the twelve different possible colors. Try to recognize the theory behind color mixing (Why would green and red mix to create brown?)
//If you don't like a color you've created, or have reached the undesirable grey, click on the bucket to grab a washcloth to clear the mixing area. Return the washcloth to the bucket once the area in clean.


// Set colors
int red = color(255, 0, 0);
int yellow = color(255, 255, 0);
int blue = color(0, 0, 255);
int green = color(30, 146, 3);
int orange = color(255, 128, 0);
int purple = color(110, 5, 215);
int brown = color(117, 75, 40);
int white = color(255, 255, 255);
int black = color(0, 0, 0);
int grey = color(102, 102, 102);
int redOrange = color(250, 70, 0);
int yellowOrange = color(255, 180, 0);
int yellowGreen = color(100, 215, 0);
int aqua = color(0, 130, 130);
int magenta = color(180, 0, 255);
int indigo = color(60, 0, 215);

int currentDropColor;
int currentCenterColor = white;
int currentWashclothColor = white;
float currentBucketRed = 175;
float currentBucketGreen = 235;
float currentBucketBlue = 255;

paintCircle redCircle;
paintCircle yellowCircle;
paintCircle blueCircle;
paintDrop drop;
paintCenter center;
washcloth rag;
bucket pail;

void setup()
{
  size(500, 500);
  background(60);
  rectMode(CENTER);
  ellipseMode(RADIUS);
  redCircle = new paintCircle(125, 150, 50, red);
  yellowCircle = new paintCircle(250, 150, 50, yellow);
  blueCircle = new paintCircle(375, 150, 50, blue);
  drop = new paintDrop(mouseX, mouseY);
  center = new paintCenter(250, 325, 75);
  rag = new washcloth(400, 395, 35);
  pail = new bucket(400, 400, 50);
}

void draw()
{
  strokeWeight(1);
  background(60);
  fill(255);
  rect(width/2, height/2, 400, 400);
  
  center.display(currentCenterColor);

  redCircle.display();
  redCircle.takecolor();
  yellowCircle.display();
  yellowCircle.takecolor();
  blueCircle.display();
  blueCircle.takecolor();
  pail.display();
  pail.takeWashcloth();
}

void mousePressed() {
  if (rag.overWashcloth) {         //If the mouse is pressed while over the washcloth, then the washcloth becomes "locked" and it may now be dragged.
    rag.locked = true;
    rag.offsetX = mouseX - rag.x;
    rag.offsetY = mouseY - rag.y;
  } 
  else {
    rag.locked = false;
  }
}

void mouseDragged() {
  if (rag.locked == true) {       //If the mouse is pressed while over the washcloth and dragged, then the washcloth moves with the mouse.
    rag.x = mouseX - rag.offsetX;
    rag.y = mouseY - rag.offsetY;
  }
}

void mouseReleased() 
//Mixing colors (what two colors mix to create a third)
{
  float d = dist(mouseX, mouseY, center.x, center.y);
  if (drop.dropExist == true && d < center.centerRadius && ((currentDropColor == yellow && currentCenterColor == red) || (currentDropColor == red && currentCenterColor == yellow))) 
  {
    currentCenterColor = orange; //Red + Yellow = Orange
  }
  else if (drop.dropExist == true && d < center.centerRadius && ((currentDropColor == yellow && currentCenterColor == blue) || (currentDropColor == blue && currentCenterColor == yellow))) 
  {
    currentCenterColor = green; //Yellow + Blue = Green
  }
  else if (drop.dropExist == true && d < center.centerRadius && ((currentDropColor == red && currentCenterColor == blue) || (currentDropColor == blue && currentCenterColor == red))) 
  {
    currentCenterColor = purple; //Red + Blue = Purple
  }
  else if (drop.dropExist == true && d < center.centerRadius && ((currentDropColor == red && currentCenterColor == green) || (currentDropColor == yellow && currentCenterColor == purple) || (currentDropColor == blue && currentCenterColor == orange))) 
  {
    currentCenterColor = brown; //Red + Green = Brown; Yellow + Purple = Brown; Blue + Orange = Brown
  }
  else if (drop.dropExist == true && d < center.centerRadius && currentDropColor == blue && currentCenterColor == brown) 
  {
    currentCenterColor = black; //Blue + Brown = Black
  }
  else if (drop.dropExist == true && d < center.centerRadius && (currentDropColor == red && currentCenterColor == orange)) 
  {
    currentCenterColor = redOrange; //Red + Orange = Red Orange
  }
  else if (drop.dropExist == true && d < center.centerRadius && (currentDropColor == red && currentCenterColor == purple)) 
  {
    currentCenterColor = magenta; //Red + Purple = Magenta
  }
  else if (drop.dropExist == true && d < center.centerRadius && (currentDropColor == yellow && currentCenterColor == orange)) 
  {
    currentCenterColor = yellowOrange; //Yellow + Orange = Yellow Orange
  }
   else if (drop.dropExist == true && d < center.centerRadius && (currentDropColor == yellow && currentCenterColor == green)) 
  {
    currentCenterColor = yellowGreen; //Yellow + Green = Yellow Green
  }
  else if (drop.dropExist == true && d < center.centerRadius && (currentDropColor == blue && currentCenterColor == green)) 
  {
    currentCenterColor = aqua; //Blue + Green = Aqua
  }
   else if (drop.dropExist == true && d < center.centerRadius && (currentDropColor == blue && currentCenterColor == purple)) 
  {
    currentCenterColor = indigo; //Blue + Purple = Indigo
  }
  else if (drop.dropExist == true && d < center.centerRadius && currentCenterColor == white) 
  {
    currentCenterColor = currentDropColor; //If the center is white/empty, and a color drop is placed on it, then the center becomes the color of the drop.
  }
    else if (drop.dropExist == true && d < center.centerRadius && (currentCenterColor != currentDropColor)) {
    currentCenterColor = grey; //Another other color combinations (besides the same color being dropped on itself) create grey.
  }
  
  //When the mouse is released, the paint drop disappears
  drop.dropExist = false;
  currentDropColor = white;

//If the washcloth is dropped onto the center when it contains a color, the washcloth turns that color and the center becomes white.
//This looks as if the washcloth is absorbing/cleaning the center paint.
  if (rag.washclothExist == true && rag.locked == true && d < center.centerRadius && currentCenterColor != white) {
    currentWashclothColor = currentCenterColor;
    currentCenterColor = white;
  }

//If the washcloth is released on top of the bucket, the washcloth is cleaned and disappears and the water in the bucket gets dirtier.
  if (rag.locked == true && (dist(mouseX, mouseY, pail.x, pail.y)) < ((.4) * pail.bucketHeight)) {
    rag.washclothExist = false;
    if (currentWashclothColor != white) {
      currentBucketRed -= 10;
      currentBucketGreen -= 13.3;
      currentBucketBlue -= 13.3;
    }
    currentWashclothColor = white;
  }

  rag.locked = false;
  rag.overWashcloth = false;
}

class paintCircle {
  float x;
  float y;
  float circleRadius;
  int circleColor;

  paintCircle(float tempx, float tempy, float tempCR, int tempCC) {
    x = tempx;
    y = tempy;
    circleRadius = tempCR;
    circleColor = tempCC;
  }

  void takecolor() 
  //If a paint circle is clicked, then a drop of that paint is created and can be dragged to the center mixing area.
  {
    float d = dist(mouseX, mouseY, x, y);
    if (d < circleRadius && mousePressed && rag.locked == false && drop.dropExist == false) {
      drop.dropExist = true;
      currentDropColor = circleColor;
    }

    if (drop.dropExist == true) {
      drop.display((circleRadius/2), currentDropColor);
    }
  }

  void display() 
  {
    drawCircle(x, y, circleRadius, circleColor);
  }

  void drawCircle(float x, float y, float circleRadius, int circleColor)
  {
    fill(circleColor);
    ellipse(x, y, circleRadius, circleRadius);
  }
}

class paintDrop {
  float x;
  float y;
  boolean dropExist = false;
  int dropColor;

  paintDrop(float tempx, float tempy) {
    x = tempx;
    y = tempy;
  }

  void display(float dropRadius, int dropColor)
  {
    drawDrop(dropRadius, dropColor);
  }

  void drawDrop(float dropRadius, int dropColor)
  {
    fill(dropColor);
    ellipse(mouseX, mouseY, dropRadius, dropRadius);
  }
}

class paintCenter {
  float x;
  float y;
  float centerRadius;

  paintCenter(float tempx, float tempy, float tempCR) {
    x = tempx;
    y = tempy;
    centerRadius = tempCR;
  }

  void display(int centerColor) 
  {
    drawCenter(x, y, centerColor);
  }

  void drawCenter(float x, float y, int centerColor)
  {
    fill(centerColor);
    ellipse(x, y, centerRadius, centerRadius);
  }
}

class bucket {
  float x;
  float y;
  float bucketHeight;

  bucket(float tempx, float tempy, float tempBH) {
    x = tempx;
    y = tempy;
    bucketHeight = tempBH;
  }

  void takeWashcloth()
  //If the bucket is clicked, then a clean washcloth appears.
  {
    float d = dist(mouseX, mouseY, x, y);
    if (d < ((.4) *bucketHeight) && mousePressed && rag.washclothExist == false && drop.dropExist == false) {
      rag.washclothExist = true;
      rag.locked = true;
    }

    if (rag.washclothExist == true) {
      rag.display(currentWashclothColor);
    }
  }

  void display() 
  {
    drawBucket(x, y);
  }

  void drawBucket(float x, float y)
  {
    fill(255);
    rect(x, y, (0.8*bucketHeight), bucketHeight);
    fill(currentBucketRed, currentBucketGreen, currentBucketBlue);
    rect(x, (y+ ((0.25)*bucketHeight)), ((0.8)*bucketHeight), ((0.8)*bucketHeight));
  }
}

class washcloth {
  float x;
  float y;
  float washclothRadius;
  boolean washclothExist = false;
  boolean overWashcloth = false;
  boolean locked = false;
  float offsetX = 0.0;
  float offsetY = 0.0;

  washcloth(float tempx, float tempy, float tempWR) {
    x = tempx;
    y = tempy;
    washclothRadius = tempWR;
  }

  void display(int washclothColor)
  { //If the mouse is moved over the washcloth, then the lines of the washcloth become bold.
    if (mouseY < y+ 40 && mouseY > y && mouseX > x - 7 && mouseX < x + 7) {
      overWashcloth = true;
      if (!locked) {
        strokeWeight(2);
      }
    } 
    else {
      strokeWeight(1);
      overWashcloth = false;
    }

    fill(washclothColor);
    drawWashcloth();
  }

  void drawWashcloth()
  {
    arc(x, y, washclothRadius, washclothRadius, radians(60), radians(120), PIE);
  }
}
