
int Width=600;
int Height=400;
int count=0;
int xMove=0;
int Speed=1;
int[] Slot = {
  0, 110, 220
};
boolean[] Hit= {
  false, false
};
int i=0;
int index;

int[] PosMons = { 
  80, 190, 300, 410, 520
};
int[] xPosMons = {
  0, 0
};

void keyPressed()
{
  if (key=='d')
  {
    if (xMove<220)
    {
      i++;
    }
  }
  if (key=='a')
  {
    if (xMove>0)
    {
      i--;
    }
  }
  if (key=='j')
  {
    Hit[0]=true;
  }
  if (key=='k')
  {
    Hit[1]=true;
  }
  xMove=Slot[i];
}

void setup()
{
  frameRate(20);
  size(Width, Height);
  update();
}

void draw()
{  
  DrawBackground();
  DrawCharacter();
  TextShow();
  DrawMonster();
  //DrawMonster(xPosMons[1]);
  //
}

void update()
{
  index=int(random(0, 5));
  xPosMons[0]=PosMons[index];
  //xPosMons[1]=PosMons[index];
}



//BG
void DrawBackground()
{
  background(100, 100, 255);
  int HeightHalf=Height/2;
  int xStart_Line=0;
  int xEnd_Line=50;
  strokeWeight(0.25);
  line(0, 175, width, 175);
  strokeWeight(4);
  fill(0);
  for (xStart_Line=0 ; xStart_Line<Width ; xStart_Line+=110) {
    xEnd_Line=xStart_Line+50;
    line(xStart_Line, HeightHalf, xEnd_Line, HeightHalf);
  }
}

//Interface Character
void DrawCharacter()
{
  ellipse(188+xMove, 70, 50, 50);  //Head
  ellipse(188+xMove, 130, 30, 60); //Body
  strokeWeight(4);
  line(160+xMove, 175, 175+xMove, 160);  //LeftLeg
  line(200+xMove, 160, 215+xMove, 175);  //RightLeg
  fill(255);
  strokeWeight(1);
  ellipse(180+xMove, 70, 10, 10); //LeftEye
  ellipse(200+xMove, 70, 10, 10); //RightEye
  ellipse(190+xMove, 85, 30, 5);  //Mouth
  DrawHit();
}
void DrawHit()
{
  fill(0);
  if (Hit[0]==false)
  {
    quad(80+xMove, 20, 50+xMove, 50, 80+xMove, 80, 110+xMove, 50);
    strokeWeight(3);
    line(95+xMove, 67, 125+xMove, 100); //LeftHammerHandle
    strokeWeight(8);
    line(125+xMove, 100, 140+xMove, 117);//LeftHand
    strokeWeight(4);
    line(143+xMove, 120, 160+xMove, 125);//LeftArm
  }//LeftNoHit
  if (Hit[1]==false)
  {
    quad(295+xMove, 20, 265+xMove, 50, 295+xMove, 80, 325+xMove, 50);
    strokeWeight(3);
    line(250+xMove, 100, 280+xMove, 67);//RightHammerHandle
    strokeWeight(8);
    line(235+xMove, 117, 250+xMove, 100);//RightHand
    strokeWeight(4);
    line(213+xMove, 125, 233+xMove, 120);//RightArm
  }//RightNoHit
  if (Hit[0]==true)
  {
    quad(60+xMove, 130, 105+xMove, 130, 105+xMove, 175, 60+xMove, 175);//LeftHammer
    strokeWeight(3);
    line(100+xMove, 155, 125+xMove, 150);//LeftHammerHandle
    strokeWeight(8);
    line(125+xMove, 150, 140+xMove, 143);//LeftHand
    strokeWeight(4);
    line(143+xMove, 140, 160+xMove, 130);//LeftArm
    CountPoint();
    Hit[0]=false;
  }//LeftHit
  if (Hit[1]==true)
  {
    quad(280+xMove, 130, 325+xMove, 130, 325+xMove, 175, 280+xMove, 175);//RightHammer
    strokeWeight(3);
    line(250+xMove, 150, 280+xMove, 155);//RightHammerHandle
    strokeWeight(8);
    line(235+xMove, 142, 250+xMove, 150);//RightHand
    strokeWeight(4);
    line(213+xMove, 130, 233+xMove, 140);//RightArm
    CountPoint();
    Hit[1]=false;
  }//RightHit
}

//CountPoint
int CountPoint()
{  
  switch (index) {
  case 0 :
    if (yPosMons <=190 && yPosMons >=160 && Hit[0]==true && xMove==Slot[0])
    {
      count++;
      CheckHIT=true;
    }
    break;

  case 1 :
    if (yPosMons <=190 && yPosMons >=160 && (Hit[0] && xMove==Slot[1]))
    {
      count++;
      CheckHIT=true;
    }
    break;

  case 2 :
    if (yPosMons <=190 && yPosMons >=160 && ((Hit[1]==true && xMove==Slot[0]) || (Hit[0] && xMove==Slot[2])))
    {
      count++;
      CheckHIT=true;
    }
    break;

  case 3 :
    if (yPosMons <=190 && yPosMons >=160 && (Hit[1]==true && xMove==Slot[1]))
    {
      count++;
      CheckHIT=true;
    }
    break;

  case 4 :
    if (yPosMons <=190 && yPosMons >=160 && Hit[1]==true && xMove==Slot[2])
    {
      count++;
      CheckHIT=true;
    }
    break;
  }
  return count;
}

//OUTPUT POINT METHOD
void TextShow()
{
  fill(0);
  textSize(40);
  text("VERMIN", 300, 350);
  text(CountPoint(), 500, 350);
}

///////////////////////10.09.13 --- Finished draw + count BUT pls FIX THE xT variable and how to count a point when TOKENs are HITED////////////////
// 15/09/13 -- TARGET :  DrawMonster Method & Count POINT//
boolean CheckHIT=false;
int yPosMons=300;

void DrawMonster() {
  int r=20;

  if (CheckHIT == false)
  {
    ellipse(xPosMons[0], yPosMons, r, r);
    }
    if (CheckHIT == true)
    {
      update();
      yPosMons=300;
      CheckHIT=false;
    }

  if (CountPoint()>4 && CountPoint()<10) {
    Speed=3;
  }
  else if (CountPoint()>10)
  {
    Speed=5;
  }
  yPosMons-=Speed;
}
