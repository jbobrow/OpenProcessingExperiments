
//Jared Leonhart

//calls the image class and sets up variables for those images
PImage startscreen;
PImage startscreen2;
PImage snowright;
PImage snowrightm1;
PImage snowrightm2;
PImage snowleft;
PImage snowleftm1;
PImage snowleftm2;
PImage snowup;
PImage snowupm1;
PImage snowupm2;
PImage snowdown;
PImage snowdownm1;
PImage snowdownm2;
PImage snowattackr;
PImage snowattackl;
PImage snowvicm1;
PImage snowvicm2;
PImage snowlose;
PImage bliz;
PImage punchr;
PImage punchl;
PImage bg;
PImage snow;
PImage serahcrys;
PImage serahfree;
PImage blizthis;
PImage punchthis;

//sets up the font
PFont manaspc;

//sets some parameter variables
int startup = 0; //for the start screen
int snowlocX = 250; 
int snowlocY = 550;
int snowstate = 6;
int blizlocX = snowlocX + 102;
int blizlocY = snowlocY + 15;
int punchlocX = snowlocX + 102;
int punchlocY = snowlocY;
int blizstate = 0;
int punchstate = 0;
int punchtimer = 0;
int blizmonsterState = 1;
int blizmonster2State = 1;
int punchmonsterState = 1;
int moncount = 0;
int playlimiter = 0;
float blizMonX = random(1300, 1400);
float blizMonY = random(475, 666);
float blizMonX2 = random(1300, 1400);
float blizMonY2 = random(475, 666);
float punchMonX = random(1300, 1400);
float punchMonY = random(413, 666);
float blizmonMove = 2;
float blizmonMove2 = 2;
float punchmonMove = 2;







//setsup the window and loads images
void setup()
{
  size(1440, 810, JAVA2D);
  startscreen = loadImage("startscreen.png"); 
  startscreen2 = loadImage("startscreen2.png");
  bg = loadImage("bg.png");
  snowright = loadImage("snowright.png");
  snowrightm1 = loadImage("snowrightm1.png");
  snowrightm2 = loadImage("snowrightm2.png");
  snowleft = loadImage("snowleft.png");
  snowleftm1 = loadImage("snowleftm1.png");
  snowleftm2 = loadImage("snowleftm2.png");
  snowup = loadImage("snowup.png");
  snowupm1 = loadImage("snowupm1.png");
  snowupm2 = loadImage("snowupm2.png");
  snowdown = loadImage("snowdown.png");
  snowdownm1 = loadImage("snowdownm1.png");
  snowdownm2 = loadImage("snowdownm2.png");
  snowattackr = loadImage("snowattackr.png");
  snowattackl = loadImage("snowattackl.png");
  snowlose = loadImage("snowlose.png");
  bliz = loadImage("bliz.png");
  punchr = loadImage("punchr.png");
  punchl = loadImage("punchl.png");
  serahcrys = loadImage("serahcrys.png");
  blizthis = loadImage("blizthis.png");
  punchthis = loadImage("punchthis.png");
  background(bg);
  manaspc = loadFont("manaspc.vlw");



  //loads audio
  minim = new Minim(this);     
  kick = minim.loadSample("Bliz.mp3", 256);
  kick2 = minim.loadSample("Punch.mp3", 256);
  kick3 = minim.loadSample("bgm.mp3", 1024);
  kick4 = minim.loadSample("startbgm.mp3", 1024);
  kick5 = minim.loadSample("victory.mp3", 1024);
  kick6 = minim.loadSample("lose.mp3", 1024);
  kick7 = minim.loadSample("start1.mp3", 256);
  kick8 = minim.loadSample("start2.mp3", 256);
  kick4.trigger();
}

