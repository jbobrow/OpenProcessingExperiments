
float ShipY = 550;
float ShipX = mouseX;
float GunY = 550;
float GunX;
float AsteriodY = -50;
float AsteriodX;
float AsteriodY2 = -25;
float AsteriodX2;
float AsteriodY3 = -100;
float AsteriodX3;
int SCORE;

void mousePressed()
{
  if (GunY<-5)
  {
    GunX = mouseX;
  }
}

void setup()
{
  size(600, 600);
  background(0,0,0);
}

void draw()
{
  background(0,0,0, 75);
  fill(0, 0, 255);
  triangle(mouseX, 550, mouseX-10, 575, mouseX+10, 575);
  noStroke();
  fill(255, 0, 0);
  ellipse(GunX, GunY, 5, 5);
  GunY = GunY -10;
  fill(255);
  textAlign(CENTER);
  textSize(48);
  text("EARTH DEFENDER",300,300);
  textSize(12);
  text( "PRESS THE MOUSE TO SHOOT AND S TO START", 300, 100);
  text( "PRESS T TO GET TO THE TUTORIAL", 300, 125);

  if (mousePressed)
  {
    if (GunY<-50)
    {
      GunY = 550;
    }
  }
  if (key == 't')
  {
    background(0,0,0,75);
    fill(0, 0, 255);
    triangle(mouseX, 550, mouseX-10, 575, mouseX+10, 575);
    noStroke();
    fill(255, 0, 0);
    ellipse(GunX, GunY, 5, 5);
    fill(255);
    textAlign(CENTER);
    text("LETTING ASTERIODS PAST IS A 5 POINT DEDUCTION", 300, 100);
    text("EACH ASTERIOD IS 1 POINT", 300, 125);
    text("IF A ASTERIOD HITS THE SHIP ITS GAME OVER", 300, 150);
    text("PRESS S TO START", 300, 175);
    ellipse(AsteriodX, AsteriodY, 30, 30);
    AsteriodY = AsteriodY+4;
    if (AsteriodY>650)
    {
      AsteriodY = -50;
      AsteriodX = random(width);
    }
  }
  if (key == 's')
  {
    background(0,0,0,75);
    fill(0, 0, 255);
    triangle(mouseX, 550, mouseX-10, 575, mouseX+10, 575);
    noStroke();
    fill(255, 0, 0);
    ellipse(GunX, GunY, 5, 5);
    fill(255);
    textAlign(CENTER);
    text("SCORE:" +SCORE, 50, 50);
    text("Press P to Pause",50,75);
    text("LEVEL 1",50,100);
    ellipse(AsteriodX, AsteriodY, 30, 30);
    AsteriodY = AsteriodY+4;
    if (AsteriodY>650)
    {
      AsteriodY = -50;
      AsteriodX = random(width);
    }
  }
  if (dist(GunX, GunY, AsteriodX, AsteriodY) <=15)
  {
    AsteriodY=AsteriodY+4;
    AsteriodY=-50;
    AsteriodX=random(width);
    SCORE=SCORE+1;
  }
  if (AsteriodY>649)
  {
    SCORE=SCORE-5;
  }
  if (key=='p')
  {
    background(0,0,0,75);
    fill(0, 0, 255);
    triangle(mouseX, 550, mouseX-10, 575, mouseX+10, 575);
    noStroke();
    fill(255, 0, 0);
    ellipse(GunX, GunY, 5, 5);
    fill(255);
    textAlign(CENTER);
    text("SCORE:" +SCORE, 50, 50);
    ellipse(AsteriodX, AsteriodY, 30, 30);
    text("Press P to Pause",50,75);
    text("PAUSED",300,300);
    text("Press The Level Letter to Continue",300,325);
  }
    
    if (SCORE>=25)
 {
   fill(255);
   textAlign(CENTER);
   text ("Level 2 Ready Press D",300,100);
 }
    if (key=='d')
    {
    background(0,0,0,75);
    fill(0, 0, 255);
    triangle(mouseX, 550, mouseX-10, 575, mouseX+10, 575);
    noStroke();
    fill(255, 0, 0);
    ellipse(GunX, GunY, 5, 5);
    fill(255);
    textAlign(CENTER);
    text("SCORE:" +SCORE, 50, 50);
    text("Press P to Pause",50,75);
    text("LEVEL 2",50,100);
    ellipse(AsteriodX, AsteriodY, 30, 30); 
      ellipse(AsteriodX2,AsteriodY2,20,20);
       AsteriodY2 = AsteriodY2+3;
      
          if (AsteriodY2>649)
    {
      AsteriodY2 = -25;
      AsteriodX2 = random(width);
      SCORE=SCORE-3;
    }
     ellipse(AsteriodX, AsteriodY, 30, 30);
    
        AsteriodY = AsteriodY+4;
    if (AsteriodY>650)
    {
      AsteriodY = -50;
      AsteriodX = random(width);
    }
    if (dist(GunX,GunY,AsteriodX2,AsteriodY2) <=10)
  {
    AsteriodY2=AsteriodY+3;
    AsteriodY2=-25;
    AsteriodX2=random(width);
    SCORE=SCORE+2;
  }
    }
    if (SCORE>=50)
    {
      fill(255);
      textAlign(CENTER);
      text("Level 3 Ready Press C",300,100);
    }
      if (key=='c')
      {
    background(0,0,0,75);
    fill(0, 0, 255);
    triangle(mouseX, 550, mouseX-10, 575, mouseX+10, 575);
    noStroke();
    fill(255, 0, 0);
    ellipse(GunX, GunY, 5, 5);
    fill(255);
    textAlign(CENTER);
    text("SCORE:" +SCORE, 50, 50);
    text("Press P to Pause",50,75);
    text("LEVEL 3",50,100);
    ellipse(AsteriodX, AsteriodY, 30, 30); 
      ellipse(AsteriodX2,AsteriodY2,20,20);
      ellipse(AsteriodX3,AsteriodY3,50,50);
       AsteriodY3 = AsteriodY3+3;
      
          if (AsteriodY2>649)
    {
      AsteriodY2 = -25;
      AsteriodX2 = random(width);
      SCORE=SCORE-3;
    }
     ellipse(AsteriodX, AsteriodY, 30, 30);
    
        AsteriodY = AsteriodY+4;
    if (AsteriodY>650)
    {
      AsteriodY = -50;
      AsteriodX = random(width);
    }
    if (dist(GunX,GunY,AsteriodX2,AsteriodY2) <=10)
  {
    AsteriodY2=AsteriodY+3;
    AsteriodY2=-25;
    AsteriodX2=random(width);
    SCORE=SCORE+2;
  }
  if (AsteriodY3>649)
  {
    AsteriodY3 = -100;
    AsteriodX3 = random(width);
    SCORE=SCORE-10;
  }
  if (dist(GunX,GunY,AsteriodX3,AsteriodY3) <=25)
  {
    AsteriodY3=AsteriodY3+1;
    AsteriodY3=-100;
    AsteriodX3=random(width);
    SCORE=SCORE+5;
  }
      }
      if (dist(AsteriodX3,AsteriodY3,mouseX,555) <=25)
      {
        textSize(48);
        text("GAME OVER",300,300);
        noLoop();
      }
        if (dist(AsteriodX2,AsteriodY2,mouseX,555) <=15)
  {
    textSize(48);
    text("GAME OVER",300,300);
    noLoop();
  }
    
    if (dist(AsteriodX,AsteriodY,mouseX,555) <=15)
  {
    textSize(48);
    text("GAME OVER",300,300);
    noLoop();
  }
}


