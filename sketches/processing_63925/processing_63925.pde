
int insertdata[] = new int[100];
int bubbledata[] = new int[100];
long bubbletime = 0, inserttime = 0, start = 0;
boolean bubbledone = false, insertdone = false;
int xScale;
int yScale;
int i, j, newValue;
int insertsteps = 0, bubblesort = 0; 
color red = color(255, 0, 0);
color yellow = color(237, 255, 0);
color green = color(4, 131, 23);
int transparent = 170;
int solid = 255;
void setup()
{
  size(500, 500);
  smooth();
  frameRate(5);
  textAlign(LEFT);
  for (int i = 0; i < bubbledata.length; i++)
  {
    bubbledata[i] = (int)random(100);
  }
  insertdata = Arrays.copyOf(bubbledata, bubbledata.length);
  xScale = width/100;
  yScale = height/100;
  rectMode(CENTER);
  fill(0);
}
void draw()
{
  background(255);
  drawInsertPoints();
  drawBubblePoints();
  if(bubbledone && insertdone)
  {
   noLoop(); 
  }
  if (!insertdone)
  {
    start = System.nanoTime();
    insertstep();
    inserttime += (System.nanoTime() - start);
  }
  insertdone = isSorted(insertdata);
  if (!bubbledone)
  {
    start = System.nanoTime();
    bubblestep();
    bubbletime += (System.nanoTime() - start);
  }
  bubbledone = isSorted(bubbledata);
  System.out.println("bubble : " + bubbletime + " insert : " + inserttime);
  
}
void bubblestep()
{
  for (int c = 0; c < bubbledata.length - 1; c++)
  {
    if (bubbledata[c] > bubbledata[c + 1])
    {
      int temp = bubbledata[c];
      bubbledata[c] = bubbledata[c+1];
      bubbledata[c+1] = temp;
    }
  }
}
boolean isSorted(int[] arr)
{
  for(int i = 0; i < arr.length - 1; i++)
  {
   if(arr[i] > arr[i+1])
   {
    return false; 
   }
  }
  return true;
}
void insertstep()
{
  i++;
  if (i < insertdata.length)
  {
    newValue = insertdata[i];
    j = i;
    while (j > 0 && insertdata[j - 1] > newValue) 
    {
      insertdata[j] = insertdata[j - 1];
      j--;
    }
    insertdata[j] = newValue;
  }
}

void drawInsertPoints()
{
  fill(red, solid);
  text("Insertion Sort : " + inserttime + "ns", 15, 30);

  for (int c = 0; c < insertdata.length; c++)
  {
    rect(xScale*c,yScale*insertdata.length - yScale*insertdata[c], xScale, yScale);
  }
}
void drawBubblePoints()
{
  fill(green, solid);
  text("Bubble Sort : " + bubbletime + "ns", 15, 60);

  fill(yellow, transparent);

  for (int c = 0; c < bubbledata.length; c++)
  {
    rect(xScale*c, yScale*bubbledata.length - yScale*bubbledata[c], xScale, yScale);
  }
}


