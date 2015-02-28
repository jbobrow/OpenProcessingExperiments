
import ddf.minim.*;

PImage[] boys = new PImage[2];
PImage[] girls = new PImage[2];
PImage[] cloud = new PImage[2];
PImage bgd;
PImage heart; 
PImage tree;
//WIND
int N_WIND = 10;
float[] winds  = new float[N_WIND];
//CLOUD
int N_CLOUD = 3;
Cloud[] clouds = new Cloud[N_CLOUD];
//HEART
int MAX_HEART = 5;
int N_HEART = 3;
Heart[] hearts = new Heart[MAX_HEART];
//HUMAN
Human boy = new Human(50, 50, boys);
Human girl = new Human(565, 350, girls);

//GAME
Game game = new Game();

Minim minim;
AudioPlayer player;
AudioPlayer baylen;
AudioPlayer gioiqua;

void mousePressed() {
  boy.state *= -1; 
  for (int i = 0; i< N_HEART;i++) {
    if (mouseX >= hearts[i].x_ - 50 && mouseX <= hearts[i].x_ + 100 &&
      mouseY >= hearts[i].y_ - 50 && mouseY <= hearts[i].y_ + 100){
      hearts[i].yspeed_ -= 0.5;
      baylen.rewind();
      baylen.play();
      }
  }
}

void keyPressed() {
  if (keyCode == ENTER) {
    game.start();
  }
  if (key == CODED) {

    if (keyCode == LEFT) {
      girl.x_ -= 4;
      girl.state = -1;
    }
    if (keyCode == RIGHT) {
      girl.x_ +=4;
      girl.state = -1;
    }
  }
}

void keyReleased() {
  girl.state = 1;
}

void setup() {
  size(800, 600);
  minim = new Minim(this);
  player = minim.loadFile("love1.mp3");
  //player.setVolume(0.5);
  baylen = minim.loadFile("baylen.mp3");
  gioiqua = minim.loadFile("gioiqua.mp3");
  
  bgd = loadImage("background.png");
  heart = loadImage("heart.png");
  boys[0] = loadImage("boy1.png");
  boys[1] = loadImage("boy2.png");
  girls[0] = loadImage("girl1.png");
  girls[1] = loadImage("girl2.png");
  cloud[0] = loadImage("cloud1.png");
  cloud[1] = loadImage("cloud2.png");
  tree = loadImage("tree.png");

  //Initializing clouds
  for (int i = 0; i< N_CLOUD; i++) {
    clouds[i] = new Cloud(random(0, 400), 100 * i + 50, 1, cloud[1]);
  }

  //Initializing winds
  for (int i = 0; i < N_WIND;i++) {
    winds [i] = random(-1, 1);
  }

  //Initializing hearts;
  for (int i = 0; i < N_HEART;i++) {
    hearts[i] = new Heart(175., 80., 0.2  + random(0.5), 0.05, winds, heart);
  }

  savedTime = millis();
}

double time, savedTime;
void draw() {

  background(#459CE5);
  image(bgd, 0, 0);
  if (game.state == 1) {
    player.play();
    for (int i = 0;i < N_CLOUD;i++) {
      clouds[i].draw();
      clouds[i].update();
    }
    image(tree, 0, 0);

    //HEART
    time = millis();
    if (time - savedTime >= 5000) {
      int active = (int ) random(0, N_HEART);
      if (hearts[active].state_ != 1) 
        hearts[active].state_ = 1;
      savedTime = time;
    }
    for (int i = 0; i < N_HEART;i++) {

      hearts[i].draw();
      hearts[i].update(game, girl);
    }  
    //HUMANS
    girl.update();
    girl.draw();

    boy.update();
    boy.draw();
    //GAME
    textSize(20);
    text("Score: " + game.score, width - 100, 20);
    game.check();
  } 
  else if (game.state == 0){
    player.pause();
    textSize(50);
    text("Press Enter To Start. (^_^)", width/2 - 300, height/2 - 50);
  } else {
    textSize(50);
    text("Em Gioi Qua! ANH YEU EM <3", width/2 - 350, height/2 - 50);    
  }
}

class Cloud{
 float x_;
 float y_;
 float speed_;
 float acce_;
 PImage img_;
 
 Cloud(float x, float y, float speed, PImage img){
  x_ = x;
  y_ = y;
  speed_ = speed;
  img_ = img;
  acce_ = 0;
 }
 
 void update(){
  x_ = x_ + speed_ + acce_; 
  if(x_ > width) x_ = -img_.width;
  
 }
 
 void draw(){
   image(img_,x_,y_);
 }
  
}
class Game {
  int state = 0; //0 - waiting to start, 1 = playing, 2 = end;
  int score = 0;
  Game() {
  }
  
  void start(){
   state = 1; 
  }
  
  void check(){
   if(score >= 3){
      state = 2;
   } 
  }
}

class Heart {
  float defaultx_, defaulty_;
  float x_;
  float y_;
  float xspeed_;
  float yspeed_;
  float grav_;
  float acce_;
  PImage img_;
  float[] winds_;
  float wind = 0;
  int state_ = -1; //1 = active, -1 = inactive;
  Heart(float x, float y, float xspeed, float yspeed, float[] winds, PImage img) {
    x_ = x;
    y_ = y;
    defaultx_ = x;
    defaulty_ = y;
    xspeed_ = xspeed;
    yspeed_ = yspeed;
    img_ = img;
    acce_ = 0;
    grav_ = 0.01;
    winds_ = winds;
    state_ = -1;
  }

  void update(Game g, Human h) {
    if (state_ == 1) {
      int step = height/winds_.length;
      for (int i = 0;i < winds_.length;i++) {
        if (y_ > i *  step && y_ < i * step + step) {
          wind = winds_[i];
        }
      }
      x_ = x_ + xspeed_ +  wind;
      y_ = y_ + yspeed_;
      yspeed_ = yspeed_ + grav_;

      if (x_ >= h.x_ && x_ < h.x_ + 50 && y_ >= h.y_ && y_ <= h.y_ + 50) {
        g.score += 1;
        state_ = -1;
        x_ = defaultx_;
        y_ = defaulty_;
        gioiqua.rewind();
        gioiqua.play();
        h.state = 2;
        h.state = 1;
        yspeed_ = 0.05;
      }
      if ( x_ >= width || y_ >= height - 50) {
        state_ = -1;
        x_ = defaultx_;
        y_ = defaulty_;
        yspeed_ = 0.05;
      }
    }
  }

  void draw() {
    pushMatrix();
    image(img_, x_, y_);
    popMatrix();
  }
}

class Human {
  PImage[] imgs_;
  int state = 1; //1 = wait, 2 = take
  float x_, y_;
  Human(float x, float y, PImage[] imgs) {
    imgs_ = imgs;
    x_ = x;
    y_ = y;
  }

  void update() {
  }

  void draw() {
    PImage img;
    if (state == 1) {
      img = imgs_[0];
    } else {
      img = imgs_[1]; 
    }
    image(img,x_,y_);
  }
}



