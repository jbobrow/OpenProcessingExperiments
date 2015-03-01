
import processing.dxf.*;
import ddf.minim.*;

AudioPlayer player; //import minim audio 
Minim minim; //audio context 
AudioInput input; 

//enemy array 
Asteroid[] asteroids = new Asteroid[1000];
Planet[] planets = new Planet[1000];

ArrayList bombs; //bomb array list 


int radius = 10;
int directionX = 1;
int directionY = 0;
float shipX=20;
float shipY=20; 
float speed=5;

int y; 
int x; 

//spawn location 
int wx[] = new int[2];
int wy[] = new int[2];

color col; 

//enemy variables
int startTime; 
int totalAsteroids;
float asteroidAttack = random(1000, 3000); 
int score; 

int totalPlanets;
//spawn after longer time, increase difficulty 
float planetAttack = random(100, 100000); //spawn time//planets spawn later than spacerocks, increase difficulty

PImage myImg;
PImage myImg2;
PImage myImg3;
PImage myImgBomb; 
PImage myImgShip; 

float randomX;
float randomY = 550; 

int numBombs; 
int gravity = 0;

void setup ()
{

  minim = new Minim(this);
  player = minim.loadFile("data/SpaceBattle.mp3");
  player.loop();
  input = minim.getLineIn();

  randomX = random (50, 550);

  size(600, 600, P3D);
  colorMode(HSB);
  smooth();
  noStroke(); 
  ellipseMode(RADIUS);
  startTime = millis(); 

  // initialise the arrayList of bomb
  bombs = new ArrayList();



  //initialize enemy list
  for (int i = 0; i < asteroids.length; i++) {
    asteroids[i] = new Asteroid();
  }

  for (int i = 0; i < planets.length; i++) {
    planets[i] = new Planet();
  }  




  //load images 
  myImg = loadImage ("data/planet.png");
  myImg2 = loadImage ("data/Spacerock.png");
  myImg3 =loadImage ("data/background.jpeg");
  myImgBomb =loadImage ("data/bomb.png");
  myImgShip =loadImage ("data/Spaceship.png");
}


void draw () 
{
  background(128, 128, 128);
     imageMode(CORNER);
    image(myImg3, x, 0);
    image(myImg3, x+myImg3.width, 0); 




  gravity += 1; 
  shipY += gravity; 


  //spawn obstacle every 2 seconds 
  //make obstacle 
    if ((millis() - startTime) > asteroidAttack) {
    asteroids[totalAsteroids].alive = true;
    if (totalAsteroids >= asteroids.length) {
      totalAsteroids = 0;
    }

    totalAsteroids++;
    startTime = 0;
    asteroidAttack = asteroidAttack + (random(500, 1500));
  }

  //checks through enemies and detects collisions 

  //might need bubble for() loop 

  //Display enemies (only if alive/after elapsed time)

  for (int i = 0; i < asteroids.length; i++) {
    asteroids[i].move();
    asteroids[i].display();

    if (i == asteroids.length) {
      i = 0;
    }

    //Kill enemies if they reach the left side of the screen

    if (asteroids[i].reachedEnd()) {
      asteroids[i].kill();
    }
  }

  ///////////////////////////////////////////////
  ///////////////////////////////////////////////
  //Spawn Human 
  //spawn enemy every 2 seconds 
  //make enemy 
  if ((millis() - startTime +1000) > planetAttack) {
    planets[totalPlanets].alive = true;

    if (totalPlanets >= planets.length) {
      totalPlanets = 0;
    }

    totalPlanets++;
    startTime = 0;
    planetAttack = planetAttack + (random(500, 1500));
  }

  //checks through enemies and detects collisions 


  //Display enemies (only if alive/after elapsed time)

  for (int i = 0; i < planets.length; i++) {
    planets[i].move();
    planets[i].display();

    if (i == planets.length) {
      i = 0;
    }

    //Kill enemies if they reach the left side of the screen

    if (planets[i].reachedEnd()) {
      planets[i].kill();
    }
  }

  ////////////////////////////////////////////////
  ////////////////////////////////////////////////



  // changing Position //ball mode 
  shipX=shipX+speed*directionX;
  shipY=shipY+speed*directionY; 

//draw players ship 
  image(myImgShip, shipX, shipY, radius*5, radius*5);    // body



  for (int i = bombs.size ()-1; i>=0; i--) {


    Bomb f = (Bomb) bombs.get(i);
    f.update();

    // check hit with each fish
    if (f.hitTest(shipX, shipY) == true) {
      bombs.remove(i);
    }



    //remove excess enemies
    if (numBombs > 20) {
      bombs.remove(i);
    }


  }



    //lost condition 
    //if player goes out of bounds, stop game, pause music 
  if (shipY>height||shipY<0 && shipX>height||shipX<0) {
    player.mute(); 
    player.pause(); 
    frameRate(0);
    player.pause(); 
    stopMusic(); 
    print ("You Are Forever Lost In The Dark Corners Of Time");
  } 
}

