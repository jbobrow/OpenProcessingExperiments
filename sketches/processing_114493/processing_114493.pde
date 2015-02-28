
SpriteObjectred[] redDialogue = new SpriteObjectred[10];
SpriteObjectgreen[] greenDialogue = new SpriteObjectgreen[10];
SpriteObjectblue[] blueDialogue = new SpriteObjectblue[10];
SpriteObjectpurple[] purpleDialogue = new SpriteObjectpurple[10];
SpriteObjectorange[] orangeDialogue = new SpriteObjectorange[10];
SpriteObjectyellow[] yellowDialogue = new SpriteObjectyellow[10];
SpriteObjectnumber[] scoringMe = new SpriteObjectnumber[6];
SpriteObjectending[] end = new SpriteObjectending[1];
SpriteObjectselector[] select=new SpriteObjectselector[4];
int ballX=400;
int ballY=400;
boolean titleS=false;
boolean sell1=true;
boolean sell2=false;
boolean gridON=false;
boolean start=false;
boolean leftturn=true;
boolean downturn=true;
boolean redstop=false;
int redX=720;
int purpleX=720;
int yellowX=-10;
int orangeX=-10;
int greenX=720;
int redY=50;
int blueY=640;
int bluescale=50;
float timer=0;
boolean bluebounce=false;
boolean redShift = false;
boolean redSpeak=true;
boolean greenSpeak=false;
int playerpoint1=60;
int playerPoint2=120;
boolean collision=false;
int comPoint1=60;
int comPoint2=160;
boolean player2=false;
boolean turn=false;
int score=0;
boolean scoreMark=false;
float enTimer=0;
boolean game101=false;
boolean game202=false;
boolean pass1=true;
boolean red1=false;
boolean green1=false;
boolean blue1=false;
boolean orange1=false;
boolean yellow1=false;
boolean purple1=false;
void setup()
{
  frameRate(30);
  size(700,650);
  background(0);
end[0]=new SpriteObjectending("WIN.jpg");
select[0]=new SpriteObjectselector("Title.jpg");
select[1]=new SpriteObjectselector("Arrow.jpg");

  for(int i=1;i<6;i++)
  {
      scoringMe[i] = new SpriteObjectnumber(i+".jpg");

  }
  for(int i=0;i<6;i++)
  {
      redDialogue[i] = new SpriteObjectred("red"+i+".jpg");

  }
  for(int i=0;i<8;i++)
  {
      greenDialogue[i] = new SpriteObjectgreen("green"+i+".jpg");

  }
  for(int i=0;i<5;i++)
  {
      blueDialogue[i] = new SpriteObjectblue("blue"+i+".jpg");

  }
  for(int i=0;i<5;i++)
  {
      purpleDialogue[i] = new SpriteObjectpurple("purple"+i+".jpg");

  }
  for(int i=0;i<3;i++)
  {
      orangeDialogue[i] = new SpriteObjectorange("orange"+i+".jpg");

  }
  for(int i=0;i<2;i++)
  {
      yellowDialogue[i] = new SpriteObjectyellow("yellow"+i+".jpg");

  }
}

