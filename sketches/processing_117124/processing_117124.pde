
PImage reaper;
PImage earth;
PImage defeat;
PImage reaperHit;
PFont font;
PFont font1;
int lvl = 0;
int gunLvl = 0;
//int lineLength = 3000;
int loadCannon = 20;
float b = 0;
float centreX;
float centreY;
float s = -20;
float health = 1150;
float alive=0;
float deathTimer =0;
float r = 0;
float w =0;
float shield =0;
float stop = 0;
Player thePlayer = new Player();
// for explosions (these are actually Shrapnels)

//
// bullets
final float bulletFlySpeed = 8;  // how fast bullet flies
final int fireSpeed=1500; // how often you fire / distance between bullets
int lastFired=millis();  // timer to determine when next bullet starts
// ammo not in use
int ammoCount = 7000;


void setup()
{
  reset(); 
  size(800, 600); 
  imageMode(CENTER);
  rectMode(CENTER);
  ellipseMode(CENTER);
  smooth();
  earth = loadImage("earth.jpg");
  reaper = loadImage("reaper.png");
  reaperHit = loadImage("reaperHit.png");
  defeat = loadImage("defeat.png");
  font = loadFont("font.vlw");
  font1 = loadFont("font1.vlw");
  centreX = width-25;
  centreY = height/2;
  cursor(CROSS);
}

void draw()
{
  background(0);
  //image(earth, width/2, height/2, width, height);
  println("x: " + mouseX + " y: " + mouseY);
  println(health);
  thePlayer.draw();
  if (lvl == 0)
  {
    lvlA();
  }
  if (lvl == 1)
  {
    lvlB();
  }

  if (health<=0)
  {
    alive=0;
  }
}

void lvlA()
{
  image(earth, width/2, height/2, width, height);
  textFont(font1, 66);
  colorMode(RGB, 255, 255, 255);
  fill(255, 0, 0);
  text("Mass Effect", 230, 200);
  textFont(font, 66);
  colorMode(HSB, 360, 100, 100);
  fill(random(360), 100, 100);
  text("press SPACE to start", 115, 300);
  textFont(font, 40);
  colorMode(RGB, 255, 255, 255);
  fill(255, 0, 0);
  text("Left click to guide laser", 180, 400); 
  text("Right click to fire main gun", 180, 450);
  text("Middle click to generate shield", 180, 500);
}

void lvlB()
{
  monsterSpawn();
  float theta = atan2(centreX - mouseX, centreY - mouseY);
  pushMatrix();
  translate(centreX, centreY);
  rotate(-theta - HALF_PI);
  noFill();
  colorMode(GRAY, 255);
  strokeWeight(6);
  stroke(255);
  rect(0, 0, 30, 30);
  line(0, 0, 40, 0);
  popMatrix();

  if (s + w > 745 && shield == 0 && s+w < 800)
  {
    stop =1;
    death();
  }

  if (mousePressed && mouseButton == LEFT)
  {
    if (gunLvl == 1)
    {
      if (stop == 0)
      {
        colorMode(HSB, 360, 100, 100);
        strokeWeight(3);
        stroke(random(0, 60), 100, 100, random(200, 225));
        //float dx = mouseX - centreX;
        //float dy = mouseY - centreY;
        //float angle2 = atan2(dy, dx);
        //float newX = centreX + cos(angle2) * lineLength;
        //float newY = centreY + sin(angle2) * lineLength;
        line(centreX, centreY, mouseX, mouseY);
        if (s < 730 && s-50<mouseX && mouseX<s+50)
        {
          health -= 1;
        }
      }
    }
    if (gunLvl == 2)
    {
    }
    if (gunLvl == 3)
    {
    }
  }
  if (mousePressed && mouseButton == RIGHT)
  {
    if (gunLvl == 1)
    {
      thePlayer.fire();
    }
    if (gunLvl == 2)
    {
    }
    if (gunLvl == 3)
    {
    }
  }
  if (mousePressed && mouseButton == CENTER)
  {
    if (gunLvl == 1)
    {
      if (stop == 0)
      {
        noStroke();
        colorMode(RGB, 255, 255, 255);
        fill(0, 0, random(100, 255), random(100, 150));
        ellipse(centreX, centreY, 100, 100);
        shield =1;
      }
    }
    if (gunLvl == 2)
    {
    }
    if (gunLvl == 3)
    {
    }
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    lvl = 1;
    gunLvl = 1;
    alive =1;
  }
  if (key == 'r' && stop ==1)
  {
    setup();
  }
}

