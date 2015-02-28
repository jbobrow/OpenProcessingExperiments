
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/141506*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
//import processing.serial.*;

//Serial myPort;  // Create object from Serial class
//int val;      // Data received from the serial port
Backdrop sky = new Backdrop();
slim player = new slim();
object[] boxes = new object[8];
obsticalgap gap = new obsticalgap();
obsticallight lightbox = new obsticallight();
float speed = 0.7;
PImage cupBox;
PImage drop;
PImage light;
PImage title;
PImage goscreen;
PImage owlgirl;
PImage ground;
int offset = 200;
int nothere = 0;
int nothere2 = 0;
int highscore = 0;
boolean gamestart = false;
boolean gameover = false;

// ******************* OBSTICALLIGHT CLASS ***********************

class obsticallight {
  PVector hitLoc = new PVector(0, 0);
  Boolean hit = false;
  PVector pos = new PVector(0, 0);
  PImage img;

  obsticallight() {
    this.img = light;
  }
  obsticallight(float x, float y) {
    this.img = light;
    this.pos.x=x;
    this.pos.y=y;
  }
  obsticallight(PImage image) {
    this.img = image;
  }
  void draw() {
    //image(this.img,this.pos.x,this.pos.y);
    image(this.img, this.pos.x, this.pos.y);
    if (this.hit) {
      // image(pow, this.hitLoc.x, this.hitLoc.y, 128, 128);
    }
  }
  void update() { //check for collisions
    if (player.pos.x + 50 - offset > this.pos.x 
      && player.pos.x -50  - offset < this.pos.x 
      && player.pos.y -50 < this.pos.y
      && player.pos.y +50 > this.pos.y
      ) {
      this.hitLoc.y = this.pos.y;
      this.hitLoc.x = this.pos.x;
      if (!this.hit) {
        // boxSnd.load();
        //  boxSnd.play();
        //player.boxCount++;
      }
      this.hit = true;
    }
    //move boxes
    if (this.hit) {
      this.pos.x = 1024 + random(2048);
      this.hit = false;
      gameover = true;
      if (player.boxCount > highscore) {
        highscore = player.boxCount;
      }
      player.boxCount = 0;
      speed = 0.7;
    }
    if (this.pos.x > -128) {
      this.pos.x-=12*speed;//move at same rate as scroll
      nothere = int(this.pos.x);
    }
    if (this.pos.x<-128) {
      this.pos.x = 1024+random(2048);//stagger boxes starting pos to the right of the screen
      if ((this.pos.x > nothere2 + 100) && (this.pos.x < nothere2 - 100)) {
        this.pos.x += 400;
      }
      this.pos.y=375;
      this.hit=false;
    }
  }
}


// ******************* OBSTICALGAP CLASS ***********************

class obsticalgap {
  PVector hitLoc = new PVector(0, 0);
  Boolean hit = false;
  PVector pos = new PVector(0, 0);
  PImage img;

