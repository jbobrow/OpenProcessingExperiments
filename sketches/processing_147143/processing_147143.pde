
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/144936*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

//O============================================================================O
//|                              OwlGirl Run Source Code                       |
//|                              Version 1.0.1                                 |
//|                              By Colin MacDonald April 22                   |
//O============================================================================O

/* @pjs preload="title.png, kunai.png,gameover2.png,drop.png,light.png,owlgirl.png,sky.png,floor.png,frame.png,buildings.png,pose00.png,pose01.png,pose02.png,pose03.png,pose04.png,pose05.png,pose06.png,pose07.png,pose08.png,pose09.png,fallanim00.png,fallanim01.png,fallanim02.png,fallanim03.png,fallanim04.png,fallanim05.png,fallanim06.png,fallanim07.png,fallanim08.png,fallanim09.png,fallanim10.png,fallanim11.png,fallanim12.png,fallanim13.png,fallanim14.png,fallanim15.png,fallanim16.png,fallanim17.png,owl00.png,owl01.png,owl02.png,owl03.png,owl04.png,owl05.png,owl06.png,owl07.png,owlgirlRun0.png,owlgirlRun1.png,owlgirlRun2.png,owlgirlRun3.png,owlgirlRun4.png,owlgirlRun5.png,owlgirlRun6.png,owlgirlRun7.png,owlgirlRun8.png,owlgirlRun9.png,owlgirlRun10.png,owlgirlRun11.png,owlgirlJump.png,owlgirlSlide.png,owlgirlTrip.png"; */
//import ddf.minim.*;
//These are objects created by the game classes. They are used to update visual assets for the game.
//Minim minim;
//AudioPlayer jumpsd;
//AudioPlayer itemsd;
//AudioPlayer musicsd;
//AudioPlayer fallsd;

Backdrop sky;
Backdrop roof;
Backdrop buildings;
player OwlGirl;
object[] kunai = new object[8];
obstacleGap gap;
obstacleLight lightbox;
obstacleOwl owl;
Animation pose;
Animation falldown;
Animation flyingOwl;
// These are all .png images used in the game. They are loaded as global variables to reduce cost later using them.

PImage imgKunai;
PImage imgAlley;
PImage imgRoofLight;
PImage imgTitleScreen;
PImage imgGameOver;
PImage imgTitle;
PImage imgSky;
PImage imgBuildings;
PImage imgFloor;
PImage imgHSFrame;
//Global variables used by several different classes
int offset = 40;
int nothere = 0;
int nothere2 = 0;
int highscore = 0;
float speed = 0.7; //Speed of the game. Updates slowly for difficulty
long lastTime = 0;
//Boolean variables that act as check states for parts of the game
boolean gamestart = false;
boolean gameover = false;
boolean addname = false;
boolean stop = false;


// ******************* REMAINING CODE ***********************

