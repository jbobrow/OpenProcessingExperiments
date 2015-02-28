
float level;
int i;
 
mainCharacter m;
bluetile[] bt;
greentile[] gt;
bluegreentile[] bgt;
finishline[] fl;
sgreen[] sg;
whitetile[] wt;
orangetile[]ot;
redtile[]rt;
Enemy[]e;
greencircle[]gc;
 
boolean leftkey, rightkey, upkey, downkey, hit, akey, skey;
 
// float y;
PFont font;
 
void setup ()
{
  size (500,500);
  smooth();
  level = 0;
  font = loadFont("AharoniBold-50.vlw");
 
  m = new mainCharacter();
  m.mf = #0000FF;
  m.mx = m.my = 50;
 
  bt = new bluetile [24];
  gt = new greentile[24];
  bgt = new bluegreentile[24];
  fl = new finishline [10];
  sg = new sgreen [5];
  wt = new whitetile [24];
  ot = new orangetile [24];
  rt = new redtile [24];
  e = new Enemy [2];
  e[0] = new Enemy();
  e[0].ex = e[0].ey = 400;
  e[0].esizex = e[0].esizey = 30;
  gc = new greencircle [10];
  //gc[0].gcx = fl[0].flx;
  //gc[0].gcy = 450;
  gc[1].gcx = 50;
  gc[1].gcy = 175;
 
  leftkey = false;
  rightkey= false;
  upkey= false;
  downkey= false;
  akey=false;
  skey=false;
}
 
void draw()
{
  if (level == 0)
  {
    intro();
  }
  else if (level == 0.5)
  {
    leveli();
  }
  else if (level == 1)
  {
    level1();
  }
  else if (level == 2)
  {
    level2();
  }
  else if (level == 3)
  {
    level3();
  }
  else if (level == 5)
  {
  level5();
  }
}
 
// INTRO SCREEN: IT'S INTRO TIME //////////////////////////
 
void intro()
{
  background (0,0,255);
  noStroke();
  fill (0,255,0);
  rect (25,25, 450,450);
  textFont (font, 32);
  fill (255);
  text ("GAME!", 50,75);
  textFont (font, 25);
  text ("Click here to start the game.", 50, 200);
  text ("Click here for instructions.",50,250);
  if (mousePressed)
  {
    if (mouseY<250) level = 1;
    if (mouseY>250) level = 0.5;
  }
}
 
// THE NECESSARY INSTRUCTIONS ////////////////////////////
void leveli()
{
  background (0,0,255);
  //noStroke();
  fill (0,255,0);
  rect (25,25, 450,450);
  fill (255);
  text ("Move to finish line with arrow keys.",50,75);
  text ("You can't cross green if you're blue",50,120);
  text ("Unless you're blue green",50,165);
  text ("You can't cross red or orange", 50,200);
}
 
