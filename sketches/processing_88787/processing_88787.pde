
PImage mp;
int myX;
int myY=640;
float [] xPos = new float[0];
float [] yPos = new float[0];
float [] xVel = new float[0];
float [] yVel = new float[0];
float [] snowSize = new float[0];
float ePosY = 350;
float ePosX = 635;
int ballSize = 25;
boolean fire = false;
  int RandomX()
  {
    return int(random(900));
  } 
  int[] ballx = { RandomX(), RandomX(), RandomX(), RandomX(), RandomX(),RandomX()};
  int[] bally = { 0, 0, 0, 0, 0,0 };
  

void setup() 
{
  size(900, 750); 
  noStroke();  
  mp =loadImage("winter.jpg");
}


void draw() { 
image(mp,0,0);
myX=mouseX;

  xPos = append(xPos, random(ePosX-600, ePosX+300));
  yPos = append(yPos, ePosY-300);
  xVel = append(xVel, random(-0.5, 0.5));
  yVel = append(yVel, random(-1, 1));
  snowSize = append(snowSize, random(2, 6));
 
  for (int i = 0; i<xPos.length;i++) {
    noStroke();
    fill(242,244,250);
    ellipse(xPos[i], yPos[i], snowSize[i], snowSize[i]);
    xPos[i]+=xVel[i];
    yPos[i]+=yVel[i];

  }
  
    triangle(mouseX,500, mouseX+20, 530, mouseX-20, 530);
    if(fire)
    {
      cannon(mouseX);
      fire = false;
    }
   
ballFalling();
makePenguin();
textSize(20);
fill(252, 252, 240);
text("Shot the Orange Ball!", 660, 725);
}

 void mousePressed()
  {
    fire = true;
  }
   
  void ballFalling()
{ 
stroke(247, 147, 35);
fill (247, 147, 35);
for (int i=0; i<5; i++)
    {
     ellipse(ballx[i], bally[i]++, ballSize, ballSize);
    }
  }
   
  void cannon(int shotX)
  {
    boolean strike = false;
    for (int i = 0; i < 6; i++)
    {
      if((shotX >= (ballx[i]-ballSize/2)) && (shotX <= (ballx[i]+ballSize/2))) {
        strike = true;
        fill(234,237,81);
        ellipse(ballx[i], bally[i],
                ballSize+50, ballSize+50);
        ballx[i] = RandomX();
        bally[i] = 0;
 
      }   
    }
   
    if(strike == false)
    {
      line(mouseX, 565, mouseX, 0);
    } 
   
  }
   



void makePenguin(){
noStroke();
fill(8,10,18);//black body
ellipse(myX, 640, 180, 210);
fill(255,255,255);//white
ellipse(myX,myY+50,90,100);//belly
ellipse(myX-30,myY-50,54,50);//left eye
ellipse(myX+30,myY-50,54,42);//right eye
fill(0);//black
float w=random(2);
ellipse(myX-20,myY-50,30*1.3,30*w);//left eye2
ellipse(myX+20,myY-50,30,30);//right eye2
fill(192,109,240);//purple
rect(myX-15,myY+4,27,27);//tie
rect(myX-10,myY+10,17,83);//tie 2
fill(241,241,43);//yellow
ellipse(myX-70,myY+100,80,20);//left feet
ellipse(myX+70,myY+100,80,20);//right feet
triangle (myX-20,myY-30,myX+20,myY-30,myX,myY-10);
fill(0);//black
float e=random(1.3);
triangle(myX-180*e,myY-50*e,myX-80,myY-30,myX-90,myY+30);//left wing
triangle(myX+70,myY-50,myX+170*e,myY-100*e,myX+90,myY+20);//right wing  
}