void setup() {
  lastTime = millis();
  //Load all images
  imgKunai = requestImage("kunai.png");
  imgTitleScreen = requestImage("title.png");
  imgGameOver = requestImage("gameover2.png");
  imgAlley = requestImage("drop.png");
  imgRoofLight = requestImage("light.png");
  imgTitle = requestImage("owlgirl.png");
  imgSky = requestImage("sky.png");
  imgFloor = requestImage("floor.png");
  imgHSFrame = requestImage("frame.png");
  imgBuildings = requestImage("buildings.png");
  pose = new Animation("pose", 10);
  falldown = new Animation("fallanim", 18);
  flyingOwl = new Animation("owl", 8);

  //Load all sounds and music
  /*  minim = new Minim(this);
   jumpsd = minim.loadFile("jump2.wav");
   jumpsd.shiftGain(-35, -35, 1000);
   jumpsd.setGain(-10.0);
   jumpsd.mute();
   jumpsd.unmute();
   
   itemsd = minim.loadFile("item.wav");
   itemsd.shiftGain(-45, -45, 1000);
   itemsd.setGain(-10.0);
   itemsd.mute();
   itemsd.unmute();
   
   musicsd = minim.loadFile("marcus_kellis_theme.mp3");
   musicsd.shiftGain(-25, -25, 1000);
   musicsd.setGain(-10.0);
   musicsd.mute();
   musicsd.unmute();
   
   fallsd = minim.loadFile("Fall.wav");
   fallsd.shiftGain(-10, -10, 1000);
   fallsd.setGain(-10.0);
   fallsd.mute();
   fallsd.unmute();*/
   
  //Create background images set to move at different speeds
  sky = new Backdrop(imgSky, 180, 130, 0.1, 0); 
  buildings = new Backdrop(imgBuildings, 180, 239, 0.3, 130); 
  roof = new Backdrop(imgFloor, 180, 112, 1, 369);

  //Setup for all objects in the game
  for (int q=0;q<1;q++) {
    for (int i=0;i<kunai.length;i++) {//setup kunai initial positions
      kunai[i] = new object();
      kunai[i].pos.x = 1024+random(1024);//stagger kunai starting pos to the right of the screen
      kunai[i].pos.y = 380;
    }
  }

  for (int w=0;w<1;w++) {
    lightbox = new obstacleLight();
    lightbox.pos.x = 1824;
    lightbox.pos.y = 375;
  }

  for (int e=0;e<1;e++) {
    gap = new obstacleGap();
    gap.pos.x = 1224;
    gap.pos.y = 370;
  }

  for (int r=0;r<1;r++) {
    owl = new obstacleOwl();
    owl.pos.x = 3024;
    owl.pos.y = 90;
  }

  //box.setup(); had to be moved to global? setup to accomidate array of kunai
  for (int y=0;y<1;y++) {
    OwlGirl = new player();
    OwlGirl.setup();
  }

  size(1024, 480);
  //frameRate(30);
  frameRate(30);
}

void draw() {
  //Title screen
  if (myDelay()==false) {
  }
  else {
    if  (gamestart == false) {
      drawTitleScreen();
    }
    //Game Over Screen
    else if (gamestart == true && gameover == true) {
      drawGameOver();
    }
    //Gameplay and update for vissuals
    else {
      drawGamePlay();
    }
  }
}

/*void keyPressed() {
  if (key == CODED) {
    if (keyCode==UP&&OwlGirl.jump==false) {
      OwlGirl.jump=true;
       //jumpsd.play();
    }
    if (keyCode == DOWN && OwlGirl.jump == false) {
      OwlGirl.slide = true;
    }
  }
  if (keyCode == RIGHT && gamestart == false) {
    OwlGirl.boxCount = 0;
    owl.timer = 2;
    owl.pos.y = 90;
    //musicsd.play();
    gamestart = true;
    speed = 0.7;
  }
  if (keyCode == RIGHT && gameover == true) {
   // musicsd.rewind();
    gamestart = false;
    gameover = false;
  }
}*/

void mouseClicked() {
 
 if (OwlGirl.jump==false) {
 OwlGirl.jump=true;
 //jumpsd.play();
 }
 if (gamestart == false) {
 OwlGirl.boxCount = 0;
 owl.timer = 2;
 owl.pos.y = 90;
 //musicsd.play();
 gamestart = true;
 speed = 0.7;
 }
 if (gameover == true) {
 //musicsd.rewind();
 gamestart = false;
 gameover = false;
 }
 }

void drawTitleScreen() {
  frameRate(2);
  image(imgTitleScreen, 0, 0);
  image(imgTitleScreen, 596, 0);
  image(imgTitle, 240, 50, 600, 260);
  textSize(32);
  fill(150, 70, 50);
  if (second() % 2 == 0) {
    fill(68, 100, 129);
  }
  text("Press Right to start game", 300, 300);
  pose.display(150, 100, 128, 128);
}

void drawGameOver() {
  background(0);

  image(imgGameOver, 0, 0, 800, 480);
  image(imgHSFrame, 800, 85, 230, 300);

  fill(255);
  textSize(32);

  if (second() % 2 == 0) {
    fill(0);
  }
  text("Press Right", 310, 320);
  fill(255);
  text("Your Score: " + OwlGirl.boxCount, 300, 150);
}

