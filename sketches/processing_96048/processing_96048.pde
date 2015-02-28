
/*
Project Description: A game where you control a tank that shoots projectiles to kill an endless wave enemies and get points. The tank is controlled by the WASD keys and mouse click 
 to shoot. Right-click will shoot from a cannon in the top left-corner, which can be aimed with the mouse. 
 
 Players have four health points, which can be subtracted if damaged by enemy. Game ends when player's health reaches zero.
 
 Controls:
 W - Jump
 A - Move left
 D - Move Right
 Left mouse button - Fire tank gun
 Right mouse button - Fire corner gun -- Not complete yet
 
 Credits:
 Graphics from Nintendo's "Kirddddby Mass Attack".
 
 CHANGELOG V2
 - Added start menu button
 - Added death and screen when you die
 - Added explosion animation when enemy dies
 - Added corner gun functionality 
 - Added pause menu(15%)
 
 */




tank playertank;
topgun shootgun;
tankbullet standardbullet;
enemy standardenemy;
enemy standardenemy2;
scoreboard main;
gunbullet stan;
menu start;
endgame end;
pause stop;



PImage gun;
PImage bg;

float xpos;      //variable put out of tank class so that bullet class can refer to it
float ypos;
float bulletx;   //variable put out of bullet class to interact with enemy class
float bullety;
float speed;
int score;
int healthv = 4;
int alphastroke;
float corx;
float cory;

boolean play = false;
boolean dead = false;
boolean reset = false;
boolean pause = false;

float x, y;

//boolean showMenu = true;

void setup() {
  size(513, 450);
  strokeWeight(20.0);
  stroke(255, alphastroke);

  playertank = new tank();                  //intializing objects/classes
  shootgun = new topgun(); 
  standardbullet = new tankbullet();
  standardenemy = new enemy();
  standardenemy2 = new enemy();
  stan = new gunbullet();
  main = new scoreboard();
  start = new menu();
  end = new endgame();
  stop = new pause();
  bg = loadImage("background.png");

  loadFont("AgencyFB-Bold-48.vlw");
}

void draw() {
  background(bg);

  stop.activate();
  stop.window();

  if (play && dead == false && pause == false) {

    cursor(CROSS);

    standardbullet.movement();
    standardbullet.display();

    playertank.drive();
    playertank.display();
    playertank.controls();
    playertank.health();
    //  playertank.rotation();
    //  playertank.tankgun();

    stan.display();
    stan.movement();

    shootgun.rotation();
    //  bullet.rotation();

    standardenemy.display();
    standardenemy.movement();
    standardenemy.collision();
    standardenemy.collisionplayer();
    standardenemy.explosion();

    standardenemy2.display();
    standardenemy2.movement();
    standardenemy2.collision();
    standardenemy2.collisionplayer();
    standardenemy2.explosion();

    main.score();
    
//    playertank.damage();
  }
  if (play == false) {
    start.button();
  }
  if (dead == true) {
    end.endscreen();
  }
}

class topgun {
  float x;
  float y;
  float dx;
  float dy;
  float angle1;
  topgun() {
    x = 0;
    y = 0;
    gun = loadImage("gun.png");
  }
  void rotation() {
    dx = mouseX - x;
    dy = mouseY - y;
    angle1 = atan2(dy, dx);
    pushMatrix();
    translate(x, y);
    rotate(angle1);
    image(gun, -55.636363, -25, 111.272727, 50);
    popMatrix();
  }
}
class tank {
  //body
  PImage cockpit;
  PImage base;
  PImage wheel;
  float direction;
  float speed;
  float upspeed;
  float drag;
  //gun
  PImage tankgun;
  float dx;
  float dy;
  float angle1;
  float x;
  float y;
  //health
  PImage health;
  boolean damaged;
  boolean dow;
  float alphav;
  tank() {
    ///body
    cockpit = loadImage("cockpit.gif");
    base = loadImage("Base.gif");
    wheel = loadImage("Wheel.gif");
    tankgun = loadImage("k_00.gif");
    wheel = loadImage("Wheel.gif");
    health = loadImage("health.png");
    xpos = 50;
    ypos = 360;
    direction = 0;
    speed = 0;
    upspeed = 0;
    drag = 0;
    x = xpos;
    y = ypos;
    damaged = false;
  }


  void display() {
    image(cockpit, xpos+5, ypos-5);
    image(base, xpos-5, ypos+15);
    image(tankgun, xpos+4, ypos+7);
    image(wheel, xpos-15, ypos+20);
    image(wheel, xpos+33, ypos+20);
    image(health, xpos-10, ypos-30);
  }

