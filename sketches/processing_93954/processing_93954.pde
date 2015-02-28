
//Batman sprite subimages ripped by Maneko from "Batman" (Super NES prototype)
//Batman sprite subimages archived at The Sprite Database

//Deadpool sprite subimages ripped by Wucash from "The Unlimited"
//Deadpool sprite subimages archived at Infinity MUGEN

//Move Batman using the WASD format, punch with '1', kick wth '2'
//Move Deadpool using arrow key format, punch with number pad '1', kick with number pad '2'
//NOTE: Make sure the NumLk key is engaged, otherwise Deadpool won't be able to attack

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

PlayerOne batman;
PlayerTwo deadpool;

boolean moveright, moveleft, punch, kick;
boolean moveRIGHT, moveLEFT, PUNCH, KICK;
boolean hitsfx;

int bct, bst, btt;
int dct, dst, dtt; 
int score;

PImage bimg, blogo, dlogo, bwin, dwin;
PFont font1, font2;
Minim minim;
AudioSnippet sfx1, sfx2;
AudioPlayer battle;

void setup() 
{
  size(800, 480);
  smooth();

  minim = new Minim(this);
  
  batman = new PlayerOne();
  batman.init("b_");
  moveleft = moveright = punch = false;
  
  deadpool = new PlayerTwo();
  deadpool.init("d_");
  moveLEFT = moveRIGHT = PUNCH = false;
  
  //Timer for Batman punching and kicking
  bct = 0;
  bst = 0;
  btt = 450;
  
  //Timer for Deadpool punching and kicking
  dct = 0;
  dst = 0;
  dtt = 450;

  //Load background image
  bimg = loadImage("bkg3.jpg");
  
  //Load type fonts
  font1 = loadFont("BookAntiqua-BoldItalic-100.vlw");
  font2 = loadFont("Arial-BoldMT-100.vlw");
  
  //Load sound effects
  sfx1 = minim.loadSnippet("attack.mp3");
  sfx2 = minim.loadSnippet("human_death2.wav");
  hitsfx = false;
  
  //Load background music
  battle = minim.loadFile("Mortal_Kombat.mp3");
  battle.loop();

  //Load character logos
  dlogo = loadImage("deadpool_logo.png");
  blogo = loadImage("blogo.png");
  
  //Load win screen images
  bwin = loadImage("bats.png");
  dwin = loadImage("dp.png");
}

