
//sshaik
//copyright
float anchorPointX;
float anchorPointY;
float [] randomFillFactor = new float[4];
float backgroundR = 0;
float backgroundG = 0;
float backgroundB = 0;
ArrayList<BulletClass> bulletArray= new ArrayList<BulletClass>();
boolean initialClick = false;
void setup()
{
 size(1000,1000);
 rectMode(CENTER);
}

void draw()
{
  if(!initialClick)
  {
     fill(#FFFFFF);
     text("Click the screen",width*.5,20);
  }
  noCursor();
  background(backgroundR,backgroundG,backgroundB);
  drawBullets();
  float previousMouseX = -10000;
  float previousMouseY = -10000;
  
  boolean firstRun = true;
  float randomFillFactor = random(50)*.2;
  previousMouseX = mouseX;
  previousMouseY = mouseY;
  strokeWeight(2);
  float currentMouseX = mouseX*.5;
  float currentMouseY = mouseY*.5;
  anchorPointX = mouseX;
  anchorPointY = mouseY;
  float circleRad = 150.0;
  fill(#FFFFFF);
  rect(anchorPointX-44,anchorPointY-50,150,150);
  rect(anchorPointX-44-75,anchorPointY-50,30,30);
  rect(anchorPointX-44+75,anchorPointY-50,30,30);
  rect(anchorPointX-44,anchorPointY+25,30,30);
  rect(anchorPointX-44,anchorPointY-125,30,30);
  fill(currentMouseX*randomFillFactor,currentMouseY,currentMouseX-currentMouseY);
  ellipse(anchorPointX-44,anchorPointY-50,circleRad,circleRad);
  
  fill(currentMouseX,currentMouseY*randomFillFactor,currentMouseX-currentMouseY);
  float rectWidth = 75.0;
  float rectHeight = 75.0;
  fill(currentMouseX,currentMouseY,(currentMouseX-currentMouseY)*randomFillFactor);
  float xOffset = -32.0;
  float yOffset = -62.0;
  beginShape();
  vertex(anchorPointX-25+xOffset,anchorPointY-25+yOffset);
  vertex(anchorPointX+xOffset,anchorPointY-25+yOffset);
  vertex(anchorPointX+25+xOffset,anchorPointY+yOffset);
  vertex(anchorPointX+25+xOffset,anchorPointY+25+yOffset);
  vertex(anchorPointX+xOffset,anchorPointY+50+yOffset);
  vertex(anchorPointX-25+xOffset,anchorPointY+50+yOffset);
  vertex(anchorPointX-50+xOffset,anchorPointY+25+yOffset);
  vertex(anchorPointX-50+xOffset,anchorPointY+yOffset);
   vertex(anchorPointX-25+xOffset,anchorPointY-25+yOffset);
  endShape();
  strokeWeight(1);
  //triangle(anchorPointX-130,anchorPointY-50,anchorPointX-100,anchorPointY-30,anchorPointX-100,anchorPointY-70);
  //line(anchorPointX-44,anchorPointY-circleRad,anchorPointX-44,anchorPointY+circleRad);
  //stroke(255,255,255);
  
  
  //line(anchorPointY-circleRad,anchorPointY-44,anchorPointY+circleRad,anchorPointY-44);
}

void mouseClicked()
{
  backgroundR = random(255);
  backgroundG = random(255);
  backgroundB = random(255);
  BulletClass newBullet = new BulletClass(anchorPointX-144,anchorPointY-50);
  bulletArray.add(newBullet);
  print(bulletArray.size());
}

void drawBullets()
{
  for(int i = 0;i<bulletArray.size();i++)
  {
    BulletClass currentBullet = bulletArray.get(i);
    if(currentBullet.bulletX<=0)
    {
      bulletArray.remove(i);
    }
  }
  for(BulletClass a : bulletArray)
  {
     if(a.bulletX>=0)
     {
     a.bulletX -= 10;
     translate(a.bulletX+10,a.bulletY);
     rotate((frameCount*.5)%360);
     //triangle(a.bulletX,a.bulletY,a.bulletX+30,a.bulletY+20,a.bulletX+30,a.bulletY-20);
     triangle(0,0,30,20,30,-20);
     rotate(-(frameCount*.5)%360);
     translate(-(a.bulletX+10),-(a.bulletY));
     }
  } 
}
class BulletClass
{
  float bulletX;
  float bulletY;
  
  BulletClass(float bulletXIn, float bulletYIn)
  {
    bulletX = bulletXIn;
    bulletY = bulletYIn;
  } 
}