void drawGamePlay() {
  //frameRate(30);
  frameRate(30);
  sky.draw();
  roof.draw();
  buildings.draw();

  for (int j=0;j<1;j++) {
    for (int u=0;u<kunai.length;u++) {//update kunai: move and check for collisions, see object.update

      kunai[u].draw();
      kunai[u].update();
    }
  }

  if (!OwlGirl.fall) {
    for (int n=0;n<1;n++) {
      gap.draw();
      gap.update();
    }

    for (int m=0;m<1;m++) {
      lightbox.draw();
      lightbox.update();
    }

    for (int o=0;o<1;o++) {
      owl.draw();
      owl.update();
    }

    for (int p=0;p<1;p++) {
      OwlGirl.draw();
    }
  }
  for (int t=0; t<1;t++) {
    OwlGirl.update();
  }

  textSize(24);
  text("Kunai: " + OwlGirl.boxCount, 50, 50);
}

boolean myDelay() {
  boolean timeUp;
  fill(0);
  text("loading...",50,50);
  fill(255);
  if (stop = false) {
    lastTime = millis();
    stop = true;
  }
  if (millis() - lastTime > 3000) {
    timeUp = true;
    stop = false;
  }
  else {
    timeUp=false;
  }
  return timeUp;
}

// Class for animating a sequence of GIFs

class Animation {
  PImage[] images;
  int imageCount;
  int frame = 0;

  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 2) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos, float boxw, float boxh) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos, boxw, boxh);
  }

  void reset() {
    frame = 0;
  }

  int getWidth() {
    return images[0].width;
  }
}

// ******************* BACKGROUND CLASS ***********************

class Backdrop {
  PImage ground;
  float x_pos = 0;
  float paralax = 0;
  int imgheight = 0;
  int imgwidth = 0;
  int y = 0;
  

  Backdrop() {
    this.ground = imgBuildings;
  }
  
   Backdrop(PImage image, int wdth, int hght, float slw, int pos) {
    this.ground = image;
    this.paralax = slw;
    this.imgheight = hght;
    this.imgwidth = wdth;
    this.y = pos;
  }

  void draw() { 
    if (x_pos<180) {
      this.x_pos+=12*speed*paralax;

      for (int i=0;i<width+this.x_pos;i+=180) {
        image(ground, i-this.x_pos, this.y, this.imgwidth, this.imgheight);
      }

      if (this.x_pos>179) {
        this.x_pos=0;
      }
    }
  }
}  
// ******************* OBJECT CLASS ***********************

class object {
  PVector hitLoc = new PVector(0, 0);
  float timer = 2;
  float arc = 0;
  Boolean hit = false;
  PVector pos = new PVector(0, 0);
  PImage img;//generic image container for assigning image at instantiation 

  /*void setup() {// use for unique instances, ie: bonus items
   }*/

  object() {

    this.img = imgKunai;
  }
  object(float x, float y) {
    this.img = imgKunai;
    this.pos.x=x;
    this.pos.y=y;
  }
  object(PImage image) {
    this.img = image;
  }
  void draw() {
    //image(this.img,this.pos.x,this.pos.y);
    image(this.img, this.pos.x, this.pos.y, 64, 64);
    if (this.hit&&timer>1.7) {
      // image(pow, this.hitLoc.x, this.hitLoc.y, 128, 128);
    }
  }
  void update() { //check for collisions
    if (OwlGirl.pos.x +  offset > this.pos.x 
      && OwlGirl.pos.x - offset < this.pos.x + 40
      && OwlGirl.pos.y - offset < this.pos.y
      && OwlGirl.pos.y + offset > this.pos.y
      ) {
      this.hitLoc.y = this.pos.y;
      this.hitLoc.x = this.pos.x;
      if (!this.hit) {
       // itemsd.rewind();
        //itemsd.play();
        OwlGirl.boxCount++;
        if (OwlGirl.boxCount % 10 == 0) {
          speed += 0.1;
        }
      }
      this.hit = true;
    }
    //move kunai
    if (this.hit) {
      timer-=.1;
      if (this.timer>1) {
        this.pos.y-=30*(this.timer-1);
      }
      if (this.timer<1) {
        this.pos.y+=30*(1-this.timer);
      }
    }
    if (this.pos.x > -128) {
      this.pos.x-=12*speed;//move at same rate as scroll
    }
    if (this.pos.x<-128||this.pos.y<-16||this.pos.y>512) {
      this.pos.x = 1024+random(4096);//stagger kunai starting pos to the right of the screen
      if (int(random(3)) == 2) {
        this.pos.y = 150;
      }
      else {
        this.pos.y=380;
      }
      this.timer=2;
      this.hit=false;
    }
  }
}

