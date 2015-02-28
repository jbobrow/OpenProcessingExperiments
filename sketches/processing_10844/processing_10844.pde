
int shapeFlag = 0;
//0=point, 1=line, 2=ellipse, 3=triangle, 4=quad, 5=arc, 6=rect, 7=curve

float ranX, ranY, ranM, ranN;
float ranI, ranJ, ranK, ranL;

void setup()
{
  size(800,600);
  strokeWeight(5);
}

void draw()
{
}

void mouseDragged()
{
  println(mouseX+" "+mouseY);
  ellipse(mouseX,mouseY,5,5);
}

void mouseReleased()
{
  delay(int(random(1000,5000)));
  shapeFlag = int(random(0,7));

  ranX=random(0,800);
  ranY=random(0,600);
  ranM=random(0,800);
  ranN=random(0,600);
  
  ranI=random(0,800);
  ranJ=random(0,600);
  ranK=random(0,800);
  ranL=random(0,600);

  println("Mouse Released!");
  println("shapeFlag is "+shapeFlag);
  println("ranX is "+ranX);
  println("ranY is "+ranY);
  println("ranM is "+ranM);
  println("ranN is "+ranN);

  if(shapeFlag==0) //point
  {
    point(ranX,ranY);
  }
  if(shapeFlag==1) //line
  {
    line(ranX,ranY,ranM,ranN);
  }
  if(shapeFlag==2) //ellipse
  {
    ellipse(ranX,ranY,int(random(0,150)),int(random(0,150)));
  }
  if(shapeFlag==4)  //quad
  {
    quad(ranX,ranY,ranM,ranN,ranI,ranJ,ranK,ranL);
  }
  if(shapeFlag==5) //arc - PI/2
  {
    arc(ranX,ranY,int(random(0,150)),int(random(0,150)),0,PI/2);
  }
  if(shapeFlag==6) //rect
  {
    rect(ranM,ranN,int(random(0,150)),int(random(0,150)));
  }
  if(shapeFlag==7) //curve
  {
    curve(ranX,ranY,ranM,ranN,ranI,ranJ,ranK,ranL);
  }
//  else //if all else fails
//  {
//    ranX=random(0,800);
//    ranY=random(0,600);
//    ranM=random(0,800);
//    ranN=random(0,600);
//    
//    line(ranX,ranY,ranM,ranN);
//  }
}


