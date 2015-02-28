

Particle[] p= new Particle[10];
Particle2 p2;
pistol[] pi= new pistol[100];
Background b; 
ammo[] ammo= new ammo[10];
Floor[] fl= new Floor[50];
Level1 L1;
PImage img;
boolean mousepress;
boolean gunP,gunMG,gunSG;
boolean alive=true;
float d, xv, retsize, dret, Max, Min, grav;
float x2 = 200;
int timer;
int clip;
int DelayMG, DelaySG, delayP, lives, score, highscore;
PFont fontA;
void setup() {
   size(900,600,P3D);
   fill(32,200,205);
   background(255);
   noCursor();
   img = loadImage("codebackground.jpg");
   //frameRate(60);
   lives=3;
  mousepress=false;
  timer=0;
  grav=.251111;
  fontA = loadFont("Helvetica-48.vlw");
  textFont(fontA, 20);
   for(int a=0; a<ammo.length; a++)
   {
   ammo[a] = new ammo();
   }
   b= new Background();
   //p2=Player1
   p2 = new Particle2();
   //p=flying enemy
   for (int i=0; i<p.length; i++) {
   p[i]= new Particle(); 
   }
   //bullets
   for (int j=0; j<pi.length; j++) {
   pi[j] = new pistol();
   }
   //platforms
   for (int f=0; f<fl.length; f++) {
    fl[f] = new Floor(); 
   }
   //level one
      L1= new Level1();
   d=10;
   gunP=true;
   gunMG=false;
   gunSG=false;
   clip=0;
   DelayMG=6;
   DelaySG=30;
   delayP=12;

}

void draw() {
  //this zooms in the camera
  
camera(x2, height/2.0, (height/2.0) / tan(PI*60.0 / 360.0),
x2, height/2.0, 0,
0, 1, 0);
//this slows down the player's speed
p2.xv/=1.2;
//this is the timer
timer += 1;
if (score >highscore){
 highscore=score; 
}
//this draws the backround
b.draw();
//this is the player
   if (alive && lives >0) {
p2.draw();
}
else {
  score=0;
  lives-=1;
  p2= new Particle2();
}
//this makes the single shot come back when your run out of other upgrades
if (mousepress == true && gunMG)
{
  if (clip == 30)
    {
      gunP=true;
      gunMG=false;
    }
}
if (mousepress == true && gunSG)
{
  if (clip == 8)
    {
      gunP=true;
      gunSG=false;

    }
}
//this sets the level and draws the platforms
L1.Set();
   for (int f=0; f<fl.length; f++) {
       if (fl[f].x <= x2+width/2 && fl[f].x+fl[f].W >= x2-width/2)
  {
   fl[f].onscreen=true; 
  }
  else 
  {
   fl[f].onscreen=false;
  }
     if (fl[f].drew && fl[f].onscreen){
     fl[f].draw();
     }
   }
//these are the powerups
for(int a=0; a<ammo.length; a++)
{
if (ammo[a].dropped)
{
  ammo[a].draw();
}
}
//these are the player's bullets
    for (int j=0; j<pi.length; j++) {
      pi[j].fire(j);
    if (pi[j].fired) {
pi[j].draw();
}
      
  }
//this is the flying enemy
for (int i=0; i<p.length; i++) {
  if (!p[i].shot)
  {
  p[i].draw();
  }
  if (p[i].shot)
  {
  p[i]=new Particle();
  }

}
//heads up display
hud();
ret();
}
//cross hairs
void ret(){
     Max=constrain(Max,0, 100);
  stroke(255,0,0,255);
  strokeWeight(2);
  fill(0,0,0,0);
    ellipse(mouseX-width/2+x2,mouseY,Max,Max); 
Min=dist(p2.x3,p2.y3,mouseX-width/2+x2,mouseY)/10;
  if (gunP){
    if (Max>Min){
    Max-=.7;
    }
    else if(Max < Min)
    {
      Max=Min;
    }
  }
  
  if (gunMG){
    Min=dist(p2.x3,p2.y3,mouseX-width/2+x2,mouseY)/7;
          if (mousepress)
  {

  }
       if (Max>Min){
    Max-=2;
    }
        else if(Max < Min)
    {
      Max=Min;
    }
  }
  if (gunSG){
    Min=dist(p2.x3,p2.y3,mouseX-width/2+x2,mouseY)/3;
          if (mousepress)
  {

  }
       if (Max>Min){
    Max-=2;
    }
        else if(Max < Min)
    {
      Max=Min;
    }
  }

}
void hud(){
   noStroke();
  fill(255,0,0,255);
  rect(x2-width/2,0,p2.health,10);
  fill(0,0,0,255);
  text("Lives: " +lives, x2-width/2, 25);
  text("Highscore: " +highscore, x2-width/2,40);
  text("Score: " +score, x2-width/2, 55); 
}
void keyPressed() { 
p2.movePressed();
} 
 
