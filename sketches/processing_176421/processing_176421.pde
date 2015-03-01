
PointCloud pc;
PImage  testImg;
PImage  nycImg;
boolean showImage = false; 
boolean doPause = false;
String filename = "brokenword.jpg";


String typed = ""; //words that you are typing
String words = ""; //words that show up
PFont f;
PGraphics pg;
color c = 255;

void setup ()
{
  size (600, 200, P3D); //P3D
  testImg = loadImage ("brokenword.jpg");
  //nycImg = loadImage ("nyc.jpg");
  f = createFont("AktivGrotesk-Regular-60", 60, true);
  pg = createGraphics (600, 200);


  pc = new PointCloud (4000);  //makes a new cloud of points with (x) amount of points within it
  float cx, cy; // current X value and current y value
  while (pc.p.length <= pc.length)
  {
    float [] [] target = (float[] []) findTargets (1, testImg);
    cx = random (width); //gives all the particles a random x
    cy = random (height); //gives all the particles a random y
    pc.addPatricel (new Particle(cx, cy, target[0][0], target[0][1]));
  }
}

void draw ()
{ 
  background (255);
  pc.draw();

  pg.beginDraw();
  pg.background (255);
  pg.textFont(f);
  pg.fill (0);
  pg.rect (0, 0, 600, 1);
  pg.rect (0, 199, 600, 1);
  pg.rect (0, 0, 1, 200);
  pg.rect (599, 0, 1, 200);
  pg.textAlign (CENTER);
  pg.text(typed, width/2, 125);

  //pg.text(words, width/2, 125);


  if (pc.paused) //once the particles all reach they pause
  {
    updatePointCloud (testImg); //tells the points what to do after they have reached/paused
  }
  if (showImage) image (testImg, 10, 10, testImg.width/4, testImg.height/4); //shows a thumbnail preview of the image
}

void updatePointCloud (PImage img) //takes image and uses it to redraw the image based on targets
{
  float [] [] target = (float[] []) findTargets (pc.p.length, img); //tells the points what to do after they are paused
  pc.updateSimple (target); //update position of particles and unpause
}

void keyPressed ()
{
  if (key == '\n' ) {
    words = typed;
    pg.save ("/data/words.jpg");
    pg.endDraw();
    testImg = loadImage("words.jpg");
    typed = "";
  } else {
    typed = typed + key;
  }
  if (keyCode == BACKSPACE) {
    if (typed.length() > 1) {
      typed = typed.substring(0, typed.length()-2);
    }
  } else { 
    typed = typed;
  }
  if (keyCode == '1') {
    doPause = !doPause;
    if (doPause) noLoop(); //stops the draw loop
    else loop(); //starts the draw loop again
  }
  if (keyCode == '2') showImage = !showImage; // switches the bool to show the image preview
  if (keyCode == '3') {
    testImg = loadImage ("NYC.jpg");
  }
}

class Particle 
{
  float cx, cy; //current position
  float tx, ty; //target position
  float speed = 0; 
  boolean targetRechead = false;

  Particle (float cx, float cy, float tx, float ty) // takes the fed arguments of and sets them equal to the variables
  {
    this.cx = cx;
    this.cy = cy;
    this.tx = tx;
    this.ty = ty;
  }

  void update (float tx, float ty) // redefines the target locations
  {
    targetRechead = false;
    speed = 0;
    this.tx = tx; //updates the target from the last target
    this.ty = ty; //updates the target based on last target
  }

  void move () //move logic - what to do when it is not reached
  {
    if (!targetRechead)
    {
      float amt = sin (speed); //amt is between 0 and 1
      cx = lerp (cx, tx, amt); // lerp from current to target at a certain speed
      cy = lerp (cy, ty, amt);
      speed += 0.001;
      
     if ( (int) cx ==  (int) tx && (int) cy == (int) ty) targetRechead = true; //if currents = targets then reached = true
     if (speed >= 0.13) //this curbs the lerp speed and makes the particles where they need to be
     {
       targetRechead = true;
       cx = tx;
       cy = ty;
     }
    }
  }

  void draw ()
  {
   point (cx, cy);
   //ellipse (cx,cy,1,1);
  }
}


class PointCloud 
{
  boolean paused = false;
  Particle [] p;
  int length;

  PointCloud (int n) // requires an integer which determines the number of particles
  {
    this.length = n;
    p = new Particle [0];
  }
  void addPatricel (Particle cp)
  {
    if (p.length <= length) p = (Particle[]) append (p, cp); // if the number declared in the pointcloud is greater than the number of particles then add more particles
  }
   
  void updateSimple (float [] [] target)
  {
    for (int i = 0; i < p.length; i++)
    {
      p[i].update (target [i] [0], target [i] [1]);
    }

    paused = false;
  }

  void checkFinishing () // check to see if particles have reached and pauses it if they have
  {
    boolean targetRechead = true;
    for (int i = 0; i < p.length; i++)
    {
      if (!p[i].targetRechead)
      {
        targetRechead = false;
        break;
      }
    }
    
    if (targetRechead) paused = true;
  }

  void draw () //draws the particles and makes them move
  {
    for (int i = 0; i < p.length; i++)
    {
      if (!paused) p[i].move();
      p[i].draw();
    }
    
    checkFinishing();
  }
}

float [] [] findTargets (int n, PImage img)
{
  img.loadPixels(); //loads all the pixels of the img
  float [] [] target = new float [n] [2];
  PVector pos;
  
  for (int i = 0; i < target.length; i++)
  {
    pos = target (img.pixels, (int) random (img.width), (int) random (img.height), img.width, img.height, 0);

    target [i] [0] = pos.x;
    target [i] [1] = pos.y;
  }

  return target;
}

PVector target (int [] colors, int x, int y, int W, int H, int depth)
{
  PVector pos = new PVector (0, 0);
  int index = y*W+x;
  color c = colors [index];

  if (depth == 15 || isValidTarget (brightness (c)))
  {
    pos.x = x;
    pos.y = y;
  } 
  else 
  {
    pos = target (colors, (int) random (W), (int) random (H), W, H, depth++);
  }
  
    return pos;
}

boolean isValidTarget (float fbrightness)
{
  if (fbrightness > 220) return false;
  float value = map (fbrightness, 0, 255, 1, 100);

  float iRandom = random (0, value);
  if (iRandom < 1) return true;
  else return false;
}



