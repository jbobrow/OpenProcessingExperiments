
PointCloud pc;
PImage [] imglist;
PImage testImg;
PImage mainImg;
boolean showImage = false, randomImage = true, transparentBackground = true, moveRandom = false, doPause = false;

int begin = 1; //True / on
int click = 0; //False / off
int points = 0; //False / off

int imageFade = 0;

void setup ()
{
  size (787, 1060, P3D);
 
  frameRate (75); //speed of particles
  
  mainImg = loadImage("Rembrandt_.jpg");
 
  imglist = new PImage [0];
  imglist = (PImage []) append (imglist, loadImage ("YS_.jpg"));
  imglist = (PImage []) append (imglist, loadImage ("F_S_.jpg"));
  imglist = (PImage []) append (imglist, loadImage ("OB_.jpg"));
  imglist = (PImage []) append (imglist, loadImage ("FF_.jpg"));
  imglist = (PImage []) append (imglist, loadImage ("FH_.jpg"));


 
  for (int i = 0; i < imglist.length; i++)
  {
    if (imglist[i].width != width) imglist[i].resize (width, height);
  }
 
  testImg = imglist [0];
 
 
  pc = new PointCloud (36000); //number of points
 
  float cx, cy;
  while (pc.p.length <= pc.length)
  {
    float [] [] target = (float[] []) findTargets (1, testImg);
     
    cx = random (width);
    cy = random (height);
    pc.addPatricel (new Particle(cx, cy, target[0][0], target[0][1]));
  }
 
  background (230);
  stroke (5);
}
 
void draw () {
 
  if (transparentBackground)
  {
    noStroke();
    fill (230, 80);
    rect (0, 0, width, height);
    stroke (5);
  }
  else background (247);
  
  if(  begin == 1 ){
   image(mainImg, 0, 0); 
  }
  
  if ( mousePressed ){
   click = 1;
   begin = 0; 
  }
  
  if(  click == 1 ){
   image(mainImg, 0, 0);
   fill(255, imageFade);
   rect(0, 0, width, height); 
   
   if( imageFade < 255 ){
     imageFade = imageFade + 5; // number changes speed of fade
   }
   
   if( imageFade == 250 ){
    click = 0; 
    points = 1;
   }
  }
  
  if(  points == 1 ){
  pc.draw();
  }
  
  if (pc.paused)
  {
    if (randomImage) testImg = imglist [(int) random (imglist.length)];
    updatePointCloud (testImg, moveRandom ? 1 : 0);
  }
  if (showImage) image (testImg, 10, 10, testImg.width/4, testImg.height/4);
}
 
 
void updatePointCloud (PImage img, int mode)
{
  float [] [] target = (float[] []) findTargets (pc.p.length, img);
  if (mode == 0) pc.update (target);
  else pc.updateSimple (target);
}
 
void keyPressed ()
{
  if (keyCode == KeyEvent.VK_P) {
    doPause = !doPause;
    if (doPause) noLoop();
    else loop();
  }
  if (keyCode == KeyEvent.VK_M) moveRandom = !moveRandom;
  if (keyCode == KeyEvent.VK_B) transparentBackground = !transparentBackground;
  if (keyCode == KeyEvent.VK_I) showImage = !showImage;
  if (keyCode == KeyEvent.VK_R) randomImage = !randomImage;
}

class Particle
{
  float cx, cy;
  float tx, ty;
  float speed = 0;
  boolean targetRechead = false;
 
  Particle (float cx, float cy, float tx, float ty)
  {
    this.cx = cx;
    this.cy = cy;
    this.tx = tx;
    this.ty = ty;
  }
 
  void update (float tx, float ty)
  {
    targetRechead = false;
    speed = 0;
    this.tx = tx;
    this.ty = ty;
  }
 
  void move ()
  {
    if (!targetRechead)
    {
      float amt = sin (speed);
      cx = lerp (cx, tx, amt);
      cy = lerp (cy, ty, amt);
      speed += 0.001;
     if ( (int) cx ==  (int) tx && (int) cy == (int) ty) targetRechead = true;
     if (speed >= 0.13)
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
  }
}
 
class PointCloud
{
  boolean paused = false;
  Particle [] p;
  int length;
 
  PointCloud (int n)
  {
    this.length = n;
    p = new Particle [0];
  }
 
 
  void addPatricel (Particle cp)
  {
    if (p.length <= length) p = (Particle[]) append (p, cp);
  }
 
    void update (float [] [] target)
  {
    ArrayList <Integer> index = new ArrayList();
    ArrayList <Float> targetX = new ArrayList();
    ArrayList <Float> targetY = new ArrayList();
 
    for (int i = 0; i < target.length; i++) index.add (i);
 
    int closestIndex = 0;
    float closestDist = width*2;
    float dis = 0;
 
    for (int i = 0; i < p.length; i++)
    {
      closestIndex = 0;
      closestDist = width*2;
 
      for (int j = 0; j < index.size(); j++)
      {
        dis = dist (p[i].cx, p[i].cy, target [index.get(j)] [0], target [index.get(j)] [1]);
        {
          if (dis < closestDist)
          {
            closestDist = dis;
            closestIndex = j;
          }
        }
      }
       
      targetX.add ( target [index.get(closestIndex)] [0]);
      targetY.add ( target [index.get(closestIndex)] [1]);
      try
      {
        index.remove (closestIndex);
      }
      catch (IndexOutOfBoundsException e)
      {
        println (e);
      }
       
    }
 
 
    for (int i = 0; i < p.length; i++)
    {
       
      p[i].update (targetX.get (i), targetY.get (i));
    }
 
    paused = false;
  }
 
  void updateSimple (float [] [] target)
  {
    for (int i = 0; i < p.length; i++)
    {
      p[i].update (target [i] [0], target [i] [1]);
    }
 
    paused = false;
  }
 
  void checkFinishing ()
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
 
  void draw ()
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
  img.loadPixels();
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