void update () {

  checkBounds();
}

void checkBounds () {

  if ((shipX > width+10) || (shipX < 0)) {
    directionX = directionX * -1;
  }
  if ((shipY > height+10) || (shipY < 0)) {
    directionY = directionY * -1;
  }
}


void makeBomb ()
{

//make fish using arryalist method 
  bombs.add(new Bomb(mouseX, mouseY));
}



void keyPressed()
{
  if (key == 'a')
  {

    directionX=-1;
    directionY=0;

  } else if (key == 'd')
  {

    directionX=1;
    directionY=0;

  } else if (key == 'w')
  {

    directionY=-1;
    directionX=0;
    gravity = -10; 

  } else if (key == 's')
  {

    directionY=1;
    directionX=0;

  }
}

void stopMusic () {

  player.close();
  input.close(); 
  minim.stop();
  super.stop();
}

void mousePressed()
{
  //hit test 
  for (int i=0; i<bombs.size (); i++) {
    Bomb f = (Bomb) bombs.get(i);
    boolean val = f.hitTest(mouseX, mouseY);

  }

  makeBomb(); 
  
}



class Asteroid {

  float x, y;
  float speed;
  int r;
  boolean alive;
  float rand;

  Asteroid() {
    r = 20;
    x = height + r*20; //spawn location 
    y = random(height);
    speed = random(5, 7);
    alive = false;
    rand = random(10, 20);
  }

  void move() {
    if (alive) {      //Only move if alive (after elapsed time)
      x -= speed;     //Move left
    }
  }

  //Determines whether the enemies have reached the left side of the screen

  boolean reachedEnd() {
    if (x < 0 - r*2) {
      x = 1000;
      y = -2000;
      score--;
      return true;
    } else {
      return false;
    }
  }



  void display() {
    if (alive) {  //Display only if alive (after elapsed time)
      if (rand >= 9.5) {
        image(myImg2, x, y, 3*r, 3*r);
      }
    }
  }

  void kill() {
    alive = false;
    x = 1000;
    y = -2000;
    speed = 0;
  }
}


//up here is global 



class Bomb {
  //everything to do with a fish in here

  float x, y, w, h;
  float sp;
  color col; 

  float t = 0;
  float inc = 0.1; 
  float offSet; 

  float speed;
  int r;
  boolean alive;
  float rand;
  


  //class constructor
  //analogous to setup() in main script 
  Bomb ()
  {
    


    colorMode(HSB); 
    println("hello i am a new Bomb"); 
    x = random(width);
    y = random(height);
    w = random(50, 100);
    h = random (25, 50);
    sp = random (1, 3);
    col = color(random(128, 255), random(128, 255), random(128, 255));

    r = 20;
    x = width + r*20; //spawn location 
    y = random(height);
    speed = random(5, 7);
    alive = false;
    rand = random(10, 20);
  }

  //class constructor with arguments
  Bomb (int xx, int yy)
  {



    println("hello i am a new fish with arguments"); 
    x = xx;
    y = yy;
    r = 20; 
    w = random(50, 100);
    h = random (25, 50);
    sp = random (1, 3);
    col = color(random(128, 255), random(128, 255), random(128, 255));
  }

  void update () 
  {

    move();
    display();
  }

  void move ()
  {

    y += sp; //increment across screen //move on y axis 

    //bob up and down
    t += inc;
    offSet = sin(t) *20; 

    //check for bouncing off sides
    if (x > width || x < 0) {
      sp = -sp;
    }
  }

  void display () 
  {
    image(myImgBomb, x, y, 5*r, 5*r);
    
  }

  boolean hitTest (float xx, float yy) { 
    boolean toReturn = false;

    if (xx > x  &&  xx < x + w  && yy > y && yy < y + h ) {
      //i was hit by the mouse
      toReturn = true; 

    }

    return toReturn;
  }

  boolean hit(Asteroid a) {
    float distance = dist(x, y, a.x, a.y);
    if (distance < r + a.r) {
      println ("I Hit!");
      return true;
    } else {
      return false;
    }
  }
}




class Planet {

  float x, y;
  float speed;
  int r;
  boolean alive;
  float rand;

  Planet() {
    r = 20;
    x = height + r*20; //spawn location 
    y = random(height);
    speed = random(2, 3);
    alive = false;
    rand = random(10, 50);
  }

  void move() {
    if (alive) {      //Only move if alive (after elapsed time)
      x -= speed;     //Move left
    }
  }

  //Determines whether the enemies have reached the left side of the
  //screen

  boolean reachedEnd() {
    if (x < 0 - r*2) {
      x = 1000;
      y = -2000;
      score--;
      return true;
    } else {
      return false;
    }
  }

  void display() {
    if (alive) {  //Display only if alive (after elapsed time)
      if (rand >= 9.5) {
        image(myImg, x, y, 5*r, 5*r); //r = image multiplication size 
      }
    }
  }

  void kill() {
    alive = false;
    x = 1000;
    y = -2000;
    speed = 0;
  }
}



