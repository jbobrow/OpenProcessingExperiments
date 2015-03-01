
float uX=0, tX1=310, tY1=620, tX2=310, tY2=310;
boolean goRight=true;
float score=0;

void setup()
{
  size(620,620);
}

void keyPressed()
{
  tX1=width/2;
  tY1=620;
  tX2=random(0,width);
  tY2=height/2;
}

void mousePressed()
{
  float tVecX=tX2-tX1;
  float tVecY=tY2-tY1;
  
  float tVecMag=sqrt(tVecX*tVecX+tVecY*tVecY);
  
  float uVecX=uX-width/2;
  float uVecY=height/2-0;
  
  float uVecMag=sqrt(uVecX*uVecX+uVecY*uVecY);
  
  float dot=tVecX*uVecX+tVecY*uVecY;
  
  float cosine=dot/(tVecMag*uVecMag);
  
  score=cosine*100;
}

void draw()
{
  background(0);
  
  stroke(0,0,255);
  strokeWeight(20);
  line(tX1,tY1,tX2,tY2);
  
  if(uX>width) goRight=false;
  else if(uX<0) goRight=true;
  if(goRight) uX+=10;
  else uX-=10;
  stroke(255,0,0);
  line(width/2,0,uX,height/2);
  
  textSize(50);
  fill(#FCE800);
  if(score>99) text("Miracle", width/2, height*2/3);
  else text("You Can't Win This Game",0, height*2/3);
}
