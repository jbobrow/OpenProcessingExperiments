
ArrayList<Pills> pills;

Player player;
int mG;
int alpha;

void setup(){
  noStroke();
  mG = 0;
  alpha = 255;
  size(500,500);
  pills = new ArrayList<Pills>();
  pills.add(new Pills(random(0,width-10),random(50,height-5)));
  player = new Player();
}

void draw(){
  if (player.getLife() > 0)
  {
    fill(100,100,155,alpha);
    rect(0,0,width,height);
    player.update();
    pills.get(0).update();
    if (pills.get(0).collide()){
      mG+=5;
      pills.remove(0);
      alpha-=20;
      if (alpha<10)
        alpha =10;
      pills.add(new Pills(random(0,width-10),random(50,height-5)));
      player.giveLife(20);
      player.decreaseSpeed();
    }
    meter();
  }
  
  else
  {
    fill(0);
    rect(0,0,width,height);
    textSize(18);
    fill(255);
    alpha = 255;
    text("You crashed. \nThere is no winning.\nPlease stop. \n(or hit space)",width/2-60,height/2-40);
    if (keys[4])
      player.reset();
  }
  
}

void meter(){
  fill(0);
  rect(0,0,width,50);
  fill(255);
  textSize(12);
  text("David's High: ", 10,15);
  fill(0,255,0);
  if (player.getLife() < 50)
    fill(255,255,0);
  if (player.getLife() < 20)
    fill(255,0,0);
  rect(90,5,player.getLife()*3.7,15);
  text(mG+" mgs", 30,30);
}

class Pills{
  Pills(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void update()
  {
    fill(255,102,0);
    rect(x,y,15,5);
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
  
  boolean collide(){
    if ((x < player.getX()+30 && x > player.getX())
    && (y < player.getY()+30 && y > player.getY()))
    return true;
    else return false;
  }
  
  private float x,y;
}
class Player{
  Player()
  {
    life = 100;
    x = 10;
    y = 60;
    speed = 2.5;
  }
  
  void update()
  {
    rectMode(CORNER);
    fill(255);
    rect(x,y,30,30);
    life-=.15;
    move();
  }
  
  void move()
  {
    if (keys[0])
      x-=speed;
    if (keys[1])
      y-=speed;
    if (keys[2])
      x+=speed;
    if (keys[3])
      y+=speed;
  }
  
  void giveLife(float health)
  {
    life+= health;
    if (life > 100)
      life = 100;
  }
  
  float getLife()
  {
    return life;
  }
  
  float getX()
  {
    return x;
  }
  
  float getY()
  {
    return y;
  }
  
  void decreaseSpeed()
  {
    speed-=.15;
    if (speed < 1)
      speed = 1;
  }
  
  void reset()
  {
    life = 100;
    mG = 0;
    speed = 2.5;
  }
  
  
  
  private float x,y;
  private float speed;
  private float life;
}
boolean[] keys = new boolean[5];

void keyPressed()
{
  print(keyCode);
  if (keyCode == 37)
    keys[0] = true;
  if (keyCode == 38)
    keys[1] = true;
  if (keyCode == 39)
    keys[2] = true;
  if (keyCode == 40)
    keys[3] = true;
  if (keyCode == 32)
    keys[4] = true;
  
}

void keyReleased()
{
   if (keyCode == 37)
    keys[0] = false;
  if (keyCode == 38)
    keys[1] = false;
  if (keyCode == 39)
    keys[2] = false;
  if (keyCode == 40)
    keys[3] = false;
  if (keyCode == 32)
    keys[4] = false;
  
}




