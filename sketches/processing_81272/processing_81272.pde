
int start = 0, end = 200, count = 0, iMax = 0, iMin = 0;
int [] iArray;
PFont font;
PImage img;
 
void setup ()
{
  img = loadImage ("slantedphoto.jpg");
  size (415, 516);
  smooth();
  iArray = new int [end-start];
  for (int i = 0; i < iArray.length; i++) iArray [i] = 0;
}
 
void draw ()
{
background (247);
image(img, 0, 0);
  fill (0);
  float steps = (float) width / (float) iArray.length;
  float h = 0;
  for (int i = 0; i < iArray.length; i++)
  {
    h = map (iArray[i], iArray [iMin], iArray [iMax], 0, height*0.75);
    if (i == iMax) fill (150); /*colour of random bars*/
    else fill (229, 145, 117); /*colour of bars*/
    noStroke ();
    beginShape ();
    vertex ((i*steps), height, width);
    vertex (i*steps+steps, height);
    vertex (i*steps+steps, height-h);
    vertex ((i*steps), height-h);
    endShape (CLOSE);
  }
   

 
  for (int i = 0; i < 10; i++) doRandom();
  count++;
}
 
void doRandom ()
{
  int index = int ( random (start, end));
  iArray [index] =  iArray [index] + 1;
 
  if (iArray[index] > iArray [iMax]) iMax = index;
  checkMin();
}
 
void mousePressed ()
{
count = iMax = iMin = 0;
setup();
}
 
void checkMin ()
{
  int tempVal = count;
  int tempPos = iArray.length-1;
  for (int i = 0; i < iArray.length; i++)
  {
    if (iArray [i] < tempVal)
    {
      tempVal = iArray [i];
      tempPos = i;
    }
  }
 
  iMin = tempPos;
}

/*Source: http://www.openprocessing.org/sketch/59360 */

