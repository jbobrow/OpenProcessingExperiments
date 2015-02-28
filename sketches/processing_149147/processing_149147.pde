
//Heidi Peterson
//Lick-Wilmerding High School, Building and Programming Intelligent Machines: Level 2: Block G
//May 2014
//Helped a lot by teacher Natalie Freed.
//Used Processing website for tutorials on different functions/operations, such as void mousePressed(), void mouseDragged(), void mouseReleased(), color(), text(), textAlign(), and LoadDisplayImage. 
//Used code from the Processing Mouse Functions tutorial <http://processing.org/examples/mousefunctions.html> to improve the drag function of the washcloth.
//Used code from the Processing Load and Display tutorial <https://www.processing.org/examples/loaddisplayimage.html> to load image of wooden pallete.
//This Color Mixology 2. 
//The new version features a wooden palette background, the ability to save colors you've mixed in empty paint circles, and displays of the name of the color you've mixed and the name of the color you run your mouse over.
//Interact with this program to learn how to mix colors. Discover what color is created when you combine red and blue, or what two (or more) colors mix to create aqua. 
//Explore and experiment to find and create the thirty different possible colors. Try to recognize the theory behind color mixing (Why would green and red mix to create brown?)
//If you like a color you've created, and want to save it to use later, drag it into one of the empty paint circles. To clean a paint circle to make room for more colors, use the washcloth.
//If you don't like a color you've created, or have reached the undesirable grey, click on the bucket to grab a washcloth to clear the mixing area. Return the washcloth to the bucke once the area is clean.

PImage img;  // Declare variable "a" of type PImage

// Set colors
namedColor clean = new namedColor(color(240, 240, 240), "Clean");
namedColor red = new namedColor(color(255, 0, 0), "Red");
namedColor yellow = new namedColor(color(255, 255, 0), "Yellow");
namedColor blue = new namedColor(color(0, 0, 255), "Blue");
namedColor green = new namedColor(color(30, 146, 3), "Green");
namedColor orange = new namedColor(color(255, 128, 0), "Orange");
namedColor purple = new namedColor(color(110, 5, 215), "Purple");
namedColor brown = new namedColor(color(117, 75, 40), "Brown");
namedColor white = new namedColor(color(255, 255, 255), "White");
namedColor black = new namedColor(color(0, 0, 0), "Black");
namedColor grey = new namedColor(color(102, 102, 102), "Grey");
namedColor redOrange = new namedColor(color(250, 70, 0), "Red Orange");
namedColor yellowOrange = new namedColor(color(255, 180, 0), "Yellow Orange");
namedColor yellowGreen = new namedColor(color(100, 215, 0), "Yellow Green");
namedColor aqua = new namedColor(color(0, 130, 130), "Aqua");
namedColor magenta = new namedColor(color(180, 0, 255), "Magenta");
namedColor indigo = new namedColor(color(60, 0, 215), "Indigo");
namedColor pink = new namedColor(color(252, 108, 139), "Pink");
namedColor paleYellow = new namedColor(color(255, 255, 120), "Pale Yellow");
namedColor babyBlue = new namedColor(color(111, 160, 255), "Baby Blue");
namedColor lavender = new namedColor(color(204, 102, 255), "Lavender");
namedColor paleOrange = new namedColor(color(253, 165, 86), "Pale Orange");
namedColor paleGreen = new namedColor(color(100, 188, 79), "Pale Green");
namedColor palePurple = new namedColor(color(135, 94, 200), "Pale Purple");
namedColor paleYellowOrange = new namedColor(color(254, 204, 91), "Pale Yellow Orange");
namedColor paleYellowGreen = new namedColor(color(144, 230, 78), "Pale Yellow Green");
namedColor paleRedOrange = new namedColor(color(252, 110, 67), "Pale Red Orange");
namedColor paleAqua = new namedColor(color(62, 166, 164), "Pale Aqua");
namedColor paleIndigo = new namedColor(color(72, 66, 237), "Pale Indigo");
namedColor paleBrown = new namedColor(color(170, 118, 75), "Pale Brown");
namedColor silver = new namedColor(color(165, 165, 165), "Silver");


