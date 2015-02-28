
int myX;
int myY;
float dropY;
int myXchange;
int mouthWidth;
int flowerRed;

void setup()
{
  size(800,600);
  myX=0;
  myY=height-100;
  myXchange=2;
  dropY=0;
  mouthWidth=60;
  flowerRed=40;
}
void draw()
{
  background(90);
  //dropping flowers
  dropY=dropY+1;
  for (int x=50;x<width;x=x+100)
  { 
    for(int y=-100;y<height;y=y+100)
    {
  pushMatrix();
  translate(x,y+dropY);
  rotate(radians(dropY));
  fill(flowerRed+dropY/2,20,70);
  ellipse(10,0,20,20);
  ellipse(-10,0,20,20);
  ellipse(0,10,20,20);
  ellipse(0,-10,20,20);
  ellipse(0,0,20,20);
  popMatrix();
    }
  }

  //top//
  noStroke();
  fill(140,10,10);
  arc(myX+75,myY,150,160,PI,TWO_PI);
  fill(255,180,165);
  ellipse(myX+75,myY,150,35);
  //spot//
  fill(255);
  ellipse(myX+75,myY-33,25,20);
  ellipse(myX+25,myY-30,25,20);
  ellipse(myX+125,myY-30,25,20);
  ellipse(myX+50,myY-53,25,20);
  ellipse(myX+100,myY-53,25,20);
  //bottom//
  fill(255,180,165);
  rectMode(CENTER);
  rect(myX+75,myY+25,75,75,20);
  //eyes//
  drawLeftEye();
  drawRightEye();
  //mouth//
  if (dropY>=height+100)
  {
    mouthWidth=8;//no more flowers
  }
  fill(255);
  rect(myX+75,myY+45,mouthWidth,8,3);
  myX=myX+myXchange;//moving on x axis
  if (myX+150>=width){
    myXchange=-myXchange;
  }
  if (myX<=0){
    myXchange=-myXchange;
  }
}

void drawLeftEye()
{
 fill(255);//left eye
  stroke(0);
  strokeWeight(2);
  ellipse(myX+50,myY+12,30,30);
  pushMatrix();//left eyeball
  translate(myX+50, myY+12);
  rotate(radians(frameCount*2+200));
  fill(0);
  ellipse(8,0,6,6);
  popMatrix();
}

void drawRightEye()
{
  fill(255);//right eye
  ellipse(myX+90,myY+12,30,30);
  pushMatrix();//right eyeball
  translate(myX+90, myY+12);
  rotate(radians(frameCount*2));
  fill(0);
  ellipse(8,0,6,6);
  popMatrix();
}



