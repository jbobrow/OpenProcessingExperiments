
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer aplayer;
AudioInput ainput;

float sx = 400, sy = 500; 
boolean left = false, right = false, up = false, down = false;
ArrayList MeteorCol, SkudCol;
float spawnrate = 0.1, spawning = 0;
boolean shipalive = true;
int score = 0;
boolean lr = true;
float lrx, lry, lrsize = 0;
PImage rock, ship;
int mode = 1;
int shopslide;

//SHOP
int lrleft = 5;
float money = 100, hpmax = 20, hp = 20;

String[] toolnavn = {
  "HP", 
  "Repair Rate", 
  "Speed", 
  "Armor", 
  "Speed", 
  "Clipsize", 
  "Reload Speed", 
  "Multiplayer",
};
String[] tooltip = {
  "Increes your health cap by X.", 
  "Incress rapair by x/sec.", 
  "Incress movement speed by 0.5", 
  "Incress armoar by x%.", 
  "Incress colddown between shots.", 
  "Incress clipsize by X.", 
  "Decress reload time by X.", 
  "Incress the amount of money you get by X%."
};

int[] toolprice = {
  10, 
  100, 
  10, 
  10000, 
  1000, 
  100, 
  10, 
  1
};
int[] toollevel = {
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
};


void setup() {
  size(800, 600);
  frameRate(60);
  MeteorCol = new ArrayList();
  SkudCol = new ArrayList();
  rock = loadImage("Stone.gif");
  ship = loadImage("ship.png");
  minim = new Minim(this);
  aplayer = minim.loadFile("105753_Heaven_remix.mp3");
  ainput = minim.getLineIn();
  //aplayer.play();
}

void draw() {
  switch(mode) {
  case 1:
    menu();
    break;
  case 2: 
    game();
    break;
  case 3:
    shop();
    break;
  }
}

void spaceship(float x, float y) {
  pushMatrix();
  translate(x, y);
  image(ship, -10, -20);
  score+=3;
  popMatrix();
}

void debug() {
  fill(255);
  textSize(12);
  text(MeteorCol.size(), 10, 10);
  text(spawnrate, 10, 20);
  text(mouseX, 10, 30);
  text(mouseY, 10, 40);
}

void game() {
  background(20);
  bg();
  //Meteor
  spawning+=spawnrate;
  while (spawning>=1) {
    Meteor mainMeteor = new Meteor();
    MeteorCol.add(mainMeteor);
    spawning -= 1;
    spawnrate += 0.0002;
  }
  if (mousePressed) {
    Shot mainShot = new Shot();
    SkudCol.add(mainShot);
  }
  for (int i = 0; i < MeteorCol.size(); i++) {
    Meteor met = (Meteor) MeteorCol.get(i);
    if (met.alive) {
      met.logic(sx, sy);
    } 
    else {
      MeteorCol.remove(met);
    }
  }
  for (int i = 0; i < SkudCol.size(); i++) {
    Shot sku = (Shot) SkudCol.get(i);
    if (sku.alive) {
      sku.logic();
    } 
    else {
      SkudCol.remove(sku);
    }
  }

  //BØLGE
  if (!lr) {
    lrsize+=20;
    fill(0, 0, 0, 0);
    stroke(0, 0, 255, 50);
    strokeWeight(16);
    ellipse(lrx, lry, lrsize, lrsize);
    if (lrsize>600) {
      lr=true;
    }
  }

  //Skib
  input();
  if (shipalive) {
    spaceship(sx, sy);
  }

  //Hud
  debug();
  textSize(32);
  fill(255);
  text(score, 40, 60);

  pushMatrix();
  translate(50, 500);
  fill(40);
  stroke(0);
  strokeWeight(1);
  rect(-15, 30, 255, 40);
  fill(255, 0, 0);
  noStroke();
  rect(-10, 35, 245*hp/hpmax, 30);
  textSize(20);
  fill(255);
  text(hp+"/"+hpmax, -5, 57);
  for (int i = 0;i < lrleft;i++) {
    stroke(0, 0, 255, 150);
    fill(0, 0, 0, 0);
    strokeWeight(6);
    ellipse(i*40, 0, 30, 30);
  }
  popMatrix();
}

float wavemax=0;

void bg() {
  wavemax = 0;
  for ( int i = 0; i < 100; i++ )
  {
    if (aplayer.left.get(i)>wavemax) {
      wavemax=aplayer.left.get(i);
    }
  }
  fill(255, 255, 255, 200);
  noStroke();
  ellipse(100, 100, 40+20*wavemax, 40+20*wavemax);
}

/*
////////////////////////////////////////////
 //       Pete's dejlige comands. :)       //
 ////////////////////////////////////////////
 */

float point_direction(float x1, float y1, float x2, float y2) {
  float dir = 180+atan2(-(y1-y2), (x1-x2))*180/PI;
  return  dir;
}

float point_distance(float x1, float y1, float x2, float y2) {
  float dis = abs(sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)));
  return dis;
}

float lengthdir_x(float len, float dir) {
  float lengthdir = cos(dir*PI/180)*len;
  return lengthdir;
}

float lengthdir_y(float len, float dir) {
  float lengthdir = -sin( dir*PI/180)*len;
  return lengthdir;
}

void input() {
  if (up) {
    sy-=speedlevel(toollevel[2]);
  }
  if (down) {
    sy+=speedlevel(toollevel[2]);
  }
  if (left) {
    sx-=speedlevel(toollevel[2]);
  }
  if (right) {
    sx+=speedlevel(toollevel[2]);
  }
}

