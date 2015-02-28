
//Shane Gilligan-Steinberg
//a little help from concepts from "the nature of code"
import controlP5.*;
ControlP5 cp5;
PImage bg;
PImage img;
PImage img2;


Mover mover;
Target target;
Bullseye bullseye;
Obstacle obstacle;
BigObstacle bigObstacle;


int xFire = 50;
int yFire = 100;
int score = 1;
int lives = 10;

int gravityPower = 5;
float angle = 0;
int level = 1;
float arrowPower = 0;

void setup() {
  size(640, 360);
  obstacle = new Obstacle();
  bigObstacle = new BigObstacle();
  mover = new Mover(100, height-150);
  target = new Target();
  bullseye = new Bullseye();
  cp5 = new ControlP5(this);
  background(255);
  int xFire = 50;
  int yFire = 100;

  cp5.addSlider("arrowPower") //slider for power of arrow
    .setPosition(50, 50)
      .setRange(0, 10)
        ;
  //  cp5.addSlider("level") //slider for level
  //    .setPosition(50, 30)
  //      .setRange(0, 10)
  //        .setNumberOfTickMarks(10)
  ;
  cp5.addSlider("gravityPower") //slider for force of gravity
    .setPosition(50, 70)
      .setRange(-5, 10)
        .setNumberOfTickMarks(15)
          ;
  cp5.addSlider("angle") //slider for angle of shot
    .setPosition(100, 160)
      .setSize(20, 100)
        .setRange(-5, 5)
          ;
  bg = loadImage("grass.jpg");
  img = loadImage("rock.JPG");
  img2 = loadImage("hedge.png");
}

void draw() {

  background(bg);
  fill(255, 0, 0);
  textSize(12);
  text("level", 10, 10);
  text("lives", 10, 30);
  text(score, 70, 10);
  text(lives, 70, 30);
  fill(100);
  rect(xFire, yFire, 20, 20); // fire button
  if (lives < 0)
  {
    textSize(50);
    fill(255, 0, 0);
    background(255);
    text("you lose", 200, 200);
  }

  mover.update(); // arow methods
  mover.checkEdges();
  mover.display();
  mover.targetHit();
  mover.bigobstacleHit();
  mover.obstacleHit();

  target.display();
  bullseye.display();

  println(score);

  PVector gravity = new PVector(0, gravityPower * .02); //gravity baseline
  PVector power = new PVector(6, 0); //power baseline
  PVector angler = new PVector(0, 5); // angle baseline

  if (mousePressed==true && mouseX >= xFire && mouseX <= xFire +20 && mouseY >= yFire && mouseY <= yFire + 20)
  { //fire
    fill(0);
    rect(xFire, yFire, 20, 20);
    power.mult(arrowPower);
    mover.applyForce(gravity);
    mover.applyDirectForce(power);
    angler.mult(angle*-1);
    mover.applyDirectForce(angler);
    xFire = -100;
    yFire = -100;
  }

  if (level == 1) //level set
  {
    obstacle.goAway();
    target.reset();
    bullseye.reset();
    bigObstacle.goAway();
  }
  else if (level == 2)
  {
    obstacle.display();
    obstacle.checkEdges();
    obstacle.update();
    target.reset();
    bullseye.reset();
    bigObstacle.goAway();
    image(img, obstacle.location.x, obstacle.location.y);
  }
  else if (level == 3)
  {
    obstacle.reset();
    obstacle.display();
    target.reset();
    bullseye.reset();
    bigObstacle.goAway();
    image(img, obstacle.location.x, obstacle.location.y);
  }
  else if (level == 4)
  {
    target.update();
    bullseye.update();
    obstacle.goAway();
    bigObstacle.goAway();
  }
  else if (level == 5)
  {
    target.update();
    bullseye.update();
    obstacle.reDo();
    obstacle.reset();
    obstacle.display();
    bigObstacle.goAway();
    image(img, obstacle.location.x, obstacle.location.y);
  }
  else if (level == 6)
  {
    bigObstacle.reset();
    bigObstacle.display(); 
    obstacle.goAway();
    target.reset();
    bullseye.reset();
    image(img2, bigObstacle.location.x, bigObstacle.location.y);
  }
  else if (level == 7)
  {
    bigObstacle.goAway();
    target.reset();
    bullseye.reset();
    obstacle.reset();

    obstacle.update2();
    obstacle.display();
    image(img, obstacle.location.x, obstacle.location.y);
  }
}
void keyPressed()
{
  if (key == 'r' || key == 'R') //reset
  {
    setup();
    xFire = 50;
    yFire = 100;
    lives --;
    //    level = level + 1;
  }
  if (key == 'p' || key == 'P') // not a cheat
  {
    mover.location.x = bullseye.location.x - 70;
    mover.location.y = bullseye.location.y + 10;
    lives --;
  }
}

