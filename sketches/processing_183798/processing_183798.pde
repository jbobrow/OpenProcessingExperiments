
import ddf.minim.*;

float fade = 0, dir = .5, dirSpeed = .5, x = 0, y = 0; 
float playerX, playerY, pXOffset, vSpeed = 1.5;
float hSpeed = 7, jumpHeight = 50, playerDir = 1.0;
float attackDelay = 250, currTime, lastTime;

int playerSize = 30, bottomY, maxVSpd = 3, formChoice = 0, c = 0;
int scene = 0, story = -1;

PImage monster1, monster2, monster1_f2, monster1_f3, monster1_final; 
PImage girl, girl_cape, girl_cape_fly, girl_img;
PImage girl_attack, sceneFam, scenePlay, sceneBadDad, sceneBroken;
PImage sceneTrash1, sceneTrash2;
PImage girlBed, title;

boolean attacking = false, dreaming = false, caught = false, dead = false;
boolean memory = false;

TallMonster tMon;
CentiMonster cMon;

Minim minim;
AudioPlayer openningSong, dreamSong;

void setup()
{
  size(1000, 600); 
  
  //construct the minim objects
   minim = new Minim(this);
   openningSong = minim.loadFile("Sleep Party People-Not Human.mp3");
   dreamSong = minim.loadFile("Aesop Rock-Forest Crunk.mp3");

  //for memory
  sceneFam = loadImage("fam1.png");
  scenePlay = loadImage("play.png");
  sceneBadDad = loadImage("dadbad.png");
  sceneBroken = loadImage("broken.png");
  sceneTrash1 = loadImage("herointrash.png");
  sceneTrash2 = loadImage("herotrashfetch.png");

  //for bedroom
  girlBed = loadImage("bedroom.png");
  title = loadImage("title.png");

  //for dream
  monster1 = loadImage("tallmonster.png");
  monster2 = loadImage("centiMonster.png");
  monster1_f2 = loadImage("tallmonster_form2.png");
  monster1_f3 = loadImage("tallmonster_form3.png");
  monster1_final = loadImage("tallmonster_formfinal.png");

  girl = loadImage("dreamgirl.png");
  girl_cape = girl_img = loadImage("dreamgirl.png");
  girl_cape_fly = loadImage("dreamgirl_jump.png");
  girl_attack = loadImage("dreamgirl_attack.png");

  tMon = new TallMonster();
  cMon = new CentiMonster();

  pXOffset = 0;

  bottomY = height - girl.height;

  lastTime = millis();
}

void draw()
{

  if (memory)
  {
    memory();
  }
  else if (!dreaming)
  {
    bedroom();
    
    if(!openningSong.isPlaying())
    {
       openningSong.rewind();
       openningSong.loop(); 
    }
  }
  else
  {
    dream();
  }
}

void keyPressed()
{
  if (memory)
  {
    memory = false;
  }
  else
  {
    if (key == CODED)
    {
      if (!caught)
      {
        if (keyCode == UP)
        {
          playerY -= vSpeed + 20;
        }
        else if (keyCode == LEFT)
        {
          playerX -= hSpeed;
          playerDir = 1.0;
        }
        else if (keyCode == RIGHT)
        {
          playerX += hSpeed;
          playerDir = -1.0;
        }
      }
    }
    else if (key == 's')
    {
      dreaming = true; 
      fade = 0;
      openningSong.pause();
      dreamSong.rewind();
      dreamSong.loop();
    }
    else if (key == 't')
    {
      memory = true; 
      fade = 255;
      scene = 0;
      story = -story;
    }
    else if (key == 'd' && !dreaming)
    {
      exit();
    }
    else if (key == ' ')
    {
      currTime = millis();
      if (currTime - lastTime > attackDelay)
      {
        attacking = true;
        lastTime = currTime;
      }
    }
  }
}


//______________________________________________________


/////////////////////////////////////////////////
///MEMORY SCENE
/////////////////////////////////////////
void memory()
{
  //fade = 255;
  dirSpeed = 1;

  background(fade);

  PImage img = sceneFam;

  if (scene == 0)
  {
    img = sceneFam;
  }
  else if (scene == 1)
  {
    img = scenePlay;
  }
  else if (scene == 2)
  {
    if (story == 1)
    {
      img = sceneBadDad;
    }
    else if (story == -1)
    {
      img = sceneTrash1;
    }
  }
  else if (scene == 3)
  {
    if (story == 1)
    {
      img = sceneBroken;
    }
    else if (story == -1)
    {
      img = sceneTrash2;
    }
  }

  image(img, 
  width/2 - img.width/2, height - img.height);

  if (fade < 1)
  {
    dir = dirSpeed; 

    //change scene when dark
    if (scene > 2)
    {
      memory = false; 
      scene = 0;
    }
    else
    {
      scene++;
    }
  }
  else if (fade > 255)
  {
    dir = -dirSpeed;
  }

  fade += dir;
}



