
Spaceship spaceship;
Obstacles obstacleSmall;
Obstacles obstacleLarge;
Obstacles obstacleMed;
Collision collision;
Time time;
Lives life;
PImage bg1;
PImage bg2; //background image
PImage bg3;

void setup() {
  size (700, 300);
  smooth();
  bg1 = loadImage("fly.jpg");
  bg2 = loadImage("forest.jpg");
  bg3 = loadImage ("dead.jpg");

  life = new Lives();

  spaceship = new Spaceship();
  collision = new Collision();

  obstacleSmall = new Obstacles(20);
  obstacleLarge = new Obstacles(50);
  obstacleMed = new Obstacles(35);

  time = new Time();
}

void draw() {
  if (time.seconds<20) { //after 20 seconds, change bg image! no real point yet...
    background(bg2);
  }
  else {
    background(bg1);
  }
  
  if (life.lives==0){  //Show death background
    background(bg3);
  }


  life.invincible();
  life.display();
  life.death();


  spaceship.move();
  spaceship.boundary();
  spaceship.display();

  obstacleSmall.move();
  obstacleLarge.move();
  obstacleMed.move();

  obstacleMed.display();
  obstacleSmall.display();
  obstacleLarge.display();

  time.display();

  collision.display();
}

class Collision {

  public boolean ship_life;
  public float t;

  Collision() {
    ship_life = true;
    t=0;
  }

  void display() {
    t+=0.017; //increase t;;invicibility post crash-- increase by 1 every second

if (t>1 && life.lives>0 && life.cheatcode!=true){  //invincibility for first second/ 1st sec after crash
    //Returns spaceship after Big/Med Obstacle 
    if (dist(obstacleLarge.x, obstacleLarge.y, spaceship.x, spaceship.y)>obstacleLarge.r || dist(obstacleMed.x, obstacleMed.y, spaceship.x, spaceship.y)>obstacleMed.r) {
      if (ship_life!=false) { //if small obstacle already hit, no more spaceship!
        spaceship.r=50;
      }
      //Small obstacle removes all lives
      if (dist(obstacleSmall.x, obstacleSmall.y, spaceship.x, spaceship.y)<(obstacleSmall.r/2+spaceship.r/2)) {
        ship_life = false;
        life.lives -= life.lives;
      }

      // Big/Med obstacles remove 1 life
      if (ship_life!=false) {
        if (dist(obstacleLarge.x, obstacleLarge.y, spaceship.x, spaceship.y)<((obstacleLarge.r/2+spaceship.r/2)-2) || dist(obstacleMed.x, obstacleMed.y, spaceship.x, spaceship.y)<((obstacleMed.r/2+spaceship.r/2)-2)) {
          fill(255, 0, 0); 
          //ellipse (width/2, height/2, 60, 60);
          //lose a life
          t=0;
          life.lives-=1;
        }
      }
    }
    if (life.lives == 0){
      spaceship.r = 0;
    }
      //restart spaceship if SPACEBAR is pressed
      if (keyPressed  && key== ' ') {
        spaceship.r = 50;
        spaceship.x = width/2;
        spaceship.y = height/2;
        ship_life=true;
      }
      println(t);
    }
  }
}

class Lives {
  public String life_string;
  public PFont font; 
  public PFont deathfont;
  public int lives;
  public boolean cheatcode;

  Lives() {
    font = loadFont ("Bodoni.vlw");
    deathfont = loadFont("Bold.vlw");
    lives = 3;
  }

  void display() { //show lives
    fill(0);
    life_string = lives +" Lives";
    textFont(font, 30);
    text (life_string, width/2-50, 0+30);
  }
  void death() {
    if (lives == 0) {
      fill(255, 0, 0);
      textFont(deathfont, 100);
      text ("GAME OVER", width/2 -300, height/2);
    }
  }
  void invincible() { //invincible text above/below ship;; shouldnt be there when lives=0
   if (keyPressed && key == ' '){
     cheatcode = true;
   }
   else{
     cheatcode = false;
   }
   
//    if (lives > 1);{
//      if (collision.t < 0.9 || cheatcode==true) {
//        fill (0, 0, 255);
//        textFont(font, 30);
//        text ("invincible", spaceship.x-55, spaceship.y+50);
//        text ("invincible", spaceship.x-55, spaceship.y-35);
//      }
//    }
  }
}


class Obstacles {
  public float x, y;
  public float r;
  public float x_speed, y_speed;

 Obstacles(float radius) {
    r = radius;
    x = random(width);
    y = random(height);
    x_speed=random(-4, -1);
  }

  void move() {
    x+=x_speed;

    if (x<(0+(r/2))) { //x boundary
      x=width;
      y = random(0+(r/2), height-(r/2));
      x_speed=random(-4,-1);
    }
    if (y >height || y < 0) {
      y_speed*=-1;
    }
  }

  void display() {
    fill (255);
    rectMode(CENTER);
    rect(x, y, r, r);
  }
}



class Spaceship {
  PImage img;

  public  int x;
  public int y;
  public int r; 
  public int speed;

  Spaceship() {
    img = loadImage ("Spaceship.jpg");
    img.resize(0, 25);
    x = (width/2);
    y = (height/2);
    r = 50; 
    speed = 4;
  }
  void move() {
    if (keyPressed) {
      if (keyCode == UP) {
        y-=speed;
      }
    }

    if (keyPressed) {
      if (keyCode == DOWN) {
        y+=speed;
      }
    }
    if (keyPressed) {
      if (keyCode == RIGHT) {
        x+=speed;
      }
    }
    if (keyPressed) {
      if (keyCode == LEFT) {
        x-=speed;
      }
    }
  }

  void boundary() { //so that spaceship can't leave playing field
    if (x<r/2) {
      x = r/2;
    }
    if (x>width-(r/2)) {
      x = width-(r/2);
    }
    if (y<r/2) {
      y = r/2;
    }
    if (y>height-(r/2)) {
      y = height - (r/2);
    }
  }

  void display() {

    noFill ();
    strokeWeight(8);
    if (collision.t<1 || life.cheatcode == true){ //change color from blue to green when invincible
      stroke(0,255,0);
    }
    else{
      stroke (0,0,255);
    }
    ellipse(x, y, r, r);
    noStroke();
    //mageMode(CENTER);
    //image(img, x, y, r, r);
  }
}

class Time {
  public String time_string;
  public PFont font; 
  public int seconds;

  Time() {
    font = loadFont ("Agency.vlw");
    seconds = millis()/1000;
  }

  void display() { //show time in bottom right corner
    seconds = millis()/1000;
    time_string = seconds+"s";
    fill(255, 0, 0);
    textFont(font, 30);
    text (time_string, width-40, height);
  }
}



