
// Version 2.6
//
// Finished 5-7-14
//
// Based on DDC Games
//
// Soup Master is an RPG-based game that is fun...
//
// Created by Cody "Chacka", Darius "Fat Tony", Daniel "The Man" {aka "The Triforce"}, and Zac "F-Dog"
//
// Warning: Enemy attacks are not quite finished
//
// PG13 for AWESOMENESS
Bar pBar1 = new Bar(200, 200, 50, 50, 0);//Natsu(player)
Bar pBar2 = new Bar(200, 200, 50, 100, 255);
Bar e1Bar = new Bar(500, 500, 650, 50, 0);//Wyvern
Bar e2Bar = new Bar(700, 700, 450, 50, 0);//Dragon
float alph = 255;//fade the 'being hit' effect after however mant millis.
float setTime;
boolean msclick = false;
int gamemode = 1;
int s; 
//loading image section
//jpg image type
PImage titlescreen; //background of title screen
PImage fightback; //background of fight screen
PImage fightback2;
PImage mana;
//SVG image type  
PShape killed;



  ArrayList<Proj> bullets = new ArrayList<Proj>();//from other program
  ArrayList<Proj> fireblast = new ArrayList<Proj>();//from other program
  Proj ender = new Proj(150);
  
  int xp = 100;//player
  int xe = 900;//enemy
  int c = xe;
  int y = 500;//level or height of all objects
  
  boolean attackOn = false;//deals with melee attack
  boolean attackOff = false;// deals with stopping
  boolean punchOn = false;
  boolean punchOff = false;
  boolean cheat = false;//deals with super attack
  boolean eAttack, eAttack2 = false;//enemy's attacks
  
  float soup, soup1, soup2, soup3, soup4 = 0;// Standing, running, fireball, dragon, wyvern
  PImage[] standing = new PImage [4];
  PImage[] running = new PImage [6];
  PImage[] back = new PImage [6];
  PImage[] wyvern = new PImage [4];
  PImage[] dragon = new PImage [3];
  
  PImage smallfire;
  PImage medfire;
  PImage bigfire;
  PImage punch;
  PImage jump;
  PImage firethrow;
  PImage dragonfire;
  PImage wyvernfire;
  PImage dfiresmall;
  PImage dfiremed;


void keyPressed()  
{
  
  //skip the intro
  if (key == 's' && gamemode <= 5)
  {
    gamemode = 5;
  }
   
}

void mouseClicked()  
{
  msclick = true;
}

void mouseReleased()  
{
  msclick = false;
}
class Bar {
  //----------Fields-----------------------------------------
  //parameter fields
  int size, max;
  float xpos, ypos;
  int blue;
  
  //non-parameter fields
  int prevSize;
  int alph = 255;
  boolean smacked = false;
  float angle = 0;
  
  
  //----------Constructor------------------------------------  
  Bar(int size_, int max_, 
      float xpos_, float ypos_, int blue_) {
        size = size_;
        xpos = xpos_;
        ypos = ypos_;
        max = max_;
        blue = blue_;
      }
  
  //----------Methods----------------------------------------
  void display() {

    //if hit, this triggers and draws red BEFORE drawing green...
    if(smacked && size > 0) {
      noStroke();
      fill(255,0,0,alph);
      rect(xpos, ypos, prevSize, 10);
      alph -= 12;  //12 had good "hangtime"
    }

    //draws black outline of box
    stroke(255);
    noFill();
    rect(xpos, ypos, max, 10);

    //draws green only if alive
    if(size > 0) {
      fill(0, 255, blue);
      rect(xpos, ypos, size, 10);
    }
  }

  //what happens to bar when hit
  //this gets a parameter so all attacks use the same code
  void hit(int hitVal) {
    alph = 255; //restore alpha value if invisible
    prevSize = size; //remember the location of the bar before the hit
    smacked = true; //trigger stuff in display method
    if (size >= 0) {
      size = size - hitVal;
    }
  }

