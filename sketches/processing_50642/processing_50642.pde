
import java.io.*;  //import io library
import ddf.minim.*; //import sound library
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
String dir_nuke = "North";
int posY_nuke = height;
int y_nuke = 620 ;
int test = 0;
int number_of_nukes = 10;
boolean game_start =false;         //variable for game start

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
PFont font;
File f = new File("C:\\Users\\INAAM\\Documents\\Processing\\Space_Maveric\\data\\save_file.ser");
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
AudioPlayer[] player = new AudioPlayer[3] ; // array of sounds [0] for background [1] for shooting [2] for bomb
Minim minim;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
PImage motherShip;
PImage aliens;
PImage boss;
PImage boss2;
PImage boss3;
PImage boss4;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
PImage instructions;
PImage wonGame;
PImage lostGame;
PImage nuke;
PImage nuke_blast;
PImage prize;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
PImage boss_destroy;
PImage boss_bomb;
PImage boss2_destroy;
PImage boss3_destroy;
PImage boss4_destroy;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
PImage backgroundd;
PImage backgroundd_boss1_3;
PImage backgroundd_boss2_4;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
int diff_level;
int x = 200; // start pos of boss
int y = 100; // start pos of boss
int posX, posY; // change in pos of boss
String dir; // direction of boss
boolean wonBossBattle1 = false;
boolean wonBossBattle2 = false;
boolean wonBossBattle3 = false;
boolean wonBossBattle4 = false;
boolean shoot = false;
int lives = 5;
int sphereDiameter = 10;
int score = 0;
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
int randx()
{
  return int(random(30, width-30));
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
int[] aliensXCoords = { 
  randx(), randx(), randx(), randx(), randx(), randx(), randx(), randx(), randx(), randx(), randx()
  };
int[] aliensYCoords = { 
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

int[] bombXCoords = { 
  randx(), randx(), randx(), randx(), randx(), randx(), randx(), randx(), randx(), randx(), randx(), randx()
  };
int[] bombYCoords = { 
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void setup()
{ 
  
  minim = new Minim(this);
  player[0] = minim.loadFile("bg_music.mp3", 2048); //main background file
  player[0].play(); 
  size(600, 620);
  font = loadFont("BodoniMT-Bold-48.vlw");
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  motherShip = loadImage("nave.jpg");
  motherShip.resize(0, 50);
  aliens = loadImage("alien.png");
  aliens.resize(0, 30);
  nuke = loadImage("nuke.png");
  nuke.resize(0, 45);
  nuke_blast = loadImage("nuke_blast.png");
  prize = loadImage("prize.png");
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  boss_bomb = loadImage("boss_bomb.png");
  boss_bomb.resize(0, 50);
  boss = loadImage("boss.png");
  boss.resize(0, 150);
  boss2 = loadImage("boss2.png");
  boss2.resize(0, 150);
  boss3 = loadImage("boss3.png");
  boss3.resize(0, 150);
  boss4 = loadImage("boss4.png");
  boss4.resize(0, 150);
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  boss_destroy = loadImage("boss_des.png");
  boss_destroy.resize(0, 150);
  boss2_destroy = loadImage("boss2_des.png");
  boss2_destroy.resize(0, 150);
  boss3_destroy = loadImage("boss3_des.png");
  boss3_destroy.resize(0, 150);
  boss4_destroy = loadImage("boss4_des.png");
  boss4_destroy.resize(0, 150);
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  wonGame = loadImage("game_win.png");
  lostGame = loadImage("game_end.png");
  instructions = loadImage("start_screen.png");
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  backgroundd = loadImage("bg.jpg");
  backgroundd_boss1_3 = loadImage("bg_boss1.jpg");
  backgroundd_boss2_4 = loadImage("bg_boss2.png");
  dir = "East";
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void draw()
{
  if (game_start==false) {            //show instructions
    fill(255);
    image(instructions, 0, 0);
    rect(260, 550, 80, 25);           //show button
    fill(0);
    textSize(20);
    text("START", 270, 570);
  }
  else {
    textSize(15);
    image(backgroundd, 0, 0);
    strokeWeight(2);
    stroke(color(0, 255, 0));
    image(motherShip, mouseX-17, height-55);
    frameRate(60);
    if (dir_nuke == "North" && test == 1 && number_of_nukes > 0)  //controles nukes //!!!do not tamper!!!
    {
      posY_nuke = -2;
      image(nuke, mouseX, y_nuke);
      y_nuke+=posY_nuke;
    }
    diplay_stats();
    if (y_nuke < height/4 )   //if bomb crosses more than 75% of the screen then
    {
      test = 0;
      score+=diff_level;
      image(nuke_blast, 0, 0);
      frameRate(20);
      player[2] = minim.loadFile("explosion.mp3", 2048); //nuke blast sound
      player[2].play(); 
      y_nuke = 640;
      for (int a = 0 ; a < diff_level ; a++)
      {
        aliensXCoords[a] = randx();
        aliensYCoords[a] = 0;
      }
    }

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (score < 50) // beiginners level
    {
      diff_level = 5;
      if (shoot==true)
      {
        alienKiller(mouseX);
        shoot = false;
      }
      alienDropper();
      gameEnder();
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (score >= 50 && score < 70) //boss battle number 1
    {

      image(backgroundd_boss1_3, 0, 0);
      diplay_stats();
      image(motherShip, mouseX-17, height-55);
      if ( dir == "East") 
      {
        posX = 2;
        if (x >= width/2)
        {
          dir = "South";
          posX = -2;
          posY = 2;
        }
      }
      if ( dir == "South")
      {
        if (y >= height/2)
        {
          dir = "West";
          posX = -2;
          posY = -2;
        }
      }
      if (dir == "West")
      {
        if (x <= 50)
        {
          dir = "North";
          posX = 2;
          posY = -2;
        }
      }
      if (dir == "North")
      {
        if (y <= 40)
        {
          dir = "East";
          posX = 2;
          posY = 2;
        }
      }
      x+=posX;
      y+=posY;
      image(boss, x, y);

      if (shoot==true)
      {
        bomb_killer(mouseX);
        bossKiller(mouseX, x, y);
        shoot = false;
      }
      bomb_dropper();
      if (score >= 67 &&score < 70) //show damages boss
      {
        image(boss_destroy, x, y);
        wonBossBattle1 = true;
      }
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (score >= 70 && score <= 120 && wonBossBattle1 == true) // intermediate level
    {
      diff_level = 7;
      if (shoot==true)
      {
        alienKiller(mouseX);
        shoot = false;
      }
      alienDropper();
      gameEnder();
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (score > 120 && score < 140) //boss battle number 2
    {
      image(backgroundd_boss2_4, 0, 0);
      diplay_stats();
      image(motherShip, mouseX-17, height-55);
      if ( dir == "East") 
      {
        posX = 4;
        if (x >= width/2)
        {
          dir = "South";
          posX = -4;
          posY = 4;
        }
      }
      if ( dir == "South")
      {
        if (y >= height/2)
        {
          dir = "West";
          posX = -4;
          posY = -4;
        }
      }
      if (dir == "West")
      {
        if (x <= 50)
        {
          dir = "North";
          posX = 4;
          posY = -4;
        }
      }
      if (dir == "North")
      {
        if (y <= 40)
        {
          dir = "East";
          posX = 4;
          posY = 4;
        }
      }
      x+=posX;
      y+=posY;
      image(boss2, x, y);
      if (shoot==true)
      {
        bomb_killer(mouseX);
        bossKiller(mouseX, x, y);
        shoot = false;
      }
      bomb_dropper();
      if (score >= 137 &&score < 140) //show damages boss2
      {
        image(boss2_destroy, x, y);
        wonBossBattle2 = true;
      }
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (score >= 140 && score <=190 && wonBossBattle2 == true) // hard level
    {
      diff_level = 9;
      if (shoot==true)
      {
        alienKiller(mouseX);
        shoot = false;
      }
      alienDropper();
      gameEnder();
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (score > 190 && score < 210) //boss battle number 3
    {
      image(backgroundd_boss1_3, 0, 0);
      diplay_stats();
      image(motherShip, mouseX-17, height-55);
      if ( dir == "East") 
      {
        posX = 5;
        if (x >= width/2)
        {
          dir = "South";
          posX = -5;
          posY = 5;
        }
      }
      if ( dir == "South")
      {
        if (y >= height/2)
        {
          dir = "West";
          posX = -5;
          posY = -5;
        }
      }
      if (dir == "West")
      {
        if (x <= 50)
        {
          dir = "North";
          posX = 5;
          posY = -5;
        }
      }
      if (dir == "North")
      {
        if (y <= 40)
        {
          dir = "East";
          posX = 5;
          posY = 5;
        }
      }
      x+=posX;
      y+=posY;
      image(boss3, x, y);
      if (shoot==true)
      {
        bomb_killer(mouseX);
        bossKiller(mouseX, x, y);
        shoot = false;
      }
      bomb_dropper();
      if (score >= 207 && score < 210) //show damages boss3
      {
        image(boss3_destroy, x, y);
        wonBossBattle3 = true;
      }
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (score >= 210 && score <= 260 && wonBossBattle3 == true) // extreme level
    {
      diff_level = 11;
      diplay_stats();
      if (shoot==true)
      {
        alienKiller(mouseX);
        shoot = false;
      }
      alienDropper();
      gameEnder();
    } 
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (score > 260 && score < 290) //boss battle number 4
    {
      image(backgroundd_boss2_4, 0, 0);
      diplay_stats();
      image(motherShip, mouseX-17, height-55);
      if ( dir == "East") 
      {
        posX = 7;
        if (x >= width/2)
        {
          dir = "South";
          posX = -7;
          posY = 7;
        }
      }
      if ( dir == "South")
      {
        if (y >= height/2)
        {
          dir = "West";
          posX = -7;
          posY = -7;
        }
      }
      if (dir == "West")
      {
        if (x <= 50)
        {
          dir = "North";
          posX = 7;
          posY = -7;
        }
      }
      if (dir == "North")
      {
        if (y <= 40)
        {
          dir = "East";
          posX = 7;
          posY = 7;
        }
      }
      x+=posX;
      y+=posY;
      image(boss4, x, y);
      if (shoot==true)
      {
        bomb_killer(mouseX);
        bossKiller(mouseX, x, y);
        shoot = false;
      }
      bomb_dropper();
      if (score >= 287 && score < 290) //show damages boss4
      {
        image(boss4_destroy, x, y);
        wonBossBattle4 = true;
      }
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (score >= 290 && wonBossBattle4 == true)
    {
      image(wonGame, 0, 0);
      player[0].close();
      minim.stop();
      noLoop();
    }
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void mousePressed()
{                                                 //verifies the start button pressed
  if (game_start==false) {
    if (mouseX>260&&mouseX<340) {
      if (mouseY>550&&mouseY<575) {
        game_start=true;
      }
    }
  }
  shoot = true;
  player[1] = minim.loadFile("laser.mp3", 512);    //laser sound
  player[1].play();
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void alienDropper()
{ 
  stroke(255);
  fill(255);
  for (int i=0; i<diff_level; i++)
  {
    image(aliens, aliensXCoords[i], aliensYCoords[i]++);
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void alienKiller(int shotX)
{
  boolean hit = false;

  for (int i = 0; i < diff_level; i++)
  {
    if ((shotX >= (aliensXCoords[i]-aliens.width/2)) && 
      (shotX <= (aliensXCoords[i]+aliens.width/0.8)))
    {
      hit = true;
      score++;
      line(mouseX, height-55, mouseX, aliensYCoords[i]);
      ellipse(aliensXCoords[i], aliensYCoords[i], 
      sphereDiameter+25, sphereDiameter+25); //the sphere is the small sphere that is made on impact with the laser
      aliensXCoords[i] = randx();
      aliensYCoords[i] = 0;
    }
  }
  if (hit == false)
  {
    line(mouseX, height-55, mouseX, 0); // this line is blank without any sphere on the top
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void bossKiller(int shotX, int x, int y)
{
  boolean hit = false;
  stroke(0, 255, 0);
  if ((shotX >= (x-boss.width/2)) && (shotX <= (x+boss.width/0.8)))
  {
    hit = true;
    score++;
    line(mouseX, height-55, mouseX, y);
    ellipse(x+boss.width/2, y+boss.width/2-55, 
    sphereDiameter+75, sphereDiameter+75); //the sphere is the small sphere that is made on impact with the laser
  }
  if (hit == false)
  {
    line(mouseX, height-55, mouseX, 0); // this line is blank without any sphere on the top
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void gameEnder()
{
  for (int i=0; i< diff_level; i++)
  {
    if (aliensYCoords[i]==height-50 || bombYCoords[i] == height - 50) //alien image length = 50 pixels //stop it from going down the screen
    {
      lives--;
      if (lives == 0)
      {
        noLoop();
        image(lostGame, 0, 0);
        player[0].close();
      } 
      minim.stop();
    }
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
int pause = 0;
void keyTyped() {
  if ((int)key == 98)  //98 ASCII for b // for bomb
  {
    test = 1;
    number_of_nukes--;
  }
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if ((int)key == 112)  //112 ASCII for p // for pausing the game
  {
    pause++;
    if (pause%2 == 1)
    {
      player[0].pause();
      noLoop();
    }
    if (pause%2 == 0)
    {
      loop();
      player[0].play();
    }
  }
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if ((int)key == 115)  //115 ASCII for s   // for saving the game
  {
    save_game(diff_level, lives, score, number_of_nukes, wonBossBattle1, wonBossBattle2, wonBossBattle3, wonBossBattle4);
    println("Game Saved");
  }
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  if ((int)key == 108)  //108 ASCII for l   // for loading the saved game
  {
    load_game();
    println("Game Loaded");
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void save_game(int diff_level_save, int lives_save, int score_save, int number_of_nukes_save, boolean wonBossBattle1_save, boolean wonBossBattle2_save, 
boolean wonBossBattle3_save, boolean wonBossBattle4_save)
{
  try {
    ObjectOutputStream obj = new ObjectOutputStream(new FileOutputStream(f));
    obj.writeInt(diff_level_save);
    obj.writeInt(lives_save);
    obj.writeInt(score_save);
    obj.writeInt(number_of_nukes_save);
    obj.writeBoolean(wonBossBattle1_save);
    obj.writeBoolean(wonBossBattle2_save);
    obj.writeBoolean(wonBossBattle3_save);
    obj.writeBoolean(wonBossBattle4_save);
    obj.flush();
  } 
  catch (IOException e) {
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void load_game()
{
  try {

    ObjectInputStream obj = new ObjectInputStream(new FileInputStream(f));
    //System.out.println("diff_level : "+  obj.readInt()); 
    //System.out.println("lives : "+  obj.readInt()); 
    //System.out.println("score : "+  obj.readInt());
    //System.out.println("number of nukes "+  obj.readInt());
    //System.out.println("won boss battle "+  obj.readBoolean());
    diff_level = obj.readInt();
    lives = obj.readInt();
    score = obj.readInt();
    number_of_nukes = obj.readInt();
    wonBossBattle1 = obj.readBoolean();
    wonBossBattle2 = obj.readBoolean();
    wonBossBattle3 = obj.readBoolean();
    wonBossBattle4 = obj.readBoolean();
    obj.close();
  }
  catch (IOException e) {
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void diplay_stats()
{
  fill(255);
  text("SCORE IS: " + score, 0, 50); 
  text("LIVES LEFT: " + lives, 0, 70);
  text("NUMBER OF NUKES: " + number_of_nukes, 0, 90);
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void bomb_killer(int shotX)
{
  boolean hit = false;

  for (int i = 0; i < diff_level; i++)
  {
    if ((shotX >= (bombXCoords[i]-boss_bomb.width/2)) && 
      (shotX <= (bombXCoords[i]+boss_bomb.width/0.8)))
    {
      hit = true;
      line(mouseX, height-55, mouseX, bombYCoords[i]);
      ellipse(bombXCoords[i], bombYCoords[i], 
      sphereDiameter+25, sphereDiameter+25); //the sphere is the small sphere that is made on impact with the laser
      bombXCoords[i] = randx();
      bombYCoords[i] = 0;
    }
  }
  if (hit == false)
  {
    line(mouseX, height-55, mouseX, 0); // this line is blank without any sphere on the top
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void bomb_dropper()
{ 
  stroke(255);
  fill(255);
  for (int i=0; i<diff_level; i++)
  {
    image(boss_bomb, bombXCoords[i], bombYCoords[i]++);
    if (bombYCoords[i] == height - 50)
    {
      gameEnder();
    }
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



