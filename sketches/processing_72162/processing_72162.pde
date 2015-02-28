

import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;

RFont font;

String fName = "GHOST";

final int MAX = 10;

int [] xList;
int [] yList;
int [] deltaXlist;
int [] deltaYlist;
int [] index;
color[] col1;

void setup() {
  size( 800, 800 );
  background(0);
  smooth();
  RG.init(this);
  
  font = new RFont ("JGJUNCIA.TTF", 100, CENTER);
  
  RCommand.setSegmentLength(40);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  xList = new int [MAX];
  yList = new int [MAX];
  deltaXlist = new int [MAX];
  deltaYlist = new int [MAX];
  col1 = new color[MAX];
  
  initArray(xList, -width/2, width/2);
  initArray(yList, -width/2, width/2);
  initArray(deltaXlist, -10, 10);
  initArray(deltaYlist, -10, 10);
  initColor1(col1);
    
}

void draw() {
  fill(0, 30);
  rect(0, 0, width, height);
  fill(255, 5);
  pushMatrix();
  translate(mouseX, mouseY);
  font.draw(fName);
  popMatrix();
  textPoints();
  moveFigures();
}
  
void textPoints() {  
  
  RGroup fnGroup = font.toGroup(fName); 
  fnGroup = fnGroup.toPolygonGroup();
  
  RPoint[] fnPoints = fnGroup.getPoints();
  
  strokeWeight(.1);
  pushMatrix();
  translate(width/2, height/2);
    for( int j = 0; j < xList.length; j++ )
    {
      for (int i=0; i<fnPoints.length; i++) {
        stroke(col1[j]);
        line(fnPoints[i].x, fnPoints[i].y, xList[j], yList[j]);
      }
    }
  popMatrix();  
}  

void moveFigures()
{
  for( int i = 0; i < xList.length; i++ )
  {
    xList[i] += deltaXlist[i];
    if( xList[i] > width/2 )
    {
      deltaXlist[i] = -deltaXlist[i];
    }
    xList[i] += deltaXlist[i];
    if( xList[i] < -width/2 )
    {
      deltaXlist[i] = -deltaXlist[i];
    }
    yList[i] += deltaYlist[i];
    if( yList[i] > height/2 )
    {
      deltaYlist[i] = -deltaYlist[i];
    }
    yList[i] += deltaYlist[i];
    if( yList[i] < -height/2 )
    {
      deltaYlist[i] = -deltaYlist[i];
    }
  }
}

void initArray( int [] ar, int low, int high )
{
  for( int i = 0; i < ar.length; i++ )
  {
    ar[i] = int( random( low, high ) );
  }
}

void initColor1( color[] tempColor )
{
  for( int i = 0; i < tempColor.length; i++ )
  {
    
    int whiteV = int( random( 50, 255 ));
    
    int transparency = int( random( 10, 255 ));
    tempColor[i] = color( whiteV, transparency );
  }
}
  