void keyPressed() {
  if (mode==1) {
    if (key=='t'||key=='T') {
      mode = 2;
    }
  }
  if (mode==2) {
    if (key=='a'||key=='A') {
      left = true;
    }  
    if (key=='d'||key=='D') {
      right = true;
    }
    if (key=='w'||key=='W') {
      up = true;
    }
    if (key=='s'||key=='S') {
      down = true;
    }
    if (key==' '&&lr==true&&shipalive&&lrleft>0) {
      lr=false;
      lrx=sx;
      lry=sy;
      lrsize=0;
      lrleft--;
    }
    if ((key=='b'||key=='B')&&shipalive) {
      mode = 3;
      shopslide=200;
    }
  }
  if (mode==3) {
    if (key=='q'||key=='Q') {
      mode = 2;
    }
  }
}

void keyReleased() {
  if (key=='a'||key=='A') {
    left = false;
  }
  if (key=='d'||key=='D') {
    right = false;
  }
  if (key=='w'||key=='W') {
    up = false;
  }
  if (key=='s'||key=='S') {
    down = false;
  }
}

void mousePressed() {
  if (mode==3) {
     if (mouseX>600&&mouseY>132&&mouseY<154){
       if (toolprice[2]<=money) {
         money-=toolprice[2];
         toollevel[2]+=1;
         println("LOL");
       }    
     }
  } 
}

void menu() {
  background(20);
  textSize(140);
  text("T to start...", 20, 400);
}

class Meteor {
  float x;
  float y = -40;
  float size = 40;
  float speedy = 3; 
  float speedx;
  boolean alive = true;
  float rotation = random(-0.1, 0.1);
  float spin = 0;

  Meteor() {
    x = random(0, width);
    speedx = random(-1, 1);
  }

  void logic(float sx, float sy) {
    y += speedy;
    x += speedx;

    pushMatrix();
    spin+=rotation;
    translate(x, y);
    rotate(spin);
    image(rock, -20, -20, 40, 40);
    popMatrix();

    if (y > height+50) {
      alive = false;
    }
    if (point_distance(x, y, sx, sy)<25) {
      alive = false;
      hp-=3;
    }
    if (!lr&&point_distance(x, y, lrx, lry) < lrsize/2+size/2) {
      alive=false;
    }
  }
}

void shop() {
  if (shopslide>0) {
    shopslide-=10;
  }
  noStroke();
  fill(255);
  textSize(64);
  text("GAME PAUSED", 100, 300);
  fill(80);
  pushMatrix();
  translate(width-200+shopslide, 0);
  rect(0, 0, 200, height);
  textSize(32);
  fill(255);
  text("SHOP", 60, 35);
  textSize(22);
  text("Ship upgrades", 5, 70);
  text("Guns upgrades", 5, 228);
  sknapmake(0, 3);
  sknapmake(1, 4);
  sknapmake(2, 5);
  sknapmake(3, 6);
  sknapmake(4, 9);
  sknapmake(5, 10);
  sknapmake(6, 11);
  sknapmake(7, 12);
  hovertool(0, 3);
  hovertool(1, 4);
  hovertool(2, 5);
  hovertool(3, 6);
  hovertool(4, 9);
  hovertool(5, 10);
  hovertool(6, 11);
  hovertool(7, 12);

  textSize(16);
  fill(255);
  text("Money: "+money, 5, 570);

  popMatrix();
}

void sknapmake(int upgrade, int place) {
  noStroke();
  fill(60);
  rect(0, 26*place, 200, 22); //bg
  textSize(16);
  fill(255);
  text(toolnavn[upgrade], 6, 18+26*place);//Navn
  textAlign(RIGHT);
  text(toolprice[upgrade], 174, 18+26*place);//Pris
  textAlign(LEFT);
  fill(255, 255, 0);
  stroke(0);
  strokeWeight(1);
  ellipse(185, 11+26*place, 16, 16);//coin
  fill(0);
  textSize(10);
  text("$", 183, 16+26*place);
}

void hovertool (int upgrade, int place) {
  if (mouseX>=600&&mouseY>=26*place&&mouseY<=26*place+22) {
    fill(60);
    rect(0, mouseY+10, 199, 50);
    fill(255);
    stroke(255);
    textSize(16);
    text(tooltip[upgrade], 2, mouseY+10, 195, 50);
  }
}

float speedlevel(int level) {
  float ret = level*0.5+0.5;
  return ret;
}
class Shot {
  float x, y, dir;
  boolean alive = true;
  float speed = 10;

  Shot() {
    x=sx+5;
    y=sy-10;
    dir = point_direction(x, y, mouseX, mouseY);
  }

  void logic() {
    x+=lengthdir_x(speed, dir);
    y+=lengthdir_y(speed, dir);

    for (int i = 0; i < MeteorCol.size(); i++) {
      Meteor met = (Meteor) MeteorCol.get(i);
      if (point_distance(x,y,met.x,met.y)<25) {
        met.alive=false;
        alive=false;
        
      }
    }
    
    if (x<0||x>width||y<0||y>height) {alive=false;}

    noStroke();
    pushMatrix();
    translate(x, y);
    fill(255, 255, 0);
    ellipse(-5, -5, 5, 5);
    popMatrix();
  }
}



