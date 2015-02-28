
// Homework #10
// Visualizing Data
//© Eden Weingart 2013
// eweingart@andrew.cmu.edu
//images and data sourced from: http://www.realsimple.com/food-recipes/shopping-storing/food/common-types-pasta-00000000040544/index.html


int phase;
float [ ] pcooktime = {10.5, 9, 10, 11, 10, 7, 9, 10, 11, 12, 8, 10, 11, 6, 5, 0, 0};
PFont f1;
PFont f2;
PImage p;
PImage pBowl, pbackground;
PImage [ ] imageArray;
int d;
void setup ()
{
  size (400, 400);
  rectMode(CENTER);
  f1 = loadFont ("f1.vlw");
  f2 = loadFont ("f2.vlw");
  textSize (11);
  textAlign ( CENTER, CENTER);
  textFont (f2, 12);
  imageMode (CENTER);
  phase = 0;
  d= 240;

  imageArray = new PImage[16];
  for(int i = 1; i <= 15; i++)
  {
      if( i < 10 )
        imageArray[i] = loadImage("0" + i + ".jpg");
      else
        imageArray[i] = loadImage(i + ".jpg");

  }

  pBowl = loadImage("bowl.jpg");
  pbackground = loadImage("bowlbackground.jpg"); ;

}

void draw ()
{
  background(255);
  drawPastas();
}

void drawPastas()
{
   fill (0);
   text ( "Phase#" + phase + "\nData:" + pcooktime [ phase ], 200, 200);
    if (phase == 0)
    {
      p = pbackground;
      image (p, 200, 200);
    }


    if (phase == 1)
  {
    p = imageArray[1];
    image (p, 200, 200);
    textFont (f1, 40);
    fill (0);
    text ("ZITI", 200, 200);
    textFont (f2, 16);
    text ("Average Cook Time: " + pcooktime [ phase-1 ] + " minutes", 200, d);


  }

    if (phase == 2)
  {
    p = imageArray[2];
    image (p, 200, 200);
    fill (0);
    textFont (f1, 40);
    text ("SPAGHETTI", 200, 200);
    textFont (f2, 16);
    text ("Average Cook Time: " + pcooktime [ phase-1 ] + " minutes", 200, d);

  }

      if (phase == 3)
  {
    p = imageArray[3];
    image (p, 200, 200);
    fill (0);
    textFont (f1, 40);
    text ("SHELLS", 200, 200);
    textFont (f2, 16);
    text ("Average Cook Time: " + pcooktime [ phase-1 ] + " minutes", 200, d);

  }

    if (phase == 4)
  {
    p = imageArray[4];
    image (p, 200, 200);
    fill (0);
    textFont (f1, 40);
    text ("RIGATONI", 200, 200);
    textFont (f2, 16);
    text ("Average Cook Time: " + pcooktime [ phase-1 ] + " minutes", 200, d);

  }

      if (phase == 5)
  {
    p = imageArray[5];
    image (p, 200, 200);
    fill (0);
    textFont (f1, 40);
    text ("PENNE", 200, 200);
    textFont (f2, 16);
    text ("Average Cook Time: " + pcooktime [ phase-1 ] + " minutes", 200, d);

  }


    if (phase == 6)
  {
    p = imageArray[6];
    image (p, 200, 200);
    fill (0);
    textFont (f1, 40);
    text ("PAPPARDELLE", 200, 200);
    textFont (f2, 16);
    text ("Average Cook Time: " + pcooktime [ phase-1 ] + " minutes", 200, d);

  }

    if (phase == 7)
  {
    p = imageArray[7];
    image (p, 200, 200);
    fill (0);
    textFont (f1, 40);
    text ("ORZO", 200, 200);
    textFont (f2, 16);
    text ("Average Cook Time: " + pcooktime [ phase-1 ] + " minutes", 200, d);

  }

    if (phase == 8)
  {
    p = imageArray[8];
    image (p, 200, 200);
    fill (0);
    textFont (f1, 40);
    text ("ORECCHIETTE", 200, 200);
    textFont (f2, 16);
    text ("Average Cook Time: " + pcooktime [ phase-1 ] + " minutes", 200, d);

  }

    if (phase == 9)
  {
    p = imageArray[9];
    image (p, 200, 200);
    fill (0);
    textFont (f1, 40);
    text ("LINGUINE", 200, 200);
    textFont (f2, 16);
    text ("Average Cook Time: " + pcooktime [ phase-1 ] + " minutes", 200, d);
  }

    if (phase == 10)
  {
    p = imageArray[10];
    image (p, 200, 200);
    fill (0);
    textFont (f1, 40);
    text ("JUMBO SHELL", 200, 200);
    textFont (f2, 16);
    text ("Average Cook Time: " + pcooktime [ phase-1 ] + " minutes", 200, d);
  }


    if (phase == 11)
  {
    p = imageArray[11];
    image (p, 200, 200);
    fill (0);
    textFont (f1, 40);
    text ("FUSILLI", 200, 200);
    textFont (f2, 16);
    text ("Average Cook Time: " + pcooktime [ phase-1 ] + " minutes", 200, d);
  }

      if (phase == 12)
  {
    p = imageArray[12];
    image (p, 200, 200);
    fill (0);
    textFont (f1, 40);
    text ("FETTUCCINE", 200, 200);
    textFont (f2, 16);
    text ("Average Cook Time: " + pcooktime [ phase-1 ] + " minutes", 200, d);
  }

      if (phase == 13)
  {
    p = imageArray[13];
    image (p, 200, 200);
    fill (0);
    textFont (f1, 40);
    text ("FARFALLE", 200, 200);
    textFont (f2, 16);
    text ("Average Cook Time: " + pcooktime [ phase-1 ] + " minutes", 200, d);
  }

      if (phase == 14)
  {
    p = imageArray[14];
    image (p, 200, 200);
    fill (0);
    textFont (f1, 40);
    text ("MACARONI", 200, 200);
    textFont (f2, 16);
    text ("Average Cook Time: " + pcooktime [ phase-1 ] + " minutes", 200, d);
  }

      if (phase == 15)
  {
    p = imageArray[15];
    image (p, 200, 200);
    fill (0);
    textFont (f1, 40);
    text ("ANGEL HAIR", 200, 200);
    textFont (f2, 16);
    text ("Average Cook Time: " + pcooktime [ phase-1 ] + " minutes", 200, d);
  }

  if (phase == 16)
  {
    p = pBowl;
    image (p, 200, 200);
    fill (0);
    textFont (f1, 40);
    text ("CLICK TO", 200, 180);
    text ("START AGAIN", 200, 230);
    textFont (f2, 16);

    if (mousePressed == true)
    {
      phase = 0;
    }
  }



}

void keyPressed()
{
  if (phase <16) phase++;
}

void mousePressed()
{
  if (phase>0 & phase<16) phase--;


}



