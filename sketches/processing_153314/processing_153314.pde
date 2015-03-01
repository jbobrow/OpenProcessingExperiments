
int arrayLength = 10;  // the max data items

// for space 
int heightSartX = 0;
int heightSartY = 0;
int heightEndX = 0;
int heightEndY = 0;
int widthStartX = 0;
int widthStartY = 0;
int widthEndX = 0;
int widthEndY = 0;

int pointStep = 50;

void setup() {
  size(640,480);
  
  // show random line chart
  randomDataDraw();

}
 
void draw() {
  // do nothing here
}

void mousePressed(){
  randomDataDraw();  // draw a random line chart
}

// generate a random line chart
void randomDataDraw()
{
  background(255);  // clear
  strokeWeight(3);  // for space
  drawSpace();
  
  // generate the random data
  int[][] dataList = new int[int(random(3,10))][arrayLength];
  for(int i=0;i<dataList[0].length;i++)
  {
    for(int j=0;j<dataList.length; j++)
    {
      dataList[j][i] = int(random(1,300));
    }
  }
  
  for(int i=0; i<dataList.length;i++)
  {
    // use random color
    stroke(random(0,255), random(0,255), random(0,255));
    // print the line
    printLine(dataList[i]);    
  }
}



void drawSpace()
{
   stroke(0,0,0);

   heightSartX = 50;
   heightSartY = 50;
   heightEndX = 50;
   heightEndY = height - 50;
   widthStartX = 50;
   widthStartY = height - 50;
   widthEndX = width-50;
   widthEndY = height - 50;

    // Y 
    line(heightSartX,heightSartY, heightEndX, heightEndY);
    // X
    line(widthStartX, widthStartY, widthEndX, widthEndY);
}

// draw a line with data
void printLine(int[] dataList)
{
  strokeWeight(1);  // for line  
  
  int prePosX = 0;
  int prePosY = 0;
  for(int i=0; i<dataList.length;i++)
  {
    int posX = (i+1)*pointStep + pointStep;
    int posY = heightSartX + dataList[i];
    point(posX, posY);
    
    if(i>0)
    {
      line(prePosX, prePosY, posX, posY);
    }
    prePosX = posX;
    prePosY = posY;
    
  }
}