void mouseReleased()
{
  if (mouseButton == CENTER)
  {
    shield = 0;
  }
}

void reset()
{
  lvl = 0;
  gunLvl = 0;
  loadCannon = 20;
  b = 0;
  s = -20;
  health = 1150;
  alive=0;
  deathTimer =0;
  r = 0;
  w =0;
  shield =0;
  stop = 0;
}

void monsterSpawn()
{
  if (alive == 1)
  {
    if (stop == 0)
    {
      s++;
      textFont(font, 33);
      colorMode(RGB, 255, 255, 255);
      fill(0, 0, random(255));
      text("Reaper Shield: " + (int)health, 0, 30);

      if (s > 100)
      {
        w +=4;
        colorMode(RGB, 255, 255, 255);
        noStroke();
        fill(random(255), 0, random(255));
        rect(s + w, 300, 50, 20);
      }
    }
    if (s > 730)
    {
      death();
    }
    if (lvl == 1 && s < 730)
    {
      image(reaper, s, 300);
    }
  }
  if (alive == 0)
  {
    deathTimer += 0.0167;
    if (deathTimer <= 3)
    {
      image(reaper, -20 +s, 300);
      filter(THRESHOLD, random(0, 1));
    }
    if (deathTimer > 3)
    {
      image(reaperHit, width/2, height/2, width, height);
      textFont(font, 88);
      colorMode(HSB, 360, 100, 100);
      fill(random(360), 100, 100);
      text("VICTORY!", 200, 300);
      textFont(font, 30);
      text("Click 'R' to restart", 300, 500);
      stop = 1;
    }
  }
}

void death()
{
  image(defeat, 400, 300, width, height);
  textFont(font, 88);
  colorMode(RGB, 255, 255, 255);
  fill(random(255), 0, 0);
  text("DEATH", 255, 300);
  textFont(font, 30);
  text("Click 'R' to restart", 300, 500);
  stop = 1;
}

class Bullet {

  float x;
  float y;
  float speedX; 
  float speedY;
  float w;
  float life = 255;

  Bullet(float tempX, float tempY, // new2
  float tempSpeedX, float tempSpeedY, 
  float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speedX = tempSpeedX; // 4.2; // new2
    speedY = tempSpeedY; // 0;
  }


  void move() {
    // Add speed to location
    x = x + speedX;
    y = y + speedY;
    //
    // kill bullet when outside screen
    if (x<4)
      life=-1;
    if (y<4)
      life=-1;
    if (x>width-4)
      life=-1;
    if (y>width-4)
      life=-1;

    // blue rect
    if (x<= s)
    {
      life=-1;
      if (s < 730)
      {
        health -= 100;
      }
    }

    //
  }

  boolean finished() {
    // bullet dead?
    if (life < 0) {
      return true;
    }
    else {
      return false;
    }
  }

  void display() 
  {
    colorMode(RGB, 255, 255, 255);
    noStroke();
    fill(0, 0, 255, 180);
    ellipse(x, y, 20, 20);
  }
} 

class Player {

  ArrayList<Bullet> bullets;  
  PVector position, velocity; // contains x and y...

  Player() {
    bullets  = new ArrayList();  
    position = new PVector(775, 315);
    velocity = new PVector();
    velocity.x = 0;
    velocity.y = 0;
  }

  void fire() {     // new2
    if (fireSpeed<=millis()-lastFired) {
      if (ammoCount>0) {
        // ammoCount--;
        lastFired=millis();

        float xSpeed ;
        float ySpeed ;
        float angle = update(mouseX, mouseY);
        xSpeed = cos(angle);
        ySpeed = sin(angle);
        xSpeed*= bulletFlySpeed;
        ySpeed*= bulletFlySpeed;

        bullets.add ( new Bullet(
        position.x+12, position.y-14, 
        xSpeed, ySpeed, 
        5 ));
      } // if
    } // if
  } // method

  float update(int mx, int my) {
    //determines angle to mouse
    float angle = atan2(float(my)-(position.y-14), float(mx)-(position.x+12));
    return angle;
  }

  void draw() {
    for (Bullet currentBullet : bullets ) {     // new1
      // println ("************************");
      currentBullet.move();
      currentBullet.display();
    }
    for (int i = bullets.size()-1; i >= 0; i--) {
      // An ArrayList
      Bullet currentBullet = bullets.get(i);
      if (currentBullet.finished()) {
        bullets.remove(i);
      }
    }
  }
}
//http://www.openprocessing.org/sketch/77863#


