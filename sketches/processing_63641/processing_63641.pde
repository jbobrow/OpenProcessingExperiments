
PImage pop1, pop2, pop3, pop4; 
PImage candy0, candy1, candy2, candy3, candy4;
int pop1X, pop1Y; // position of first dancer
int pop2X, pop2Y; // position of second dancer
int pop3X, pop3Y; // position of third dancer
int pop4X, pop4Y; // position of fourth dancer
int pop1Size = 205; // diameter of first dancer
int pop2Size = 271; // diameter of second dancer
int pop3Size = 259; // diameter of third dancer
int pop4Size = 332; // diameter of fourth dancer

// colors for line design
int colorA, colorB;

// colors for diff background images
color pinkColor;
color blueColor;
color baseColor;

boolean popOver1 = false;
boolean popOver2 = false;
boolean popOver3 = false;
boolean popOver4 = false;

void setup()
{
  size(1280,740);
  smooth();
  pop1 = loadImage("pop1.png");
  pop2 = loadImage("pop5.png");
  pop3 = loadImage("pop4.png");
  pop4 = loadImage("pop8.png");
  candy0 = loadImage("candy0.png");
  candy1 = loadImage("candyBG1.png");
  candy2 = loadImage("candyBG2.png");
  candy3 = loadImage("candyBG3.png");
  candy4 = loadImage("candyBG4.png");
  baseColor = color(255);
  pop1X = 35;
  pop1Y = 244;
  pop2X = 325;
  pop2Y = 312;
  pop3X = 618;
  pop3Y = 221;
  pop4X = 924;
  pop4Y = 252;
}

void draw()
{
  update(mouseX, mouseY);
  
  // changes the background image by rollover images
  if (popOver1) {
    background(candy1);
  } else if (popOver2) {
    background(candy2);
  } else if (popOver3) {
    background(candy3); 
  } else if (popOver4) {
    background(candy4);
  } else {
    background(candy0);
  }
  
  // the four images you can roll over
  image(pop1, pop1X, pop1Y, pop1Size, 396);
  image(pop2, pop2X, pop2Y, pop2Size, 411);
  image(pop3, pop3X, pop3Y, pop3Size, 419);
  image(pop4, pop4X, pop4Y, pop4Size, 408);
  
  
  // create line design from project one
  if( mouseX > 500 ) {
    colorA = (int)random(0,150);
  }
  else {
    colorA = (int)random(150,255);
  }
  
  if( mouseY > 150 ) {
    colorB = (int)random(0,150);
  }
  else {
    colorB = (int)random(150,255);
  }
  
  stroke(colorA, colorB, 211);
  for (int i=0; i < 14; i++) {
    for (int j=0; j < 14; j++) {
      line(i*100, 0, j*100, 200);
    }
  }
}

void update(int x, int y)
{
  if( popOver1(pop1X, pop1Y, pop1Size, pop1Size) ) {
    popOver1 = true;
    popOver2 = false;
    popOver3 = false;
    popOver4 = false;
  } else if ( popOver2(pop2X, pop2Y, pop2Size, pop2Size) ) {
    popOver2 = true;
    popOver1 = false;
    popOver3 = false;
    popOver4 = false;
  } else if ( popOver3(pop3X, pop3Y, pop3Size, pop3Size) ) {
    popOver3 = true;
    popOver1 = false;
    popOver2 = false;
    popOver4 = false;
  } else if ( popOver4(pop4X, pop4Y, pop4Size, pop4Size) ) {
    popOver4 = true;
    popOver1 = false;
    popOver2 = false;
    popOver3 = false;
  } else {
    popOver1 = popOver2 = popOver3 = popOver4 = false;
  }
}

boolean popOver1(int x, int y, int width, int height)
{
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
        return true;
      } else {
        return false;
      }
}

boolean popOver2(int x, int y, int width, int height)
{
    if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
        return true;
      } else {
        return false;
      }
}

boolean popOver3(int x, int y, int width, int height)
{
    if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
        return true;
      } else {
        return false;
      }
}

boolean popOver4(int x, int y, int width, int height)
{
    if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
        return true;
      } else {
        return false;
      }
}


