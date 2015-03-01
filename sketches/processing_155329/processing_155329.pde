
/*----------------------------------
       
 Copyright by Diana Lange 2014
 Don't use without any permission. Creative Commons: Attribution Non-Commercial.
       
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 vimeo: https://vimeo.com/dianalange/videos
      
 -----------------------------------*/

float lerpValue = 0;

float [] aStartX;
float [] aStartY;

float [] aEndX;
float [] aEndY;

PImage img;

void setup ()
{
  size (600, 600, P3D);
  //smooth();
  noSmooth();
  img = loadImage ("delorien.jpg");
  img.resize (width, 0);
  aStartX = new float [4000];
  aStartY = new float [4000];

  aEndX = new float [4000];
  aEndY = new float [4000];

  setRandomValue (aStartX, aStartY);
  setRandomValue (aEndX, aEndY);

  //println (aStartX);
}

void draw ()
{
  if (mousePressed)
  {
    translate (-mouseX*3, -mouseY*3);
    scale (3);
  }

  fill (#57385c, 40);
  noStroke();
  rect (0, 0, width, height);


  // ZEICHNEN -----------------------

  stroke (255);
  strokeWeight (1.5);
  for (int i = 0; i < aStartX.length; i++)
  {

    float startX = aStartX [i];
    float startY = aStartY [i];

    float endX = aEndX [i];
    float endY = aEndY [i];

    /*
    fill (0);
     ellipse (startX, startY, 10, 10);
     ellipse (endX, endY, 10, 10);
     */

    //float lerpValue = map (mouseX, 0, width, 0, 1);

    float currentX = lerp (startX, endX, sin (lerpValue));
    float currentY = lerp (startY, endY, sin (lerpValue));


    point (currentX, currentY);
  }
  //  BEWEGEN ---------------------------

  lerpValue = lerpValue + 0.01;

  //  ZIELERKENNUNG --------------------

  if (lerpValue >= PI / 2)
  {
    //arrayCopy (basis, copy to);
    arrayCopy (aEndX, aStartX);
    arrayCopy (aEndY, aStartY);

    float dice = random (100);

    float [] targetX = new float [aEndX.length+ 200];
    float [] targetY = new float [aEndY.length+ 200];


    if (dice < 33.333)
    {
      setRandomValue (targetX, targetY, random (100, 250));
    }
    else if (dice < 66.67)
    {
      setRandomValue (targetX, targetY, img);
    } 
    else
    {
      setRandomValue (targetX, targetY);
    }

    lookForNearestTarget (aEndX, aEndY, targetX, targetY);
    lerpValue = 0;
  }
}