  obsticalgap() {
    this.img = drop;
  }
  obsticalgap(float x, float y) {
    this.img = drop;
    this.pos.x=x;
    this.pos.y=y;
  }
  obsticalgap(PImage image) {
    this.img = image;
  }
  void draw() {
    //image(this.img,this.pos.x,this.pos.y);
    image(this.img, this.pos.x, this.pos.y);
    if (this.hit) {
      // image(pow, this.hitLoc.x, this.hitLoc.y, 128, 128);
    }
  }
  void update() { //check for collisions
    if (player.pos.x + 50 - offset > this.pos.x 
      && player.pos.x -50  - offset < this.pos.x 
      && player.pos.y -50 < this.pos.y
      && player.pos.y +50 > this.pos.y
      ) {
      this.hitLoc.y = this.pos.y;
      this.hitLoc.x = this.pos.x;
      if (!this.hit) {
        // boxSnd.load();
        //  boxSnd.play();
        //player.boxCount++;
      }
      this.hit = true;
    }
    //move boxes
    if (this.hit) {
      this.pos.x = 1024 + random(2048);
      this.hit = false;
      gameover = true;
      if (player.boxCount > highscore) {
        highscore = player.boxCount;
      }
      player.boxCount = 0;
      speed = 0.7;
    }
    if (this.pos.x > -128) {
      this.pos.x-=12*speed;//move at same rate as scroll
      nothere = int(this.pos.x);
    }
    if (this.pos.x<-128) {
      this.pos.x = 1024+random(2048);//stagger boxes starting pos to the right of the screen
      if ((this.pos.x > nothere + 100) && (this.pos.x < nothere - 100)) {
        this.pos.x += 250;
      }
      this.pos.y=370;
      this.hit=false;
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

    this.img = cupBox;
  }
  object(float x, float y) {
    this.img = cupBox;
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
    if (player.pos.x + 50 - offset > this.pos.x 
      && player.pos.x -50  - offset < this.pos.x 
      && player.pos.y -50 < this.pos.y
      && player.pos.y +50 > this.pos.y
      ) {
      this.hitLoc.y = this.pos.y;
      this.hitLoc.x = this.pos.x;
      if (!this.hit) {
        // boxSnd.load();
        //  boxSnd.play();
        player.boxCount++;
        if (player.boxCount % 10 == 0) {
          speed += 0.1;
        }
      }
      this.hit = true;
    }
    //move boxes
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
      this.pos.x = 1024+random(4096);//stagger boxes starting pos to the right of the screen
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

// ******************* PLAYER CLASS ***********************

class slim {
  int boxCount = 0;
  //  int health = 3;
  float gravity = 0;
  float floor=380;
  float timer = 2;
  Boolean jump =false;
  PVector pos = new PVector(512, floor);
  float frame = 1;
  PImage[] slimOld = new PImage[12];
  PImage slimOldjump;

  void setup() {

    for (int i=0;i<12;i++) {
      slimOld[i] = requestImage("slimOld"+(i)+".png");
    }

    slimOldjump = requestImage("owlgirljump.png");
  }

  slim() {
  }
  void draw() {
    imageMode(CENTER);
    if (player.jump == false) {
      //if (this.frame<9&&this.frame>=0) {   
      image(slimOld[int(frame)], this.pos.x - offset, this.pos.y, 128, 128);
    }
    else {
      image(slimOldjump, this.pos.x - offset, this.pos.y, 128, 128);
    }
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
        this.jump=false;
        this.timer=2;
      }
    }

    if (this.pos.y<this.floor&&!this.jump) {
      //this.floor=380;
      this.pos.y+=45*this.gravity;
      this.gravity+=.05;
      //this.jump=true;
      /*}
       else if (this.pos.y>=this.floor) {
       this.pos.y=this.floor;
       this.jump=false;
       this.timer=2;
       }*/

      if (this.floor!=380) {
        this.floor=380;
      }
    }
    else if (!this.jump) {

      this.gravity=0;
    }
  }
}


// ******************* BACKGROUND CLASS ***********************

class Backdrop {
  PImage img;
  float x_pos = 0;

  Backdrop() {
    this.img = ground;
  }

  void draw() { 
    if (x_pos<180) {
      this.x_pos+=12*speed;

      for (int i=0;i<width+this.x_pos;i+=180) {
        image(img, i-this.x_pos, 0, 180, 480);
      }

      if (this.x_pos>179) {
        this.x_pos=0;
      }
    }
  }
}  

// ******************* REMAINING CODE ***********************

void setup() {

  cupBox = requestImage("kunai.png");
  title = requestImage("title.png");
  goscreen = requestImage("gameover2.png");
  drop = requestImage("drop.png");
  light = requestImage("light.png");
  owlgirl = requestImage("owlgirl.png");
  ground = requestImage("backgnd.png");

  for (int i=0;i<boxes.length;i++) {//setup boxes initial positions
    boxes[i] = new object();
    boxes[i].pos.x = 1024+random(1024);//stagger boxes starting pos to the right of the screen
    boxes[i].pos.y = 380;
  }

  lightbox = new obsticallight();
  lightbox.pos.x = 1824;
  lightbox.pos.y = 375;

  gap = new obsticalgap();
  gap.pos.x = 1224;
  gap.pos.y = 370;

  sky = new Backdrop();

  //box.setup(); had to be moved to global? setup to accomidate array of boxes
  player.setup();

  //String portName = Serial.list()[1];
  //println(Serial.list()[1]);
  //myPort = new Serial(this, portName, 9600);

  size(1024, 480);
  frameRate(30);
}

void draw() {

  if  (gamestart == false) {
    image(title, 0, 0);
    image(title, 596, 0);
    image(owlgirl, 240, 50, 600, 260);
    textSize(32);
    fill(150, 70, 50);
    text("Press Return to start game", 300, 300);
  }
  else if (gamestart == true && gameover == true) {
    image(goscreen, 180, 90);
    fill(255);
    textSize(32);
    if (second() % 2 == 0) {
      fill(0);
    }
    text("Press Return", 410, 370);
    fill(255);
    text("Highscore: " + highscore, 410, 200);
  }
  else {

    sky.draw();

    player.update();
    player.draw();

    for (int i=0;i<boxes.length;i++) {//update boxes: move and check for collisions, see object.update
      boxes[i].update();
      boxes[i].draw();
    }

    gap.update();
    gap.draw();

    lightbox.update();
    lightbox.draw();

    textSize(24);
    text("Kunai: " + player.boxCount, 50, 50);

    //boxes.draw();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode==UP&&player.jump==false) {
      player.jump=true;
    }
  }
  if (keyCode == ENTER && gamestart == false) {
    gamestart = true;
  }
  if (keyCode == ENTER && gameover == true) {
    gamestart = false;
    gameover = false;
  }
}



