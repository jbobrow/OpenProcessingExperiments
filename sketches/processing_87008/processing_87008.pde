


/*
simple platforming environment that
plays music notes when you land on a block


drawing more tiles
-show green or red box if you can or cant place a new block
-place block -> recalc

press space, break apart, hold space, pieces gravitate towards each other
-bigger piece eats small piece, if same size, randomly choose who wins
-space -> break apart
-hold down -> come back together
-pieces increase speed while moving towards each other
    -so if holding right and you have two pieces, the piece on the left will move a bit faster to catch up to
      the one on the right
-when you break apart, each section divides in half
-fans that apply force to player, based on mass(size)
    -might have to break down and become light to get lifted
    OR
    -might have to come together so a fan doesnt push them too much
    
-player can press a key to 'throw' parts that are near him

-click to freeze a player, so that other players will pull to it like a grappling hook
-can throw pieces and stick them to walls?

-left thumb stick for main block, right thumb stick for others

snap
(mouseY/32)*32;

*/

import java.util.List;

//import ddf.minim.analysis.*;
//import ddf.minim.*;
//import ddf.minim.signals.*;
 
//Minim minim;
//AudioOutput out;

//Lists
List<Button> buttons;
List<Block> blocks;

//Player
List<Player> players;
List<Player> playersToAdd;  //makes these static in the player class
List<Player> playersToRemove;
Player player;

boolean pressedUp = false;
boolean pressedDown = false;
boolean pressedLeft = false;
boolean pressedRight = false;

Button drawBlocksButton;
boolean drawBlocks = false;
boolean canDrawBlock = false;

Button addPlayersButton;
Button flyButton;

PVector mouseGrid;

void setup()
{
  size(700, 500);
 
  //minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  //out = minim.getLineOut(Minim.STEREO);
  
  //create Lists
  buttons = new ArrayList<Button>();
  blocks = new ArrayList<Block>();
  players = new ArrayList<Player>();
  playersToAdd = new ArrayList<Player>();  
  playersToRemove = new ArrayList<Player>();
  
  //create ui buttons
  CreateUIButtons();
  
  //create initial ground
  CreateInitialGround();
  
  //create player
  player = new Player(new PVector(150,50));
  players.add(player);
  
  //grid
  mouseGrid = new PVector(0,0);
}


void draw()
{
  background(40,148,255);
  
  mouseGrid = new PVector((mouseX/32)*32, (mouseY/32)*32);
  
  //println(mouseGrid);
  
  //player.Update();
  for(Player p : players)
  {
    p.Update();
  }
  for(Block b : blocks)
  {
     b.Draw(); 
  }
   for(Button b : buttons)
  {
     b.Draw(); 
  }
  if(drawBlocksButton.checked == true)      //should change this to tileAreaEmtpy check
  {
    //check square for block
    canDrawBlock = true;
    for(Block b : blocks)
    {
       if(b.position.x == mouseGrid.x && b.position.y == mouseGrid.y)
        {
          canDrawBlock = false;
          break;
        }
    }
    //draw box cursor
     fill(255,0,0,0);
     if(canDrawBlock)stroke(0,255,0,255);
     else stroke(255,0,0,255);
     strokeWeight(2);
     rect(mouseGrid.x, mouseGrid.y, 32, 32, 5);
     stroke(0);
     strokeWeight(1);
  }
  else canDrawBlock = false;
  
  for(Player p : playersToAdd)
  {
    players.add(p);
  }
  playersToAdd.clear();
  for(Player p : playersToRemove)
  {
    players.remove(p);
  }
  playersToRemove.clear();
}

/*void stop()
{
  out.close();
  minim.stop();
 
  super.stop();
}*/

