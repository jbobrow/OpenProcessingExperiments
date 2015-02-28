
//Batman sprites ripped by Maneko from "Batman" (Super NES prototype)
//Batman sprites archived at The Sprite Database

Hero batman;

boolean moveright, moveleft, punch, kick;

int pct, pst, ptt;

void setup()
{
  size(500, 500);
  smooth();
  batman = new Hero();
  batman.init("b_");
  moveleft = moveright = punch = false;
  
  //Timer for Batman punching and kicking
  pct = 0;
  pst = 0;
  ptt = 250;
}

void draw()
{
  background(100);
        
  //Image pose for Batman moving right      
  if (moveright && !moveleft && !punch)
  {
    if (!batman.current_pose.equals("walk") || batman.facing != 1) 
    {
      batman.facing = 1;
      batman.current_pose = "walk";
      batman.st = millis() - batman.tt;
    }
  }
  
  //Image pose for Batman moving left
  if (moveleft && !moveright && !punch)
  {
    if (!batman.current_pose.equals("walk") || batman.facing != -1) 
    {
      batman.facing =- 1;
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
    pct = millis();
    if (pct - pst > ptt) 
    {
      batman.current_pose = "stand";
      punch = false;
    }
  }
  
  //Image pose for Batman kicking
  if (batman.current_pose.equals("kick"))
  {
    pct = millis();
    if (pct - pst > ptt)
    {
      batman.current_pose = "stand";
      kick = false;
    }
  }

  batman.update();
}

void keyPressed() 
{
  //Move left with left arrow key
  if (keyCode==37) 
  {
    moveleft = true; 
  }
  
  //Move right with right arrow key
  if (keyCode==39) 
  {
    moveright = true;  
  }
  
  //Punch with 'a' or 'A' key
  if (keyCode==65) 
  {
    if (!batman.current_pose.equals("punch")) 
    {
      punch = true; 
      batman.current_pose="punch";
      pst=millis();
    }
  }
  
  //Kick with 's' or 'S' key
  if(keyCode==83)
  {
    if (!batman.current_pose.equals("kick"))
    {
      kick = true;  
      batman.current_pose = "kick";
      pst = millis();
    }
  }
}

void keyReleased() 
{
  //Stop moving left if the left arrow key is released
  if (keyCode==37) 
  {
    moveleft = false;  
  }
  
  //Stop mocing right if the right arrow key is released
  if (keyCode==39) 
  {
    moveright = false;  
  }
}

//**********************HERO CLASS***********************//
class Hero
{
  //Preloaded images for Batman sprite
  //0:stand/idle, 1-8: walk, 9-10:punch, 11-13:kick
  
  String current_pose;   //Identifies which animation pose is playing
  
  int facing;   //Identifies which way the hero is facing
  int playhead;   //Identifies which subimage of the hero sprite is currently shown
  int ct, st, tt;   //Timer to control the speed of the hero's walking animation
  
  float x, y, xspeed;  //Hero's position
  
  //Variables to set up the hero's animation
  PImage[] sprites;
  int totalImages;
  int walk_end, walk_start;
  int punch_sp, kick_sp;
  
  void init(String prefix)
  {
    totalImages = 14;
    walk_start = 1;
    walk_end = 8;
    punch_sp = 10;
    kick_sp = 13;
    
    //Holds the hero's sprite subimages in an image array
    sprites = new PImage[totalImages];  
    
    for (int i = 0; i < totalImages; i++)
    {
      sprites[i] = loadImage(prefix + i + ".png");  //load images
    }
    
    //initiate values
    x = width/2;
    y = height/2+100;
    
    current_pose = "stand";
    playhead = 0;
    
    facing = 1;
    xspeed = 1;
    
    ct = 0;
    st = 0;
    tt = 150;
  }
  
  void update()
  {
    if (current_pose.equals("stand"))
    {
      pushMatrix();
      translate(x, y);
      scale(facing, 1);
      image(sprites[0], -sprites[0].width/2, -sprites[0].height+10);
      popMatrix();
    }
    
    if(current_pose.equals("walk"))
    {
       x += xspeed * facing;   //move hero indirection facing
      
       ct = millis();  //update timer
       if (ct - st > tt)  //if timer is up, advanceplayhead to next image
       {
         playhead += 1;
        
       if (playhead > walk_end) //if it exceeds the last image, set playhead bacl
       {                     //to the first image of this pose
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
  
   if (current_pose.equals("punch"))
   {
     pushMatrix();
     translate(x, y);
     scale(facing, 1);
     image(sprites[punch_sp], -sprites[punch_sp].width/2, -sprites[punch_sp].height+10);
     popMatrix();
   }
  
   if (current_pose.equals("kick"))
   {
     pushMatrix();
     translate(x, y);
     scale(facing, 1);
     image(sprites[kick_sp], -sprites[kick_sp].width/2, -sprites[kick_sp].height+10);
     popMatrix();
   }
  }
 }


