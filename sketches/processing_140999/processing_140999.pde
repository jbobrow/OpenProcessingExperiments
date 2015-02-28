
var jumpSnd = new Audio("jump.wav");
var dmgSnd = new Audio("dmg.wav");
var tacoSnd = new Audio("tacoGet.wav");
var boxSnd = new Audio("boxHit.wav");


Boolean jumpPlay = false;
Boolean tacoPlay = false;
Boolean boxPlay = false;
Boolean dmgPlay = false;

PFont toon;
Backdrop sky = new Backdrop();
slim player = new slim();
object[] boxes = new object[6];
PVector[] buildings = new PVector[24];
obstacle chef = new obstacle();
enemy berty = new enemy();
enemy medKit = new enemy(true);


PImage table;
PImage taco;
PImage building;
PImage ramp;
PImage chicken;
PImage heart;
PImage ground;
PImage cupBox;
PImage pow;
float speed = 1;
float jumpTime=1;
float timer=0;
float fadeTimer=0;
float alpha = .1;
float a = 0;
Boolean gameOver=false;
Boolean game=false;
Boolean end=false;





class enemy {
  PImage img;
  Boolean vanish=false;
  float randY =0;
  float alph=0;
  Boolean hit = false;
  PVector pos = new PVector(1280, 310);
  enemy() {
    img=chicken;
  }
  enemy(Boolean van) {

    this.vanish=van;
    this.img = taco;
    this.pos.x = random(1024, 2048);
  }
  void update() {
    if (!this.vanish) {
      this.pos.y = 240+randY+ sin(this.alph) * 50.0;//chicken sin wave pattern
      this.alph = this.alph + .2;
      if (this.pos.x > -256) {
        this.pos.x-=20*speed;//move faster than scroll
        //this.pos.y= 310;
      }
    }
    if (this.vanish) {
      this.pos.y = 240+this.randY;
      //alpha = alpha + .1;
      if (this.pos.x > -256) {
        this.pos.x-=7*speed;//taco slow scroll
        //this.pos.y= 310;
      }
    }
    if (this.pos.x<=-256&&!this.vanish) {
      this.pos.x = 1024+random(2048);//stagger chicken to right of screen
      this.pos.y=random(250, 450);
      this.hit=false;
      this.randY=random(0, 128);
    }
    if (this.pos.x<=-256&&this.vanish) {
      this.pos.x = 1024+random(2048);//stagger taco to right of screen
      this.pos.y=random(250, 450);
      this.hit=false;
      this.randY=random(0, 128);
    }

    if (player.pos.x < this.pos.x + 84
      &&player.pos.x > this.pos.x - 72
      && player.pos.y < this.pos.y + 72 
      && player.pos.y > this.pos.y - 72)
    {
      if (!this.hit&&!this.vanish) {
        dmgSnd.load();
        dmgSnd.play();
        player.health-=1;
        this.hit=true;
      }
      if (!this.hit&&this.vanish) {
        tacoSnd.load();
        tacoSnd.play();
        this.hit=true;
        this.pos.x = 1280+random(2048);//stagger chicken to right of screen
        this.pos.y=random(250, 450);
        this.randY=random(0, 128);
        this.hit=false;

        if (player.health<3) {
          player.health+=1;
        }
      }
    }
  }
  void draw() {
    imageMode(CENTER);
    if (!vanish) {
      image(chicken, this.pos.x, this.pos.y, 128, 128);
    }
    if (vanish) {
      image(taco, this.pos.x, this.pos.y, 128, 128);
    }
    //rect(this.pos.x, this.pos.y, 128, 320);
    imageMode(CORNER);
  }
}








