
//extra credit 3, nov. 1
//copyright Jessica Schafer, pittsburgh, pa

final int MAX = 50;
float [] objectx, objecty, deltax, deltay, ht, wid;
color [] cols;

void setup()
{
  size (400, 400);
  smooth();
  objectx = new float [MAX];
  objecty = new float [MAX];
  deltax = new float [MAX];
  deltay = new float [MAX];
  ht = new float [MAX];
  wid = new float [MAX];
  cols = new color [MAX];
  initializeArray (objectx, 50, width-50);
  initializeArray (objecty, 50, height-50);
  initializeArray (deltax, .1, 2);
  initializeArray (deltay, .1, 2);
  initializeArray (ht, 10, 50);
  initializeArray (wid, 10, 50);
  initializeColors (); 
}

void draw ()
{
  drawBackground();
  drawObjects();
  moveObjects();
}

void drawObjects()
{
  for (int i = 0; i<MAX; i++)
   {
     fill (cols[i]);
     rect (objectx[i], objecty[i], wid[i], ht[i]);
   }
}


void moveObjects()
{
  for (int i = 0; i<MAX; i++)
  {
    objectx[i] = objectx[i] + deltax[i];
    objecty[i] = objecty[i] + deltay[i];
    
    if (objectx[i] > (width-wid[i]/2) || objectx[i] < -wid[i]/2)
     {
       deltax[i] = deltax[i]*-1;
     }
    if (objecty[i] > (height-ht[i]/2) || objecty[i] < -ht[i]/2)
     {
       deltay[i] = deltay[i]*-1;
     }
  
  }
  
}


void drawBackground()
{
 noStroke();
  fill (247, 226, 147, 25);
 rect (0,0, width, height); 
}


void initializeArray (float[]array, float small, float large)
{
  for (int i = 0; i<array.length; i++)
  {
   array[i] = random(small, large); 
  }
}

void initializeColors ()
{
  for (int i = 0; i<cols.length; i++)
  {
   cols[i] = color(random(255), random(255), random(255)); 
  }
}                