void draw() 
{
  background(bimg);

  //********************************DEADPOOL SPRITE LOGIC******************************//
    //Image pose for Deadpool moving right
  if (moveRIGHT && !moveLEFT && !PUNCH && !KICK)
  {
    if ( !deadpool.current_pose.equals("walk") || deadpool.facing!=1) 
    {
      deadpool.facing = 1;
      deadpool.current_pose = "walk";
      deadpool.st = millis() - deadpool.tt;
    }
  }

  //Image pose for Deadpool moving left
  if (moveLEFT && !moveRIGHT && !PUNCH && !KICK)
  {
    if ( !deadpool.current_pose.equals("walk") || deadpool.facing!=-1) 
    {
      deadpool.facing = -1;
      deadpool.current_pose = "walk";
      deadpool.st = millis() - deadpool.tt;
    }
  }

  //Image pose for Deadpool standing idle
  if (!moveLEFT && !moveRIGHT)
  {
    if (deadpool.current_pose.equals("walk")) 
    {
      deadpool.current_pose = "stand";
    }
  }

  //Image pose for Deadpool punching
  if (deadpool.current_pose.equals("punch")) 
  {
    dct = millis();
    if (dct - dst > dtt) 
    {
      deadpool.current_pose = "stand";
      PUNCH = false;
    }
  }
  
  //Image pose for Deapdool kicking
  if (deadpool.current_pose.equals("kick"))
  {
    dct = millis();
    if (dct - dst > dtt)
    {
      deadpool.current_pose = "stand";
      KICK = false;
    }
  }
  
  deadpool.update(batman.x, batman.y);
  //********************************END DEADPOOL SPRITE LOGIC******************************//

  //********************************BATMAN SPRITE LOGIC******************************//
  //Image pose for Batman moving right
  if (moveright && !moveleft && !punch && !kick)
  {
    if ( !batman.current_pose.equals("walk") || batman.facing!=1) 
    {
      batman.facing = 1;
      batman.current_pose = "walk";
      batman.st = millis() - batman.tt;
    }
  }

  //Image pose for Batman moving left
  if (moveleft && !moveright && !punch && !kick)
  {
    if ( !batman.current_pose.equals("walk") || batman.facing!=-1) 
    {
      batman.facing = -1;
      batman.current_pose = "walk";
      batman.st = millis() - batman.tt;
    }
  }

  //Image pose for Batman standing idle
  if (!moveleft && !moveright)
  {
    if (batman.current_pose.equals("walk")) 
    {
      batman.current_pose = "stand";
    }
  }

  //Image pose for Batman punching
  if (batman.current_pose.equals("punch")) 
  {
    bct = millis();
    if (bct - bst > btt) 
    {
      batman.current_pose = "stand";
      punch = false;
    }
  }
  
  //Image pose for Batman kicking
  if (batman.current_pose.equals("kick"))
  {
    bct = millis();
    if (bct - bst > btt)
    {
      batman.current_pose = "stand";
      kick = false;
    }
  }
  
  batman.update(deadpool.x, deadpool.y);
  //********************************END BATMAN SPRITE LOGIC******************************//
  
  //Display health bar for Batman's health
  noStroke();
  fill(100, 200);
  rect(width/2-380, height-440, 300, 30);
  
  if (batman.health <= 300 && batman.health > 150)
  {
    fill(#15BC21);  //Green health bar: Full health
    rect(width/2-380, height-440, batman.health, 30);
  }
  
  if (batman.health <= 150 && batman.health > 75)
  {
    fill(#E88307);  //Orange health bar: Medium health
    rect(width/2-380, height-440, batman.health, 30);
  }
  
  if (batman.health <= 75)
  {
    fill(#F71414);  //Red health bar: Low health
    rect(width/2-380, height-440, batman.health, 30);
  }
  
  //Display health bar for Deadpool's health
  noStroke();
  fill(100, 200);
  rect(width/2+80, height-440, 300, 30);
  
  if (deadpool.health <= 300 && deadpool.health > 150)
  {
    fill(#15BC21);  //Green health bar: Full health
    rect(width/2+80, height-440, deadpool.health, 30);
  }
  
  if (deadpool.health <= 150 && deadpool.health > 75)
  {
    fill(#E88307);  //Orange health bar: Medium health
    rect(width/2+80, height-440, deadpool.health, 30);
  }
  
  if (deadpool.health <= 75)
  {
    fill(#F71414);  //Red health bar: Low health
    rect(width/2+80, height-440, deadpool.health, 30);
  }
  
  
  //Draw Player Two win screen if Batman dies
  if (batman.death)
  {
    image(dwin, width/2-120, height/2-100);
    fill(0);
    textFont(font2, 30);
    text("PLAYER TWO WINS", width/2, height/2+115);
  }
  
  //Draw Player One win screen if Deadpool dies
  if (deadpool.death)
  {
    image(bwin, width/2-150, height/2-150);
    fill(0);
    textFont(font2, 30);
    text("PLAYER ONE WINS", width/2, height/2+115);
  }
  
  
  //Draw command
  fill(0);
  textAlign(CENTER, TOP);
  textFont(font1, 30);
  text("FIGHT!", width/2, height-440);
  
  //Draw logos
  image(dlogo, width/2+300, height-480);
  image(blogo, width/2-370, height-466);
  
  //Draw player names
  textFont(font2, 20);
  text("BATMAN", width/2-220, height-460);
  text("DEADPOOL", width/2+240, height-460);
}

void keyPressed() 
{ 
  //**********************BATMAN PLAYER LOGIC*****************************//
  //Move left with 'a' or 'A' key
  if (keyCode == 65) 
  {
    moveleft = true;
  }
  
  //Move right with 'd' or 'D' key
  if (keyCode == 68) 
  {
    moveright = true;
  }
  
  //Punch with '1' key
  if (keyCode == 49 && !hitsfx) 
  {
    if (!batman.current_pose.equals("punch")) 
    {
      punch = true;
      batman.current_pose = "punch";
      bst = millis();
      hitsfx = true;
      
      if (sfx1 != null && !sfx1.isPlaying()) 
      {
        sfx1.rewind();
        sfx1.play();
      }
    }
  }
  
  //Kick with '2' key
    if (keyCode == 50 && !hitsfx) 
  {
    if (!batman.current_pose.equals("kick")) 
    {
      kick = true;
      batman.current_pose = "kick";
      bst = millis();
      hitsfx = true;
      
      if (sfx1 != null && !sfx1.isPlaying()) 
      {
        sfx1.rewind();
        sfx1.play();
      }
    }
  }
  //**********************END BATMAN PLAYER LOGIC*****************************//
  
  //**********************DEADPOOL PLAYER LOGIC*****************************//
    //Move left with left arrow key
  if (keyCode == 37) 
  {
    moveLEFT = true;
  }
  
  //Move right with right key
  if (keyCode == 39) 
  {
    moveRIGHT = true;
  }
  
  //Punch with number pad '1' key
  if (keyCode == 97 && !hitsfx) 
  {
    if (!deadpool.current_pose.equals("punch")) 
    {
      PUNCH = true;
      deadpool.current_pose = "punch";
      dst = millis();
      hitsfx = true;
      
      if (sfx1 != null && !sfx1.isPlaying()) 
      {
        sfx1.rewind();
        sfx1.play();
      }
    }
  }
  
  //Kick with number pad '2' key
    if (keyCode == 98 && !hitsfx) 
  {
    if (!deadpool.current_pose.equals("kick")) 
    {
      KICK = true;
      deadpool.current_pose = "kick";
      dst = millis();
      hitsfx = true;
      
      if (sfx1 != null && !sfx1.isPlaying()) 
      {
        sfx1.rewind();
        sfx1.play();
      }
    }
  }
  //**********************END DEADPOOL PLAYER LOGIC*****************************//
  
  //Restart the game with 'p' or 'P' key
  if (keyCode == 80)
  {
    reset();
  }
}

void keyReleased() 
{
  //**********************BATMAN PLAYER LOGIC*****************************//
  //Stop moving left if the 'a' or 'A' key is released
  if (keyCode == 65) 
  {
    moveleft = false;
  }
  
  //Stop moving right if the 'd' or 'D' is released
  if (keyCode == 68) 
  {
    moveright = false;
  }
  
  //Stop playing the hit sound effect if the punching or kicking key is released
  if (keyCode == 49 || keyCode == 50) 
  {
    hitsfx = false;
  }
  //**********************END BATMAN PLAYER LOGIC*****************************//
  
  //**********************DEADPOOL PLAYER LOGIC*****************************//
  //Stop moving left if the left arrow key is released
  if (keyCode == 37) 
  {
    moveLEFT= false;
  }
  
  //Stop moving right if the right is released
  if (keyCode == 39) 
  {
    moveRIGHT = false;
  }
  
  //Stop playing the hit sound effect if the punching or kicking key is released
  if (keyCode == 97 || keyCode == 98) 
  {
    hitsfx = false;
  }
  //**********************END DEADPOOL PLAYER LOGIC*****************************//
}

void stop()
{
  sfx1.close();
  minim.stop();
  super.stop();
}

//************************PLAYER ONE CLASS****************************//
class PlayerOne
{
  //Preloaded images for Batman sprite
  //0:stand/idle, 1-8:walk, 9-10:punch, 11-13:kick
  
  String current_pose;   //Identifies which animation pose is playing
  
  int facing;   //Identifies which way the player is facing
  int playhead;   //Identifies which subimage of the player's sprite is currently shown
  float health;   //Player's health
  int ct, st, tt;   //Timer to control the speed of the player's walking animation
  int dimension;
    
  float x, y, xspeed;   //Player's position and horizontal speed
  
  boolean death;
  PImage deathImg;
  ArrayList simple;

  //Variables to set up the player's animation
  PImage[] sprites;
  int totalImages;          
  int walk_end, walk_start;
  int punch_sp, kick_sp;
  
  String pre;

  void init(String prefix) 
  {
    totalImages = 14;
    walk_start = 1;
    walk_end = 8;
    punch_sp = 10;
    kick_sp = 13;

    pre = prefix;
    
    //Holds the player's sprite subimages in an image array
    sprites = new PImage[totalImages]; 

    //Load the player's sprite subimages
    for (int i = 0; i < totalImages; i++) 
    {
      sprites[i] = loadImage(pre + i + ".png");
    }
    
    deathImg = loadImage(pre + "0.png");
    dimension = (deathImg.width*deathImg.height);
    simple = new ArrayList();
    
    for (int i = 0;i < dimension; i++) 
    {
      simple.add(i);
    }
    
    //Set intial values 
    x = width/10;
    y = height/2+120;
    health = 300;

    current_pose = "stand";
    playhead = 0;
    death = false;

    facing = 1;
    xspeed = 2;

    ct = 0;
    st = 0;
    tt = 150;
  }

  void update(float ox, float oy) 
  {
    if (health < 0) 
    {
      death = true;
      health = 0;
      sfx2.play(0);
    }
    
    if (!death)  
    {
      //Display the standing/idle subimage of the player's sprite
      if (current_pose.equals("stand")) 
      {
        pushMatrix();
        translate(x, y);
        scale(facing, 1);
        image(sprites[0], -sprites[0].width/2, -sprites[0].height+10);
        popMatrix();
      }
      
      //Display the walking subimages of the player's sprite
      if (current_pose.equals("walk")) 
      {
        x += xspeed * facing;   //Move the player in the direction he is facing
        ct = millis();   //Update the animation timer
        
        if (ct - st > tt) 
        { 
          //If the timer is up, advance the playhead to the next subimage
          playhead += 1;
          
          if (playhead > walk_end) 
          { 
            //If the playhead goes past the last subimage, reset it to the first subimage
            playhead = walk_start;
          }
          st = millis();
        }

        pushMatrix();
        translate(x, y);
        scale(facing, 1);
        image(sprites[playhead], -sprites[playhead].width/2, -sprites[playhead].height+10);
        popMatrix();
      }
      
      //Display the punching subimages of the player's sprite
      if (current_pose.equals("punch")) 
      {
        pushMatrix();
        translate(x, y);
        scale(facing, 1);
        image(sprites[punch_sp], -sprites[punch_sp].width/2, -sprites[punch_sp].height+10);
        popMatrix();
        
        //Injure Deadpool if he is within range of Batman's punch
        if (!deadpool.death && dist(x, y, ox, oy) < 75)
        {
          deadpool.health = deadpool.health - 0.5;
        }
      }
      
      //Display the kicking subimages of the player's sprite
      if (current_pose.equals("kick"))
      {
        pushMatrix();
        translate(x, y);
        scale(facing, 1);
        image(sprites[kick_sp], -sprites[kick_sp].width/2, -sprites[kick_sp].height+10);
        popMatrix();
        
        //Injure Deadpool if he is in range of Batman's kick
        if (!deadpool.death && dist(x, y, ox, oy) < 75)
        {
          deadpool.health = deadpool.health - 0.5;
        }
      }
    }
    else 
    {
      deathImg.loadPixels();
      
      if (simple.size() > 85)
      {
        for (int i = 0; i < 85; i++) 
        {
          int p = (int)(random(simple.size()));
          int m = int((simple.get(p)) + "");
          deathImg.pixels[m] = color(0, 0, 0, 0);
          simple.remove(p);
        }
        
        deathImg.updatePixels();
        pushMatrix();
        translate(x, y);
        scale(facing, 1);
        image(deathImg, -deathImg.width/2, -deathImg.height+10);
        popMatrix();
      }
    }
  }
}
//************************END PLAYER ONE CLASS****************************//

//************************PLAYER TWO CLASS****************************//
class PlayerTwo
{
  //Preloaded images for Deadpool sprite
  //0:stand/idle, 1-13:walk, 14-15:punch, 16-17:kick
  
  String current_pose;   //Identifies which animation pose is playing
  
  int facing;   //Identifies which way the player is facing
  int playhead;   //Identifies which subimage of the player's sprite is currently shown
  float health;   //Player's health
  int ct, st, tt;   //Timer to control the speed of the player's walking animation
  int dimension;
    
  float x, y, xspeed;   //Player's position and horizontal speed
  
  boolean death;
  PImage deathImg;
  ArrayList simple;

  //Variables to set up the player's animation
  PImage[] sprites;
  int totalImages;          
  int walk_end, walk_start;
  int punch_sp, kick_sp;
  
  String pre;

  void init(String prefix) 
  {
    totalImages = 18;
    walk_start = 1;
    walk_end = 13;
    punch_sp = 15;
    kick_sp = 17;

    pre = prefix;
    
    //Holds the player's sprite subimages in an image array
    sprites = new PImage[totalImages]; 

    //Load the player's sprite subimages
    for (int i = 0; i < totalImages; i++) 
    {
      sprites[i] = loadImage(pre + i + ".png");
    }
    
    deathImg = loadImage(pre + "0.png");
    dimension = (deathImg.width*deathImg.height);
    simple = new ArrayList();
    
    for (int i = 0; i < dimension; i++) 
    {
      simple.add(i);
    }
    
    //Set intial values 
    x = width-80;
    y = height/2+120;
    health = 300;

    current_pose = "stand";
    playhead = 0;
    death = false;

    facing = -1;
    xspeed = 2;

    ct = 0;
    st = 0;
    tt = 150;
  }

  void update(float ox, float oy) 
  {
    if (health < 0) 
    {
      death = true;
      health = 0;
      sfx2.play(0);
    }
    
    if (!death)  
    {
      //Display the standing/idle subimage of the player's sprite
      if (current_pose.equals("stand")) 
      {
        pushMatrix();
        translate(x, y);
        scale(facing, 1);
        image(sprites[0], -sprites[0].width/2, -sprites[0].height+10);
        popMatrix();
      }
      
      //Display the walking subimages of the player's sprite
      if (current_pose.equals("walk")) 
      {
        x += xspeed * facing;   //Move the player in the direction he is facing
        ct = millis();   //Update the animation timer
        
        if (ct - st > tt) 
        { 
          //If the timer is up, advance the playhead to the next subimage
          playhead += 1;
          
          if (playhead > walk_end) 
          { 
            //If the playhead goes past the last subimage, reset it to the first subimage
            playhead = walk_start;
          }
          st = millis();
        }

        pushMatrix();
        translate(x, y);
        scale(facing, 1);
        image(sprites[playhead], -sprites[playhead].width/2, -sprites[playhead].height+10);
        popMatrix();
      }
      
      //Display the punching subimages of the player's sprite
      if (current_pose.equals("punch")) 
      {
        pushMatrix();
        translate(x, y);
        scale(facing, 1);
        image(sprites[punch_sp], -sprites[punch_sp].width/2, -sprites[punch_sp].height+10);
        popMatrix();
        
        //Injure Batman if he is in range of Deadpool's punch
        if (!batman.death && dist(x, y, ox, oy) < 75)
        {
          batman.health = batman.health - 0.5;
        }
      }
      
      //Display the kicking subimages of the player's sprite
      if (current_pose.equals("kick"))
      {
        pushMatrix();
        translate(x, y);
        scale(facing, 1);
        image(sprites[kick_sp], -sprites[kick_sp].width/2, -sprites[kick_sp].height+10);
        popMatrix();
        
        //Injure Batman if he is in range of Deadpool's kick
        if (!batman.death && dist(x, y, ox, oy) < 75)
        {
          batman.health = batman.health - 0.5;
        }
      }
    }
    else 
    {
      deathImg.loadPixels();
      
      if (simple.size() > 85)
      {
        for (int i = 0; i < 85; i++) 
        {
          int p = (int)(random(simple.size()));
          int m = int((simple.get(p)) + "");
          deathImg.pixels[m] = color(0, 0, 0, 0);
          simple.remove(p);
        }
        
        deathImg.updatePixels();
        pushMatrix();
        translate(x, y);
        scale(facing, 1);
        image(deathImg, -deathImg.width/2, -deathImg.height+10);
        popMatrix();
      }
    }
  }
}
//************************END PLAYER TWO CLASS****************************//

void reset()
{
  batman.death= false;
  batman.health = 300;
  batman.x = width/10;
  batman.y = height/2+120;
  batman.facing = 1;
  
  deadpool.death = false;
  deadpool.health = 300;
  deadpool.x = width-80;
  deadpool.y = height/2+120;
  deadpool.facing = -1;
}

