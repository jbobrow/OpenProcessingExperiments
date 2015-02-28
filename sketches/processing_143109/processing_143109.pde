

/*----------------------------------
 
 Copyright by Diana Lange 2014
 Don't use without any permission
 
 This sketch is based on:
 #479 Mesh block
 http://geometrydaily.tumblr.com/post/54913997818/479-mesh-block-a-new-minimal-geometric
 
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 --------------------------------------*/

int W;
float H;
float sw;
int res;
int margin;

void setup ()
{
  size (700, 700);
  smooth();
  frameRate (5);

  sw = 4;
  res = 17;

  rectMode (CORNER);

  margin = width /10;
  W = (int) sqrt ((sq(width-2*margin)) / 2.0);
  H = (W / (float) res);
  float val = W % H;
  if (val < H*0.5)W -= val;
  else W += H-val;

  background (237);
}


void draw ()
{

  int dice = (int) random (2);

  float rx = 0, ry = 0, rh = 0, rw = 0;
  float val = 0;

  if (dice == 0) // quer
  {
    rx = -W/2+H/2;
    ry = random (-W/2-1, W/2);

    val = ry % H;

    if (val < 0.5*H) ry -=val;
    else ry += H-val;

    // ry-=H;

    rh = H;
    rw = W;
  }
  else
  {
    ry = -W/2+H/2;
    rx = random (-W/2-1, W/2);

    val = rx % H;

    if (val < 0.5*H) rx-=val;
    else rx += H-val;

    //rx-=H;

    rh = W;
    rw = H;
  }


  translate (width/2, height/2);
   rotate (PI/4);

  fill (#343B4D);
  strokeWeight (sw);
  stroke (237);
  rect (rx, ry, rw, rh);
}


void mouseDragged ()
{
  
  if (mouseButton == LEFT) margin = (int) map (mouseX, 0, width, 0, width/3);
   
   else res = (int) map (mouseX, 0, width, 2, 30)*2+1;
   
   W = (int) sqrt ((sq(width-2*margin)) / 2.0);
   H = (W / (float) res);
   float val = W % H;
   if (val < H*0.5)W -= val;
   else W += H-val;
   
}


void keyPressed ()
{
  
  if (key == '+') sw+= 0.5;
   if (key == '-')
   {
   sw -= 0.5;
   if (sw < 0.5) sw = 0.5;
   }
   
   if (key == ' ') background (237);
   if (key == 'p') setup();
   
}

