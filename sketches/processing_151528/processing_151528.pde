
int bob;
int num;
int shot;
int spawn;
PVector Player;
PVector Speed;
float G2GF;
ArrayList<enemy> farm;
ArrayList<bullet> hell;//Bullet hell... get it XD
class enemy
{
   PVector pos;
  PVector Speed;
  enemy(PVector p, PVector s)
  {
    pos = p;
    Speed = s;
  }
 void Update()
 {
   PVector t = new PVector(Player.x-pos.x, Player.y-pos.y);
   t.normalize();
   t.mult(3);
   pos.add(t);
   fill(19,70,4);
   rect(pos.x,pos.y,25,25);
 }
}
class bullet
{
  PVector pos;
  PVector Speed;
  bullet(PVector p, PVector S)
  {
    pos = p;
    Speed = S;
  }
 void Update()
 {
   pos.add(Speed);
   fill(38,160,250);
   ellipse(pos.x,pos.y,25,25);
 }
}
void setup()
{
size(800,800);
Player = new PVector (400, 400);
Speed = new PVector (0,0);
hell = new ArrayList<bullet>();
farm = new ArrayList<enemy>();
G2GF = 4;
shot = 0;
spawn = 0;
num = 0;
bob = 0;
}
 
 void PlayerUpdate()
 {
 
       stroke(250,0,0);
      line(Player.x,Player.y,pmouseX,pmouseY);
  if(mouseButton == RIGHT && shot <= 0)
    {
      shot = 5;
      float x = mouseX-Player.x;
      float y = mouseY-Player.y;
      PVector p = new PVector(Player.x, Player.y);
      PVector s = new PVector (x,y);
      s.normalize();
      s.mult(10);
      bullet b = new bullet (p, s);
      hell.add(b);
    }
    fill(240,109,155);
  ellipse(Player.x,Player.y,20,20);
  {
    if(key == 'w' || key == 'W')
    {
      Speed.add (new PVector (0,-.8));
    }
    if(key == 's' || key == 'S')
    {
      Speed.add (new PVector (0,.8));
    }
    if(key == 'a' || key == 'A')
    {
      Speed.add (new PVector (-.8,0));
    }
    if(key == 'd' || key == 'D')
    {
      Speed.add (new PVector (.8,0));
    }
    if (Speed.x > G2GF)
      Speed.x = G2GF;
       if (Speed.x < -G2GF)
      Speed.x = -G2GF;
       if (Speed.y > G2GF)
      Speed.y = G2GF;
       if (Speed.y < -G2GF)
      Speed.y = -G2GF;
      Speed.mult (.95);
      Player.add (Speed);
      if (Player.x > 810)
      Player.x = -10;
      if (Player.x < -10)
      Player.x = 810;
      if (Player.y > 810)
      Player.y = -10;
      if (Player.y < -10)
      Player.y = 810;
  }
 }
 void enemyUpdate ()
 {
   float x = 0;
   int r3;
   int d2;
      float y = 0;
      float r = random(0,3);
      r3=int(r);
      if (r3 == 0)
      {
        float r2 = random(0,800);
        //d2=int(r2);
        y=0;
        x=r2;
      }
       if (r3 == 1)
      {
        float r2 = random(0,800);
         //d2=int(r2);
        y=r2;
        x=800;
      }
       if (r3 == 2)
      {
        float r2 = random(0,800);
        // d2=int(r2);
        y=800;
        x=r2;
      }
       if (r3 == 3)
      {
        float r2 = random(0,800);
        // d2=int(r2);
        y=r2;
        x=0;
      }
      PVector p = new PVector(x,y);
      PVector s = new PVector (0,0);
   enemy c = new enemy (p,s);
   farm.add(c);
 }
 
void draw()
{
  background(255,255,255);
  shot--;
  spawn--;
  PlayerUpdate();
   for (int i = hell.size()-1; i >= 0; i--) {
    bullet b = hell.get(i);
    b.Update();
    //if (ball.finished()) {
      // Items can be deleted with remove().
     // balls.remove(i);
     for (int j = farm.size()-1; j >= 0; j--) {
    enemy c = farm.get(j);
    if(b.pos.y > c.pos.y - 12.5 && b.pos.y < c.pos.y + 12.5 && b.pos.x > c.pos.x - 12.5 && b.pos.x < c.pos.x + 12.5)
      {
        float r3;
        float x = 0;
        float y = 0;
      float r = random(0,3);
      r3=int(r);
      if (r3 == 0)
      {
        float r2 = random(0,800);
        //d2=int(r2);
        y=0;
        x=r2;
      }
       if (r3 == 1)
      {
        float r2 = random(0,800);
         //d2=int(r2);
        y=r2;
        x=800;
      }
       if (r3 == 2)
      {
        float r2 = random(0,800);
        // d2=int(r2);
        y=800;
        x=r2;
      }
       if (r3 == 3)
      {
        float r2 = random(0,800);
        // d2=int(r2);
        y=r2;
        x=0;
      }
      c.pos.x = x;
      c.pos.y = y;
      }
    }
    }
    if(num < 150)
    enemyUpdate();
   for (int i = farm.size()-1; i >= 0; i--) {
    enemy c = farm.get(i);
    if(Player.y > c.pos.y - 12.5 && Player.y < c.pos.y + 12.5 && Player.x > c.pos.x - 12.5 && Player.x < c.pos.x + 12.5)
    {
      bob++;
    }
    if (bob > 1)
    {
      text("GAME OVER MAN", 400,400);
    }
    c.Update();
    num++;
    //if (ball.finished()) {
      // Items can be deleted with remove().
     // balls.remove(i);
    }
   }