// ******************* obstacleGap CLASS ***********************

class obstacleGap {
  PVector hitLoc = new PVector(0, 0);
  Boolean hit = false;
  PVector pos = new PVector(0, 0);
  PImage img;

  obstacleGap() {
    this.img = imgAlley;
  }
  obstacleGap(float x, float y) {
    this.img = imgAlley;
    this.pos.x=x;
    this.pos.y=y;
  }
  obstacleGap(PImage image) {
    this.img = image;
  }
  void draw() {
    //image(this.img,this.pos.x,this.pos.y);
    image(this.img, this.pos.x, this.pos.y);
    nothere = int(this.pos.x);
    //line(this.pos.x + 10, this.pos.y, this.pos.x + 10, this.pos.y -50);
    //line(this.pos.x + 45, this.pos.y, this.pos.x + 45, this.pos.y -50);
    if (this.hit) {
      // image(pow, this.hitLoc.x, this.hitLoc.y, 128, 128);
    }
  }
  void update() { //check for collisions
    if (OwlGirl.pos.x + offset > this.pos.x + 10
      && OwlGirl.pos.x -offset < this.pos.x + 45
      && OwlGirl.pos.y -offset < this.pos.y
      && OwlGirl.pos.y +offset > this.pos.y
      ) {
      this.hitLoc.y = this.pos.y;
      this.hitLoc.x = this.pos.x;
      if (!this.hit) {
      }
      this.hit = true;
    }
    //move kunai
    if (this.hit) {
      OwlGirl.fall = true;
      //fallsd.rewind();
      //fallsd.play();
      gap.hit = false;
      highscore = OwlGirl.boxCount;
    }
    if (this.pos.x > -128 && OwlGirl.fall == false) {
      this.pos.x-=12*speed;//move at same rate as scroll
    }
    if (this.pos.x<-128) {
      this.pos.x = 1024+random(2048);//stagger kunai starting pos to the right of the screen
      if ((this.pos.x < nothere2 + 200) && (this.pos.x > nothere2 - 150)) {
        this.pos.x += 512;
      }
      this.pos.y=370;
      this.hit=false;
    }
  }
}

// ******************* obstacleLight CLASS ***********************

class obstacleLight {
  PVector hitLoc = new PVector(0, 0);
  Boolean hit = false;
  PVector pos = new PVector(0, 0);
  PImage img;

  obstacleLight() {
    this.img = imgRoofLight;
  }
  obstacleLight(float x, float y) {
    this.img = imgRoofLight;
    this.pos.x=x;
    this.pos.y=y;
  }
  obstacleLight(PImage image) {
    this.img = image;
  }
  void draw() {
    //image(this.img,this.pos.x,this.pos.y);
    image(this.img, this.pos.x, this.pos.y);
    nothere2 = int(this.pos.x);
    //line(this.pos.x + 20, this.pos.y, this.pos.x + 20, this.pos.y -50);
    //line(this.pos.x + 55, this.pos.y, this.pos.x + 55, this.pos.y -50);
    if (this.hit) {
      // image(pow, this.hitLoc.x, this.hitLoc.y, 128, 128);
    }
  }
  void update() { //check for collisions
    if (OwlGirl.pos.x + offset > this.pos.x +20
      && OwlGirl.pos.x -offset < this.pos.x +55
      && OwlGirl.pos.y -offset < this.pos.y
      && OwlGirl.pos.y +offset > this.pos.y
      ) {
      this.hitLoc.y = this.pos.y;
      this.hitLoc.x = this.pos.x;
      if (!this.hit) {
      }
      this.hit = true;
    }
    //move kunai
    if (this.hit) {
      OwlGirl.trip = true;
      this.hit = false;

      highscore = OwlGirl.boxCount;
    }
  
  if (this.pos.x > -128) {
    this.pos.x-=12*speed;//move at same rate as scroll
  }
  if (this.pos.x<-128) {
    this.pos.x = 1024+random(2048);//stagger kunai starting pos to the right of the screen
    if ((this.pos.x < nothere + 200) && (this.pos.x > nothere - 150)) {
      this.pos.x += 512;
    }
    this.pos.y=375;
    this.hit=false;
  }
}
}
// ******************* obstacleOwl CLASS ***********************