void keyPressed()
  {
      switch(key)
      {
         case 'w': case 'W':
          pressedUp = true;
          break;
         case 's': case 'S':
          pressedDown = true;
          break;
         case 'a': case 'A':
          pressedLeft = true;
          break;
         case 'd': case 'D':
          pressedRight = true;
          break;
          case ' ':
            //player = new Player(new PVector(150,50));
            //players.add(player);
            for(Player p : players)
            {
               p.Split(); 
            }
           break;
      }
  }
  void keyReleased()
  {
      switch(key)
      {
         case 'w': case 'W':
          pressedUp = false;
          break;
         case 's': case 'S':
          pressedDown = false;
          break;
         case 'a': case 'A':
          pressedLeft = false;
          break;
         case 'd': case 'D':
          pressedRight = false;
          break;
      }
  }

void CreateInitialGround()
{
  Block newBlock;
  for(int i = 0; i < 16; i++)
  {
    newBlock = new Block(96 + (i * 32), 224);
    blocks.add(newBlock);
  }
   for(int i = 0; i < 16; i++)
  {
    if(i % 4 == 0)
    {
      newBlock = new Block(96 + (i * 32), 192);
      blocks.add(newBlock);
    }
  }
  
}


void CreateUIButtons()
{
   Button b;
   PVector pos;
   PVector size;
   color fill;
   color stroke;
   color fillChecked;
   color strokeOver;
   
   //tree button
   pos = new PVector(width - 48, height / 2);
   size = new PVector(36,36);
   fill = color(0,255, 24, 128);
   stroke = color(0);
   fillChecked = color(255,255, 255, 200);
   strokeOver = color(240, 255, 0, 255);
   b = new Button(pos, size, fill, stroke, fillChecked, strokeOver, "Add more Ground Blocks");
   drawBlocksButton = b;
   buttons.add(b);
   //treePlacer = b;
   
   //add player pieces
   pos = new PVector(width - 48, height / 2 - 64);
   size = new PVector(36,36);
   fill = color(209,209, 209, 128);
   stroke = color(0);
   fillChecked = color(255,255, 255, 200);
   strokeOver = color(240, 255, 0, 255);
   b = new Button(pos, size, fill, stroke, fillChecked, strokeOver, "Add more Player Pieces");
   addPlayersButton = b;
   buttons.add(b);
   
   //fly!
   pos = new PVector(width - 48, height / 2 - 128);
   size = new PVector(36,36);
   fill = color(15, 255, 249, 128);
   stroke = color(0);
   fillChecked = color(255,255, 255, 200);
   strokeOver = color(240, 255, 0, 255);
   b = new Button(pos, size, fill, stroke, fillChecked, strokeOver, "Fly!");
   flyButton = b;
   buttons.add(b);
   
   //controls!
   pos = new PVector(width - 48, height  - 48);
   size = new PVector(36,36);
   fill = color(255, 255, 255, 128);
   stroke = color(0);
   fillChecked = color(255,255, 255, 200);
   strokeOver = color(240, 255, 0, 255);
   b = new Button(pos, size, fill, stroke, fillChecked, strokeOver, "Controls!");
   //flyButton = b;
   buttons.add(b);

}


void mousePressed()
{
 PVector mousePos = new PVector(mouseX, mouseY);
 Block newBlock;
 Block deadBlock = new Block(0,0);
 //CreateCloud();
  for(Button b : buttons)
  {
    if(b.Contains(mousePos))
    {
       //if(b.checked) b.checked = false;
       //else b.checked = true;
       b.Checked();
    }
  }
  for(Player p : players)
  {
    p.mousePressed(mousePos);
  }
  
  if(mouseButton == LEFT)
  {
    if(drawBlocksButton.checked && canDrawBlock)
    {
       newBlock = new Block(mouseGrid);
       blocks.add(newBlock);
    }
    if(addPlayersButton.checked)
    {
       player = new Player(mousePos, 4);
       players.add(player);
    }
  }
  if(mouseButton == RIGHT)
  {
    if(drawBlocksButton.checked)
    {
      for(Block b : blocks)
      {
         if(b.position.x == mouseGrid.x && b.position.y == mouseGrid.y)
          {
            deadBlock = b;
            break;
          }
      }
    }
  }
  if(deadBlock != null) blocks.remove(deadBlock);
}