//////////////////
//BEDROOM SCENE
/////////////////
void bedroom()
{
  background(fade);

  if (fade > 255)
  {
    fade = 255;
  }
  else if (fade < 255)
  {
    fade++;
  }

  tMon = new TallMonster();

  //player starts at bottom right corner
  playerX = width - girl_img.width;
  playerY = bottomY;


  textSize(20);
  fill(0, 0, 200);
  text("Think about today: t", 20, 330);

  fill(255, 0, 0);
  text("Go to sleep: s", 20, 360);
  textSize(15);
  fill(75);
  text("Controls:", 30, 380);
  text("To move: arrow keys", 30, 400);
  text("To fly: up arrow", 30, 420);
  text("To attack: spacebar", 30, 440);

  textSize(20);
  fill(100);
  text("Carry on with your day: d", 20, 470);

  image(title, 20, 20);
  image(girlBed, width-girlBed.width-20, height-girlBed.height-20);
}



//////////////////
//DREAM GAMEPLAY
//////////////////
int maxFade = 50;

void dream ()
{
  dirSpeed = .5;

  background(fade);
  /*

   if (playerY < bottomY && vSpeed < maxVSpd)
   {
   vSpeed--;
   }
   
   if (playerY == bottomY)
   {
   vSpeed = 0;
   }*/


  currTime = millis();
  if (currTime - lastTime > attackDelay)
  {
    attacking = false;
    pXOffset = 0;
  }

  if (!attacking)
  {
    if (playerY >= bottomY)
    {
      playerY = bottomY;
      girl_img = girl_cape;
    }

    else if (playerY < 0)
    {
      playerY = 0;
    }

    else if (playerY < bottomY)
    {
      playerY += vSpeed;
      girl_img = girl_cape_fly;
    }
  }
  else
  {
    girl_img = girl_attack;
    pXOffset = girl_attack.width/2;
  }

  //fill(c);
  //ellipse(playerX, playerY, playerSize, playerSize);

  if (!dead)
  {
    pushMatrix();
    scale(playerDir, 1.0);
    image(girl_img, playerX * playerDir - pXOffset, playerY);
    popMatrix();
  }

  tMon.display();
  tMon.hit();

  cMon.display();

  if (fade < 1)
  {
    dir = dirSpeed; 

    if (!dead)
    {
      tMon.update();
      cMon.update();
    }
    else
    {
      //start game over
      dreaming = false;
      dead = false; 
      caught = false;
      maxFade = 50;
      dreamSong.pause();
    }
  }
  else if (fade > maxFade)
  {
    dir = -dirSpeed;
  }

  fade += dir;
}


//____________________________________________________________

////////////////
//TALL MONSTER////
//////////

class TallMonster
{
  float tallMonX, tallMonY = 100;
  PImage img;
  boolean dangerous = false;

  TallMonster()
  {
    tallMonX = random(width-monster1.width/2);
    img = monster1;
    formChoice = 0;
  }

  void display()
  {
    if (formChoice == 0)
    {
      dangerous = false;
      tallMonY = 100;
      img = monster1;
    }
    else if (formChoice == 1)
    {
      dangerous = true;
      img = monster1_f2;
    }
    else if (formChoice == -1)
    {
      dangerous = true;
      img = monster1_f3;
    }
    else if (formChoice == -2)
    {
      img = monster1_final;
      tallMonX = width/2-img.width/2;
    }

    tallMonY = height-img.height;

    image(img, tallMonX, tallMonY);
  }

  void update()
  {

    if (caught)
    {
      formChoice = -2; 
      dead = true;
      tallMonX = width/2 - monster1_f2.width/2;
      //dirSpeed = .1;
      maxFade = 150;
    }
    else
    {
      if (playerY < height/2)
      {
        //possibility of monster changing form
        formChoice = (int)random(2);
      }
      else
      {
        formChoice = (int)random(-2, 0);
      }

      tallMonX = random(width-img.width/2);
    }
  }

  void hit()
  {
    float distance = dist(playerX, playerY, tallMonX, tallMonY);

    if ((height - playerY) < (height - tallMonY)
      && playerX > tallMonX
      && playerX < tallMonX + img.width)
    {
      if (attacking && !dangerous)
      {
        //fill(255,0,0);
        fade = 75;
      }
      else if (dangerous)
      {
        caught = true;
      }
    }
  }
}



///////////////////
/////CENTIMONSTER
///////////////////

class CentiMonster
{
  float centiMonX = 0, centiMonY = 100;
  PImage img;

  CentiMonster()
  {
    img = monster2;
  } 

  void display()
  {
    image(monster2, centiMonX, centiMonY);
  }

  void update()
  {
    centiMonX = random(width-monster2.width/2);
  }
}


////////////////////////////////
/////////////CLEANUP
///////////////////////////
void stop()
{
  // the AudioPlayer you got from Minim.loadFile()
  openningSong.close();
  minim.stop();
  
  // this calls the stop method that
  // you are overriding by defining your own
  // it must be called so that your application
  // can do all the cleanup it would normally do
  super.stop();
}