int currentDropColor;
String currentDropName;
String currentColorName;
int currentCenterColor = clean.colour;
int currentWashclothColor = clean.colour;
float currentBucketRed = 175;
float currentBucketGreen = 235;
float currentBucketBlue = 255;
float dropSize;
boolean colorChange;
String colorName = " ";

paintCircle redCircle;
paintCircle yellowCircle;
paintCircle blueCircle;
paintCircle whiteCircle;
emptyPaintCircle empty1;
emptyPaintCircle empty2;
emptyPaintCircle empty3;
emptyPaintCircle empty4;
emptyPaintCircle empty5;
paintDrop drop;
paintCenter center;
washcloth rag;
bucket pail;

void setup()
{
  size(1100, 800);
  background(60);
  rectMode(CENTER);
  ellipseMode(RADIUS);
  img = loadImage("Palette2.png");  // Load the image into the program
  whiteCircle = new paintCircle(295, 220, 40, white.colour, white.name);
  yellowCircle = new paintCircle(420, 165, 40, yellow.colour, yellow.name);
  redCircle = new paintCircle(560, 150, 40, red.colour, red.name);
  blueCircle = new paintCircle(705, 175, 40, blue.colour, blue.name);
  empty1 = new emptyPaintCircle(835, 255, 40, clean.colour, clean.name);
  empty2 = new emptyPaintCircle(910, 375, 40, clean.colour, clean.name);
  empty3 = new emptyPaintCircle(875, 500, 40, clean.colour, clean.name);
  empty4 = new emptyPaintCircle(765, 585, 40, clean.colour, clean.name);
  empty5 = new emptyPaintCircle(630, 630, 40, clean.colour, clean.name);
  drop = new paintDrop(mouseX, mouseY);
  center = new paintCenter(585, 400, 75);
  rag = new washcloth(1010, 690, 60);
  pail = new bucket(1010, 690, 100);
}