void keyReleased() { 
p2.moveReleased();
}
void mousePressed() {
  mousepress=true;
}
void mouseReleased() {
  mousepress=false;
}






class Particle
{
  float gravity = 9.80665;
  float x, y, r;
  float velocityY;
  float velocityX;
  float life;
  float speed;
  boolean shot;
  Particle()
  {
    r = 50;
    x = random(x2-(width/2)-r, x2+(width/2)+r);
    if (x>x2)
    {
      x=x2+(width/2)+r;
    }
    else {
     x=x2-(width/2)-r; 
    }
    y = random(-r,height+r);
    velocityY = 0.0;
    velocityX = 0.0;
    shot = false;
    speed=random(6000,9000);
    life =255-speed/35.295;
  }
void collide()
{
	velocityX *=-1;
    	velocityY *=-1;

}
  void draw()
  {
    noStroke();
    fill(life, life, life*15, 255);
    life-=0;
    velocityX = velocityX/1.002 +(x2-x)/speed;
    velocityY += (p2.y2-y)/speed;
    y += velocityY;
    x += velocityX;
    velocityX /= 1.01;
    velocityY /= 1.01;
    if (dist(p2.x3,p2.y3,x,y) < r/2) 
  {
    velocityX += (p2.x3-p2.px3)/2;
    velocityY += (p2.y3-p2.py3)/2;
  }  
if (x2+p2.fat/2 >= x-r/2 
    && x2-p2.fat/2 <= x+r/2 
    && p2.y2-p2.tall/2 <= y+r/2 
    && p2.y2+p2.foot >= y+r/2)
    {
     p2.health-=1; 
    }
    ellipse(x,y,r,r);
    for (int j=0; j<pi.length; j++) {
    if (dist(pi[j].x, pi[j].y, x, y) <= r/2)
    {
    shot();
    pi[j].fired=false;
    pi[j].y=-700;
    }
    }
  }
  void shot()
  {
    score+=1;
    for(int a=0; a<ammo.length; a++)
    {

      if(!shot){
  if (!ammo[a].dropped){
  ammo[a].dropped = true;
  ammo[a].x=x;
  ammo[a].y=y;
  ammo[a].type=(random(0,100));
  ammo[a].life=9;
  ammo[a].OP=255;
  shot = true;
  }

  }
  ammo[a].life-=1;
}
  }
}
class pistol {
  float d;
  float vx;
  float vy;
  float x;
  float y;
  float xx;
  float yy;
  float a;
  float a2;
  float accx, accy, acca;
  boolean fired;
  int j;
pistol(){
fired= false;
d=30;

 } 
 void draw()
 {
    if (y > width+d - d) {
      y=-700;
fired=false;
    }
    if (y < d-d) {
      y=-700;
fired=false;
    }
    if (x > x2+width/2) {
     y=-700;
fired=false;
    }
    if (x < x2-width/2) {
      y=-700;
fired=false;
    }
  xx = (x + cos(a2) * 50);
  yy = (y + sin(a2) * 50);
strokeWeight(5);
stroke(255,0,0);
ellipse(10,10,10,10);
fill(0);
   vx=(xx-x)/3;
   vy=(yy-y)/3;
line (x,y,xx,yy);
x+=vx;
y+=vy;
}
void fire(int j) {

  if(!fired && alive){
  if(gunP && mousepress && timer > delayP)
  {
    a=p2.angle2;
    accur();
    fired=true;
    x=p2.x3; 
    y=p2.y3;
    Max += 5;
    mousepress=false;
    timer=0;
    }
  if(gunMG && mousepress && timer >DelayMG && clip <= 30)
    {
    a=p2.angle2;
    accur();
    fired=true;
    x=p2.x3; 
    y=p2.y3;
    Max += 5;
    clip +=1;
    timer=0;
    }
        if (gunSG && mousepress && timer > DelaySG && clip <=9)
       {
    for (int sg=0; sg<5; sg++) {
    pi[j].a=p2.angle2;
    pi[j].accur();
    pi[j].fired=true;
    pi[j].x=p2.x3; 
    pi[j].y=p2.y3;
    j++;
    }
    clip +=1;
    Max += 5;
    timer=0;
    mousepress=false;
       }
  }
}

void accur(){
    accx=random(-Max/2, Max/2);
    accy=random(-Max/2, Max/2);
    acca=atan2(mouseY-p2.y+accy, (mouseX-width/2+x2) - p2.x+accx); 
    a2=acca;
}
}