//algorithm, +1 if above, +2 if to right, +4 if to bottom, +8 if to left


class Block
{
  PVector position;
  int index = 0;
  PVector size = new PVector(32, 32);
  
  public Block(PVector myPosition)
  {
      position = myPosition;
  }
  public Block(float x, float y)
  {
      position = new PVector(x, y);
  }
  void Draw()
  {
    strokeWeight(1);
    fill(37, 161, 57); 
    rect(position.x, position.y, 32, 32, 5);
  }
}
class Button
{
  PVector position;
  PVector size;
  boolean checked = false;
  boolean mouseOver = false;
  color fillColor;
  color strokeColor;
  color fillChecked;
  color strokeOver;
  String mouseOverText = "";
  
  public Button(PVector newPos, PVector newSize, color newFill, color newStroke, color newFill2, color newStroke2, String mouseOverTxt)
  {
    position = newPos;
    size = newSize;
    fillColor = newFill;
    strokeColor = newStroke;
    fillChecked = newFill2;
    strokeOver = newStroke2;
    checked = false;
    mouseOverText = mouseOverTxt;
  }
  
  void Draw()
  {
    textAlign(CENTER);
    if(Contains(new PVector(mouseX, mouseY))) mouseOver = true;
    else mouseOver = false;
    
    if(mouseOver) stroke(strokeOver);
    else stroke(0,0,0,128);
    if(checked) fill(fillChecked);
    else fill(fillColor);
    rect(position.x, position.y, size.x, size.y, 7);
    stroke(0);
    
    if(mouseOver)
    {
      textSize(18);
      text(mouseOverText, width/2, 100);
    }
    
    if(mouseOverText == "Controls!" && checked)
    {
      fill(0);
      textSize(18);
      String displayString = "W  -  Jump" +
      "\nA & D  -  Move" +
      "\nS  -  Pull Together" +
      "\nSpace  -  Split Apart";
      textAlign(CENTER);
      text(displayString, width/2, height - 100);
    }
    
  }
  
  void Checked()
  {
    if(checked) checked = false;
    else
    {
      for(Button b : buttons)
      {
        b.checked = false;
      }
      checked = true;
    }
  }
  
  public boolean Contains(PVector vector)
  {
    if(vector.x > (position.x) && vector.x < (position.x + size.x) &&
      vector.y > (position.y) && vector.y < (position.y + size.y))
      {
         return true; 
      }
      else return false;
  } 
  
  
}
class Player
{
  PVector position = new PVector(0, 0);
  boolean grounded = false;
  boolean canJump = false;
  PVector size = new PVector(32, 32);      //this is draw size
  int mass = 8;                           //this times 4 is actual size
  boolean dead = false;
  boolean freeze = false;

  float sizeCounter = 0;

  PVector speed = new PVector(0, 0);
  PVector force = new PVector(0, 0);

  float gravity = 0.0;
  //float speed = 10.0;

  float myColor = 255;

  /*boolean pressedUp = false;
   boolean pressedDown = false;
   boolean pressedLeft = false;
   boolean pressedRight = false;*/

  boolean collisionUp = false;
  boolean collisionDown = false;
  boolean collisionLeft = false;
  boolean collisionRight = false;


