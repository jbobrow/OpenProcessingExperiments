
import ddf.minim.*;

Minim minim;
AudioPlayer snd_shoot;

PFont titlefont;
float var1;
float x1, x2, y1, y2;
float angle1, angle2;
float scalar = 70;
int level = -1;
int death = 300;
float x;
  float y;
  float velocity;
  float angle;
  float rotation;
  float rotationRate;
  float w;
  int type;

float easing;

Player wbc;
ArrayList<Shot> shots;
ArrayList<Germs> germs;

boolean keyUp = false;
boolean keyLeft = false;
boolean keyDown = false;
boolean keyRight = false;
boolean keyShoot = false;

void setup () {
  titlefont = loadFont("Cubano-Regular-80.vlw");
  size(1000, 800);
  frameRate(30);
  
  wbc = new Player(width/2, height/2);
  shots = new ArrayList<Shot>();
  germs = new ArrayList<Germs>();

  minim = new Minim(this);
  snd_shoot = minim.loadFile("166418__quonux__scifi-shoot-or-bass.wav");
  
  restart();

}

void draw () {

  if (level == -1) {

    PImage img;
    img = loadImage("bg_screen-02.jpg");
    image(img, 0, 0);

    textFont(titlefont);
    textAlign(CENTER);
    fill(98, 147, 21);
    text("WELCOME TO", width/2, 200);
    text("GERM WARS!", width/2, 300);


    float ang1 = radians(angle1);
    float ang2 = radians(angle2);

    x1 = width/2 + (scalar * cos(ang1));
    x2 = width/2 + (scalar * cos(ang2));

    y1 = height/2 + (scalar * sin(ang1));
    y2 = height/2 + (scalar * sin(ang2));

    PImage wbc;
    wbc = loadImage("cell-04.png");
    image(wbc, width*0.75 - 60, y1);

    PImage germ;
    germ = loadImage("cell-05.png");
    image(germ, width*0.45 - 270, y1);

    angle1 += 10;
    angle2 += 10;

    if (mousePressed) {
      level = 0;
      imageMode(CORNER);
      background(0);
      PImage bg;
      bg = loadImage("bg.jpg");
      image(bg, 0, 0);
      mouseReleased();
    }
  }

  if (level==0) {  
    imageMode(CORNER);
    PImage bg;
    bg = loadImage("bg.jpg");
    image(bg, 0, 0);  
    wbc.display();
    wbc.update();
    
    PImage germ;
    germ = loadImage("cell-05.png");
    image(germ, width*0.45 - 270, y1); 
    image(germ, 526, 643);
    image(germ, 777,144); 
    image(germ, 433, 214);
    image(germ, 858, 543); 
    
  }
  
  for (int i = 0; i < shots.size(); i++ ) {
    Shot tempShot = shots.get(i);
    tempShot.update();
    tempShot.display();
    tempShot.dissipate(i);
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) { keyUp = true;}
    if (keyCode == LEFT) { keyLeft = true;}
    if (keyCode == DOWN) { keyDown = true;}
    if (keyCode == RIGHT) { keyRight = true;}
  }
    if (keyCode == ' ') {keyShoot = true;}
  }


void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) { keyUp = false;}
    if (keyCode == LEFT) { keyLeft = false;}
    if (keyCode == DOWN) { keyDown = false;}
    if (keyCode == RIGHT) { keyRight = false;}
  }
    if (keyCode == ' ') {keyShoot = false;}
  }
  
  
  void restart() {
    germs.clear();
    germs.add (new Germs(random(50, 50), random(50, 50), random(1, 3), 0, random(radians(359)), 0));
    germs.add (new Germs(random(50, 50), random(50, 50), random(1, 3), 0, random(radians(359)), 0));
    germs.add (new Germs(random(50, 50), random(50, 50), random(1, 3), 0, random(radians(359)), 0));
    germs.add (new Germs(random(50, 50), random(50, 50), random(1, 3), 0, random(radians(359)), 0));

    wbc.x = width/2;
    wbc.y = height/2;
    wbc.velocity = 0;
    wbc.alive = true;
  }


class Germs {
  PImage germ ;
  float x;
  float y;
  float velocity;
  float angle;
  float rotation;
  float rotationRate;
  float w;
  int type;


