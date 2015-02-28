
PFont myfont;

void setup()
{
  size(500,500,P3D);
  background(0);
  myfont = createFont("Impact", 36, false);
  textFont(myfont);
}

int tx, ty, tx_bullet, ty_bullet;
int tz = 0, kills = 0;

class Enemy
{
  float xpos;
  float ypos;
  float zpos;
  float zsp;
  boolean hit;
  
  Enemy()
  {
    xpos = random(50,450);
    ypos = random(50,450);
    zpos = -4000;
    zsp = random(5,20);
    hit = false;
  }
  
  void display()
  {
    pointLight(100,100,100,xpos,ypos,zpos);
    translate(xpos,ypos,zpos);
    fill(255);
    box(50);
    translate(-xpos,-ypos,-zpos);
  }
  
  void move()
  {
    zpos += zsp;
  }
  
  void hit_check()
  {
    if (bullet.zpos < zpos + 20 && bullet.zpos > zpos - 20)
    {
      if (bullet.xpos < xpos + 30 && bullet.xpos > xpos -30)
        if (bullet.ypos < ypos + 30 && bullet.ypos > ypos - 30)
          hit = true;
    }
    else hit = false;
  }
}

class Bullet
{
  float xpos;
  float ypos;
  float zpos;
  
  Bullet()
  {
    ypos = 0;
    xpos = 0;
    zpos = 0;
  }
  
  void display()
  {
    noStroke();
    fill(255,0,0);
    pointLight(255,255,255,xpos,ypos,zpos+15);
    translate(xpos,ypos,zpos);
    sphere(10);
    translate(-xpos,-ypos,-zpos);
    zpos -= 15;
  }
}

Bullet bullet = new Bullet();
Enemy[] enemy = new Enemy[1000];

int bullet_count = 0, fire = 0, offset = 0, enemy_count = 0, enemy_number = 0, level = 0;
boolean enemy_active = false, enemy_create = true;

void draw()
{
  background(0);
  
  if (keyPressed)
  {
    if (key == 'd' && tx < width-25)
      tx += 7;
    if (key == 'a' && tx > 25)
      tx -= 7;
    if (key == 'w' && ty > 25)
      ty -= 7;
    if (key == 's' && ty < height-25)
      ty += 7;
    if (key == '1')
      offset += 2;
    if (key == '2')
      offset -= 2;
  }
  
  translate(tx,ty,0);
  
  stroke(0);
  strokeWeight(2);
  fill(200);
  box(40,20,60);
  pointLight(50,50,50,0,0,1000);
  
  translate(-tx,-ty,0);
  
  if (keyPressed && key == ' ' && fire <= 0)
  {
    bullet.xpos = tx;
    bullet.ypos = ty;
    bullet.zpos = 0;
    fire = 40;
  }
  fire -= 1;
  
  bullet.display();
  
  if (enemy_number <= 4)
  {
    enemy_count += 1;
    level += 1;
    enemy[enemy_count] = new Enemy();
    enemy_number += 1;
  }
  
  for (int i = 1; i <= enemy_count; i ++)
  {
    if (enemy[i] != null)
    {
      enemy[i].display();
      enemy[i].move();
      enemy[i].hit_check();
    
      if (enemy[i].zpos > 0)
      {
        enemy[i] = null;
        enemy_number -= 1;
      }
      
      if (enemy[i] != null)
        if (enemy[i].hit == true)
        {
          enemy[i] = null;
          enemy_number -= 1;
          kills ++;
        }
    }
  }
  
  ///// walls /////
  if (level > 25 && level < 50 && offset != -520)
  {
    offset -= 10;
  }
  
  if (level > 50 && offset != 0)
  {
    offset += 10;
    
    if (offset == 0)
      level = 0;
  }
  
  fill(255);
  noStroke();
  translate(-offset,250,-250);
  
  for (int i = 0; i <= 25; i += 1)
  {
    if (i < 25)
    {
      box(40,500,500);
      translate(-offset,0,-500);
    }
    else
      translate(offset*i,0,500*i);
  }
  
  translate(width+offset*2,0,0);
  
  for (int i = 0; i <= 25; i += 1)
  {
    if (i < 25)
    {
      box(40,500,500);
      translate(offset,0,-500);
    }
    else
      translate(-offset*i,0,500*i);
  }
  translate(-250-offset,-250-offset,0);
  
  for (int i = 0; i <= 25; i ++)
  {
    if (i < 25)
    {
      box(500,40,500);
      translate(0,-offset,-500);
    }
    else
      translate(0,offset*i,500*i);
  }
  
  translate(0,500+offset*2,0);
  
  for (int i = 0; i <=25; i ++)
  {
    if (i < 25)
    {
      box(500,40,500);
      translate(0,offset,-500);
    }
    else
      translate(0,-offset*i,500*i);
  }
  
  translate(-250, -500-offset, 250);
  ambientLight(0,255,0,250,250,250);
  text(kills, 50,50,1);
}