  public Player(PVector pos)
  {
    position = pos;
  }
  public Player(PVector pos, int startingSize)
  {
    position = pos;
    mass = startingSize;
    size = new PVector(mass * 4, mass * 4);
  }
  void Update()
  {
    Draw();

    myColor = 255;
    collisionUp = false;
    collisionDown = false;
    collisionLeft = false;
    collisionRight = false;


    for (Block b : blocks)
    {
      if (CheckForGround(b))
      {
        //collisionDown = true;
        //grounded = true;
      }
      CheckForCollision(b);
    }
    if (collisionDown) grounded = true;
    else grounded = false;


    if (!grounded)
    {
      force.y += 0.2;
      if (force.y > 3.0)
      {
        force.y = 3.0;
      }
    }
    if (grounded)
    {
      force.y = 0;  
      if (speed.y > 0)
      {
        speed.y = 0;
      }
    }

    //collisionUp
    if (collisionUp)
    {
      grounded = true;
      canJump = false;
      if (speed.y < 0)
      {
        speed.y = 0;
      }
    }

    //jump 
    //if (pressedUp && grounded && canJump) force.y -= 6.0;
    if (pressedUp && canJump) force.y -= 6.0;
    if (flyButton.checked)
      if (pressedUp && !grounded && !canJump && force.y > -3.5) force.y -= 0.25;
    //spawn particle!

    if (pressedUp && canJump) canJump = false;
    if (!pressedUp && grounded) canJump = true;



    //move
    if (pressedLeft)
    {
      if (pressedDown) speed.x = -2.0;
      else speed.x = -5.0;
    }
    if (pressedRight)
    {
      if (pressedDown) speed.x = 2.0;
      else speed.x = 5.0;
    }
    // check for other players left and right
    float time = second();
    if (pressedLeft)
    {
      if (time % 1 == 0)
      {
        for (Player p : players)
        {
          if (p.position.x < position.x)
          {
            speed.x += -1;
            break;
          }
        }
      }
    }
    if (pressedRight)
    {
      if (time % 1 == 0)
      {
        for (Player p : players)
        {
          if (p.position.x > position.x)
          {
            speed.x += 1;
            break;
          }
        }
      }
    }

    //collision
    if (collisionRight) if (speed.x > 0) speed.x = 0;
    if (collisionLeft) if (speed.x < 0) speed.x = 0;

    speed.y += force.y;

    //check if frozen
    if (freeze)
    { 
      myColor = 203;
      speed = new PVector(0, 0);
    }

    position.add(speed);      //move player

    //speed = new PVector(0,0);
    speed.x *= 0.75;
    if (speed.x < 0.15 && speed.x > -0.15) speed.x = 0;
    force = new PVector(0, 0);

    //change shape
    if (pressedDown)
    {
      PullTogether();
    }
  }
  void Draw()
  {
    fill(myColor);
    strokeWeight(1);
    rect(position.x, position.y, size.x, size.y, 5);
  }

  void mousePressed(PVector mousePos)
  {
    if (mouseButton == RIGHT)
    {
      if (mousePos.x > (position.x) && mousePos.x < (position.x + size.x) &&
        mousePos.y > (position.y) && mousePos.y < (position.y + size.y))
      {
        if (freeze) freeze = false;
        else freeze = true;
        println("freeze!"+freeze);
      }
    }
  }