class BigObstacle
{
  float xCord1 = width/2;
  float yCord1 = 0;
  PVector location;
  BigObstacle()
  {
    location = new PVector(xCord1, yCord1);
  }

  void display() //show
  {
    fill(0);
    rect(location.x, location.y, 15, 50);
    rect(location.x, location.y + 100, 15, 300);
  }
  void reset() //go to initial position
  {
    PVector add = new PVector(xCord1, yCord1);
    location.mult(0);
    location.add(add);
  }
  void goAway() //hide and move away
  {
    location.y = width;
  }
}

class Bullseye
{
  int xCord = width-40;
  int yCord = height-100;
  PVector location;
  PVector speed;
  Bullseye()
  {
    location = new PVector(xCord, yCord);
    speed = new PVector(0, -1);
  }
  void display() //show
  {
    fill(249, 231, 61);
    rect(location.x, location.y, 20, 20);
  }
  void update() //move up and down and turn around if touching roof
  {
    if (location.y + 60 > height) {
      speed.y *= -1;
      location.y = height-60;
    }
    else if (location.y - 40 < 0) {
      speed.y *= -1;
      location.y = 40;
    }
    location.add(speed);
    println(location.y);
  }
  void stop() //stop moving
  {
    speed.mult(0);
  }
  void reset() //go back to start position
  {
    PVector add = new PVector(xCord, yCord);
    location.mult(0);
    location.add(add);
  }
}

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float mass;

  Mover(int x, int y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0.0);
    topspeed = 10;
    mass = 10.0;
  }

  void update() //move the arrow
  {
    velocity.add(acceleration);
    location.add(velocity);
    //    acceleration.mult(0);
  }

  void display() //show arrow
  {
    stroke(0);
    fill(175);
    fill(113, 121, 120); //grey
    triangle(location.x, location.y, location.x-20, location.y-10, location.x-20, location.y+10);
    fill(203, 160, 72); //brown
    rect(location.x - 70, location.y -3, 50, 6);
    fill(145, 48, 29); //red
    quad(location.x - 80, location.y -10, location.x - 60, location.y -10, location.x - 50, location.y -3, location.x - 70, location.y -3); 
    quad(location.x - 80, location.y +10, location.x - 60, location.y +10, location.x - 50, location.y +3, location.x - 70, location.y +3);
  }

  void checkEdges() //see if touching side or top
  {
    if (location.x > width) {
      location.x = width;
      velocity.mult(0);
      acceleration.mult(0);
    } 
    else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
      velocity.mult(0);
      location.y = height;
    }
    else if (location.y < 0) {
      //      velocity.y *= -1;
      //      location.y = 0;
    }
  }
  void applyForce(PVector force) //aply a force that is throughout
  {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
  void applyDirectForce(PVector force) //aplly a force that happens once
  {
    PVector f = force.get();
    f.div(mass);
    velocity.add(f);
  }
  void rotate() //rotate arrow
  {
    //    if (velocity.x > 0)
    //    {
    //      pushMatrix();
    //      rotate(radians(315)); //rotate up
    //      popMatrix();
    //    }
    //    else if (velocity.x < 0)
    //    {
    //      pushMatrix();
    //      rotateX(radians(45));//rotate down
    //      popMatrix();
    //    }
  }
  void targetHit() //did it hit the target
  {
    if (location.x > target.location.x && location.x < target.location.x + 20 && location.y > target.location.y && location.y < target.location.y+100) {
      location.x =  target.xCord1;
      velocity.mult(0);
      acceleration.mult(0);
      target.stop();
      bullseye.stop();
      score = score + 1;
      level = level + 1;
      setup();
      xFire = 50;
      yFire = 100;



      if ((location.y < target.yCord1 && location.y > target.yCord1 + 40)||(location.y < target.yCord2 && location.y > target.yCord2+ 40)  )
      {
        score = score + 1;
        println(score);
      }
    }
  }
  void obstacleHit() //did it hit the obstacle
  {
    if (location.x > obstacle.location.x && location.x < obstacle.location.x + 15 && location.y > obstacle.location.y && location.y < obstacle.location.y +50) 
    {
      location.x =  obstacle.location.x;
      velocity.mult(0);
    }
  }
  void reset()
  {
    location.mult(0);
    location.add(new PVector(100, width-150));
  }
  void bigobstacleHit() //did it hit the other obstacle
  {
    if (location.x > bigObstacle.location.x && location.x < bigObstacle.location.x + 15 && ((location.y > bigObstacle.location.y && location.y < bigObstacle.location.y +50) || (location.y > bigObstacle.location.y + 100 && location.y < bigObstacle.location.y +400))) 
    {
      location.x =  obstacle.location.x;
      velocity.mult(0);
    }
  }
}