class Floor
{
float x,y,H,W;
boolean drew, onscreen;
Floor()
{
  onscreen=false;
  drew=false;
}
void draw() {
  stroke(100);
  fill(100);
  strokeWeight(2);
  rect(x,y,W,H);
  for(int a=0; a<ammo.length; a++)
  {
  if (ammo[a].x >= x && ammo[a].x <= x+W && ammo[a].y >= y && ammo[a].y <= y+H){
    ammo[a].stopp=true;
    ammo[a].y=y;
  }
  else {
   ammo[a].stopp=false; 
  }
  }
  for (int i=0; i<p.length; i++) {
  if (p[i].x+p[i].r/2 >= x 
  && p[i].x-p[i].r/2 <= x+W 
  && p[i].y+p[i].r/2 >= y 
  && p[i].y+p[i].r/2 <= y+H)
  {
   //p[i].collide(); 
  }
  }
  //just trust me on this one, this works. nevermind.. YAY NOW IT WORKS!
  if (x2+p2.fat/2 >= x 
  && x2-p2.fat/2 <= x+W 
  && p2.y2-p2.tall/2 <= y+H 
  && p2.y2+p2.foot >= y)    {
    
 if (x2 <= x || x2 >= x+W) {
   if ((p2.y2+p2.foot >= y+8 && p2.y2-p2.tall/2 <= y+W) 
   || p2.y2 -p2.tall/2 >= y+W-8 && p2.y2 + p2.foot<= y+H)
   {
     p2.xv*=-0.5;
     if(x2<=x){
     x2=x-p2.fat/2;
     }
     else {
      x2=x+W+p2.fat/2; 
     }
   }
   }

 if (x2 + p2.fat/2 >= x+8 && x2 - p2.fat/2 <= x+W-8){
 if (p2.y2+p2.foot >= y+8 && p2.y2-p2.tall/2 <= y)
   {
    p2.y2=y-p2.foot; 
   }
 }
    if (p2.y2+p2.foot <= y+8){
     p2.y2=y-p2.foot;
     p2.yv=0;
    }

    if (p2.y2-p2.tall/2 >= y+H-10){
    p2.y2=y+H+p2.tall/2;
    p2.yv*=-1;
  }
}
}
}
class Level1 {
  boolean ran;
Level1(){
  boolean ran=false;
}
void Set(){
  if (!ran){
fl[1].x=0;
fl[1].y=0;
fl[1].H=601;
fl[1].W=100;
fl[1].drew=true;
fl[2].x=450;
fl[2].y=370;
fl[2].H=30;
fl[2].W=100;
fl[2].drew=true;
fl[3].x=800;
fl[3].y=200;
fl[3].H=30;
fl[3].W=100;
fl[3].drew=true;
fl[4].x=900;
fl[4].y=400;
fl[4].H=201;
fl[4].W=400;
fl[4].drew=true;
fl[5].x=1600;
fl[5].y=200;
fl[5].H=30;
fl[5].W=300;
fl[5].drew=true;
fl[6].x=1900;
fl[6].y=400;
fl[6].H=200;
fl[6].W=100;
fl[6].drew=true;
fl[7].x=2000;
fl[7].y=0;
fl[7].H=601;
fl[7].W=100;
fl[7].drew=true;
fl[8].x=100;
fl[8].y=500;
fl[8].H=101;
fl[8].W=200;
fl[8].drew=true;
fl[9].x=800;
fl[9].y=500;
fl[9].H=101;
fl[9].W=100;
fl[9].drew=true;
ran=true;
  }
}
}
  