  Germs (float X, float Y, float V, int T, float A, float R) {
    x = X;
    y = Y; 
    velocity = V;
    angle = A;
    type = T;
    rotation = R;
    germ = loadImage("cell-05.png");
  }
}


void update() {
//
//  if ( x < 0 ) {x = width;} 
//  if ( x > width) {x = 0;}
//  if ( y < 0) {y = height;}
//  if ( y > height) {y = 0;} 

//  rotation += rotationRate; 
//  x += cos(angle) * velocity;
//  y += sin(angle) * velocity;
}

void display() {
//  pushMatrix();
//  translate(x, y); 
//  rotate(rotation);
//  image(img, 400, 400);
//  popMatrix();
}

class Player {
  PImage wbc;
  PImage bg;
  float x;
  float y;
  float xpos;
  float ypos;
  int xdirection = 1;
  int ydirection = 1;
  float cell;
  
  int r = 50;
  
  float velocity;
  float angle;
  float rotation;
  float rotationRate;
  
  float shotTimer;
  float shotRate;
  
  float maxVelocity;
  
  boolean alive;
  
  Player(float X, float Y) {
    x = X;
    y = Y;
    
    shotRate = 3;
    shotTimer = 0;
    maxVelocity = 50;
    alive = true;
    wbc = loadImage("cell-04.png");
  }
  
  void display() {
    imageMode(CENTER);
    if(alive == true) {
    pushMatrix();
    translate(x,y);
    rotate(rotation);
    image(wbc, 0, 0);
    popMatrix();
  }
 }
 
 void update() {
   if (alive == true) {    
     if ( x < 0 ) { x = width; }
    if ( x > width ) { x = 0; }
    if ( y < 0 ) { y = height; }
    if ( y > width ) { y = 0; }
     
     
     rotation += rotationRate;
     x += cos(angle) * velocity;
     y += sin(angle) * velocity;
     
     if (keyUp == true) {accelerate();}
     if (keyDown ==true) {deccelerate();}
     
     if (keyLeft == true) {rotation -= 0.1;}
    if (keyRight == true) {rotation += 0.1;}
     
     if (shotTimer > 0) {shotTimer--;}
     else {shotTimer = 0;}
     
     if (keyShoot == true) {
       if (shotTimer == 0) {
         shoot();
         shotTimer = shotRate;
       }
     }
   }
 }
 
 void accelerate() {
   if (alive == true) {
     float xt = cos(angle) * velocity + cos(rotation + PI/2) * 0.5;
     float yt = sin(angle) * velocity + sin(rotation + PI/2) * 0.5;
     velocity ++;
   easing = 0.02;
     if ( velocity < maxVelocity) {
       velocity --;
       easing = 0.2;
       angle = atan2(yt, xt);
     } else {
       velocity = maxVelocity = 0.05;
     }
   }
 }
 
 void deccelerate() {
  if (alive == true) {
      float xt = sin(angle) * velocity + sin(rotation - PI/2) * 0.25;
      float yt = cos(angle) * velocity + cos(rotation - PI/2) * 0.25;
   velocity ++;
   easing = 0.2;
   }
 }
 
 void shoot() {
  if(alive == true) {
   snd_shoot.play();
   snd_shoot.rewind();
   shots.add(new Shot(x, y, rotation + PI/2, 10, rotation + PI/2));
  }
 }
 
}

class Shot {
  float x;
  float y;
  float velocity;
  float angle;
  float rotation;
  float rotationRate;
  
  int lifespan;
  int runtime;


  Shot(float X, float Y, float A, float V, float R) {
    x = X;
    y = Y;
    angle = A;
    velocity = V;
    rotation = R;
    
    lifespan = 35;
    runtime = 0;
  }

  void update() {

    if ( x < 0 ) { x = width; }
    if ( x > width ) { x = 0; }
    if ( y < 0 ) { y = height; }
    if ( y > width ) { y = 0; }  
    
    rotation += rotationRate;
    x += cos(angle) * velocity;
    y += sin(angle) * velocity;
    
  }
  
  void dissipate(int index) {
   runtime--;
   if (runtime > lifespan) {
     shots.remove(index);
   }    
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    fill(255);
    rect(0, 30, 5, 5);
    popMatrix();
  }
}





