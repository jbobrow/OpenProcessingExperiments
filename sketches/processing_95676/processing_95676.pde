
int y=560;
int a=280;
int b=30;

float ballX=random(0,300);
float ballY=random(0,300);
float ballA=random(0,300);
float ballB=random(0,300);

int speed=4;
int xdir=speed;
int ydir=speed;
int adir=speed;
int bdir=speed;

int lives=3;

int score=0;

int lives2=3;

int score2=0;

boolean square=false;

float rectX=random(30,570);
float rectY=random(30,559);

boolean load=true;
boolean help=false;
boolean pause=false;
boolean pause2=false;

int playX=200;
int playY=160;
int helpX=200;
int helpY=250;

int backX=275;
int backY=500;

int resumeX=200;
int resumeY=200;
int instructionsX=200;
int instructionsY=255;
int menuX=200;
int menuY=310;

int back2X=275;
int back2Y=500;
boolean instructions=false;

boolean modes=false;
float player1X=200;
float player1Y=160;
float player2X=200;
float player2Y=250;
boolean player1=false;
boolean player2=false;

int resume2X=200;
int resume2Y=200;


void setup()  {
 size (600,600);
 background (0,0,0); 
 textFont (createFont("Verdana",16));
}

void draw()  {
 background (0,0,0);
 noStroke();
 noCursor();
 fill(128,128,128);
 
 ellipse(ballX,ballY,20,20);
 if(score>=20)  {
   fill(128,128,128);
   ellipse(ballA,ballB,20,20);
    ballA=ballA+adir;
    ballB=ballB+bdir;
    speed=8;
 }
  if(score2>=20)  {
   fill(128,128,128);
   ellipse(ballA,ballB,20,20);
    ballA=ballA+adir;
    ballB=ballB+bdir;
    speed=8;
 }
 if(score>=30)  {
   speed=9;
 }
 ballX=ballX+xdir;
 ballY=ballY+ydir;
 if(ballX>=590)  {
  xdir=-speed;
 }
 if(ballA>=590)  {
   adir=-speed;
 }
 if(ballX<=10)  {
  xdir=speed;
 } 
 if(ballA<=10)  {
   adir=speed;
 }
 if(ballY>=590)  {
  ydir=-speed;
  lives=lives-1;
 }
 if(ballB>=590)  {
   bdir=-speed;
   lives=lives-1;
 }
 if(player2==true&&ballY-10<=0)  {
  ydir=speed;
  lives2=lives2-1;
 }
 if(player2==true&&ballB-10<=0)  {
   bdir=speed;
   lives2=lives2-1;
 }
 text("Lives:",14,590);
 text(lives,73,590);
 if(player2==false&&lives<=0)  {
   noLoop();
   text("Game Over... Press r",200,290);
 }
 if(ballY<=10)  {
  ydir=speed;
 }
 if(ballB<=10)  {
   bdir=speed;
 }
 
 if(player2==true)  {
 text("Lives:",14,20);
 text(lives2,73,20);
 }
 
 rect(mouseX,y,40,10);
 if(mouseX>=560)  {
  mouseX=560;
 }
 
   if(ballX+10>mouseX&&ballX-10<mouseX+40&&ballY+10>y&&ballY+10<y+10)  {
   ydir=-speed;
   score=score+1;
 }
 if(ballA+10>mouseX&&ballA-10<mouseX+40&&ballB+10>y&&ballB+10<y+10)  {
   bdir=-speed;
   score=score+1;
 }
 
  if(player2==true&&ballX+10>a&&ballX-10<a+40&&ballY-10>b&&ballY-10<b+10)  {
   score2=score2+1;
    ydir=speed;
 }
 if(player2==true&&ballA+10>a&&ballA-10<a+40&&ballB-10>b&&ballB-10<b+10)  {
   score2=score2+1;
   bdir=speed;
 }
 
 text("Score:",500,590);
 text(score,567,590);
 if(score>=5)  {
   speed=6;
 }
 if(score>=10)  {
   speed=8;
 }
 if(score>=15)  {
   speed=9;
 }
 
 if(player2==true)  {
 text("Score:",500,20);
   text(score2,567,20);
   square=false;
 }
   if(score2>=5)  {
   speed=6;
 }
 if(score2>=10)  {
   speed=8;
 }
 if(score2>=15)  {
   speed=9;
 }
 
 if(player2==false&&ballX>rectX&&ballX<rectX+20&&ballY>rectY&&ballY<rectY+20)  {
   lives=lives+1;
   rectX=random(30,570);
   rectY=random(30,559);
 }
  if(player2==false&&ballX+10>rectX&&ballX+10<rectX+20&&ballY>rectY&&ballY<rectY+20)  {
   lives=lives+1;
   rectX=random(30,570);
   rectY=random(30,559);
 }
  if(player2==false&&ballX-10>rectX&&ballX-10<rectX+20&&ballY>rectY&&ballY<rectY+20)  {
   lives=lives+1;
   rectX=random(30,570);
   rectY=random(30,559);
 }
  if(player2==false&&ballX>rectX&&ballX<rectX+20&&ballY+10>rectY&&ballY+10<rectY+20)  {
   lives=lives+1;
   rectX=random(30,570);
   rectY=random(30,559);
 }
  if(player2==false&&ballX>rectX&&ballX<rectX+20&&ballY-10>rectY&&ballY-10<rectY+20)  {
   lives=lives+1;
   rectX=random(30,570);
   rectY=random(30,559);
 }
  if(player2==false&&ballA>rectX&&ballA<rectX+20&&ballB>rectY&&ballB<rectY+20)  {
   lives=lives+1;
   rectX=random(30,570);
   rectY=random(30,559);
 }
  if(player2==false&&ballA+10>rectX&&ballA+10<rectX+20&&ballB>rectY&&ballB<rectY+20)  {
   lives=lives+1;
   rectX=random(30,570);
   rectY=random(30,559);
 }
  if(player2==false&&ballA-10>rectX&&ballA-10<rectX+20&&ballB>rectY&&ballB<rectY+20)  {
   lives=lives+1;
   rectX=random(30,570);
   rectY=random(30,559);
 }
  if(player2==false&&ballA>rectX&&ballA<rectX+20&&ballB+10>rectY&&ballB+10<rectY+20)  {
   lives=lives+1;
   rectX=random(30,570);
   rectY=random(30,559);
 }
  if(player2==false&&ballA>rectX&&ballA<rectX+20&&ballB-10>rectY&&ballB-10<rectY+20)  {
   lives=lives+1;
   rectX=random(30,570);
   rectY=random(30,559);
 }
 
 if(load==true)  {
   noLoop();
   background(255,255,255);
   fill(128,128,128);
   rect(playX,playY,200,80);
   rect(helpX,helpY,200,80);
   fill(255,255,255);
   text("PLAY",playX+76,playY+47);
   text("HELP",helpX+76,helpY+47);
   fill(128,128,128);
   text("By Trevor Phillips",230,400);
   textFont (createFont("Verdana",30));
   text("Bounce",243,50);
   textFont (createFont("Verdana",16));
   cursor();
 }
 
 if(help==true)  {
   background(255,255,255);
   text("the paddle follows your mouse",175,200);
   text("bounce the ball off of it and you get a point",125,230);
   text("miss and you lose a life",200,260);
   text("hit the box for an extra life",187,290);
   text("the ball speeds up",223,320);
   text("press r to restart",230,350);
   text("p to pause",258,380);
   fill(128,128,128);
   rect(backX,backY,50,20);
   fill(255,255,255);
   text("BACK",backX+3,backY+16);
   fill(128,128,128);
   cursor();
 }
 
  if(pause==true)  {
    noLoop();
    background(255,255,255);
    fill(128,128,128);
    rect(resumeX,resumeY,200,50);
    rect(instructionsX,instructionsY,200,50);
    rect(menuX,menuY,200,50);
    fill(255,255,255);
    text("RESUME",resumeX+63,resumeY+30);
    text("INSTRUCTIONS",instructionsX+36,instructionsY+30);
    text("MENU",menuX+73,menuY+30);
    fill(128,128,128);
    textFont (createFont("Verdana",30));
    text("Paused",247,50);
    textFont (createFont("Verdana",16));
    cursor();
  }
  
  if(pause2==true)  {
     noLoop();
    background(255,255,255);
    fill(128,128,128);
    rect(resume2X,resume2Y,200,50);
    rect(instructionsX,instructionsY,200,50);
    rect(menuX,menuY,200,50);
    fill(255,255,255);
    text("RESUME",resume2X+63,resume2Y+30);
    text("INSTRUCTIONS",instructionsX+36,instructionsY+30);
    text("MENU",menuX+73,menuY+30);
    fill(128,128,128);
    textFont (createFont("Verdana",30));
    text("Paused",247,50);
    textFont (createFont("Verdana",16));
    cursor();
  }
  
  if(instructions==true)  {
     background(255,255,255);
   text("the paddle follows your mouse",175,200);
   text("bounce the ball off of it and you get a point",125,230);
   text("miss and you lose a life",200,260);
   text("hit the box for an extra life",187,290);
   text("the ball speeds up",223,320);
   text("press r to restart",230,350);
   text("p to pause",258,380);
   fill(128,128,128);
   rect(back2X,back2Y,50,20);
   fill(255,255,255);
   text("BACK",back2X+3,back2Y+16);
   fill(128,128,128);
   cursor();
  }
  
  if(modes==true)  {
    background(255,255,255);
    fill(128,128,128);
    rect(player1X,player1Y,200,50);
    rect(player2X,player2Y,200,50);
    fill(255,255,255);
    text("1 Player",player1X+65,player1Y+30);
    text("2 Players",player2X+60,player2Y+30);
    fill(128,128,128);
    text("Player 2 Uses A & D Keys",195,400);
    cursor();
    loop();
  }
    
    if(player2==true)  {
      load=false;
        modes=false;
    rect(a,b,40,10);
    }
    if(a>=560)  {
      a=560;
    }
    if(a<=0)  {
      a=0;
    }
    
    if(square==true)  {
       rect(rectX,rectY,20,20);
 fill(0,0,0);
 text("+1",rectX-1,rectY+15);
 fill(128,128,128);
    }
    if(player1==true)  {
      square=true;
    }
    
    if(player2==true&&score>=45)  {
      noLoop();
      text("PLAYER ONE WINS! Press r",200,400);
    }
    if(player2==true&&score2>=45)  {
      noLoop();
      text("PLAYER TWO WINS! Press r",200,200);
    }
    if(player2==true&&lives<=0)  {
      noLoop();
      text("PLAYER TWO WINS! Press r",200,200);
    }
    if(player2==true&&lives2<=0)  {
      noLoop();
      text("PLAYER ONE WINS! Press r",200,400);
    }
}
 void keyPressed()
{
    if(key=='p'&&load==false&&help==false&&player2==false)  {
    pause=true;
    player2=false;
    square=false;
  }
  
  if(key=='p'&&load==false&&help==false&&player2==true)  {
    pause2=true;
    player2=false;
    square=false;
  }
  
  if(key=='r')  {
    loop();
    lives=3;
    score=0;
    lives2=3;
    score2=0;
    speed=4;
    rectX=random(30,570);
    rectY=random(30,559);
    ballB=ballB;
    ballA=ballA;
    ballA=random(0,300);
    ballB=random(0,300);
  }
  
  if(player2==true&&key=='d')  {
    a=a+15;
    loop();
  }
  if(player2==true&&key=='a')  {
    a=a-15;
    loop();
  }
}
void mouseReleased()
{
  if(load==true&&mouseX>=playX&&mouseX<=playX+200&&mouseY>=playY&&mouseY<=playY+80)  {
  modes=true;
  player2=false;
  player1=false;
  load=false;
  cursor();
  loop();
  }
  if(load==true&&mouseX>=helpX&&mouseX<=helpX+200&&mouseY>=helpY&&mouseY<=helpY+80)  {
   help=true;
   player2=false;
   loop();
  }
  
  if(help==true&&mouseX>=backX&&mouseX<=backX+50&&mouseY>=backY&&mouseY<=backY+20)  {
    help=false;
    player2=false;
    loop();
  }
  
  if(pause==true&&mouseX>=resumeX&&mouseX<=resumeX+200&&mouseY>=resumeY&&mouseY<=resumeY+50)  {
    pause=false;
    load=false;
    help=false;
    player2=false;
    square=true;
    loop();
}

if(pause2==true&&mouseX>=resume2X&&mouseX<=resume2X+200&&mouseY>=resume2Y&&mouseY<=resume2Y+50)  {
    pause2=false;
    load=false;
    help=false;
    player2=true;
    square=false;
    loop();
}

  if(pause==true&&mouseX>=instructionsX&&mouseX<=instructionsX+200&&mouseY>=instructionsY&&mouseY<=instructionsY+50)  {
    instructions=true;
    player2=false;
    loop();
}
 if(pause2==true&&mouseX>=instructionsX&&mouseX<=instructionsX+200&&mouseY>=instructionsY&&mouseY<=instructionsY+50)  {
    instructions=true;
    player2=false;
    loop();
}
  if(instructions==true&&mouseX>=back2X&&mouseX<=back2X+50&&mouseY>=back2Y&&mouseY<=back2Y+20)  {
    instructions=false;
    player2=false;
    loop();
  }
  if(pause==true&&mouseX>=menuX&&mouseX<=menuX+200&&mouseY>=menuY&&mouseY<=menuY+50)  {
    pause=false;
    load=true;
    help=false;
    player2=false;
    loop();
  }
  if(pause2==true&&mouseX>=menuX&&mouseX<=menuX+200&&mouseY>=menuY&&mouseY<=menuY+50)  {
    pause2=false;
    load=true;
    help=false;
    player2=false;
    loop();
  }
  
  if(modes==true&&mouseX>=player1X&&mouseX<=player1X+200&&mouseY>=player1Y&&mouseY<=player1Y+50)  {
        load=false;
        modes=false;
        square=true;
    lives=3;
    score=0;
    ballX=random(0,300);
    ballY=random(0,300);
    rectX=random(30,570);
    rectY=random(30,559);
    player2=false;
    loop();
  }
  if(modes==true&&mouseX>=player2X&&mouseX<=player2X+200&&mouseY>=player2Y&&mouseY<=player2Y+50)  {
    player2=true;
    modes=false;
    load=false;
    help=false;
    square=false;
    instructions=false;
    player1=false;
    pause=false;
    lives=3;
    score=0;
    lives2=3;
    score2=0;
  }
}