class obstacle {
  Boolean hit = false;
  PVector pos = new PVector(1280, 310);
  obstacle() {
  }
  void update() {

    if (this.pos.x > -256) {
      this.pos.x-=12*speed;//move at same rate as scroll
      this.pos.y= 310;
    }
    if (this.pos.x<=-256) {
      this.pos.x = 1024+random(2048);//stagger boxes starting pos to the right of the screen
      this.pos.y=310;
      this.hit=false;
    }

    if (player.pos.x < this.pos.x + 72
      &&player.pos.x > this.pos.x - 128
      && player.pos.y < this.pos.y - 64 
      && player.pos.y > this.pos.y - 128)
    {
      player.floor=220;
    }
    if (!(player.pos.x < this.pos.x + 72
      &&player.pos.x > this.pos.x - 128
      && player.pos.y < this.pos.y - 64 
      && player.pos.y > this.pos.y - 128)) {
      //rect(16, 16, 320, 320);
      player.floor=380;
    }
  }
  void draw() {
    imageMode(CENTER);
    image(table, this.pos.x, this.pos.y, 256, 256);
    //rect(this.pos.x, this.pos.y, 128, 320);
    imageMode(CORNER);
  }
}


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
    image(this.img, this.pos.x, this.pos.y);
    if (this.hit&&timer>1.7) {
      image(pow, this.hitLoc.x, this.hitLoc.y, 128, 128);
    }
  }
  void update() { //check for collisions
    if (player.pos.x + 64 > this.pos.x 
      && player.pos.x -64 < this.pos.x 
      && player.pos.y -64 < this.pos.y
      && player.pos.y +64 > this.pos.y
      ) {
      this.hitLoc.y = this.pos.y;
      this.hitLoc.x = this.pos.x;
      if (!this.hit) {
        boxSnd.load();
        boxSnd.play();
        player.boxCount++;
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
      this.pos.x = 1024+random(2048);//stagger boxes starting pos to the right of the screen
      this.pos.y=340;
      this.timer=2;
      this.hit=false;
    }
  }
}


class slim {
  int boxCount = 0;
  int health = 3;
  float gravity = 0;
  float floor=380;
  float timer = 2;
  Boolean jump =false;
  PVector pos = new PVector(512, floor);
  float frame = 1;
  PImage[] slimOld = new PImage[10];
  void setup() {

    for (int i=0;i<10;i++) {
      slimOld[i] = requestImage("slimOld"+(i)+".png");
    }
  }
  slim() {
  }
  void draw() {
    if (gameOver&&fadeTimer<255&&!end) {
      fill(0, fadeTimer);
      rect(0, 0, 1024, 500);
    }
    //if (this.frame<9&&this.frame>=0) {
    imageMode(CENTER);
    image(slimOld[int(frame)], this.pos.x, this.pos.y, 256, 128);
    imageMode(CORNER);

    //}
  }
  void update() {
    if (this.health<=0&&gameOver==false) {
      timer=0;
      gameOver=true;
    }
    if (gameOver==true) {
      if (fadeTimer<255) {
        fadeTimer+=2;
      }
      if (this.pos.x<1280) {
        jump=false;
        this.pos.y=340;
        this.pos.x+=1;
        if (fadeTimer>=255) {
          end=true;
        }
      }
      if (end==true) {

        fill(0, 255);
        rect(0, 0, 1024, 480);
        if (timer==0) {
        }
        if (timer>255) {
          timer=0;
        }
      }
    }
    if (!end) {
      textAlign(RIGHT, TOP);
      textSize(32);
      text(str(boxCount), 400, 32, 540, 120);
      image(cupBox, 940, 24, 64, 64);
      for (int i=0; i<this.health; i ++) {
        image(heart, 72*i+32, 32, 64, 64);
      }
    }

    if (this.frame<10&&this.frame>=0) {
      this.frame+=speed;//move to next frame
    }
    if (!(this.frame<10&&this.frame>=0)) {
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
      if (!jumpPlay) {
        jumpPlay=true;
        jumpSnd.load();
        jumpSnd.play();
      }
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
      jumpPlay=false;
      this.gravity=0;
    }
  }
}


class Backdrop {

  float x_pos = 0;


  void draw() { 
    if (x_pos<48) {
      this.x_pos+=12*speed;

      for (int i=0;i<width+this.x_pos;i+=48) {
        image(ground, i-this.x_pos, 0, 48, 480);
      }
      if (this.x_pos>47) {
        this.x_pos=0;
      }
    }
  }
  Backdrop() {
    // this.ground = requestImage("tile.png");
  }
}  