void draw()
{if(keyPressed==true)
{
  if(key == 'm')
  {
  println(red1);
  println(green1);
  println(blue1);
  println(orange1);
  println(yellow1);
   println(purple1);
  } 
}
  if(keyPressed==true)
  {
    if(key == '1')
    {
      red1=true;
      green1=false;
      blue1=false;
      orange1=false;
      yellow1=false;
      purple1=false;
    }
    if(key == '2')
    {
      red1=false;
      green1=true;
      blue1=false;
      orange1=false;
      yellow1=false;
      purple1=false;
    }
    if(key == '3')
    {
      red1=false;
      green1=false;
      blue1=true;
      orange1=false;
      yellow1=false;
      purple1=false;
    }
    if(key == '4')
    {
      red1=false;
      green1=false;
      blue1=false;
      orange1=false;
      yellow1=false;
      purple1=true;
    }
    if(key == '5')
    {
      red1=false;
      green1=false;
      blue1=false;
      orange1=true;
      yellow1=false;
      purple1=false;
    }
    if(key == '6')
    {
      red1=false;
      green1=false;
      blue1=false;
      orange1=false;
      yellow1=true;
      purple1=false;
    }
  }
  fill(255,0,0);
rect(0,0,700,700);
fill(255);
titleS=true;
select[0].render();
titleS=false;
if(pass1==false)
{
sell1=true;

select[1].render();
fill(255);
rect(400,380,50,50);
}
if(pass1==true)
{
  if(keyPressed==true)
  {
    if(sell1==true && sell2==false)
    {
      if (key==  CODED)
    {
    if (keyCode==DOWN)
    {
      sell1=false;
      sell2=true;
    }
    }
    }
  else  if(sell1==false && sell2==true)
    {
      if (key==  CODED)
    {
    if (keyCode==UP)
    {
      sell1=true;
      sell2=false;
    }
    }
    }
  }
  select[1].render();
  float l=random(0,250);
  fill(l,100,100);
  rect(400,480,50,50);
  select[1].render();
fill(255);
rect(400,380,50,50);
}
if (sell1==true && sell2==false)
{
  if(keyPressed==true)
  {
    if (key==' ')
    {
      game101=true;
    }
  }
}
if(sell2==true&&sell1==false)
{
  if(keyPressed==true)
  {
    if (key==' ')
    {
      game202=true;
    }
  }
}
 
  if (game101 == true)
{
  game11();
}
if(game202==true)
{
  game2();
}
if(keyPressed==true)
{ 
  if(gridON==false)
  {
   if(key=='g')
  {
    gridON=true;
  }
  }
  else if (gridON==true)
  {
    if(key=='g')
  {
    gridON=false;
  }
    
  }
}
if(gridON==true)
{
 for (int x = 0; x< width;x+=20)
  {
    stroke(255,0,0);  
    line(x,0,x,height);
  }
   for (int y = 0; y< height;y+=20)
  {
    stroke(255,0,0);  
    line(0,y,width,y);
  }
}
}
void game11()
{
  boolean a=false;
  {     background(0);
  ellipse(ballX,ballY,50,50);
  playerpoint1= mouseY;
  playerPoint2=mouseY + 90;
if(timer==200)
{
  enTimer+=0.03;
}
if(keyPressed==true)
{
  if(player2==false)
  {
  if(key=='p')
  {
    player2=true;
  }
  }
  else if (player2==true)
  {
    if(key=='p')
  {
    player2=false;
  }
    
  }
  
}
  if(keyPressed==true)
  {
    if(key==' ')
    {
      start=true;
    }
  }
  if (start==true)
  {
    if(score==1)
    {
       scoringMe[1].render();
    }
    if(score==2)
    {
       scoringMe[2].render();
    }
    if(score==3)
    {
       scoringMe[3].render();
    }
    if(score==4)
    {
       scoringMe[4].render();
    }
    if(score==5)
    {
       scoringMe[5].render();
    }
    timer+=0.03;
   // println(pass1);
      // players
      rect(0,playerpoint1,20,80);
      rect(680,comPoint1,20,80);
       //player 2
 if (player2==true)
 {
 if (keyPressed == true)
  {
    if (key==  CODED)
    {
    if (keyCode==DOWN)
    {
      comPoint1+=10;
      comPoint2+=10;
    }
    else if (keyCode==UP)
    {
      comPoint1-=10;
      comPoint2-=10;
    }
      }
  }
 }
 else
 {
   if (turn==false)
   {
   if(comPoint1<=450 && comPoint1>0)
   {
     comPoint1-=5;
     comPoint2-=5;
   }
     else 
     {
       turn=true;
     }
   }
   else 
   {
      if(comPoint1<450 && comPoint1>=0)
     {
       comPoint1+=5;
     comPoint2+=5;
     }
     else
     {turn=false;
     }
   }
   }
 
      // bouncing ball codex begining
      if(leftturn==true&& collision==false)
      {
      if(ballX==40)
      {
      if(ballY<playerPoint2 && ballY>playerpoint1)
        {
        collision=true;
        leftturn=false;
      }
      else if(ballX>-50 && ballX<=750)
      {
        ballX-=5;
      }
      }
      else if(ballX>-50 && ballX<=750)
      {
        ballX-=5;
      }
      else
      {
        ballX=400;
      }
      }
      if (leftturn==false && collision==true)
      {
        if(ballX==660)
      {
      if(ballY<comPoint2 && ballY>comPoint1)
        {
        collision=false;
        leftturn=true;
      }
      else if(ballX>=-50 && ballX<750)
      {
        ballX+=5;
        scoreMark=true;
      }
      }
      if(scoreMark==true)
      {
        score++;
        scoreMark=false;
      }
       else if(ballX>=-50 &&ballX<750)
        {
          ballX+=5;
        }
        else
        {
          leftturn=true;
          collision=false;
          ballX=400; 
        }
        
      }
      //ball bouncing codex end
      //ball bouncing codey begin
      if(downturn==true)
      {
      if(ballY>5 && ballY<=500)
      {
        ballY-=5;
      }
      else 
      {
        downturn=false;
      }
      }
      if (downturn==false)
      {
        if(ballY>=5 &&ballY<500)
        {
          ballY+=5;
        }
        else
        {
          downturn=true;
        }
        //ball bounce codey end
      }


  }
   // red ball scenario
    fill(255,0,0);
  ellipse(redX,600,50,redY);
  fill(255);
if(redX>=300)
{
  redX-=5;
}
if (timer>=10)
{
  fill(0,255,0);
  ellipse(greenX,600,50,50);
  fill(255);
if(greenX>=400)
{
  greenX-=5;
}
if (timer>=20)
{
  if(redY<100)  
  {redY+=1;}
  
}
if (timer>=30)
{
  fill(0,0,255);
  ellipse(500,blueY,50,bluescale);
  fill(255); 
  if (bluebounce==false)
  {
  if(blueY<650)
  {
    blueY+=5;
    bluescale-=10;
  }
  else
  {
    bluebounce=true;
  }
  }
  if (bluebounce==true)
  {
  if (blueY >580)
  {
    blueY-=5;
    bluescale+=10;
  }
  else
  {
  bluebounce=false;
  }
  

}
  
}
}
if (timer>5 && timer<10)
{
      redDialogue[0].render();

}
if (timer>10 && timer<15)
{
      greenDialogue[0].render();

}
if (timer>15 && timer<20)
{
      greenDialogue[1].render();

}
if (timer>20 && timer<25)
{
      redDialogue[1].render();

}
if (timer>25 && timer<30)
{
      greenDialogue[2].render();

}
if (timer>30 && timer<35)
{
      blueDialogue[0].render();

}
if (timer>35 && timer<40)
{
      redDialogue[2].render();

}
if (timer>40 && timer<45)
{
      blueDialogue[1].render();

}
if (timer>45 && timer<50)
{
      greenDialogue[3].render();

}
if (timer>50 && timer<55)
{
      blueDialogue[2].render();

}
if(timer>55)
{
  fill(195,0,255);
  ellipse(purpleX,600,50,50);
  fill(255);
  if(purpleX>600)
  {
    purpleX-=1;
  }
}

if(timer>110)
{
  fill(255,255,0);
  ellipse(yellowX,600,50,50);
  fill(255);
  if(yellowX<100)
  {
    yellowX+=1;
  }
}
if(timer>90)
{
  fill(255,125,0);
  rect(orangeX,600,50,50);
  fill(255);
  if(orangeX<200)
  {
    orangeX+=1;
  }
}
if (timer>55 && timer<60)
{
      purpleDialogue[0].render();

}
if (timer>60 && timer<65)
{
      greenDialogue[4].render();

}
if (timer>65 && timer<70)
{
      purpleDialogue[1].render();

}
if (timer>70 && timer<75)
{
      blueDialogue[3].render();

}if (timer>75 && timer<80)
{
      greenDialogue[5].render();

}
if (timer>80 && timer<85)
{
      purpleDialogue[2].render();

}if (timer>85 && timer<90)
{
      redDialogue[3].render();

}
if (timer>90 && timer<95)
{
      orangeDialogue[0].render();

}
if (timer>95 && timer<100)
{
      greenDialogue[6].render();

}
if (timer>100 && timer<105)
{
      purpleDialogue[3].render();

}
if (timer>105 && timer<110)
{
      greenDialogue[7].render();

}
if (timer>110 && timer<115)
{
     yellowDialogue[0].render();

}if (timer>115 && timer<120)
{
      orangeDialogue[1].render();

}
if (timer>120 && timer<125)
{
      redDialogue[4].render();

}
if (timer>125 && timer<130)
{
      yellowDialogue[1].render();

}
if (timer>130 && timer<135)
{
      purpleDialogue[4].render();

}
if (timer>135 && timer<140)
{
      blueDialogue[4].render();

}
if (timer>140 && timer<145)
{
      redDialogue[5].render();

}
if (timer>145 && timer<150)
{
      orangeDialogue[2].render();

}
if (timer>150&&timer<200)
{
  a=true;
}
if (score==5)
{
  float rdc=random(0,100);
  colorMode(HSB);
  fill(rdc,100,100);
  rect(0,0,700,700);
  end[0].render();
  timer=200;
  if(a==true)
  {
    pass1=true;
  }
 colorMode(RGB);
}
if(enTimer>5)
{
  
  game101=false;
  
}
}
}


