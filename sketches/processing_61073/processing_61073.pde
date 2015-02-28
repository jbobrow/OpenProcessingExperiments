
import processing.opengl.*;
float [] xCount;
float [] xdc;
float [] yCount;
float [] ydc;
color [] colorList;
float [] xList;
float [] yList;
float [] changeXList;
float [] changeYList; 
float d,x1,x2,y1,y2;

final int MAX = 3;

void setup()
{
  size( 600, 600, OPENGL);
  background(0);
  noStroke();
  colorList = new color [MAX];
  inColorArray();
   xList = new float[MAX];
  inArray(xList);
  yList = new float[MAX];
  inArray(yList);
  xCount = new float[MAX];
  inArray(xCount);
  yCount = new float[MAX];
  inArray(yCount);
  xdc = new float[MAX];
  inArray(xdc);
  ydc = new float[MAX];
  inArray(ydc);
//  xCount [] = random(1,10);
//  xdc [] =random(1,10);
//yCount []  = random(1,10);
//  ydc [] = random(1,10);
  
}

void draw()
{
  background(255);
 lights();
  boxes();
  bounceX();
  bounceY();
  distance();
 
}



void inArray( float [] array)
{
  for (int i =0; i<array.length; i++) {
    array[i] = int(random(10, 100));
  }
}

  void inColorArray()
{
  for (int i = 0; i<colorList.length; i++)
  {
    colorList[i] = color(random(255), random(255), random(255));
  }
}

void boxes()
{
  for(int i = 0; i <xList.length; i++){
    fill(colorList[i]);
//  println(xCount);
  pushMatrix();
  translate(xCount[i], yCount[i], 0);
  rotateX(radians(xCount[i]));
  rotateY(radians(yCount[i]));
  box(xList[i], yList[i], 50);
 popMatrix();
}}

void bounceX()
{
  for(int i = 0; i <xList.length; i++)
  {
 xCount[i] += xdc[i];
  if (xCount[i] > width)
  {
    xdc[i] = random(-3,-1);
  }
  if (xCount[i] < 0)
{
  xdc[i] =random(1,3);
}
 d = dist(xCount[0],yCount[0],xCount[1],yCount[1]); 
 if (d<50)
 {
   xdc[i] = -xdc[i];
 }
}}

void bounceY()
{
  for(int i = 0; i<yList.length; i++)
  {
 yCount[i] += ydc[i];
  if (yCount[i] > width)
  {
    ydc[i] = random(-3,-1);
  }
  if (yCount[i] < 0)
{
  ydc[i] =random(1,3);
  
}
  }}
  
 void distance()
  {
    for (int i = 0; i< MAX; i++)
    {
      for(int j = i+1; j<MAX; j++)
 {d = dist(xCount[i],yCount[i],xCount[j],yCount[j]); 
// d = dist(xCount[0],yCount[0],xCount[1],xCount[1]);
if (d < 100)
{
  ydc[i] = -ydc[i];
}}}}

