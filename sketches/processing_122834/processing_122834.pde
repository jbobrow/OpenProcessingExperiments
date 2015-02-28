
Hero Snap;
Monster grr;
Monster hap;
Monster bleh;
Monster leader;
Monster grom;
Monster krie;

PImage img;
int speed; 
float x;
float y;

void setup()  {
size(800,700);
img = loadImage("graveyard.jpg");
speed= 1;

Snap = new Hero(200,500);
grr = new Monster(x=random(width),y=random(width),speed);
hap = new Monster(x=random(width),y=random(width),speed);
bleh = new Monster(x=random(width),y=random(width),speed);
leader= new Monster (x=random(width),y=random(width),speed);
grom = new Monster(x=random(width),y=random(width),speed);
krie = new Monster(x=random(width),y=random(width),speed);
}

void draw(){
background(img);

y++;
if (y > height) {
 y = 0;
}


Snap.updateHero();
Snap.tekenHero();

grr.updateMonster();
grr.testMonster();
grr.tekenMonster();
grr.returnMonster();

hap.updateMonster();
hap.testMonster();
hap.tekenMonster();
hap.returnMonster();

bleh.updateMonster();
bleh.testMonster();
bleh.tekenMonster();
bleh.returnMonster();

leader.updateMonster();
leader.testMonster();
leader.tekenMonster();
leader.returnMonster();

grom.updateMonster();
grom.testMonster();
grom.tekenMonster();
grom.returnMonster();

krie.updateMonster();
krie.testMonster();
krie.tekenMonster();
krie.returnMonster();

if(grr.death == true || hap.death == true || bleh.death == true || leader.death == true || grom.death == true || krie.death == true){
  noLoop();
}
}

class Hero{

int X;
int Y;

PImage Hero;

int y;


Hero(int tempx, int tempy){
X=tempx;
Y=tempy;
Hero = loadImage("Hero.png");
}

void updateHero(){
 X = mouseX;
 Y=mouseY;
}

void tekenHero(){
image (Hero,X,Y);
Hero.resize (100,100);
}

}
 
class Monster{

float X;
float Y;
float speed;  // botstbal
boolean death;

PImage Enemy;

Monster(float tempx, float tempy, float tempspeed){
X=tempx;
Y=tempy;
speed=tempspeed;
Enemy = loadImage("Enemy.png");
}

void updateMonster(){
 Y = Y + speed;
}
  
 void testMonster(){ 
 if (Y>=height); {
    
 }
 }

void returnMonster(){
if (Y>= height + 100){
  Y = 0 - 100;
}
  }


void tekenMonster(){
image(Enemy,X,Y);
Enemy.resize (100,100);
}

 
 
 void deathHero(){
  if (Snap.X+50 >= X-50 && Snap.X-50 <= X+50 && Snap.Y+50 >= Y-50 && Snap.Y-50 <= Y+50){
    death=true;
  }
 }}



