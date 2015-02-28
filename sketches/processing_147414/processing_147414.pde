
// copyright 2014 Hyun Doug Kim
// Final project #1


// if you wait, Scotty the CMU dog will grow as the number of students increases. 
// you have to wait a bit;;

// the year ranges from 1993-2013 and student number inceases from 4302 to 6223

PImage pic;
PImage background;

float [] cmu = {4302, 4388, 4437, 4823, 4876, 5050, 5136, 5106, 5194, 5347, 5337, 5389, 5494, 5580, 5758, 5892, 5951, 6020, 6178, 6203, 6223};
float [] year = {1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013};
float [] delta = {1, 2, 3, 4, 5, 6, 7};

int dimension;
int dimension2;
int currentTime;
int startTime;

void setup() 
{
  size(600, 600);
  noStroke();
  smooth();
  
  textAlign(CORNER);
  
  pic= loadImage ("dog.jpg");
  background= loadImage ("plaid.jpg");
  dimension= 2;
  dimension2= 10;
  startTime = millis();
}

void draw() {
  currentTime = millis();
  if (currentTime > startTime + 1000)
{
  drawDog();
  dimension ++; // dimension increase equals year
  dimension2 ++;
  showStats();
  startTime = millis();
}
}

void drawDog ()
{
//  for (int i = 0; i< year.length; i++)
//  {
      image (background, 0, 0, 600, 600);
      float  x1 = map(cmu[constrain(dimension, 0, 19)], 4300, 6000, 0, 400);
      image (pic, 30, 30, x1+ dimension, dimension2);
//  }
}

void showStats()
{
//  for (int i = 0; i< year.length; i++)
//  {
      background= loadImage ("plaid.jpg");
  fill (255);
  text("Number of CMU students" +cmu[constrain(dimension,0, 19)], width *.5, height-300);
  text("Year" + year [constrain(dimension, 0, 19)], width *.5, height- 320);
//  }
}