class Obstacle
{
  float xCord1 = width/2;
  float yCord1 = (height/2)+ 20 ;
  PVector location;
  PVector speed;
  Obstacle()
  {
    location = new PVector(xCord1, yCord1);
    speed = new PVector(0, -1);
  }
  void update() //move
  {
    location.add(speed);
    println(location.y);
  }
  void update2() //move
  {
    location.y = mover.location.y - 20;
    println(location.y);
  }

  void display() //show
  {
    fill(0);
    rect(location.x, location.y, 15, 50);
  }
  void checkEdges()//see if touching edge and turn around
  {

    if (location.y + 50 > height) {
      speed.y *= -1;
      location.y = height-50;
    }
    else if (location.y < 0) {
      speed.y *= -1;
      location.y = 0;
    }
  }
  void reset() //move back to start
  {
    PVector add = new PVector(xCord1, yCord1);
    location.mult(0);
    location.add(add);
  }
  void goAway() //hide and move away
  {
    location.y = width;
  }
  void reDo() //move back to start
  {
    PVector add = new PVector(xCord1, yCord1);
    location.add(add);
  }
}

class Target
{
  int xCord1 = width-40;
  int yCord1 = height-140;
  int xCord2 = width-40;
  int yCord2 = height-80;
  PVector location;
  PVector speed;
  Target()
  {
    location = new PVector(xCord1, yCord1);
    speed = new PVector(0, -1);
  }
  void display() //show
  {
    fill(255, 0, 0);
    rect(location.x, location.y, 20, 40);
    rect(location.x, location.y + 60, 20, 40);
  }
  void update() //move and turn around
  {
    if (location.y + 100 > height) {
      speed.y *= -1;
      location.y = height-100;
    }
    else if (location.y < 0) {
      speed.y *= -1;
      location.y = 0;
    }
    location.add(speed);
    println(location.y);
  }
  void stop() //stop moving
  {
    speed.mult(0);
  }
  void reset() // go back to start
  {
    PVector add = new PVector(xCord1, yCord1);
    location.mult(0);
    location.add(add);
  }
}



