
//Editable parameters
int pageSize = 500;
int forcePointX = int(pageSize*0.25);
int forcePointY = int(pageSize/2);
int threshold = pageSize;
int spacing = int(pageSize/250);
int lineWeight = int(pageSize/250);
int ctrlPoint1xDefault = forcePointX - int(pageSize*0.05);
int ctrlPoint2xDefault = forcePointX + int(pageSize*0.05);

float speed = 0.1;
int amp = 2;
int offset = 0;

// init variables
int yProximity = 0;
int xProximity = 0;
int anchor1x = 0;
int anchor1y = 0;
int anchor2x = pageSize;
int anchor2y = 0;
int ctrlPoint1x = 0;
int ctrlPoint1y = 0;
int ctrlPoint2x = 0;
int ctrlPoint2y = 0;

void setup()
{
  size(500,500);
  background(255);
  strokeWeight(lineWeight);
  stroke(0);
  noFill();
  smooth();
}

void draw()
{ 
  fill(255, 150);
  rect(0,0,width,height);
  noFill();
  int ctrlPoint1xDefault = forcePointX - 25;  //makes ctrl points relative to forcePointX
  int ctrlPoint2xDefault = forcePointX + 25;
  
  while (anchor2y <= pageSize)
  {
  anchor1y = anchor2y = anchor2y + spacing;  // shifts line endpoints down by spacing amount 
  ctrlPoint1y = ctrlPoint2y = anchor1y;  //shifts ctrl points down, they start off level with the line
  
  if (abs(forcePointY - anchor1y) < threshold)
  {
    if (anchor1y < forcePointY)
    {
      ctrlPoint1y = ctrlPoint2y = ctrlPoint2y - yEffect() + int(sin(speed * ctrlPoint2y + offset)*amp);  //reverses direction of yEffect, if line is above forcePoint
    } else {
      ctrlPoint1y = ctrlPoint2y = ctrlPoint2y + yEffect() + int(sin(speed * ctrlPoint2y + offset)*amp);
    }
    
    ctrlPoint1x = ctrlPoint1xDefault + xEffect();
    ctrlPoint2x = ctrlPoint2xDefault - xEffect();
  }
  
  bezier(anchor1x, anchor1y, ctrlPoint1x, ctrlPoint1y, ctrlPoint2x, ctrlPoint2y, anchor2x, anchor2y);
  }
  anchor2y = 0;
  offset += 20;
}

int yEffect()
{
  return int(dist(0, anchor1y, 0, forcePointY));
}

int xEffect()
{
  return int(dist(0, anchor1y, 0, forcePointY)*2);
}

//void mousePressed()
//{
//  if (mousePressed && (mouseButton == RIGHT))
//  {
//    String days = str(day());
//    String hours = str(hour());
//    String mins = str(minute());
//    String secs = str(second());
//    String filename = "screen" + days + hours + mins + secs + ".jpg";
//    save(filename);
//  }
//}

void mouseDragged()
{
  speed = (mouseX - width/2)/5;
  amp = (mouseY-width/2);
}

void mouseReleased()
{
  println(speed + " " + amp);
}

//49 speed = lumpyness
//-33 20 = disco
//- 47 3 = slow panning minimal
//