  void restore() {
    size = max;
  }

  //show hp value numerically below bar
  void dispNum() {
    if(size > 0) {
    fill(255);
    textSize(20);
    text(size, xpos, ypos + 30);
    }
    if(size <= 0) {
      fill(0);
      text("DEAD!", xpos, ypos + 30);

      //make a skull appear that swells and shrinks...
      float y = sin(radians(angle));
      float bounce = map(y,-1,1,0,15);
      shape(killed,xpos+max/2-20,ypos-10,25+bounce,25+bounce);
      angle++;
    }
  }
   void dispNum2() {
    if(size > 0) {
    fill(255);
    textSize(20);
    text(size, xpos, ypos + 30);
    }
    if(size <= 0) {
      fill(255);
      text("OUT OF SOUP!", xpos + 50, ypos + 30);
      
       //make mana appear that swells and shrinks...
      float y = sin(radians(angle));
      float bounce = map(y,-1,1,0,15);
      image(mana,xpos+max/2+20,ypos-10,25+bounce,25+bounce);
      angle++;
    }
  }
}
void attacks1()
{  
  image(fightback, 0, 0);
  stroke(1);
  
  soup = (soup + .15) % 4;  // Use % to cycle through frames
  image(standing[int((soup) % 4)], xp, y - 30);
  
  soup4 = (soup4 + .1) % 4;  // Use % to cycle through frames
  image(wyvern[int((soup4) % 4)], xe, y - 30);
  
  
  
   

  if(keyPressed && key == 'a' && attackOff == false)//melee attack key
  {
    attackOn = true;
  }
  
  
  if(attackOn)//start attack
  {
    image(fightback, 0, 0);
    
    soup4 = (soup4) % 4;  // Use % to cycle through frames
    image(wyvern[int((soup4) % 4)], xe, y - 30);
    
    xp += 5;
    
    soup1 = (soup1 + .2) % 6;  // Use % to cycle through frames
    image(running[int((soup1) % 6)], xp - 10, y - 30);
  }

  if(attackOn && xp >= xe - 300)//register hit
  {
    punchOn = true;
  }

  if(punchOn)
  {
    image(punch, xp - 10, y - 30);
    xp += 15;
  }
  
  if(xp >= xe)//register hit
  {
    attackOn = false;
    punchOn = false;
    attackOff = true;
    e1Bar.hit(20);//melee damage
    pBar2.hit(-20);//replenishes magic
  }
  
  if(attackOff && xp >= xe - 300)
  {
    punchOff = true;
  }
  
  if(xp <= xe - 200)
  {
    punchOff = false;
  }
  
  if(attackOff)//return
  {
    image(fightback, 0, 0);

    soup4 = (soup4 + .1) % 4;  // Use % to cycle through frames
    image(wyvern[int((soup4) % 4)], xe, y - 30);
    
    xp -= 5;
    xe = int(random(895, 905));
    
    soup1 = (soup1 + .2) % 6;  // Use % to cycle through frames
    image(back[int((soup1) % 6)], xp, y - 30);
  }
  
  if(punchOff)
  {
    image(jump, xp, y - 30);
    xp -= 15;
  }
  
  if(xp <= 100)//return end
  { 
    attackOff = false;
  }
  
  if(eAttack)
  {
    image(dfiresmall, c, y - 30);
    c -= 10;
    
    if(c <= xp)
    {
      pBar1.hit(10);
      eAttack = false;
      c = xe;
    }
  }
  if(eAttack2)
  {
    image(dfiremed, c - 20, y - 10);
    c -= 5;
     
    if(c <= xp);
    {
      pBar1.hit(30);
      eAttack2 = false;
      c = xe;
    }
  }
  
  if(frameCount % 7 == 0 && keyPressed && key == 'f') //fireball small attack key
  {
    Proj b = new Proj(xp + 50);
    bullets.add(b);
    image(firethrow, xp, y - 30);
  }
  
  for(Proj b : bullets) //fireball animation
  {
    if(b.x <= xe + 30)//animation
    {
      b.display();
      b.move();
    }
    
    if(b.x == xe + 30)
    {
      e1Bar.hit(10);
    }
    
    if(b.x == xp + 60)
    {
      pBar2.hit(5);
    }
  }


if(frameCount % 7 == 0 && keyPressed && key == 'd') //fireball small attack key
  {
    Proj b = new Proj(xp + 50);
    fireblast.add(b);
    image(firethrow, xp, y - 30);
  }
  
  for(Proj b : fireblast) 
  {
    if(b.x <= xe + 31)//animation
    {
      b.display2();
      b.move();
    }
    
    if(b.x == xe + 30)
    {
      e1Bar.hit(30);
    }
    
    if(b.x == xp + 60)
    {
      pBar2.hit(20);
    }
  }
 
  
  if(keyPressed && key == 'q')//final strike or cheat attack key
  {
    cheat = true;
  }
  
  if(cheat)//final strike or cheat attack
  {
    ender.display3();
    ender.move();
    
    if(ender.x >= xe)//sends enemy flying
    {
      e1Bar.hit(700);
      cheat = false;
    }
    
    textSize(50);
    fill(255, 0, 0);
    text("Yol Toor Shul!", 300, 500);
  }
}
void attacks2()
{  
  image(fightback2, 0, 0);
  stroke(1);
  y = 535;
  
  soup = (soup + .15) % 4;  // Use % to cycle through frames
  image(standing[int((soup) % 4)], xp, y - 30);
  
  soup3 = (soup3 + .1) % 3;  // Use % to cycle through frames
  image(dragon[int((soup3) % 3)], xe, y - 80);
  
  
  
   

  if(keyPressed && key == 'a' && attackOff == false)//melee attack key
  {
    attackOn = true;
  }
  
  
  if(attackOn)//start attack
  {
    image(fightback2, 0, 0);
    
    soup3 = (soup3) % 3;  // Use % to cycle through frames
    image(dragon[int((soup3) % 3)], xe, y - 80);
    
    xp += 7;
    
    soup1 = (soup1 + .2) % 6;  // Use % to cycle through frames
    image(running[int((soup1) % 6)], xp - 10, y - 30);
  }

  if(attackOn && xp >= xe - 300)//register hit
  {
    punchOn = true;
  }

  if(punchOn)
  {
    image(punch, xp - 10, y - 30);
    xp += 15;
  }
  
  if(xp >= xe)//register hit
  {
    attackOn = false;
    punchOn = false;
    attackOff = true;
    e2Bar.hit(20);//melee damage
    pBar2.hit(-20);//replenishes magic
  }
  
  if(attackOff && xp >= xe - 300)
  {
    punchOff = true;
  }
  
  if(xp <= xe - 200)
  {
    punchOff = false;
  }
  
  if(attackOff)//return
  {
    image(fightback2, 0, 0);

    soup3 = (soup3 + .15) % 3;  // Use % to cycle through frames
    image(dragon[int((soup3) % 3)], xe, y - 80);
    
    xp -= 7;
    xe = int(random(895, 905));
    
    soup1 = (soup1 + .2) % 6;  // Use % to cycle through frames
    image(back[int((soup1) % 6)], xp, y - 30);
  }
  
  if(punchOff)
  {
    image(jump, xp, y - 30);
    xp -= 15;
  }
  
  if(xp <= 100)//return end
  { 
    attackOff = false;
  }
  
  if(frameCount % 7 == 0 && keyPressed && key == 'f') //fireball small attack key
  {
    Proj b = new Proj(xp + 50);
    bullets.add(b);
    image(firethrow, xp, y - 30);
  }
  
  for(Proj b : bullets) 
  {
    if(b.x <= xe + 21)//animation
    {
      b.display4();
      b.move();
    }
    
    if(b.x == xe + 20)
    {
      e2Bar.hit(10);
    }
    
    if(b.x == xp + 60)
    {
      pBar2.hit(5);
    }
  }
  
  if(frameCount % 7 == 0 && keyPressed && key == 'd') //fireball medium attack key
  {
    Proj b = new Proj(xp + 50);
    fireblast.add(b);
    image(firethrow, xp, y - 30);
  }
  
  for(Proj b : fireblast) 
  {
    if(b.x < xe + 31)//animation
    {
      b.display5();
      b.move();
    }
    
    if(b.x == xe + 30)
    {
      e2Bar.hit(30);
    }
    
    if(b.x == xp + 60)
    {
      pBar2.hit(20);
    }
  }
  
  if(keyPressed && key == 'q')//final strike or cheat attack key
  {
    cheat = true;
  }
  
  if(cheat)//final strike or cheat attack
  {
    ender.display3();
    ender.move();
    
    if(ender.x >= xe)//sends enemy flying
    {
      e2Bar.hit(700);
    }
    
    textSize(50);
    fill(255, 0, 0);
    text("Yol Toor Shul!", 300, 500);
  }
}
//this displays the title screen and will be called in draw.
void displaystart()  {
  background(0);
  image(titlescreen, 0, 0);
  fill(255);
  rect(20, 500, 200, 40);
  fill(0);
  textSize(30);
  text("Start", 110, 530);
  textSize(12);
  fill(255);
  text("2.6", 1185, 597);
  textSize(50);
  fill(0, 255, 0);
  text("Soup Master", 900, 100);
  textSize(20);
  text("A = Attack", 900, 150);
  text("F = Fireball", 900, 180);
  text("D = Firestorm", 900, 210);
  fill(0);
}
void draw()  
{
  switch(gamemode)  
  {
  
    case 1:
    
      background(0, 200, 50);
      textSize(25);
      text("DDC Enterprises presents...", 600, 150);
      textSize(12);
      text("'s' to skip", 1170, 10);
      if (millis() >= 4000)  
      {
        gamemode = 2;
      }
      break;
      
    case 2:
    
      background(0, 200, 50);
      textSize(12);
      text("'s' to skip", 1170, 10);
      if (millis() >= 6000)  
      {
      gamemode = 3;
      }
      break;
    
    case 3:
    
      background(0, 200, 50);
      textSize(25);
      text("DDC Games...", 600, 450);
      textSize(12);
      text("'s' to skip", 1170, 10);
        if (millis() >= 10000)  
        {
        gamemode = 4;
      }
      break;
    
    case 4:
    
      background(0, 200, 50);
      textSize(12);
      text("'s' to skip", 1170, 10);
      if (millis() >= 12000)  
      {
      gamemode = 5;
      }
      break;
      
    case 5:
   
      displaystart();
      if (msclick && mouseX >= 20 && mouseX <= 220 && mouseY >= 500 && mouseY <= 540)  
      {
        gamemode = 6;
        msclick = false;
      }
      if (mouseX >= 20 && mouseX <= 220 && mouseY >= 500 && mouseY <= 540)  
      {
        stroke(240, 240, 0);
        strokeWeight(3);
        rect(20, 500, 200, 40);
      }
      break;
  
    case 6:

      image(fightback, 0, 0);
      attacks1();
      textSize(12);
      text("Natsu", 45, 22);
      text("Wyvern", 1150, 22);
      pBar1.display();
      pBar1.dispNum();
      pBar2.display();
      pBar2.dispNum2();
      e1Bar.display();
      e1Bar.dispNum();
      
      if(millis() % 5000 == 0)
      {
        eAttack = true;
      }
      
      if(millis() % 16000 == 0)
      {
        eAttack2 = true;
      }
      
      if(e1Bar.size <= 0)  
      {
        fill(0);
        textSize(30);
        fill(255);
        rect(900, 400, 200, 40);
        fill(0);
        text("Boss Battle", 1000, 430);
        text("--->", 1150, 430);
        
        if(msclick && mouseX >= 900 && mouseX <= 1100 && mouseY >= 400 && mouseY <= 440)  
        {
          ender.x = xp;
          gamemode = 7;
          pBar1.restore();
          pBar2.restore();
        }
      }
      break;
      
    case 7:
      
      image(fightback2, 0, 0);
      attacks2();
      fill(255);
      textSize(12);
      text("Natsu", 45, 22);
      text("Dragon", 1150, 22);
      pBar1.display();
      pBar1.dispNum();
      pBar2.display();
      pBar2.dispNum2();
      e2Bar.display();
      e2Bar.dispNum();
      break;
      
  }
}


