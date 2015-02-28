
// Copyrigth 2014 Jacklynn Pham
// Homework #9
// Array of images and strings


// press any key to show captions or hover over menu circle

PImage frame;
PImage [] picArray;

String [] caps = {
  "date knight", "grad school", "computer demands", "finals week", "bz", "spirit animal"
};

final int MAX_IMAGE = 6;

float x, y, wd, fwd, fht; // image variables
float spacing; // image spaces

float mx, my, mwd; // mouse variables

int state = 0;

void setup()
{
  size(800, 800);
  frame = loadImage("frame.png");
  imageMode(CENTER);  
  noStroke();

  picArray = new PImage [ MAX_IMAGE ]; 
  initImageArray (picArray);

  wd = 250;
  fwd = 250; //frame width
  fht = 433;

  mx = width/2;
  my= height/2;
  mwd = 25;

  x =width/2-fwd/4;
  y = height/2-fht/2+wd/4+60;
}


void draw()
{
  background(255);
  drawBackground(); // iphone background
  showImages(); // array of first column of images
  secondCol(); // array of second column of images
  drawText(); 
  //drawCaps();
  showCaps(); // shows captions
  drawMenu(); // draws circle menu button
  activateMenu(); // hover state for menu
}

void showCaps() { // show captions box
  if (keyPressed==true)
  {  
    drawCaps();
  }
  else
  {
    fill(0, 0); // transparent
  }
}

void drawCaps() // draw caption text
{
  fill(0, 200); 
  rectMode(CENTER);
  rect(width/2, height/2+30, fwd, fht-60); //space for content
  fill(255);
  textSize(10);
  textAlign(LEFT);
  for ( int i = 0; i < 2; i++) // first row
  {

    text ( caps[i], i*110+width/2-fwd/3, y);
  }
  for ( int j = 2; j < 4; j++) // second row
  {
    text ( caps[j], j*120+fwd/4, y+wd/2);
  }

  for ( int k = 4; k < 6; k++) // third row
  {
    text ( caps[k], k*110*.75, y+wd);
  }
}


void secondCol() // second column of images
{
  for (int j = 3; j < picArray.length; j++)
  {
    spacing = j*wd/2;
    image( picArray[j], x+wd/2, (y-wd*6/4)+spacing, wd/2, wd/2 );
  }
}

void showImages () // first column of images
{

  for (int i = 0; i < picArray.length-3; i++)
  {
    //imageMode(CORNER);
    spacing = i*wd/2;
    image( picArray[i], x, y+spacing, wd/2, wd/2 );
  }
}

void initImageArray ( PImage [] picArray) // load image array
{
  for (int i = 0; i < picArray.length; i++)
  {
    String imageName = "p" + i + ".jpg" ; // calls image by name
    picArray[i] = loadImage(imageName);
  }
}

void activateMenu() // show captions by activating menu
{
  if (mouseX >= mx+fwd/3+15-mwd && mouseX <=width-290 && mouseY >= my-fht/2+25-mwd && mouseY<= my-fht/2+25+mwd)
  {
    drawCaps();
  }
}

void drawMenu() // draws menu button
{
  fill(#5EA9CE);
  ellipse(mx+fwd/3+15, my-fht/2+25, mwd, mwd);
  fill(255);
  textSize(18);
  text("i", mx+fwd/3+15, my-fht/2+30);
}

void drawText() 
{
  fill(255);
  textSize(25);
  textAlign(LEFT);
  text("Doodle Keeper", x-fwd/5, y-fht/5);
  fill(200);
  textAlign(CENTER);
  text("(press any key or hover over menu to show captions)", width/2, height-50);
}

void drawBackground() // draws iphone background
{
  imageMode(CENTER);
  image(frame, width/2-4, height/2);//centering the frame
  fill(#A7C1CE); 
  rectMode(CENTER);
  rect(width/2, height/2, fwd, fht); //space for content
}