class obstacleOwl {
  PVector hitLoc = new PVector(0, 0);
  Boolean hit = false;
  PVector pos = new PVector(0, 0);
  float timer = 2;
  int dodge = 0;
  boolean dive = true;

  obstacleOwl() {
  }
  obstacleOwl(float x, float y) {

    this.pos.x=x;
    this.pos.y=y;
  }
  void draw() {
    flyingOwl.display(this.pos.x, this.pos.y, 80, 62);
    //line(this.pos.x, this.pos.y + 10, this.pos.x + 50, this.pos.y + 10);
    //line(this.pos.x, this.pos.y + 50, this.pos.x + 50, this.pos.y + 50);
    if (this.hit) {
      // image(pow, this.hitLoc.x, this.hitLoc.y, 128, 128);
    }
  }
  void update() { //check for collisions
    if (OwlGirl.slide == true) {
      dodge = 40;
    }
    else {
      dodge = 0;
    }
    if (OwlGirl.pos.x + offset > this.pos.x
      && OwlGirl.pos.x -offset < this.pos.x +55
      && OwlGirl.pos.y -offset + dodge< this.pos.y +50
      && OwlGirl.pos.y +offset > this.pos.y +10
      ) {
      this.hitLoc.y = this.pos.y;
      this.hitLoc.x = this.pos.x;
      if (!this.hit) {
      }
      this.hit = true;
    }
    //move kunai
    if (this.hit) {
      OwlGirl.trip = true;
      this.hit = false;
      highscore = OwlGirl.boxCount;
    }
  
  if (this.pos.x > -128) {
    this.pos.x-=16 * 0.7;//move at same rate as scroll
  }

  if ( this.pos.x < 450 && this.timer > 0 && dive == true && gamestart == false) {
    this.timer-=0.07 * 1;
    if (this.timer<1) {
      this.pos.y-=30.1*(1-this.timer);
    }
    if (this.timer>1) {
      this.pos.y+=30.1*(this.timer-1);
    }
  }

  if (this.pos.x<-128) {
    this.pos.x = 3072+random(2048);//stagger kunai starting pos to the right of the screen
    this.pos.y=90;
    this.timer = 2;
    this.hit=false;
    if (int(random(3)) == 2) {
      dive = true;
    }
    else {
      dive = false;
    }
  }
}
}
// ******************* OwlGirl CLASS ***********************

class player {
  int boxCount = 0;
  //  int health = 3;
  float gravity = 0;
  float floor=380;
  float timer = 2;
  float slidetime = 1;
  float triptime = 2;
  float falltime = 1;
  float frame = 1;
  Boolean jump =false;
  Boolean slide = false;
  Boolean fall = false;
  Boolean trip = false;
  PVector pos = new PVector(312, floor);
  PImage[] playerOld = new PImage[12];
  PImage playerOldjump;
  PImage playerOldSlide;
  PImage playerOldFall;
  PImage playerOldTrip;


  void setup() {
    for (int i=0;i<12;i++) {
      playerOld[i] = requestImage("owlgirlRun"+(i)+".png");
    }
    playerOldjump = requestImage("owlgirlJump.png");
    playerOldSlide = requestImage("owlgirlSlide.png");
    playerOldTrip = requestImage("owlgirlTrip.png");
  }