void draw()
{
  if (startup == 0)//for start screen
  {
    background(startscreen);//start screen
  }


  if (startup == 1)//for controls screen
  {
    background(startscreen2);//background
  }

  if (moncount == 15)//victory conditions
  {
    startup = 3;
  }


  //draws the background and the character Snow
  if (startup == 2)
  {
    kick4.close();
    background(bg);
    snow = loadImage("snowright.png");


    //reads what keys are pressed and loads the appropriate image of Snow's direction based on the if statement
    if (snowstate == 6)
    {
      snow = snowright;
    }
    else if (snowstate == 66)
    {
      if (frameCount%20 < 10)
      {
        snow = snowrightm1;
      }
      else if (frameCount%20 >= 10)
      {
        snow = snowrightm2;
      }
    }
    else if (snowstate == 4)
    {
      snow = snowleft;
    }
    else if (snowstate == 44)
    {
      if (frameCount%20 < 10)
      {
        snow = snowleftm1;
      }
      else if (frameCount%20 >= 10)
      {
        snow = snowleftm2;
      }
    }
    else if (snowstate == 2)
    {
      snow = snowdown;
    }
    else if (snowstate == 22)
    {
      if (frameCount%20 < 10)
      {
        snow = snowdownm1;
      }
      else if (frameCount%20 >= 10)
      {
        snow = snowdownm2;
      }
    }
    else if (snowstate == 8)
    {
      snow = snowup;
    }
    else if (snowstate == 88)
    {
      if (frameCount%20 < 10)
      {
        snow = snowupm1;
      }
      else if (frameCount%20 >= 10)
      {
        snow = snowupm2;
      }
    }
    else if (snowstate == 3)
    {
      snow = snowattackr;
    }
    else if (snowstate == 1)
    {
      snow = snowattackl;
    }

    //loads the initial image for Snow and Serah
    image(snow, snowlocX, snowlocY);
    image(serahcrys, 5, 550);

    //reads the user input and updates the snowstates for the directions
    {
      if (keyPressed)
      {
        if (snowlocX > 150)
        {
          if (keyCode == LEFT)
          {
            snowlocX -=4;
            snowstate = 44;
          }
        }
        if (snowlocX < 1356)
        {
          if (keyCode == RIGHT)
          {
            snowlocX +=4;
            snowstate = 66;
          }
        }
        if (snowlocY < 666)
        {
          if (keyCode == DOWN)
          {
            snowlocY +=4;
            snowstate = 22;
          }
        }
        if (snowlocY > 413)
        {
          if (keyCode == UP)
          {
            snowlocY -=4;
            snowstate = 88;
          }
        }

        //reads user input for attacks and returns the image
        if (snowstate == 8 || snowstate == 88 || snowstate == 2 || snowstate == 22 | snowstate == 6 || snowstate == 66 || snowstate == 3)
        {
          if (key == 'z')
          {
            snowstate = 3;
            blizstate = 6;
            blizlocX = snowlocX + 102;
            blizlocY = snowlocY + 40;
          }
          else if (key == 'x')
          {
            snowstate = 3;
            punchstate = 6;
            punchlocX = snowlocX + 102;
            punchlocY = snowlocY;
          }
          else if (key == '0')
          {
            startup = 3;
          }
        }
        if (snowstate == 4 || snowstate == 44 || snowstate == 1)
        {
          if (key == 'z')
          {
            snowstate = 1;
            blizstate = 4;
            blizlocX = snowlocX - 40;
            blizlocY = snowlocY + 40;
          }
          else if (key == 'x')
          {
            snowstate = 1;
            punchstate = 4;
            punchlocX = snowlocX - 69;
            punchlocY = snowlocY;
          }
        }
      }
    }

    //loads the punch and bliz images based on the user input for attacks
    if (blizstate == 6)
    {
      //blizlocY = snowlocY;
      image(bliz, blizlocX, blizlocY);
      blizlocX +=16;
    }
    if (blizstate == 4)
    {
      image(bliz, blizlocX, blizlocY);
      blizlocX -=12;
    }
    if (blizlocX > 1400 || blizlocX < 0)
    {
      blizstate = 0;
    }

    if (punchstate == 6)
    {
      image(punchr, punchlocX, punchlocY);
      punchtimer++;
    }
    if (punchstate == 4)
    {
      image(punchl, punchlocX, punchlocY);
      punchtimer++;
    }
    if (punchtimer == 10)
    {
      punchstate = 0;
      punchtimer = 0;
    }

    //loads the blizthis images into the window
    if (blizmonsterState == 1)
    {
      image(blizthis, blizMonX, blizMonY);
      blizMonX = blizMonX - blizmonMove;
    }
    if (blizmonster2State == 1)
    {
      image(blizthis, blizMonX2, blizMonY2);
      blizMonX2 = blizMonX2 - blizmonMove2;
    }
    
    //checks inteaction between bliz attack and the blizthis image, updates variables
    if (blizlocX >= blizMonX - 30 && blizlocX <= blizMonX + 30 && blizlocY >= blizMonY - 30 && blizlocY <= blizMonY + 30)
    {
      blizmonsterState = 0;
      blizstate = 0;
      moncount+=1;
    }
    if (blizlocX >= blizMonX2 - 30 && blizlocX <= blizMonX2 + 30 && blizlocY >= blizMonY2 - 30 && blizlocY <= blizMonY2 + 30)
    {
      blizmonster2State = 0;
      blizstate = 0;
      moncount += 1;
    }
    
    //deletes the image and updates the variables, also respawns the image
    if (blizmonsterState == 0)
    {
      blizMonX = random(1300, 1400);
      blizMonY = random(475, 666);
      blizmonMove = blizmonMove * 1.15;
      blizmonsterState = 1;
    }
    if (blizmonster2State == 0)
    {
      blizMonX2 = random(1300, 1400);
      blizMonY2 = random(475, 666);
      blizmonMove2 = blizmonMove2 * 1.15;
      blizmonster2State = 1;
     
    }
    
    //same thing as blizthis
    if (punchmonsterState == 1);
    {
      image(punchthis, punchMonX, punchMonY);
      punchMonX = punchMonX - punchmonMove;
    }
    if (punchlocX >= punchMonX - 30 && punchlocX <= punchMonX + 140 && punchlocY >= punchMonY - 70 && punchlocY <= punchMonY + 30)
    {
      punchmonsterState = 0;
      punchstate = 0;
      moncount += 1;
    }
    if (punchmonsterState == 0)
    {
      punchMonX = random(1300, 1400);
      punchMonY = random(450, 666);
      punchmonMove = punchmonMove * 1.15;
      punchmonsterState = 1;
    }
    
    //checks for losing conditions, if a monster hits snow and if the image hits a certain X value
    if (punchMonX <= snowlocX + 50 && punchMonX >= snowlocX - 50 && punchMonY >= snowlocY - 90 && punchMonY <= snowlocY + 70)
    {
      startup = 4;
    }
    if (blizMonX <= snowlocX + 80 && blizMonX >= snowlocX - 80 && blizMonY >= snowlocY - 50 && blizMonY <= snowlocY + 100)
    {
      startup = 4;
    }
    if (blizMonX2 <= snowlocX + 80 && blizMonX2 >= snowlocX - 80 && blizMonY2 >= snowlocY - 50 && blizMonY2 <= snowlocY + 100)
    {
      startup = 4;
    }
    if (blizMonX <= 150 || blizMonX2 <= 150 || punchMonX <= 150)
    {
      startup = 4;
    }
  }
  
  //victory screen, loads images and enter input to start again
  if (startup == 3)
  {
    background(bg);
    kick3.close();
    snow = loadImage("snowattackr.png");
    snowvicm1 = loadImage("snowvicm1.png");
    snowvicm2 = loadImage("snowvicm2.png");
    serahfree = loadImage("serahfree.png");
    snowstate = 55;

    if (snowstate == 55)
    {
      if (frameCount%30 < 15)
      {
        snow = snowvicm1;
      }
      else if (frameCount%30 >= 15)
      {
        snow = snowvicm2;
      }
    }
    while (playlimiter == 0)
    {
      kick5.trigger();
      playlimiter = 1;
    }
    image(snow, snowlocX, snowlocY);
    image(serahfree, 5, 550);
    textFont(manaspc);
    textAlign(CENTER);
    textSize(144);
    fill(0);
    text("VICTORY!", 720, 300);
    textSize(72);
    text("The hero saved the day!", 720, 400);
    textSize(54);
    text("Press Enter to play again", 720, 500);
  }
  
  //losing screen, loads image and option to press enter to play again
  if (startup == 4)
  {
    kick3.close();
    while (playlimiter == 0)
    {
      kick6.trigger();
      playlimiter = 1;
    }
    background(bg);
    image(blizthis, blizMonX, blizMonY);
    image(blizthis, blizMonX2, blizMonY2);
    image(punchthis, punchMonX, punchMonY);
    image(snowlose, snowlocX, snowlocY+75);
    textFont(manaspc);
    textAlign(CENTER);
    textSize(128);
    fill(0);
    text("SERAH WAS SLAIN!", 720, 300);
    textSize(72);
    text("Heroes never give up!", 720, 400);
    textSize(54);
    text("Press Enter to play again", 720, 500);
  }
}