  /*boolean CheckForCollision(Block block)
   {
   boolean hit = false;
   if ((position.x < block.position.x + 33 &&
   position.x > block.position.x - 33) &&
   (position.y < block.position.y + 16 &&
   position.y > block.position.y - 16))
   {
   if (position.x > block.position.x) collisionLeft = true;
   else if (position.x < block.position.x) collisionRight = true;
   hit = true;
   }
   return hit;
   }*/
  boolean CheckForCollision(Block block)
  {
    boolean hit = false;
    if ((position.x < block.position.x + block.size.x &&      //check left bounds against block right
    position.x + size.x > block.position.x) &&              //check right bounds against block left
    (position.y < block.position.y + (block.size.y - 2) &&    //make sure ground blocks arnt counted as walls, other wise player cant move
    position.y + (size.y - 2) > block.position.y))                
    {
      if (position.x > block.position.x) collisionLeft = true;
      else if (position.x < block.position.x) collisionRight = true;
      hit = true;
    }
    return hit;
  }
  /*boolean CheckForGround(Block block)
   {
   float tempPos = position.y + 2;
   if (speed.y < 0)  //jumping
   {
   if ((position.x < block.position.x + 32 &&
   position.x > block.position.x - 32) &&
   (tempPos < block.position.y + 32 &&
   tempPos > block.position.y - 32))
   {
   if (position.y > block.position.y) speed.y = 0;
   }
   }
   if ((position.x < block.position.x + 32 &&
   position.x > block.position.x - 32) &&
   (tempPos < block.position.y + 32 &&
   tempPos > block.position.y - 32))
   {
   //if(position.y < block.position.y + 12)  //step height
   if (position.y < block.position.y - 12)  //step height
   {
   //position.y = position.y - (block.position.y - position.y);
   position.y = block.position.y - 32;
   grounded = true;
   collisionDown = true;
   return true;
   }
   else if (position.y > block.position.y + 16)
   {
   collisionUp = true;
   return true;
   }
   else return false;
   }
   else return false;
   }*/
  boolean CheckForGround(Block block)
  {
    float tempPos = position.y + 2;
    /*if (speed.y < 0)  //jumping
     {
     if ((position.x < block.position.x + block.size.x &&      //check left bounds against block right
     position.x + size.x > block.position.x) &&              //check right bounds against block left
     (position.y < block.position.y + (block.size.y/2) &&    //make sure ground blocks arnt counted as walls, other wise player cant move
     position.y + (size.y/2) > block.position.y))                
     {
     if (position.y > block.position.y) speed.y = 0;
     }
     }*/
    if ((position.x < block.position.x + block.size.x - 4 &&      //check left bounds against block right
    position.x + size.x > block.position.x + 4) &&              //check right bounds against block left
    (position.y  < block.position.y + block.size.y + 2 &&    //make sure ground blocks arnt counted as walls, other wise player cant move
    position.y + size.y + 2 > block.position.y))                //adding 4 to the sides so they dont stick to walls?
    {
      //if(position.y < block.position.y + 12)  //step height
      //if (position.y < block.position.y - 12)  //step height
      if (position.y < block.position.y)  // not step height? i dont think it is, lolololol
      {
        //position.y = position.y - (block.position.y - position.y);
        position.y = block.position.y - size.y;
        grounded = true;
        collisionDown = true;
        return true;
      }
      else if (position.y > block.position.y)
      {
        collisionUp = true;
        return true;
      }
      else return false;
    }
    else return false;
  }

  void Split()
  {
    //divide into two parts, wont split when frozen
    if (mass > 3 && !freeze)
    {
      mass /= 2;
      size = new PVector(mass * 4, mass * 4);
      float r = random(-16, 16);
      Player player = new Player(new PVector(position.x + r, position.y + r), mass);
      playersToAdd.add(player);
    }
  }

  void PullTogether()
  {
    Player pullTo;
    for (Player p: players)
    {
      if (p != this && !dead && !p.dead && (mass < 14 && p.mass < 14))
      {
        if (CheckDistance(p.position.x, p.position.y) < 96)
        {
          pullTo = p;
          PVector pos = pullTo.position;
          //lerp
          //position.lerp(pos, 0.1);
          position = new PVector(position.x + 0.1 *(pos.x - position.x), position.y + 0.1 *(pos.y - position.y));
          stroke(255);
          strokeWeight(mass);
          line(position.x + size.x / 2, position.y + size.y / 2, p.position.x + p.size.x / 2, p.position.y + p.size.y / 2);
          stroke(0);

          if (CheckDistance(p.position.x, p.position.y) < 16)
          {
            //mass *= 2;
            mass = mass + p.mass;
            size = new PVector(mass * 4, mass * 4);
            p.dead = true;
            playersToRemove.add(p);
          }

          break;    //break slows it down
          //maybe no break, but only move towards the 2 closest
          //OR if they all move toward number 1, that one should be bigger
          //than the others, which was supposed to have more move toward it anyways
        }
      }
    }
  }

  float CheckDistance(float x, float y)
  {
    float dist = sqrt((position.x - x)*(position.x - x) + (position.y - y)*(position.y - y));
    return dist;
  }
}



