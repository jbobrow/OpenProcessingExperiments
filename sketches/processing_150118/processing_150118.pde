
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

float r, a;
int W, H;

ArrayList <PVector> sinList = new ArrayList();
ArrayList <PVector> cosList = new ArrayList();

void setup ()
{
  size (800, 800);
  W = width/2;
  H = height/2;
  r = 150;
  a = 0;
  smooth();
  frameRate (25);

  initSinList();
  initCosList();
  
   textFont (font, 24);
}

void draw ()
{
  background (#56676e);
  drawCircle ();
  drawAngleList ();
  displayFont();
  moveAngle ();
  moveRadius ();
  updateAngleLists();

 
}

void moveAngle ()
{
  float val = map (mouseX, 10, width, 0, PI/20);
  if (val < 0) val = 0;
  a+= val;
}

void moveRadius () {
    if(mouseX != 0 && mouseY != 0 && mouseX > 0 && mouseY > 0 && mouseX < width && mouseY < height) {
        r = map (mouseY, 0, height, 10, 200);
    }
}


void drawCircle ()
{

  // background grid ----------------- 

  stroke (#7A9686);

  for (int i = 50; i < W; i+= 50) line (i, 0, i, H);
  for (int i = 50; i < H; i+= 50) line (0, i, W, i);

  // circle ----------------- 

  float centerX = W/2;
  float centerY = H/2;

  noFill ();
  stroke (#b1c999);
  strokeWeight (3);
  ellipse (centerX, centerY, r*2, r*2);  

  // angle ----------------------

  float x = centerX + cos (a)*r;
  float y = centerY + sin (a)*r;

  stroke (#e8e2b2);
  line (centerX, centerY, x, y);

  fill (#e8e2b2);
  noStroke ();

  ellipse (x, y, 6, 6);

  // dashed line ----------------- 


  strokeWeight (1.5);
  stroke (#e8e2b2); 
  drawDashedLine (true, x, y, 10, W);
  drawDashedLine (false, x, y, 10, H);
}

// INIT --------------------------------------------------------

void initSinList ()
{
  float y = H/2 + sin (a)*r;
  
  for (int x = W; x < width; x++)
  {
    sinList.add (new PVector (x, y));
  }
}

void initCosList ()
{
  float x = W/2 + cos (a)*r;
  
  for (int y = H; y < height; y++)
  {
    cosList.add (new PVector (x, y));
  }
}

// UPDATE --------------------------------------------------------

void updateAngleLists()
{
  PVector p;
  for (int i = sinList.size()-1; i > 0; i--)
  {
    p = sinList.get(i-1);
    sinList.get(i).y = p.y;
  }

  sinList.get (0).y = H/2 + sin (a)*r;

  for (int i = cosList.size()-1; i > 0; i--)
  {
    p = cosList.get(i-1);
    cosList.get(i).x = p.x;
  }

  cosList.get (0).x = W/2 + cos (a)*r;
}

// DRAW --------------------------------------------------------

void drawAngleList ()
{
  noStroke();
  fill (#7a9686);
  rect (W, 0, W, H);
  rect (0, W, W, H);

  fill (255);
  stroke (255);
  strokeWeight (1);

  for (int i = 0; i < sinList.size(); i++) 
  {

    ellipse (sinList.get(i).x, sinList.get(i).y, 3, 3);

    if (i > 0)
    {
      line (sinList.get(i).x, sinList.get(i).y, sinList.get(i-1).x, sinList.get(i-1).y);
    }
  }

  for (int i = 0; i < cosList.size(); i++) 
  {
    ellipse (cosList.get(i).x, cosList.get(i).y, 3, 3);


    if (i > 0)
    {
      line (cosList.get(i).x, cosList.get(i).y, cosList.get(i-1).x, cosList.get(i-1).y);
    }
  }
}

PFont font = createFont ("Arial", 24);

void displayFont ()
{
  int x = W+30, y = H+50;

  fill (255);
  strokeWeight (1.5);
  stroke (#e8e2b2); 

  text ("radius: " + nf (r, 3, 2), x, y);

  y+= 40;
  text ("angle: " + nf (degrees (a%TWO_PI), 3, 2), x, y);

  y+= 30;
  drawDashedLine (true, x, y, 10, width-40);

  y+= 40;
  text ("cosinus of angle: " + nf (cos (a), 1, 2), x, y);

  y+= 40;
  text ("sinus of angle: " + nf (sin (a), 1, 2), x, y);

  y+= 30;
  drawDashedLine (true, x, y, 10, width-40);

  y+= 40;
  text ("cosinus * r = x: " + nf (cos (a)*r, 1, 2), x, y);

  y+= 40;
  text ("sinus * r = y: " + nf (sin (a)*r, 1, 2), x, y);
}

void drawDashedLine (boolean horizontal, float X, float Y, float S, float L)
{
  while (horizontal ? (X < L) : (Y < L))
  {
    if (horizontal) 
    {
      line (X, Y, X+S*0.5, Y);
      X+=S;
    }
    else 
    {
      line (X, Y, X, Y+S*0.5);
      Y+=S;
    }
  }
}