  player() {
  }
  void draw() {

    imageMode(CENTER);
    if (OwlGirl.fall == true) {
    }
    else if (OwlGirl.trip == true) {
      image(playerOldTrip, this.pos.x, this.pos.y, 128, 128);
    }
    else if (OwlGirl.jump == false && OwlGirl.slide == false) {
      //if (this.frame<9&&this.frame>=0) {   
      image(playerOld[int(frame)], this.pos.x, this.pos.y, 128, 128);
    }
    else if (OwlGirl.jump == true) {
      image(playerOldjump, this.pos.x, this.pos.y, 128, 128);
    }
    else {
      image(playerOldSlide, this.pos.x, this.pos.y + 20, 128, 95);
    }
    stroke(255);
    //line(this.pos.x + offset, this.pos.y, this.pos.x +offset, this.pos.y -50);
    //line(this.pos.x - offset, this.pos.y, this.pos.x -offset, this.pos.y -50);
    //line(this.pos.x , this.pos.y + offset, this.pos.x + 50, this.pos.y +offset);
    //line(this.pos.x , this.pos.y -offset, this.pos.x + 50, this.pos.y -offset);
    imageMode(CORNER);
    //}
  }
  void update() {
    if (this.frame<=(12)&&this.frame>=0) {
      this.frame+=speed;//move to next frame
    }
    if (!(this.frame<12&&this.frame>=0)) {
      this.frame=0;
    }
    if (!this.jump) {
      // this.pos.y=this.floor;
    }
    if (this.floor>380||this.pos.y>380) {
      this.floor = 380;
      this.pos.y=380;
    }
    //Tripping Handle & Falling Handle
    if (this.trip == true) {
      triptime-=0.07;
      speed = 0.7;
      if (this.triptime>1) {
        this.pos.y-=15*(this.triptime-1);
      }
      if (this.triptime<1&&this.pos.y<=this.floor) {
        this.pos.y+=15*(1-this.triptime);
      }
      if (this.triptime<=0||this.pos.y>=(this.floor)) {
        this.trip=false;
        gameover = true;
        this.triptime=2;
        speed = 0.7;
        lightbox.pos.x = 1024 + random(2048);
        owl.pos.x = 1024 + random(2048);
        if ((lightbox.pos.x < nothere + 200) && (lightbox.pos.x > nothere - 150)) {
          lightbox.pos.x += 512;
        }
      }
    } 
    else if (this.fall == true) {
      falltime-=0.07;
      speed = 0;
      this.pos.y = 379;
      frameRate(6);
      background(0);
      falldown.display(200, 0, 671, 480);
      if (this.falltime<=0||this.pos.y>=(this.floor)) {
        this.fall=false;
        gameover = true;
        falldown.reset();
        this.falltime=1;
        this.pos.y=380;
        //frameRate(30);
        frameRate(30);
        gap.pos.x = 1024 + random(2048);
        if ((gap.pos.x < nothere2 + 200) && (gap.pos.x > nothere2 - 150)) {
          gap.pos.x += 512;
        }
      }
    }
    else {
      //Jumping Handle
      if (this.jump == true) {

        timer-=.07;
        if (this.timer>1) {
          this.pos.y-=30*(this.timer-1);
        }
        if (this.timer<1&&this.pos.y<=this.floor) {
          this.pos.y+=30*(1-this.timer);
        }
        if (this.timer<=0||this.pos.y>=this.floor) {
          //this.pos.y=this.floor;
         // jumpsd.rewind();
          this.jump=false;
          this.timer=2;
        }
      }
      //Sliding handle
      if (this.slide == true) {
        slidetime-=.07;
        if (this.slidetime<=0) {
          this.slide = false;
          this.slidetime = 1;
        }
      }
    }

    if (this.pos.y<this.floor&&!this.jump) {
      //this.floor=380;
      this.pos.y+=45*this.gravity;
      this.gravity+=.05;
      //this.jump=true;
    }
    else if (this.pos.y>=this.floor) {
      this.pos.y=this.floor;
      this.jump=false;
      this.timer=2;
    }

    if (this.floor!=380) {
      this.floor=380;
    }
    else if (!this.jump) {

      this.gravity=0;
    }
  }
}



