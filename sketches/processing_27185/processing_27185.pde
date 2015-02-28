
/* Beta game project 1/27/11
 */
 PFont ls;
import java.util.Iterator;
boolean downPressed, spacepressed, mouseLeftClick, mouseReleased,goright,goleft, clawdown,downReleased,enterPressed,correctanswer,correctanswer2;
boolean question1 = true, question2, question3;
PImage fish4, fish5,fish1,fish2;
PImage wallpaper,titlescreen,winscreen,losescreen, rock, rock2, rock3,diamond1, diamond2, diamond3, diamond4, diamond5, diamond6, diamond8,diamond9,diamond10,diamond11,diamond12,diamond13,gold1;
PFont font;
int screennumber,clawx,clawy;
int startTime;
boolean move = true;
boolean move1 = true;
boolean move2 = true;
boolean move3 = true;
boolean move4 = true;
boolean movesecond = true;
boolean movethird = true;
boolean movefourth = true;
boolean movefifth = true;
boolean popup;
boolean popuptwo;
int score;
int time;

void setup()
{
  size(503,600);
  frameRate(30);
  imageMode(CENTER);
  winscreen = loadImage ("goldwinner.gif");
  wallpaper = loadImage("Background.gif");
  losescreen = loadImage ("loser.gif");
  titlescreen = loadImage("titlescreen.gif");
  //ls = loadFont("LucidaSans-48.vlw");
  //textFont(ls);
  screennumber = 0;
  rock = loadImage("rock.gif");
  rock2 = loadImage ("rock2.gif");
  rock3 = loadImage ("rock3.gif");
  fish1 = loadImage ("fish1.gif");
  fish2 = loadImage ("fish2.gif");
  fish4 = loadImage ("fish4.gif");
  fish5 = loadImage ("fish5.gif");
  score = 0;
  diamond1 = loadImage ("diamond1.gif");
  diamond2 = loadImage ("diamond2.gif");
  diamond3 = loadImage ("diamond3.gif");
  diamond4 = loadImage ("diamond4.gif");
  diamond5 = loadImage ("diamond5.gif");
  diamond6 = loadImage ("diamond6.gif");
  diamond8 = loadImage ("diamond8.gif");
  diamond9 = loadImage ("diamond9.gif");
  diamond10 = loadImage ("diamond10.gif");
  diamond11 = loadImage ("diamond11.gif");
  diamond13 = loadImage ("diamond12.gif");
  diamond13 = loadImage ("diamond13.gif");
  gold1 = loadImage ("gold1.gif");
  font = loadFont("Arial-BoldMT-48.vlw");
  textFont(font, 48);
  screennumber = 0;
  clawx = 250;
  clawy = 350;
}

void draw()
{

  if (screennumber == 0)
  {
    title();
    //text("click to start", 10,80);
    if(mousePressed)
    {
      screennumber = 1;
      startTime = millis();
      println(startTime);
    }

    if (mouseLeftClick)
    {
      screennumber = 1;
    }
  }
  if (screennumber == 1)
  {
    goleft = true;
    screennumber = 2;
  }

  if (screennumber == 2)
  {
    background(wallpaper);
    //image(diamond1,150,450); // 8/25
    //image(diamond2,250,555); // 1/2  
    //image(diamond3,375,525); // 3/5  
    //image(diamond4,100,520); // 1/4 
    image(diamond5,800,800); //   
    image(diamond6,800,800); //     
    image(diamond8,800,800); //   
    image(diamond9,800,800); //  
    image(diamond10,800,800); //    
    image(diamond11,800,800); //   
    image(diamond13,800,800); // 
    //line(220,210,clawx,clawy);
    line(220,210,clawx,clawy);
    //text("What is 1/4 + 1/4?",50,100);
    int m = millis();
      int timeLimit = startTime+30000;
      int timeRemaining = timeLimit - m;
      int secondsRemaining = timeRemaining/1000;
      text(secondsRemaining, 390,40);
      if (secondsRemaining <= 0) losescreen();
    if(question1)
    {
      text("What is 1/4 + 1/4?",50,100);
    }
    distance();
    movee();
    secondquestion();
    claw();
    fill(0,0,255);
    text("Score: "+score, 50,50);
    fill(255);
  }
  screen3();

/*  if(screennumber == 3)
  {
    background(wallpaper);
    claw();
    movee();
    line(220,210,clawx,clawy);
    text("What is 3^2?",50,100);
    movesecond = true;
    secondquestion();
  }*/

  if(popup)
  {
    text("CORRECT!",width/3,height/2); //1/2
  }
  if(popuptwo)
  {
    text("CORRECT!",width/3,height/2);
  }
}

void claw()
{
  if(clawx < 25)
  {
    goright = true;
  }
  if(goright)
  {
    goleft = false;
    clawx += 2;
  }
  if (clawx > 475)
  {
    goleft = true;
  }
  if(goleft)
  {
    goright = false;
    clawx -= 2;
  }
  if(downPressed)
  {
    goleft = false;
    goright = false;
    clawdown = true;
  }
  if(clawdown)
  {
    clawy+=2;
  }
  if (clawy == 600)
  {
    clawdown = false;
    clawy = 300;
    goleft = true;
    downPressed = false;
  }
}


void keyPressed()
{
  if (keyCode == DOWN) downPressed = true;
  if (keyCode == ENTER) enterPressed = true;
  if (keyCode == KeyEvent.VK_SPACE) spacepressed = true;
}

void mousePressed()
{
  if (mousePressed) mouseLeftClick = true;
}

void title()
{
  background(titlescreen);
}

void distance()
{
  if(dist(clawx,clawy,250,555)<20)
  {
    movee();
    correctanswer = true;
    move1 = false;
    move2 = false;
    move3 = false;
    clawdown = false;
    clawy = 300;
    goleft = true;
    downPressed = false;
  }
  if(correctanswer)
  {
    popup = true;
    time++;
    move4 = false;
  }
  if(time>=60)
  {
    popup = false;
    question1 = false;
    question2 = true;
    correctanswer = false;
    movesecond = true;
    time = 0;
    screennumber = 3;
    score = score +5;
  }
  //if(dist(clawx,clawy,250,555)
  /* if(dist(clawx,clawy,375,525)<20)
   {
   clawdown = false;
   clawy = 300;
   goleft = true;
   downPressed = false;
   }*/
  if(dist(clawx,clawy,100,520)<20)
  {
    move2 = false;
    clawdown = false;
    clawy = 300;
    goleft = true;
    downPressed = false;
  }
  if(dist(clawx,clawy,150,450)<20)
  {
    move3 = false;
    clawdown = false;
    clawy = 300;
    goleft = true;
    downPressed = false;
  }
}

void movee()
{
  if(move4)
  {
    image(diamond2,250,555);
  }
  if(!move4)
  {
    image(diamond2,800,800);
  }
  if(move1)
  {
    image(diamond3,375,525); //3/5
  }
  if(!move1)
  {
    image(diamond3,800,800);
  }
  if(move2)
  {
    image(diamond4,100,520); //1/4
  }
  if(!move2)
  {
    image(diamond4,800,800);
  }
  if(move3)
  {
    image(diamond1,150,450); // 8/25
  }
  if(!move3)
  {
    image(diamond1,800,800);
  }
}

void secondquestion()
{
  if(dist(clawx,clawy,225,555)<20)
  {
    correctanswer = true;
  }
}

void losescreen()
{
    screennumber = 100;
  if(screennumber == 100)
  {
    background(losescreen);
    move1 = false;
    move2 = false;
    move3 = false;
    move4 = false;
    question1 = false;
  }
}