class SpriteObjectred
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
   
  SpriteObjectred(String filename)
  {
    this.img = requestImage(filename);
  }
   
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }
     
    if (loaded)
    {
      if(timer<20&& redShift==false)
      {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 300, 550, this.w, this.h);
      popMatrix();
      }
      else if (timer>20)
      {
        imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 250, 550, this.w, this.h);
      popMatrix();
      }
      
    }
  }
}
class SpriteObjectgreen
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
   
  SpriteObjectgreen(String filename)
  {
    this.img = requestImage(filename);
  }
   
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }
     
    if (loaded)
    {
      if(timer>0)
      {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 450, 550, this.w, this.h);
      popMatrix();
      }
     
    }
  }
}

class SpriteObjectblue
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
   
  SpriteObjectblue(String filename)
  {
    this.img = requestImage(filename);
  }
   
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }
     
    if (loaded)
    {
      if(timer>0)
      {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 450, 550, this.w, this.h);
      popMatrix();
      }
     
    }
  }
}
class SpriteObjectpurple
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
   
  SpriteObjectpurple(String filename)
  {
    this.img = requestImage(filename);
  }
   
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }
     
    if (loaded)
    {
      if(timer>0)
      {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 450, 550, this.w, this.h);
      popMatrix();
      }
     
    }
  }
}
class SpriteObjectorange
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
   
  SpriteObjectorange(String filename)
  {
    this.img = requestImage(filename);
  }
   
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }
     
    if (loaded)
    {
      if(timer>0)
      {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 450, 550, this.w, this.h);
      popMatrix();
      }
     
    }
  }
}


