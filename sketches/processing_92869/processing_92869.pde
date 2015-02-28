
/* @pjs preload = "clearboundaries.png", "boundariesbw.png", "colorback.png", "soldier32x32.png" */
/*import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim minim;
AudioPlayer player;*/
PImage colorback;
PImage clearboundaries;
PImage boundariesbw;

boolean[][] bg;
int soldX, soldY, soldSpd, halfSold;

class Adventurer
{
  PImage image;
  PVector position;
  int frameRow;
  int frameColumn;
  float frameTimer;
  PVector velocity;
  float speed;
}
 
Adventurer soldier;
float left = 0;
float right = 0;
float down = 0;
float up = 0;

void setup()
{
  /*minim = new Minim(this);
  player = minim.loadFile("BD.mp3");*/
  size(510,510);
  background(255);
  imageMode(CENTER);
  frameRate(20);
  clearboundaries = loadImage("clearboundaries.png");
  boundariesbw = loadImage("boundariesbw.png");
  bg = new boolean[boundariesbw.width][boundariesbw.height];
  color black = color(0);
  color white = color(255);
  for (int i = 0; i < boundariesbw.width; i++){
    for (int j = 0; j < boundariesbw.height; j++){
      color c = boundariesbw.get(i, j);
      if (c== black){bg[i][j] = false;}
      else if (c == white) {bg[i][j] = true;}
      else{
      }
    }
  }
  halfSold = 16;
  soldier = new Adventurer();
  soldier.image = loadImage("soldier32x32.png");
  soldier.position = new PVector(350, 250);
  soldier.velocity = new PVector(0, 0);
  soldier.frameRow = 0; 
  soldier.frameColumn = 0;
  soldier.frameTimer = 0;
  soldier.speed = 3;
  soldX = 32;
  soldY = 32;
  soldSpd = 8;
}

void draw()
{
  background(255);
  colorback = loadImage("colorback.png");
  image(colorback, width/2, height/2);
  image(clearboundaries, width/2, height/2);
  soldier.velocity.x = soldier.speed * (left + right);
  soldier.velocity.y = soldier.speed * (up + down);
  soldier.position.add(soldier.velocity);
   
  soldier.frameTimer += 1;
  if (soldier.frameTimer >= 3){ soldier.frameTimer = 0;}
  soldier.frameColumn = (int)soldier.frameTimer;   
  if (soldier.velocity.x == 0 && soldier.velocity.y == 0)
  {soldier.frameColumn = 0;}
  if (left != 0){soldier.frameRow = 1;}
  if (right != 0){soldier.frameRow = 2;}
  if (up != 0){soldier.frameRow = 3;}
  if (down != 0){soldier.frameRow = 0;}
 
  pushMatrix();
  translate(soldier.position.x, soldier.position.y);
  imageMode(CENTER);
  PImage frameImage = getSubImage(soldier.image, soldier.frameRow, soldier.frameColumn, 32, 32);
  image(frameImage, soldX, soldY);
  popMatrix();
}

PImage getSubImage(PImage image, int row, int column, int frameWidth, int frameHeight)
{
  return image.get(column * frameWidth, row * frameHeight, frameWidth, frameHeight);
}

void keyPressed(){
  boolean upL = false;
  boolean upR = false;
  boolean doR = false;
  boolean doL = false;
  if(key == CODED){    
    if (keyCode == RIGHT)
    {
      right = 1;
      if(soldX <= width - halfSold -soldSpd)
      {
        upL = bg[soldX + soldSpd - halfSold][soldY - halfSold];
        upR = bg[soldX + soldSpd + halfSold][soldY - halfSold];
        doR = bg[soldX + soldSpd + halfSold][soldY + halfSold];
        doL = bg[soldX + soldSpd - halfSold][soldY + halfSold]; {
          if (upL && upR && doR && doL) {soldX += soldSpd; }
          /*else {player.play();}*/
        }
      }
    }
    if (keyCode == LEFT)
    {
      left = -1;
      if (soldX >= halfSold + soldSpd){
        upL = bg[soldX - soldSpd - halfSold][soldY - halfSold];
        upR = bg[soldX - soldSpd + halfSold][soldY - halfSold];
        doR = bg[soldX - soldSpd + halfSold][soldY + halfSold];
        doL = bg[soldX - soldSpd - halfSold][soldY + halfSold]; {
          if (upL && upR && doR && doL) {soldX -= soldSpd; }
          /*else {player.play();}*/
        }
      }
    }
    if (keyCode == UP)
    {
      up = -1;
      if (soldY >= halfSold + soldSpd){
        upL = bg[soldX - halfSold][soldY - soldSpd - halfSold];
        upR = bg[soldX + halfSold][soldY - soldSpd - halfSold];
        doR = bg[soldX + halfSold][soldY - soldSpd + halfSold];
        doL = bg[soldX - halfSold][soldY - soldSpd + halfSold]; {
          if (upL && upR && doR && doL) {soldY -= soldSpd; }
          /*else {player.play();}*/
        }
      }
    }
    if (keyCode == DOWN)
    {
      down = 1;
      if (soldY <= height - halfSold - soldSpd){
        upL = bg[soldX - halfSold][soldY + soldSpd - halfSold];
        upR = bg[soldX + halfSold][soldY + soldSpd - halfSold];
        doR = bg[soldX + halfSold][soldY + soldSpd + halfSold];
        doL = bg[soldX - halfSold][soldY + soldSpd + halfSold]; {
          if (upL && upR && doR && doL) {soldY += soldSpd; }
          /*else {player.play();}*/
        }
      }
    }
  }
}
 
void keyReleased()
{
  if (keyCode == RIGHT)
  {
    right = 0;
  }
  if (keyCode == LEFT)
  {
    left = 0;
  }
  if (keyCode == UP)
  {
    up = 0;
  }
  if (keyCode == DOWN) 
  {
    down = 0;
  }
}