//keystrokes are read and does the appropriate actions
void keyPressed()
{
  if (startup == 0)//for main menu
  {
    if (keyCode == ENTER)//displays control screen
    {
      startup = 1;
      kick7.trigger();
    }
  }

  else if (startup == 1)//for controls screen
  {
    if (keyCode == ENTER)//starts the game
    {
      startup = 2;
      kick4.close();
      kick8.trigger();
      kick3.trigger();
    }
  }

  else if (startup == 3 || startup == 4)
  {
    if (keyCode == ENTER)
    {
      kick5.close();
      kick6.close();
      kick3 = minim.loadSample("bgm.mp3", 1024);
      kick5 = minim.loadSample("victory.mp3", 1024);
      kick6 = minim.loadSample("lose.mp3", 1024);
      kick3.trigger();
      snowlocX = 250;
      snowlocY = 550;
      snowstate = 6;
      moncount = 0;
      blizmonMove = 2;
      blizmonMove2 = 2;
      punchmonMove = 2;
      startup = 2;
      punchmonsterState = 0;
      blizmonsterState = 0;
      blizmonster2State = 0;
      playlimiter = 0;
      blizstate = 0;
      punchstate = 0;
    }
  }

  //Trigger AUDIO
  if (startup == 2)
  {
    if (key == 'z')
    {
      kick.trigger();
    }

    if (key == 'x')
    {
      kick2.trigger();
    }
  }
}

void keyReleased()
{
  if (keyCode==DOWN)
  {
    snowstate = 2;
  }
  else if (keyCode==LEFT)
  {
    snowstate = 4;
  }
  else if (keyCode==RIGHT)
  {
    snowstate = 6;
  }
  else if (keyCode==UP)
  {
    snowstate = 8;
  }
}


