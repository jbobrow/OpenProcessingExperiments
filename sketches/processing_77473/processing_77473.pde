
//Zhaochang He
//zhaochah@andrew.cmu.edu
//copyright
 
final int max = 30;
 
// list of arrays
int [] rectA;
int [] rectB;
int [] speedA;
int [] speedB;
color [] Color;
int [] Size;

 
void setup()
{
  size(screen.width, screen.height);
  smooth();
  noStroke();
  frameRate(30);
  rectA = new int [max];
  rectB = new int [max];
  Size = new int [max];
  speedA = new int [max];
  speedB = new int [max];
  Color = new int [max];
  initColor();
  initArray(rectA, 0, 800);
  initArray(rectB, 0 , 500);
  initArray(Size, 10, 300);
  initArray(speedA, 1, 4);
  initArray(speedB, 1, 7);
}
 
void draw()
{
  prepBack();
  drawRect();
  moveRect();
}
 
void initArray(int [] anyArray, int low, int high)
{
  for (int i=0; i < anyArray.length; i++)
  {
    anyArray[i] = int(random(low,high));
  }
}
 
 
void prepBack()
{
  background(255);

}
 

 
void initColor()
{
 for (int i = 0; i< Color.length; i++)
  {
  Color[i] = color ((int)random(0, 255), (int)random(0, 255), (int)random(255));
  }
}



void drawRect() {
   for (int i=0; i < max; i++)
 {
   fill(Color[i],40);
   rect(rectA[i], rectB[i], Size[i], Size[i]);
   rect(rectA[i], rectB[i], Size[i]/0.5, Size[i]/0.5);
  

 }
}

 

void moveRect() {
  for (int i=0; i < max; i++)
  {
    rectA[i] = rectA[i] + speedA[i];
    if (rectA[i] + (Size[i]/2) > width)
    {
      speedA[i] = -speedA[i];
    }
    if (rectA[i] + (Size[i]/2) < -width)
    {
      speedA[i] = -speedA[i];
    }
    rectB[i] = rectB[i] + speedB[i];
     
    if (rectB[i] + (Size[i]/2) > height)
    {
      speedB[i] = -speedB[i];
    }
    if (rectB[i] + (Size[i]/2) < -height)
    {
      speedB[i] = -speedB[i];
    }
  }
}