void setup() {
  taco = requestImage("taco.png");
  toon = createFont("ObelixPro", 32);
  medKit.pos.y=200;
  medKit.pos.x=2048;
  chef.pos.x=1280;
  chef.pos.y=300;
  ramp = requestImage("ramp.png");
  building = requestImage("building.png");
  heart = requestImage("heart.png");
  table = requestImage("table.png");
  chicken = requestImage("chicken.png");
  pow = requestImage("pow.png");
  cupBox = requestImage("box.png");
  ground = requestImage("tile.png");
  for (int i=0;i<boxes.length;i++) {//setup boxes initial positions
    boxes[i] = new object();
    boxes[i].pos.x = 1024+random(2048);//stagger boxes starting pos to the right of the screen
    boxes[i].pos.y = 320;
  }
  for (int i=0;i<buildings.length;i++) {//setup building initial positions
    buildings[i] = new PVector();
    buildings[i].x = random(-16, 1280);//stagger boxes starting pos to the right of the screen
    buildings[i].y = random(250, 400);
  }
  //box.setup(); had to be moved to global? setup to accomidate array of boxes
  player.setup();
  size(1024, 480);
  frameRate(30);
}
void draw() {
  if (ground.width>1) {

    if (!game) {

      a = 150 + sin(alpha) * 120.0;
      alpha = alpha+.2;
      imageMode(CORNER);
      image(ramp, 0, 0, 1024, 480);
      for (int i=0;i<buildings.length;i++) {
        if (buildings[i].x>-64) {
          buildings[i].x-=1;
          //println("b"+buildings[i].x);

          image(building, buildings[i].x, buildings[i].y, 64, 256);
          fill(236, 24, 85, 150-i*20);
          noStroke();
          rect(buildings[i].x, buildings[i].y, 64, 256);
          fill(255);
        }
        if (buildings[i].x<-64) {
          buildings[i].x = 1024+64;//stagger boxes starting pos to the right of the screen
          buildings[i].y = random(250, 400);
        }
      }
      imageMode(CORNER);
      textFont(toon);
      fill(255);
      textAlign(CENTER, TOP);
      textSize(110);
      text("Butchy Boy", 0, 64, 1024, 600);
      textSize(64);
      text("Revenge on Slim City", 0, 200, 1024, 600);

      textSize(16);
      fill(255, 180);
      text("(c) Copyright JohnHenryClark 2014", 0, 460, 1024, 600);
      textSize(32);
      fill(255, a);
      text("Press Any Key to Start", 0, 340, 1024, 600);
      fill(255);
    }
    if (game) {
      timer+=1/frameRate;
      speed+=.001;//trololololololololol == born sadist
      sky.draw();
      if (!gameOver) {
        chef.draw();
      }
      player.update();
      player.draw();

      if (!end) {

        berty.draw();
      }
      if (!gameOver) {

        medKit.update();
        medKit.draw();
      }
      chef.update();
      berty.update();
      if (!gameOver) {

        for (int i=0;i<boxes.length;i++) {//update boxes: move and check for collisions, see object.update
          boxes[i].update();
          boxes[i].draw();
        }
      }
      if (end) {
        fill(255);
        textAlign(CENTER);
        textSize(64);
        text("Game Over", 0, 200, 1024, 400);
        textSize(48);
        image(cupBox, 400, 340, 128, 128);
        textAlign(LEFT);
        text(" = "+str(player.boxCount), 512, 380, 1024, 580);
        fill(0);
      }
      if (player.jump) {
        fill(255, 0, 0);
        //rect(16, 16, 100, 100);
        fill(255);
      }
      /*
      //DEBUG
       println("floor = "+player.floor);
       // println("chicken x = "+chef.pos.x);
       println("slim pos.y = "+player.pos.y);
       println("gravity = "+player.gravity);
       //boxes.draw();
       
       */
    }
  }
}
void keyPressed() {
  if (end) {
    speed = 1;
    jumpTime=1;
    timer=0;
    fadeTimer=0;
    alpha = .1;
    a = 0;
    gameOver=false;
    game=false;
    end=false;

    player.boxCount = 0;
    player.health = 3;
    player.gravity = 0;
    player.floor=380;
    player.timer = 2;
    player.jump =false;
    player.pos.x = 512;
    player.pos.y = 380;
    player.frame = 1;
    //PImage[] slimOld = new PImage[10];

    medKit.pos.y=200;
    medKit.pos.x=2048;
    chef.pos.x=1280;
    chef.pos.y=300;
  }
  if (keyPressed&&!game) {
    game=true;
    if (key == CODED) {
      if (keyCode == UP || keyCode == DOWN) {
        game=true;
      }
    }
  }
  if (key == CODED) {
    if (keyCode==UP&&player.jump==false) {
      player.jump=true;
    }
    if (keyCode==DOWN) {
      player.health-=1;
    }
  }
}