class Proj 
{
  int x;
  
 
  Proj(int x_) 
  {
    x = x_;
  }
 
  void display() 
  {
    image(smallfire, x, 485);
  }
  
  void display2() 
  {
    image(medfire, x, 475);
  }
  
  void display3() 
  {
    image(bigfire, x, 450);
  }
  
  void display4()
  {
    image(smallfire, x, 520);
  }
 
  void display5()
  {
    image(medfire, x, 510);
  }
  void move() 
  {
    x += 10;
  }
}
void setup()  {
  size(1200, 600);
  titlescreen = loadImage("VolcanicDragon.jpg");
  fightback = loadImage("backgroundforD.jpg");
  fightback2 = loadImage("volcanocoolness.jpg");
  mana = loadImage("manaimage2.JPG");
  killed = loadShape("bones.svg");
  textAlign(CENTER);
  
  
  
  
  
  smallfire = loadImage("firesmall.jpg");
  medfire = loadImage("firemedium.jpg");
  bigfire = loadImage("firelarge.jpg");
  punch = loadImage("natsuattack2.jpg");
  jump = loadImage("natsujump.JPG");
  firethrow = loadImage("natsu attack.jpg");
  dragonfire = loadImage("dragonfireball.png");
  wyvernfire = loadImage("wyvernattack2.jpg");
  dfiresmall = loadImage("firesmallback.jpg");
  dfiremed = loadImage("firemediumback.jpg");
  
    //this set is the standing phase soup1
   standing[0] = loadImage("natsustand1.jpg");
   standing[1] = loadImage("natsustand2.jpg");
   standing[2] = loadImage("natsustand3.jpg");
   standing[3] = loadImage("natsustand4.jpg");
 
     //this is the running animation soup
   running[0] = loadImage("natsurunning1.jpg");
   running[1] = loadImage("natsurunning2.jpg");
   running[2] = loadImage("natsurunning3.jpg");
   running[3] = loadImage("natsurunning4.jpg");
   running[4] = loadImage("natsurunning5.jpg");
   running[5] = loadImage("natsurunning6.jpg");
   
     //running back  soup
   back[0] = loadImage("natsurunningback1.jpg");
   back[1] = loadImage("natsurunningback2.jpg");
   back[2] = loadImage("natsurunningback3.jpg");
   back[3] = loadImage("natsurunningback4.jpg");
   back[4] = loadImage("natsurunningback5.jpg");
   back[5] = loadImage("natsurunningback6.jpg");
   
     //dragon soup3
   dragon[0] = loadImage("dragonstand1.jpg");
   dragon[1] = loadImage("dragonstand2.jpg");
   dragon[2] = loadImage("dragonstand3.jpg");
   
     //wyvern soup4
   wyvern[0] = loadImage("wyvernidle1.jpg");
   wyvern[1] = loadImage("wyvernidle2.jpg");
   wyvern[2] = loadImage("wyvernidle3.jpg");
   wyvern[3] = loadImage("wyvernidle4.jpg");
  
}


