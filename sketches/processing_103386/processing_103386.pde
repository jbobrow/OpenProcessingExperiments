
int shipx;
int shipy;
 
alien_class alien[];
ArrayList<bullet_class> bullets;
 
class alien_class
{
  int alienx;
  int alieny;
  int alienxv;
  int alienyv;
 
  alien_class()
  {
    alienx=(int)(random(width));
    alieny=(int)(random(20));
    alienxv=(int)(random(11)); // 0 - 10
    alienxv-=5;
    alienyv=(int)(random(3));
  }
 
  void alien_update()
  {
    move_alien();
    fill(0, 255, 0);
    rect(alienx, alieny, 10, 10);
  }
 
  void move_alien()
  {
    alienx+=alienxv;
    if (alienx>width - 5) alienxv=-alienxv;
    if (alienx<0) alienxv=-alienxv;
 
    alieny+=alienyv;
    if (alieny>height - 5) alienyv=-alienyv;
    if (alieny<0) alienyv=-alienyv;
  }
}

class bullet_class
{
  int bulletx;
  int bullety;
  
  bullet_class(x, y)
  {
    bulletx = x;
    buullety = y;
  }
  
  void update_bullet()
  {
    move_bullet();
    fill(255, 0, 0);
    rect(bulletx, bullety, 4, 4);
  }
  
  void move_bullet()
  {
    bullety -= 5;
  }
  
  int get_y()
  {
    return bullety;
  }
}
 
 
void setup()
{
  size(400, 240);
  frameRate(30);
 
  alien = new alien_class[10];
  bullets = new ArrayList<bullet_class>();
   
  for (int i=0; i<10; i++) alien[i] = new alien_class();
   
  shipx=width/2;
  shipy=height-20;
 
  fill(255);
  stroke(0);
}
 
void draw()
{
  background(0);
 
  fill(0, 255, 0);
  fill(255);
  rect(shipx, shipy, 10, 10);
 
  for (int i = 0; i < bullets.size(); i++){
    bullets.get(i).update_bullet();
    if (bullets.get(i).get_y()<0)
    {
      bullets.remove(i); 
    }
  }
 
  for (int i=0; i<10; i++) alien[i].alien_update();
   
  move_ship();
}
 
void move_ship()
{
  if (mouseX>shipx) shipx+=5;
  if (mouseX<shipx) shipx-=5;
}
 
 
void mousePressed() {
  bullets.add(new bullet_class(shipx, shipy - 5));
}