class Particle2 {
float x,y,y2,y22,
segLength,angle1,
angle2,dx,dy,tx,
ty,yv,px3,py3,x3,
y3,xv, foot,health;

int tall,fat;
  boolean up=false; 
  boolean down=false; 
  boolean left=false; 
  boolean right=false;
  boolean landed=false;
  boolean hitside=false;
  boolean runonceup=false;
  boolean runoncedown=false;
Particle2() {
  strokeWeight(20.0);
  strokeJoin (ROUND);
  stroke(0, 100);
x = 100;
y = 100;
tall=100;
fat=30;
segLength = 25;
health = 255;
if (lives >0){
alive=true;
}
if (lives <0){
alive=false;

}
}

void draw() {
y22 = y2;
x2-=xv;
if (!landed){
y2+=yv;
foot=tall/2+30;
}
if (health <0) {
 alive=false;
}
if (y2+foot<height && yv <8){
yv += grav;
}
if (y2+foot >= height) {
 landed=true;
 y2=height-foot+1;
}
else {
 landed=false; 
}
  stroke(0,100);
  dx = mouseX-width/2+x2 - x;
  dy = mouseY - y;
  angle1 = atan2(dy, dx);    
  tx = (mouseX-width/2+x2) - cos(angle1) * segLength;
  ty = mouseY - sin(angle1) * segLength;
  dx = tx - x2;
  dy = ty - y2;
  angle2 = atan2(dy, dx); 
  x = x2 + cos(angle2) * segLength;
  y = y2 + sin(angle2) * segLength;
    noStroke();
    fill(239,208,207);
    rect(x2-fat/2,y2-(tall/2),fat,tall+30);
    strokeWeight(10.0);
    stroke(0, 255);
    px3=x3;
    py3=y3;
    x3= segLength * cos(angle1) +x;
    y3= segLength * sin(angle1) +y;
line(x2,y2,x,y);
line(x,y,x3,y3);
 if(up){ 
    if (y2==y22) {
      if (!runonceup){
      p2.y2-=5;
      p2.yv = -10;
      }
      runonceup=true;
    }
    } 
    if(down){
     if(!runoncedown){ 
      tall=50;
      landed=false;
     }
     runoncedown=true;
    }
   else 
  {
   tall=100;
   
  } 
    if(left){ 
      if(!down){
      xv += 1;
      }
      else {
       xv +=.5; 
      }
  } 
    if(right){ 
      if(!down){
      xv -= 1;
    }
   else {
    xv-=.5;
   } 
    }

}

  void movePressed(){ 
    //copied from some site
    switch(key){ 
    case'w': 
    case'W': 
      up=true; 
      break; 
    case's': 
    case'S': 
      down=true; 
      break; 
    case'a': 
    case'A': 
      left=true; 
      break; 
    case'd': 
    case'D': 
      right=true; 
      break; 
    } 
  } 
 
  void moveReleased(){ 
    switch(key){ 
    case'w': 
    case'W': 
      up=false;
     runonceup=false; 
      break; 
    case's': 
    case'S': 
      down=false; 
      runoncedown=false;
      if(landed || yv<=1)
      {
        y2-=30;
      }
      break; 
    case'a': 
    case'A': 
      left=false; 
      break; 
    case'd': 
    case'D': 
      right=false; 
      break; 
    } 
  } 
}

class ammo
{
float x,y,d,type;
boolean MG;
boolean SG;
boolean dropped,stopb,stopp;
int Fill;
float life;
float OP;
String T;
ammo()
{
  d=15;
  dropped=false;
  stopb=false;
  stopp=false;
  life=9;
  OP=255;
}
void type(float t)
{
type=t;

}
void draw()
{
  if (y>=height-d/2)
  {
    y=height-d/2;
    stopb=true;
  }
  else {
   stopb=false; 
  }
  life/=1.003;
  if (life<2){
    OP-=5;
  }
if (life<=0 || OP <=0)
{
 dropped=false;
}
    
if(type>=15)
  {
    MG=true;
    SG=false;
    T= "RF";
  }
  if(type<15)
  {
   T= "SS";
   SG=true; 
   MG=false;
  }
  if(type>30)
  {
   MG=false;
   SG=false;
   T="";
  }
  if (!stopb && !stopp)
  {
  y+=3;
  }
 if (MG)
{
 if (x<= x2+15+d/2 && x>= x2-15-d/2 && y<=p2.y2+p2.foot+d/2 && y>=p2.y2-p2.tall/2-d/2)    {
     dropped=false;
     gunMG=true;
     gunP=false;
     gunSG=false; 
     clip=0;
     life=9;
}
}
if (SG)
{
 if (x<= x2+15+d/2 && x>= x2-15-d/2 && y<=p2.y2+p2.foot+d/2 && y>=p2.y2-p2.tall/2-d/2)    {
     dropped=false;
     gunMG=false;
     gunP=false;
     gunSG=true; 
     clip=0; 
     life=9;
}
}

fill(Fill,Fill,Fill,OP);
noStroke();
text(T,x-d/2,y-d/2);
}
}
class Background {
float x;
float y;

Background()
{
  
}
void draw()
{
 background(255);
 image (img, 450, 0);

 
 
}
}


