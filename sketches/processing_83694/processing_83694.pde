
final int MAX = 200;

float xoff = 0.0;
float xoff2=0.0;
float pulse=0.01;
int [] posX;
int [] posY;
int [] wd;
int [] acc;
int [] accX;
int [] count;
int [] countB;
int [] accTemp;
int [] accXTemp;
int [] reelX;
int [] reelY;
int [] distX;
int [] distY;
int [] r;
int [] g;
int [] b;


void setup ()
{
  size (800, 800);
  posX = new int [MAX];
  posY = new int [MAX];
  wd = new int [MAX];
  acc = new int [MAX];
  count = new int [MAX];
  accX = new int [MAX];
  countB = new int [MAX];
  accTemp = new int [MAX];
  accXTemp = new int [MAX];
  reelX = new int [MAX];
  reelY = new int [MAX];
  distX = new int [MAX];
  distY = new int [MAX];
  r = new int [MAX];
  g = new int [MAX];
  b = new int [MAX];
  


  countB = initIntArray (0, 0);
  accX = initIntArray (2, 6);
  count = initIntArray (0, 0);
  acc = initIntArray (1, 1);
  posX = initIntArray (0, width);
  posY = initIntArray (0, height);
  wd = initIntArray (0, height);
}

void draw()
{
  backsetup ();
  keyPressedX();
  beat ();
  circ ();
  mouseVortex();
  trackDist();
  colorRange();
  collision();
}

void collision ()
{
 for (int i=0; i<posX.length; i++)
{
 if (distY[i] <= 50 && distY [i] >= - 50 && distX[i] <= 50 && distX[i] >= -50)
 {
   acc [i] = -acc[i];
   accX [i] = -accX [i];
 }
// if (mouseY + 50 >= posY [i])
// {
//   
// }
// if (mouseX + 50 <= posY [i])
// {
//   
// }
// if (mouseX + 50 >= posY [i])
// {
//   
// }
} 
  
}

void colorRange ()
{
  for (int i= 0; i<posX.length; i++)
  {
   r [i] = posX [i];
   g [i] = posY [i];
   b [i] = abs (mouseX-posX [i]); 
    
    
  }
  
  
}
void mouseVortex()
{
  if (mousePressed == true)
  {
    for (int i = 0; i< posX.length; i++)
    {
      accTemp [i] = acc [i];
      accXTemp [i] = accX [i];
      reelY [i] = abs(1/acc[i])/10;
      reelX [i] = abs(1/accX [i])/10;
    }
  }
//if (mouseDragged == true)
//{
//    for (int i = 0; i<posX.length; i++)
//    {
//      posY [i] = posY [i] + (distY [i] * reelY [i]);
//      posX [i] = posX [i] + (distX [i] * reelX [i]);
//    }
//  }
for (int i =0; i < posX.length; i++)
{
      if (mousePressed == true)
      {
        if (mouseY < posY [i])
        {
          acc [i] = -4;
        }
        if (mouseY > posY [i])
        {
          acc [i] = 4;
        }
        if (mouseX < posX [i])
        {
          accX [i] = -4;
        }
        if (mouseX > posX [i])
        {
          accX [i] = 4;
        }
      }
  }
}
void trackDist()
{
  for (int i = 0; i<posX.length; i++)
  {
    distX [i] = mouseX - posX [i];
    distY [i] = mouseY - posY [i];
  }
}
void mouseReleased ()
{
  for (int i =0; i<posX.length; i++)
  {
    acc [i] = int(random(2,6));/*accTemp [i];*/
    accX [i] = int(random(2,6));/*accXTemp [i];*/
  }
}

void keyPressedX()
{
  noCursor();
  noStroke();
  fill (30, 20, 200);
  ellipse (mouseX, mouseY, 50, 50);
  for (int i =0; i < posY.length; i++)
  {
    if (keyPressed == true)
    {
      countB [i] = countB [i] + 1;
    }
    if (countB [i] >= 3)
    {
      posX [i] = posX [i] + accX[i];
      if (posX [i] >= width || posX [i] <=0)
      {
        accX[i] = -accX[i];
      }

      //    if (posX [i] - 25 <= mouseX && mouseY == posY [i])
      //    {
      //      posX [i] = posX [i] + accX[i];
      //    }
      //    if (mouseX <= posX [i] + 25 && mouseY == posY [i])
      //    {
      //      posX [i] = posX [i] + accX[i];
      //    }
    }
  }
}
//void mouseDragged ()
//{
//    for (int i = 0; i<posX.length; i++)
//    {
//      posY [i] = posY [i] + (distY [i] * reelY [i]);
//      posX [i] = posX [i] + (distX [i] * reelX [i]);
//    }
//  }
  
void circ ()
{
  for (int i = 0; i < posX.length; i++)
  {
    fill (255);
    fill(r[i],g[i],b [i]);
    ellipse (posX [i], posY [i], 20, 20);
    xoff2 = xoff2 + pulse;
    float t = noise(xoff2) * 10;
    pushStyle();
    stroke(255);
    noFill();
    //pulse ();
    ellipse (posX [i]+t, posY [i], 20, 20);
    ellipse (posX [i]-t, posY [i], 20, 20);
    ellipse (posX [i], posY [i]+ t, 20, 20);
    ellipse (posX [i], posY [i]-t, 20, 20);
    popStyle();

    //posX[i]= posX [i]+1;
    posY [i] = posY [i] + acc[i];

    if (posY [i] >= height || posY [i] <= 0)
    {
      acc[i] =-acc[i];
      count [i]= count [i]+1;
    }

    if (count [i] >= 3 && acc[i] > 0 && posY [i] >= height*.1)
    {
      acc [i] = int(random (2, 6));
      count [i] = 0;
    }
    if (count [i] >= 3 && acc[i] < 0 && posY [i] <= .9*height)
    {
      acc [i] = -int(random (2, 6));
      count [i] = 0;
    }
  }
}
void beat ()
{
  stroke(255);
  xoff = xoff + pulse;
  float n = noise(xoff) * width;
  line(n, 0, n, height);
}

void backsetup()
{
  background (0);
  smooth();
}

int[] initIntArray(int low, int high)
{
  int[] temp = {
  };
  for (int i = 0; i<MAX; i++)
  {
    temp = append(temp, int(random(low, high)));
  }
  return temp;
}