// LEVEL ONE! IT'S A DOOZY! //////////////////////////////
void level1()
{
  background (255,255,128);
 
  bt[0] = new bluetile();
  bt[0].btx = bt[0].bty = 25;
  bt[0].btsizex = 225;
  bt[0].btsizey = 450;
  //bt[0].btf = (#0000FF);
  bt[0].makebluetile();
 
  gt[0] = new greentile();
  gt[0].gtx = 250;
  gt[0].gty = 25;
  gt[0].gtsizex = 225;
  gt[0].gtsizey = 450;
  //gt[0].gtf = (#00FF00);
  gt[0].makegreentile();
 
  bgt[0] = new bluegreentile();
  bgt[0].bgtx = 25;
  bgt[0].bgty = 350;
  bgt[0].bgtsizex = 450;
  bgt[0].bgtsizey = 125;
  //bgt[0].bgtf = (#00FFFF);
  bgt[0].makebluegreentile();
 
  m.createMain();
  m.moveMain();
 
  if (m.mf ==#0000FF)
  {
    if (m.mx>gt[0].gtx-16)
    {
      m.mx= gt[0].gtx-16;
    }
    else if (m.my>bgt[0].bgty-16)
    {
      m.mf= #00FFFF;
    }
  }
 
  if (m.mf == #00FFFF)
  {
    if (m.my<bgt[0].bgty)
    {
      m.mf = #0000FF;
    }
    if (m.my<bgt[0].bgty && m.mx>gt[0].gtx)
    {
      m.mf = #00FF00;
    }
  }
 
  if (m.mf == #00FF00)
  {
    if (m.mx<gt[0].gtx+16)
    {
      m.mx = gt[0].gtx+16;
    }
    else if (m.my>bgt[0].bgty-16)
    {
      m.mf= #00FFFF;
    }
  }
 
  fl[0] = new finishline();
  fl[0].flx = 425;
  fl[0].fly = 50;
  fl[0].flsizex = fl[0].flsizey = 25;
  fl[0].makefinishline();
  //rect (425,50,25,25);
  //if (m.mx> 425-16 && m.mx<425+16 && m.my>50-16 && m.my< 50+25+16) level = 2;
  if (dist(m.mx,m.my-16, fl[0].flx,fl[0].fly) < 16)
  {
    level = 2;
    m.mf = #0000FF;
  }
 
  text ("Level 1", 410,20);
}
 
// LEVEL 2! FREE THE GREEN CIRCLES /////////////////////////
void level2()
{
  background (255,255,128);
  gt[1] = new greentile();
  gt[1].gtx = 25;
  gt[1].gty = 25;
  gt[1].gtsizex = 300;
  gt[1].gtsizey = 100;
  gt[1].makegreentile();
 
  bt[1] = new bluetile();
  bt[1].btx = 325;
  bt[1].bty = 25;
  bt[1].btsizex = 150;
  bt[1].btsizey = 100;
  bt[1].makebluetile();
 
  bgt[2] = new bluegreentile();
  bgt[2].bgtx = 25;
  bgt[2].bgty = 125;
  bgt[2].bgtsizex = 300;
  bgt[2].bgtsizey = 50;
  bgt[2].makebluegreentile();
 
  bgt[1] = new bluegreentile();
  bgt[1].bgtx = 325;
  bgt[1].bgty = 125;
  bgt[1].bgtsizex = 150;
  bgt[1].bgtsizey = 50;
  bgt[1].makebluegreentile();
 
  gt[2] = new greentile();
  gt[2].gtx = 25;
  gt[2].gty = 175;
  gt[2].gtsizex = 300;
  gt[2].gtsizey = 300;
  gt[2].makegreentile();
 
  bt[2] = new bluetile();
  bt[2].btx = 325;
  bt[2].bty = 175;
  bt[2].btsizex = 150;
  bt[2].btsizey = 300;
  bt[2].makebluetile();
 
  m.createMain();
  m.moveMain();
 
  if (m.mf == #0000FF)
  {
    if (m.mx<325+16 /*&& m.mx>325+10 */&& m.my <125+16)
    {
      m.mx=325+16;
    }
    if (m.mx<325+16 && m.my >150)
    {
      m.mx=325+16;
    }
    if (m.my>125)
    {
      m.mf = #00FFFF;
    }
  }
  if (m.mf == #00FFFF)
  {
    if (m.my>150+16 && m.mx>325 || m.my<100+16 && m.mx>325)
    {
      m.mf = #0000FF;
    }
    if (m.my>150+16 && m.mx<325 || m.my<100+16 && m.mx<325)
    {
      m.mf = #00FF00;
    }
  }
  if (m.mf == #00FF00)
  {
    if (m.my>125+16 && m.my<175-16 && m.mx<325)
    {
      m.mf = #00FFFF;
    }
    if (m.mx>325-16) m.mx=325-16;
  }
   
  fl[1] = new finishline();
  fl[1].flx = 50;
  fl[1].fly = 50;
  fl[1].flsizex = fl[1].flsizey = 25;
  fl[1].makefinishline();
  //rect (425,50,25,25);
  //if (m.mx> 425-16 && m.mx<425+16 && m.my>50-16 && m.my< 50+25+16) level = 2;
  if (m.mx <fl[1].flx + fl[1].flsizex && m.my<fl[1].fly + fl[1].flsizey)
  {
    level = 3;
    m.mf = #0000FF;
  }
 
  text ("Level 2", 410,20);
}
 
void level3()
{
  background (255,255,128);
  bt[3] = new bluetile();
  bt[3].btx = 25;
  bt[3].bty = 25;
  bt[3].btsizex = 100;
  bt[3].btsizey = 100;
  bt[3].makebluetile();
 
  bgt[3] = new bluegreentile();
  bgt[3].bgtx = 125;
  bgt[3].bgty = 25;
  bgt[3].bgtsizex = 100;
  bgt[3].bgtsizey = 100;
  bgt[3].makebluegreentile();
 
  bt[4] = new bluetile();
  bt[4].btx = 225;
  bt[4].bty = 25;
  bt[4].btsizex = 150;
  bt[4].btsizey = 100;
  bt[4].makebluetile();
 
  gt[3] = new greentile();
  gt[3].gtx = 375;
  gt[3].gty = 25;
  gt[3].gtsizex = 100;
  gt[3].gtsizey = 50;
  gt[3].makegreentile();
 
  bgt[4] = new bluegreentile();
  bgt[4].bgtx = 375;
  bgt[4].bgty = 75;
  bgt[4].bgtsizex = 100;
  bgt[4].bgtsizey = 50;
  bgt[4].makebluegreentile();
 
  gt[4] = new greentile();
  gt[4].gtx = 25;
  gt[4].gty = 125;
  gt[4].gtsizex = 100;
  gt[4].gtsizey = 100;
  gt[4].makegreentile();
 
  rt[1] = new redtile();
  rt[1].rtx = 125;
  rt[1].rty = 125;
  rt[1].rtsizex = 100;
  rt[1].rtsizey = 150;
  rt[1].makeredtile();
 
  ot[0] = new orangetile();
  ot[0].otx = 225;
  ot[0].oty = 125;
  ot[0].otsizex = 150;
  ot[0].otsizey = 100;
  ot[0].makeorangetile();
 
  gt[5] = new greentile();
  gt[5].gtx = 375;
  gt[5].gty = 125;
  gt[5].gtsizex = 100;
  gt[5].gtsizey = 100;
  gt[5].makegreentile();
 
  bgt[5] = new bluegreentile();
  bgt[5].bgtx = 25;
  bgt[5].bgty = 225;
  bgt[5].bgtsizex = 100;
  bgt[5].bgtsizey = 150;
  bgt[5].makebluegreentile();
 
  ot[1] = new orangetile();
  ot[1].otx = 125;
  ot[1].oty = 275;
  ot[1].otsizex = 100;
  ot[1].otsizey = 100;
  ot[1].makeorangetile();
 
  /*bt[5] = new bluetile();
  bt[5].btx = 225;
  bt[5].bty = 225;
  bt[5].btsizex = 150;
  bt[5].btsizey = 150;
  bt[5].makebluetile();*/
 
  bgt[6] = new bluegreentile();
  bgt[6].bgtx = 375;
  bgt[6].bgty = 225;
  bgt[6].bgtsizex = 100;
  bgt[6].bgtsizey = 150;
  bgt[6].makebluegreentile();
 
  bt[6] = new bluetile();
  bt[6].btx = 25;
  bt[6].bty = 375;
  bt[6].btsizex = 100;
  bt[6].btsizey = 100;
  bt[6].makebluetile();
 
  rt[0] = new redtile();
  rt[0].rtx = 125;
  rt[0].rty = 375;
  rt[0].rtsizex = 350;
  rt[0].rtsizey = 100;
  rt[0].makeredtile();
 
  if (m.mf == #0000FF)
  {
    if (m.mx > bgt[3].bgtx && m.mx <209 && m.my <125)
    {
      m.mf = #00FFFF;
    }
    if (m.mx > gt[3].gtx-16)
    {
      if (m.my<75-16) m.mx=gt[3].gtx-16;
      if (m.my>75-16 && m.my<125) m.mf=#00FFFF;
    }
    if (m.my>125-16)
    {
      m.my=125-16;
    }
  }
 
  if (m.mf == #00FFFF)
  {
    if (m.mx<gt[3].gtx+16 && m.mx > bt[4].btx && m.my < 125)
    {
      m.mf = #0000FF;
    }
    if (m.mx > bt[4].btx+16 && m.mx <bt[4].btx + bt[4].btsizex-16 && m.my <125)
    {
      m.mf = #0000FF;
    }
    if (m.mx<bt[4].btx && m.my >125-16) m.my = 125-16;
    if (m.mx<bgt[3].bgtx && m.my<125) m.mf=#0000FF;
    if (m.my<75 && m.mx>gt[3].gtx+16)
    {
      m.mf=#00FF00;
    }
    if (m.my>125 && m.mx>gt[3].gtx) m.mf=#00FF00;
    if (m.my<225+16 && m.mx>gt[3].gtx+16)m.mf=#00FF00;
    if (m.my>375-16) m.my=375-16;
  }
 
  if (m.mf == #00FF00)
  {
    if (/*m.my<75 && */m.mx<gt[3].gtx+16)
    {
      m.mx=gt[3].gtx+16;
    }
    if (m.my>75 && m.mx>gt[3].gtx && m.my<125)
    {
      m.mf=#00FFFF;
    }
    if (m.my>225-16) m.mf=#00FFFF;
  }
 
  sg[0] = new sgreen();
  if (akey==true)
  {
    sg[0].sgx = 25;
    sg[0].sgy = m.my-16;
    sg[0].sgsizex = m.mx-16;
    sg[0].sgsizey = 50;
    sg[0].makesgreen();
  }
  sg[1] = new sgreen();
  if (skey==true)
  {
    sg[1].sgx=m.mx-16;
    sg[1].sgy=m.my-16;
    sg[1].sgsizex=50;
    sg[1].sgsizey=475-m.my;
    sg[1].makesgreen();
  }
 
  e[0].makeEnemy();
  if (e[0].ey>275+16 && e[0].ex>175 && e[0].ex != sg[1].sgx+50) e[0].ex=e[0].ex-1;
  if (skey == true && e[0].ex > sg[1].sgx && e[0].ex <sg[1].sgx+50) e[0].ex = sg[1].sgx+50;
    if (akey == true && e[0].ey > sg[0].sgy && e[0].ey <sg[0].sgy+50)
       {e[0].ey = sg[0].sgy+50;
    if (e[0].ex>225-32) e[0].ex=225-32;}
  if (e[0].ex>475-32) e[0].ex=475-32;
  if (e[0].ex==175 && e[0].ey>175) e[0].ey = e[0].ey-1;
   
 
  m.createMain();
  m.moveMain();
  
  fl[3] = new finishline();
  fl[3].flx = 450;
  fl[3].fly = 175;
  fl[3].flsizex = fl[3].flsizey = 25;
  fl[3].makefinishline();
  if (m.mx >fl[3].flx && m.my>fl[3].fly)
  {
    level = 5;
    m.mf = #0000FF;
  }
 
  text ("Level 3", 410,20);
 
  /*sg[0] = new sgreen();
   if (dkey==true && rightkey==false)
   {
   sg[0].sgx=m.mx+16;
   sg[0].sgy=m.my+16;
   sg[0].sgsizex=100;
   sg[0].sgsizey=50;
   sg[0].makesgreen();
  /*100 100 150 100
   100
   150
   100
   }*/
}

void level5()
{
    background (0,0,255);
    fill (0,255,0);
    text( " YOU WON!!", 25,25);
}
 
// NO MORE LEVELS MADE BELOW HERE //////////////////////////
 
class mainCharacter
{
  float mx,my;
  int mf, mbx, mby;
  void createMain ()
  {
    fill (mf);
    stroke(255,255,0);
    ellipse (mx,my, 30,30);
  }
  void moveMain ()
  {
    if (leftkey == true)
    {
      mx=mx-5;
    }
    if (rightkey == true)
    {
      mx=mx+5;
    }
    if (upkey == true)
    {
      my=my-5;
    }
    if (downkey == true)
    {
      my=my+5;
    }
    if (m.mx<41) m.mx=41;
    if (m.mx>459) m.mx=459;
    if (m.my<41) m.my= 41;
    if (m.my>459) m.my = 459;
  }
}
 
void keyPressed ()
{
  if (keyCode == UP) upkey=true;
  if (keyCode == DOWN) downkey=true;
  if (keyCode == LEFT) leftkey=true;
  if (keyCode == RIGHT) rightkey=true;
  if (key == 'a') akey=true;
  if (key == 's') skey=true;
}
 
void keyReleased ()
{
  if (keyCode == UP) upkey=false;
  if (keyCode == DOWN) downkey=false;
  if (keyCode == LEFT) leftkey=false;
  if (keyCode == RIGHT) rightkey=false;
  if (key == 'a') akey=false;
  if (key == 's') skey=false;
}
 
class bluetile
{
  float btx,bty, btsizex, btsizey;
  //int btf;
  void makebluetile()
  {
    noStroke();
    fill (0,0,255);
    rect (btx,bty, btsizex, btsizey);
  }
}
 
class greentile
{
  float gtx,gty,gtsizex,gtsizey;
  //int gtf;
  void makegreentile()
  {
    noStroke();
    fill (0,255,0);
    rect (gtx,gty, gtsizex, gtsizey);
  }
}
 
class bluegreentile
{
  float bgtx, bgty, bgtsizex, bgtsizey;
  //int bgtf;
  void makebluegreentile()
  {
    noStroke();
    fill (0,255,255);
    rect (bgtx, bgty, bgtsizex, bgtsizey);
  }
}
 
class finishline
{
  float flx,fly,flsizex,flsizey;
  void makefinishline()
  {
    //fill(0,255,0);
    rect(flx,fly,flsizex,flsizey);
  }
}
 
class sgreen
{
  float sgx,sgy,sgsizex,sgsizey;
  void makesgreen()
  {
    noStroke();
    fill (0,255,0);
    rect (sgx,sgy,sgsizex,sgsizey);
  }
}
 
class whitetile
{
  float wtx,wty,wtsizex,wtsizey;
  void makewhitetile()
  {
    noStroke();
    fill (255,255,255);
    rect (wtx,wty,wtsizex,wtsizey);
  }
}
 
class orangetile
{
  float otx,oty,otsizex,otsizey;
  void makeorangetile()
  {
    noStroke();
    fill (255,128,0);
    rect (otx,oty,otsizex,otsizey);
  }
}
 
class redtile
{
  float rtx,rty,rtsizex,rtsizey;
  void makeredtile()
  {
    fill (255,0,0);
    rect (rtx,rty,rtsizex,rtsizey);
  }
}
 
class Enemy
{
  float ex,ey,esizex,esizey;
  void makeEnemy()
  {
    stroke(255,255,0);
    fill (255,0,0);
    rect (ex,ey,esizex,esizey);
  }
}
 
class greencircle
{
  float gcx,gcy;
  void makegreencircle()
  {
    stroke(255,50);
    fill (0,255,0);
    ellipse (gcx,gcy,50,50);
  }
}
                