void draw()
{
  background(60);
  image(img, 0, 0, 1100, 800); // Displays the image at point (0,0)
  strokeWeight(1);
  fill(255);

  center.display(currentCenterColor);
  center.takecolor();
  whiteCircle.display();
  whiteCircle.takecolor();
  redCircle.display();
  redCircle.takecolor();
  yellowCircle.display();
  yellowCircle.takecolor();
  blueCircle.display();
  blueCircle.takecolor();
  empty1.display();
  empty1.takecolor();
  empty2.display();
  empty2.takecolor();
  empty3.display();
  empty3.takecolor();
  empty4.display();
  empty4.takecolor();
  empty5.display();
  empty5.takecolor();
  pail.display();
  pail.takeWashcloth();

  if (drop.dropExist == true) {
    drop.display(dropSize, currentDropColor); // Gives opportunity to display different size drops.
  }

  //Display name of color in center below center
  fill(0);
  textSize(30);
  textAlign(CENTER);
  text(colorName, 585, 525);

  println(currentDropName);
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
{
  float d = dist(mouseX, mouseY, center.x, center.y);

  //Mixing colors (two colors mix to create a third)
  center.mixColor();


  //Filling empty paint circles
  empty1.fillCircle();
  empty2.fillCircle();
  empty3.fillCircle();
  empty4.fillCircle();
  empty5.fillCircle();

  //Cleaning previously empty circles
  empty1.cleanCircle();
  empty2.cleanCircle();
  empty3.cleanCircle();
  empty4.cleanCircle();
  empty5.cleanCircle();


  //When the mouse is released, the paint drop disappears
  drop.dropExist = false;
  currentDropColor = clean.colour;

  //If the washcloth is dropped onto the center when it contains a color, the washcloth turns that color and the center becomes white.
  //This looks as if the washcloth is absorbing/cleaning the center paint.
  if (rag.washclothExist == true && rag.locked == true && d < center.centerRadius && currentCenterColor != clean.colour) {
    currentWashclothColor = currentCenterColor;
    center.centerClean = true;
    currentCenterColor = clean.colour;
    colorName = " ";
  }

  //If the washcloth is released on top of the bucket, the washcloth is cleaned and disappears and the water in the bucket gets dirtier.
  if (rag.locked == true && (dist(mouseX, mouseY, pail.x, pail.y)) < ((.45) * pail.bucketHeight)) {
    rag.washclothExist = false;
    if (currentWashclothColor != clean.colour) {
      currentBucketRed -= 10;
      currentBucketGreen -= 13.3;
      currentBucketBlue -= 13.3;
    }
    currentWashclothColor = clean.colour;
  }

  rag.locked = false;
  rag.overWashcloth = false;
}

class paintCircle {
  float x;
  float y;
  float circleRadius;
  int circleColor;
  String circleName;
  boolean overCircle = false;


  paintCircle(float tempx, float tempy, float tempCR, int tempCC, String tempCN) {
    x = tempx;
    y = tempy;
    circleRadius = tempCR;
    circleColor = tempCC;
    circleName = tempCN;
  }

  void takecolor() 
  //If a paint circle is clicked, then a drop of that paint is created and can be dragged to the center mixing area.
  {
    float d = dist(mouseX, mouseY, x, y);
    if (d < circleRadius && mousePressed && rag.locked == false && drop.dropExist == false) {
      drop.dropExist = true;
      currentDropColor = circleColor;
      currentDropName = circleName;
      dropSize = circleRadius/2;
    }
  }

  void display() 
  {
    float d = dist(mouseX, mouseY, x, y);
    if (d < circleRadius) {
      overCircle = true;
      strokeWeight(2);
      fill(255);
      rect(935, 50, 270, 40);
      fill(0);
      textSize(25);
      String s = circleName;
      text(s, 935, 55, 270, 40);
    } 
    else {
      strokeWeight(1);
      overCircle = false;
    }

    drawCircle(x, y, circleRadius, circleColor);
  }

  void drawCircle(float x, float y, float circleRadius, int circleColor)
  {
    fill(circleColor);
    ellipse(x, y, circleRadius, circleRadius);
  }
}

class emptyPaintCircle {
  float x;
  float y;
  float circleRadius;
  int circleColor;
  boolean paintCircleClean = true;
  boolean overCircle = false;
  String circleName;

  emptyPaintCircle(float tempx, float tempy, float tempCR, int tempCC, String tempCN) {
    x = tempx;
    y = tempy;
    circleRadius = tempCR;
    circleColor = tempCC;
    circleName = tempCN;
  }

  void takecolor() 
  //If a paint circle is clicked, then a drop of that paint is created and can be dragged to the center mixing area.
  {
    float d = dist(mouseX, mouseY, x, y);
    if (d < circleRadius && mousePressed && rag.locked == false && drop.dropExist == false && paintCircleClean == false) {
      drop.dropExist = true;
      currentDropColor = circleColor;
      currentDropName = circleName;
      dropSize = circleRadius/2;
    }
  }

  void fillCircle() 
    //If a paint drop is taken from the center and dropped onto an empty paint circle, then that empty paint circle fills with the center color, and the center becomes clean/empty.
  {
    float d = dist(mouseX, mouseY, x, y);
    if (drop.dropExist == true && dropSize == center.centerRadius/2 && paintCircleClean == true && d < circleRadius) {
      paintCircleClean = false;
      circleColor = currentDropColor;
      circleName = currentDropName;
    }
  }

  void cleanCircle() 
    //If the washcloth is released onto a filled empty paint circle, then the washcloth becomes the color of the circle and the circle becomes clean.
  {
    float d = dist(mouseX, mouseY, x, y);
    if (rag.washclothExist == true && rag.locked == true && d < circleRadius) {
      currentWashclothColor = circleColor;
      paintCircleClean = true;
    }
  }

  void display() 
  {
    float d = dist(mouseX, mouseY, x, y);
    if (d < circleRadius && paintCircleClean == false) {
      overCircle = true;
      strokeWeight(2);
      fill(255);
      rect(935, 50, 270, 40);
      fill(0);
      textSize(25);
      String s = circleName;
      text(s, 935, 55, 270, 40);
    } 
    else {
      strokeWeight(1);
      overCircle = false;
    }
    drawCircle(x, y, circleRadius, circleColor);
  }

  void drawCircle(float x, float y, float circleRadius, int circleColor)
  {
    if (paintCircleClean) {
      noFill();
      ellipse(x, y, circleRadius, circleRadius);
    }
    else {
      fill(circleColor);
      ellipse(x, y, circleRadius, circleRadius);
    }
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
    if (d < ((.5) *bucketHeight) && mousePressed && rag.washclothExist == false && drop.dropExist == false) {
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
    if (mouseY < y+ 60 && mouseY > y && mouseX > x - 15 && mouseX < x + 15) {
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

class paintCenter {
  float x;
  float y;
  float centerRadius;
  boolean centerClean = true;
  String centerName;

  paintCenter(float tempx, float tempy, float tempCR) {
    x = tempx;
    y = tempy;
    centerRadius = tempCR;
  }

  void takecolor() 
  //If the center is clicked, then a drop of that paint is created and can be dragged to the an empty paint circle.
  {
    float d = dist(mouseX, mouseY, x, y);
    if (d < centerRadius && mousePressed && rag.locked == false && drop.dropExist == false && centerClean == false) {
      drop.dropExist = true;
      currentDropColor = currentCenterColor;
      currentDropName = centerName;
      dropSize = centerRadius/2;
      centerClean = true;
      currentCenterColor = clean.colour;
      colorName = " ";
    }
  }

  void mixColor()
  {
    float d = dist(mouseX, mouseY, x, y);

    //Secondary Colors
    center.checkColors(red.colour, yellow.colour, orange.colour, orange.name); //Red + Yellow = Orange
    center.checkColors(blue.colour, yellow.colour, green.colour, green.name); //Yellow + Blue = Green
    center.checkColors(red.colour, blue.colour, purple.colour, purple.name); //Red + Blue = Purple

      //Brown & Black
    center.checkColors(blue.colour, orange.colour, brown.colour, brown.name); //Blue + Orange = Brown
    center.checkColors(red.colour, green.colour, brown.colour, brown.name); //Red + Green = Brown
    center.checkColors(yellow.colour, purple.colour, brown.colour, brown.name); //Yellow + Purple = Brown
    center.checkColors(blue.colour, brown.colour, black.colour, black.name); //Blue + Brown = Black

    //Tertiary Colors
    center.checkColors(red.colour, orange.colour, redOrange.colour, redOrange.name); //Red + Orange = Red Orange
    center.checkColors(red.colour, purple.colour, magenta.colour, magenta.name); //Red + Purple = Magenta
    center.checkColors(yellow.colour, orange.colour, yellowOrange.colour, yellowOrange.name); //Yellow + Orange = Yellow Orange
    center.checkColors(yellow.colour, green.colour, yellowGreen.colour, yellowGreen.name); //Yellow + Green = Yellow Green
    center.checkColors(blue.colour, green.colour, aqua.colour, aqua.name); //Blue + Green = Aqua
    center.checkColors(blue.colour, purple.colour, indigo.colour, indigo.name); //Blue + Purple = Indigo

    //White colors
    center.checkColors(red.colour, white.colour, pink.colour, pink.name); //Red + White = Pink
    center.checkColors(yellow.colour, white.colour, paleYellow.colour, paleYellow.name); //Yellow + White = Pale Yellow
    center.checkColors(blue.colour, white.colour, babyBlue.colour, babyBlue.name); //Blue + White = Baby Blue
    center.checkColors(green.colour, white.colour, paleGreen.colour, paleGreen.name); //Green + White = Pale Green
    center.checkColors(blue.colour, paleYellow.colour, paleGreen.colour, paleGreen.name); //Blue + Pale Yellow = Pale Green
    center.checkColors(yellow.colour, babyBlue.colour, paleGreen.colour, paleGreen.name); //Yellow + Baby Blue = Pale Green
    center.checkColors(orange.colour, white.colour, paleOrange.colour, paleOrange.name); //Orange + White = Pale Orange
    center.checkColors(red.colour, paleYellow.colour, paleOrange.colour, paleOrange.name); //Red + Pale Yellow = Pale Orange
    center.checkColors(yellow.colour, pink.colour, paleOrange.colour, paleOrange.name); //Yellow + Pink = Pale Orange
    center.checkColors(purple.colour, white.colour, palePurple.colour, palePurple.name); //Purple + White = Pale Purple
    center.checkColors(blue.colour, pink.colour, palePurple.colour, palePurple.name); //Blue + Pink = Pale Purple
    center.checkColors(red.colour, babyBlue.colour, palePurple.colour, palePurple.name); //Baby Blue + Red = Pale Purple
    center.checkColors(magenta.colour, white.colour, lavender.colour, lavender.name); //Magenta + White = Lavender
    center.checkColors(red.colour, palePurple.colour, lavender.colour, lavender.name); //Red + Pale Purple = Lavender
    center.checkColors(pink.colour, purple.colour, lavender.colour, lavender.name); //Pink + Purple = Lavender
    center.checkColors(redOrange.colour, white.colour, paleRedOrange.colour, paleRedOrange.name); //Red Orange + White = Pale Red Orange
    center.checkColors(red.colour, paleOrange.colour, paleRedOrange.colour, paleRedOrange.name); //Red + Pale Orange = Pale Red Orange
    center.checkColors(pink.colour, orange.colour, paleRedOrange.colour, paleRedOrange.name); //Pink + Orange = Pale Red Orange
    center.checkColors(yellowOrange.colour, white.colour, paleYellowOrange.colour, paleYellowOrange.name); //Yellow Orange + White = PaleYellowOrange
    center.checkColors(yellow.colour, paleOrange.colour, paleYellowOrange.colour, paleYellowOrange.name); //Yellow + Pale Orange = PaleYellowOrange
    center.checkColors(paleYellow.colour, orange.colour, paleYellowOrange.colour, paleYellowOrange.name); //Pale Yellow + Orange = PaleYellowOrange
    center.checkColors(yellowGreen.colour, white.colour, paleYellowGreen.colour, paleYellowGreen.name); //Yellow Green + White = Pale Yellow Green
    center.checkColors(yellow.colour, paleGreen.colour, paleYellowGreen.colour, paleYellowGreen.name); //Yellow + Pale Green = Pale Yellow Green
    center.checkColors(paleYellow.colour, green.colour, paleYellowGreen.colour, paleYellowGreen.name); //Pale Yellow + Green = Pale Yellow Green
    center.checkColors(aqua.colour, white.colour, paleAqua.colour, paleAqua.name); //Aqua + White = Pale Aqua
    center.checkColors(blue.colour, paleGreen.colour, paleAqua.colour, paleAqua.name); //Blue + Pale Green = Pale Aqua
    center.checkColors(babyBlue.colour, green.colour, paleAqua.colour, paleAqua.name); //Baby Blue + Green = Pale Aqua
    center.checkColors(indigo.colour, white.colour, paleIndigo.colour, paleIndigo.name); //Indigo + White = Pale Indigo
    center.checkColors(blue.colour, palePurple.colour, paleIndigo.colour, paleIndigo.name); //Blue + Pale Purple = Pale Indigo
    center.checkColors(babyBlue.colour, purple.colour, paleIndigo.colour, paleIndigo.name); //Baby Blue + Purple = Pale Indigo
    center.checkColors(grey.colour, white.colour, silver.colour, silver.name); //Grey + White = Silver
    center.checkColors(paleBrown.colour, babyBlue.colour, silver.colour, silver.name); //Pale Brown + Baby Blue = Silver
    center.checkColors(brown.colour, white.colour, paleBrown.colour, paleBrown.name); //Brown + White = Pale Brown
    center.checkColors(red.colour, paleGreen.colour, paleBrown.colour, paleBrown.name); //Red + Pale Green = Pale Brown
    center.checkColors(yellow.colour, palePurple.colour, paleBrown.colour, paleBrown.name); //Yellow + Pale Purple = Pale Brown
    center.checkColors(blue.colour, paleOrange.colour, paleBrown.colour, paleBrown.name); //Blue + Pale Orange = Pale Brown


    //Returning to primary colors (almost)
    center.checkColors(yellow.colour, yellowOrange.colour, yellow.colour, yellow.name); //Yellow + Yellow Orange = Yellow
    center.checkColors(yellow.colour, yellowGreen.colour, yellow.colour, yellow.name); //Yellow + Yellow Green = Yellow
    center.checkColors(yellow.colour, paleYellow.colour, yellow.colour, yellow.name); //Yellow + Pale Yellow = Yellow
    center.checkColors(yellow.colour, paleYellowOrange.colour, yellow.colour, yellow.name); //Yellow + Pale Yellow Orange = Yellow
    center.checkColors(yellow.colour, paleYellowGreen.colour, yellow.colour, yellow.name); //Yellow + Pale Yellow Green = Yellow
    center.checkColors(red.colour, redOrange.colour, red.colour, red.name); //Red + Red Orange = Red
    center.checkColors(red.colour, magenta.colour, red.colour, red.name); //Red + Magenta = Red
    center.checkColors(red.colour, pink.colour, red.colour, red.name); //Red + Pink = Red
    center.checkColors(red.colour, paleRedOrange.colour, red.colour, red.name); //Red + Pale Red Orange = Red
    center.checkColors(red.colour, lavender.colour, red.colour, red.name); //Red + Lavender = Red
    center.checkColors(blue.colour, aqua.colour, blue.colour, blue.name); //Blue + Aqua = Blue
    center.checkColors(blue.colour, indigo.colour, blue.colour, blue.name); //Blue + Indigo = Blue
    center.checkColors(blue.colour, babyBlue.colour, blue.colour, blue.name); //Blue + Baby Blue = Blue
    center.checkColors(blue.colour, paleIndigo.colour, blue.colour, blue.name); //Blue + Pale Indigo = Blue
    center.checkColors(blue.colour, paleAqua.colour, blue.colour, blue.name); //Blue + Pale Aqua = Blue

      //Returning to white (almost)
    center.checkColors(white.colour, paleYellow.colour, white.colour, white.name); //Pale Yellow + White = White
    center.checkColors(white.colour, paleYellowGreen.colour, white.colour, white.name); //Pale Yellow Green + White = White
    center.checkColors(white.colour, paleYellowOrange.colour, white.colour, white.name); //Pale Yellow Orange + White = White
    center.checkColors(white.colour, paleIndigo.colour, white.colour, white.name); //Pale Indigo + White = White
    center.checkColors(white.colour, paleAqua.colour, white.colour, white.name); //Pale Aqua + White = White
    center.checkColors(white.colour, pink.colour, white.colour, white.name); //Pink + White = White
    center.checkColors(white.colour, paleRedOrange.colour, white.colour, white.name); //Pale Red Orange + White = White
    center.checkColors(white.colour, lavender.colour, white.colour, white.name); //Lavender + White = White
    center.checkColors(white.colour, babyBlue.colour, white.colour, white.name); //Baby Blue + White = White
    center.checkColors(white.colour, paleOrange.colour, white.colour, white.name); //Pale Orange + White = White
    center.checkColors(white.colour, paleGreen.colour, white.colour, white.name); //Pale Green + White = White
    center.checkColors(white.colour, palePurple.colour, white.colour, white.name); //Pale Purple + White = White
    center.checkColors(white.colour, paleBrown.colour, white.colour, white.name); //Pale Brown + White = White
    center.checkColors(white.colour, silver.colour, white.colour, white.name); //Silver + White = White

      if (drop.dropExist == true && d < centerRadius && currentCenterColor == clean.colour) 
    {
      center.centerClean = false;
      currentCenterColor = currentDropColor; //If the center is white/empty, and a color drop is placed on it, then the center becomes the color of the drop.
      colorChange = true;
      colorName = currentDropName;
      centerName = currentDropName;
    }

    if (drop.dropExist == true && d < centerRadius && colorChange == false && (currentCenterColor != currentDropColor)) {
      currentCenterColor = grey.colour; //Another other color combinations (besides the same color being dropped on itself) create grey.
      colorChange = true;
      colorName = "Grey";
      centerName = grey.name;
    }

    colorChange = false;
  }

  void checkColors(int color1, int color2, int color3, String name)
  {
    float d = dist(mouseX, mouseY, x, y);
    if (drop.dropExist == true && d < centerRadius && colorChange == false && (currentDropColor == color1 && currentCenterColor == color2) || 
      (currentDropColor == color2 && currentCenterColor == color1)) //If color1 and color2 are mixed, then color3 is created.
    {
      currentCenterColor = color3;
      colorChange = true;
      colorName = name;
      centerName = name;
      center.centerClean = false;
    }
  }

  void display(int centerColor) 
  {
    drawCenter(x, y, centerColor);
  }

  void drawCenter(float x, float y, int centerColor)
  {
    if (centerClean) {
      noFill();
      ellipse(x, y, centerRadius, centerRadius);
    }
    else {
      fill(centerColor);
      ellipse(x, y, centerRadius, centerRadius);
    }
  }
}

class namedColor //Class used to give colors values and names.
{
  int colour;
  String name;

  namedColor(int tempColour, String tempName)
  {
    colour = tempColour;
    name = tempName;
  }
}