  void drive() {
    xpos = xpos + speed;
    ypos=upspeed+ypos;
    upspeed=upspeed-drag;
    if (ypos>359) {                      
      upspeed=0;
      drag=0;
      ypos=360;
    }
    if (upspeed<=20 && ypos<360) {
      drag = drag-0.1;
    }
  }
  void controls() {
    if (keyPressed == true && key == 'a' && xpos > 0) {
      speed = -5;
    }
    else {
      speed = 0;
    }
    if (keyPressed == true && key == 'd' && xpos < width) {
      speed = 5;
    }
    if (keyPressed == true && upspeed==0 && key=='w') {          
      upspeed = -10;
    }
  }

  void health() {
    if (healthv == 3) {
      health = loadImage("health3.png");
      damaged = true;
    }
    if (healthv == 2) {
      health = loadImage("health2.png");
      damaged = true;
    }
    if (healthv == 1) {
      health = loadImage("health1.png");
      damaged = true;
    }
    if (healthv == 0) {
      health = loadImage("health0.png");
      dead = true;
    }
  }
  void damage() {
    fill(168,alphav);
    rectMode(CORNERS);
    rect(0,0,513,450);
    if (damaged == true) {
      alphav = alphav + 1;
      if(alphav == 100 && alphav >= 0) {
        dow = true;
        damaged = false;
      }
      if(dow == true) {
        alphav = alphav - 1;
      }
    }
  }




  //  void rotation() {
  //    dx = mouseX - x;
  //    dy = mouseY - y;
  //    angle1 = atan2(dy, dx);
  //    pushMatrix();
  //    translate(xpos+25, ypos+25);
  //    rotate(angle1);
  //    image(tankgun, 100/-2, 26/-2);
  //    popMatrix();
  //  }
}


class gunbullet {             //this bullet moves towards the mouse cursor
  PImage bullet;
  float x;
  float y;
  float xvelocity;
  float yvelocity;
  boolean fire;
  gunbullet() {
    bullet = loadImage("missile_2.png");
    x = 0;
    y = 0;
    xvelocity = 0;
    yvelocity = 0;
    fire = false;
  }

  void display() {
    //    image(bullet, x, y);
    ellipse(x, y, 15, 15);
  }

  void movement() {
    x = x + xvelocity/30;     //determines how much to move horizontal each frame
    y = y + yvelocity/30;    //determines how much to move verticale each frame
    corx = x;
    cory = y;
    if (mousePressed == true && mouseButton == RIGHT && x == 0 && y == 0) { //UNFINISHED
      fire = true;
    }
    if (fire == true) {
      xvelocity = mouseX - x;                           //determines run
      yvelocity = mouseY - y;                            //determines rise---together with run produces a slope towards the mousee cursor from the gun
      fire = false;
    }
    if (x > width || y >height) {
      xvelocity = 0;
      yvelocity = 0;
      x = 0;
      y = 0;
    }
  }
}

class tankbullet {
  PImage bullet;

  tankbullet() {
    bullet = loadImage("fireball_red_4.png");
  }

  void display() {
    image(bullet, bulletx, bullety, 24, 20);
  }
  void movement() {
    bulletx = bulletx + speed;
    if (mousePressed == true && mouseButton == LEFT) {
      speed = 15;
    }
    else if (bulletx>width || speed == 0) {
      speed = 0;
      bulletx=xpos+10;
      bullety=ypos+10;
    }
  }
}