class SpriteObjectyellow
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
   
  SpriteObjectyellow(String filename)
  {
    this.img = requestImage(filename);
  }
   
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }
     
    if (loaded)
    {
      if(timer>0)
      {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 450, 550, this.w, this.h);
      popMatrix();
      }
     
    }
  }
}
void game2()
{ boolean a=false;
  {     background(0);
  if(red1)
  {
      fill(255,0,0);
    ellipse(ballX,ballY,50,redY);
    fill(255);

  }
  if(green1)
  {
    fill(0,255,0);
      ellipse(ballX,ballY,50,50);
      fill(255);

  }
  if(blue1)
  {
    fill(0,0,255);
      ellipse(ballX,ballY,50,bluescale);
      fill(255);

  }
  if(purple1)
  {
    fill(195,0,255);  
    ellipse(ballX,ballY,50,50);
    fill(255);

  }
  if(orange1)
  {
    fill(255,125,0);
      rect(ballX,ballY,50,50);
      fill(255);


  }
  if(yellow1)
  
  {
    fill(255,255,0);
      ellipse(ballX,ballY,50,50);
      fill(255);

  }
  playerpoint1= mouseY;
  playerPoint2=mouseY + 90;
if(timer==200)
{
  enTimer+=0.03;
}
if(keyPressed==true)
{
  if(player2==false)
  {
  if(key=='p')
  {
    player2=true;
  }
  }
  else if (player2==true)
  {
    if(key=='p')
  {
    player2=false;
  }
    
  }
  
}
  if(keyPressed==true)
  {
    if(key==' ')
    {
      start=true;
    }
  }
  if (start==true)
  {
    if(score==1)
    {
       scoringMe[1].render();
    }
    if(score==2)
    {
       scoringMe[2].render();
    }
    if(score==3)
    {
       scoringMe[3].render();
    }
    if(score==4)
    {
       scoringMe[4].render();
    }
    if(score==5)
    {
       scoringMe[5].render();
    }
    timer+=0.03;
    println(pass1);
      // players
      rect(0,playerpoint1,20,80);
      rect(680,comPoint1,20,80);
       //player 2
 if (player2==true)
 {
 if (keyPressed == true)
  {
    if (key==  CODED)
    {
    if (keyCode==DOWN)
    {
      comPoint1+=10;
      comPoint2+=10;
    }
    else if (keyCode==UP)
    {
      comPoint1-=10;
      comPoint2-=10;
    }
      }
  }
 }
 else
 {
   if (turn==false)
   {
   if(comPoint1<=450 && comPoint1>0)
   {
     comPoint1-=5;
     comPoint2-=5;
   }
     else 
     {
       turn=true;
     }
   }
   else 
   {
      if(comPoint1<450 && comPoint1>=0)
     {
       comPoint1+=5;
     comPoint2+=5;
     }
     else
     {turn=false;
     }
   }
   }
 
      // bouncing ball codex begining
      if(leftturn==true&& collision==false)
      {
      if(ballX==40)
      {
      if(ballY<playerPoint2 && ballY>playerpoint1)
        {
        collision=true;
        leftturn=false;
      }
      else if(ballX>-50 && ballX<=750)
      {
        ballX-=5;
      }
      }
      else if(ballX>-50 && ballX<=750)
      {
        ballX-=5;
      }
      else
      {
        ballX=400;
      }
      }
      if (leftturn==false && collision==true)
      {
        if(ballX==660)
      {
      if(ballY<comPoint2 && ballY>comPoint1)
        {
        collision=false;
        leftturn=true;
      }
      else if(ballX>=-50 && ballX<750)
      {
        ballX+=5;
        scoreMark=true;
      }
      }
      if(scoreMark==true)
      {
        score++;
        scoreMark=false;
      }
       else if(ballX>=-50 &&ballX<750)
        {
          ballX+=5;
        }
        else
        {
          leftturn=true;
          collision=false;
          ballX=400; 
        }
        
      }
      //ball bouncing codex end
      //ball bouncing codey begin
      if(downturn==true)
      {
      if(ballY>5 && ballY<=500)
      {
        ballY-=5;
      }
      else 
      {
        downturn=false;
      }
      }
      if (downturn==false)
      {
        if(ballY>=5 &&ballY<500)
        {
          ballY+=5;
        }
        else
        {
          downturn=true;
        }
        //ball bounce codey end
      }


  }
   // red ball scenario
    fill(255,0,0);
  //ellipse(redX,600,50,redY);
  fill(255);
if(redX>=300)
{
  redX-=5;
}
if (timer>=0)
{
  fill(0,255,0);
 // ellipse(greenX,600,50,50);
  fill(255);
if(greenX>=400)
{
  greenX-=5;
}
if (timer>=0)
{
  if(redY<100)  
  {redY+=1;}
  
}
if (timer>=0)
{
  fill(0,0,255);
//  ellipse(500,blueY,50,bluescale);
  fill(255); 
  if (bluebounce==false)
  {
  if(blueY<650)
  {
    blueY+=5;
    bluescale-=10;
  }
  else
  {
    bluebounce=true;
  }
  }
  if (bluebounce==true)
  {
  if (blueY >580)
  {
    blueY-=5;
    bluescale+=10;
  }
  else
  {
  bluebounce=false;
  }
  

}
  
}
}

}


}
class SpriteObjectnumber
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
   
  SpriteObjectnumber(String filename)
  {
    this.img = requestImage(filename);
  }
   
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }
     
    if (loaded)
    {
      if(timer>0)
      {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 400, 100, this.w, this.h);
      popMatrix();
      }
     
    }
  }
}
class SpriteObjectending
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
   
  SpriteObjectending(String filename)
  {
    this.img = requestImage(filename);
  }
   
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }
     
    if (loaded)
    {
      if(timer>0)
      {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 400, 100, this.w, this.h);
      popMatrix();
      }
     
    }
  }
}

class SpriteObjectselector
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
   
  SpriteObjectselector(String filename)
  {
    this.img = requestImage(filename);
  }
   
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }
     
    if (loaded)
    {
      if(titleS==true)
      {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 200, 100, this.w, this.h);
      popMatrix();
      }
      else if (sell1==true)
      {imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 300, 400, this.w, this.h);
      popMatrix();
      }
      else if (sell2==true)
      {imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 300, 500, this.w, this.h);
      popMatrix();
      }
     
    }
  }
}