class enemy {
  int fillval;
  float x;
  float y;
  float speedx;
  boolean explosion;
  int numFrames = 19;  // The number of frames in the animation
  int frame = 0;
  PImage[] images = new PImage[numFrames];
  enemy() {
    fillval = 255;
    y = random(300, 400);
    x = 530;
    speedx = random(1, 2);
    explosion = false;
    images[0]  = loadImage("Untitled-1_01.gif");
    images[1]  = loadImage("Untitled-1_02.gif"); 
    images[2]  = loadImage("Untitled-1_03.gif");
    images[3]  = loadImage("Untitled-1_04.gif"); 
    images[4]  = loadImage("Untitled-1_05.gif");
    images[5]  = loadImage("Untitled-1_06.gif"); 
    images[6]  = loadImage("Untitled-1_07.gif");
    images[7]  = loadImage("Untitled-1_08.gif"); 
    images[8]  = loadImage("Untitled-1_09.gif");
    images[9]  = loadImage("Untitled-1_10.gif"); 
    images[10] = loadImage("Untitled-1_11.gif");
    images[11] = loadImage("Untitled-1_12.gif"); 
    images[12] = loadImage("Untitled-1_13.gif"); 
    images[13] = loadImage("Untitled-1_14.gif"); 
    images[14] = loadImage("Untitled-1_15.gif"); 
    images[15] = loadImage("Untitled-1_16.gif"); 
    images[16] = loadImage("Untitled-1_17.gif"); 
    images[17] = loadImage("Untitled-1_18.gif"); 
    images[18] = loadImage("Untitled-1_19.gif");
  }
  void display() {
    rectMode(CENTER);
    fill(255, fillval);
    rect(x, y, 50, 50);
  }
  void movement() {
    x = x - speedx;
    if (x<-30) {
      x = 570;
      y = random(300, 400);
      bulletx=xpos+10;
      bullety=ypos+10;
      speed = 0;
      speedx = random(1, 2);
    }
  }
  void collision() {
    if (y<bullety + 30 && y>bullety - 30 && x<bulletx + 30 && x>bulletx - 30 && (x>xpos+70 || x<xpos-70) 
      || y<cory + 30 && y>cory - 30 && x<corx + 30 && x>corx - 30) {
      //      x = 570;
      //      y = random(300, 400);
      bulletx=xpos+10;
      bullety=ypos+10;
      speed = 0;
      score = score + 5;
      //      speedx = random(1, 2);
      explosion = true;
    }
  }
  void collisionplayer() {
    if (x<xpos+70 && x>xpos-70) {
      x = 570;
      y = random(300, 400);
      healthv = healthv - 1;
      speedx = random(1, 2);
      print("1");
    }
    else {
    }
  }

  void explosion() {
    if (explosion == true) {
      frame = (frame+1) % numFrames;  // Use % to cycle through frames
      int offset = 0;
      fillval = 0;
      alphastroke = 0;
      for (int x1 = -100; x1 < width; x1 += images[0].width) { 
        image(images[(frame+offset) % numFrames], x-10, y-10);
      }
    }
    if (frame == 18) {
      explosion = false;
      frame = 0;
      x = 570;
      y = random(300, 400);
      speedx = random(1, 2);
      fillval = 100;
      alphastroke = 100;
    }
  }
}
class scoreboard {
  PFont font;
  scoreboard() {
    font = loadFont("AgencyFB-Bold-48.vlw");
  }

  void score() {
    textFont(font);
    fill(255);
    text(score, 450, 50);
    textFont(font, 30);
    fill(255);
    text("Score:", 380, 40);
  }
}

class menu {                    
  PImage playbutton;
  PImage playbuttonhover;
  //  int x, y, xsize, ysize;
  boolean hover;
  menu() {
    playbutton = loadImage("playbutton.png");
    playbuttonhover = loadImage("playbuttonhover.png");
    //    xsize = 304;
    //    x = 50;
    //    y = 50;
  }
  void button() {   
    if (mouseX > 100 && mouseX < 100 + 304 && mouseY > 150 && mouseY < 150 + 80) {
      hover = true;
    }
    else {
      hover = false;
    }
    if (hover == true) {
      image(playbuttonhover, 100, 150);
    }
    else {
      image(playbutton, 100, 150);
    }
    if (hover == true && mousePressed == true) {
      play = true;
    }
  }
}

class endgame {
  PFont font;
  endgame() {
    font = loadFont("AgencyFB-Bold-48.vlw");
  }

  void endscreen() {
    textFont(font, 50);
    textAlign(CENTER, CENTER);
    text("You're Dead", width/2, height/2-50);

    textFont(font, 40);
    textAlign(CENTER, CENTER);
    text("Your Score:", width/2, height/2+5);

    textFont(font, 30);
    textAlign(CENTER, CENTER);
    text(score, width/2, height/2+50);
  }  

  //  void reset() {
  //    if (keyPressed == true) {
  //      reset = true;
  //    }
  //  }
}

class pause {
  pause() {
    pause = false;
  }
  void activate() {
    if (keyPressed == true && key == 'p' ) {
      pause = true;
    }
  }
  void window() {
    if (pause == true) {
      rect(width/2,height/2,300,300);
    }
    if (mouseX > width/2 - 150 && mouseX < width/2 + 150 && mouseY > height/2 - 150 && mouseY < height/2 + 150 && mousePressed == true) {
      pause = false;
    }
  }
}

//class powerups {
//  boolean


