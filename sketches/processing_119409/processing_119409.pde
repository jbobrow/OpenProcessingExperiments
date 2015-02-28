
//Project 8
//Aaron Huang
PFont joker;
PImage face1;
float timer=0;
float g=0;
float dropTimer=0;
float y=-300;
float progressTimer=0;
ArrayList plist = new ArrayList();
int MAX = 200;

import ddf.minim.* ;
Minim minim;
AudioPlayer au_player1, au_player2, au_player3, au_player4;


void setup()
{
  size(500, 500);
  smooth();
  noStroke();
  noFill();
  joker = loadFont("Diediedie-48.vlw");
  face1 = requestImage("face1.png");
  minim = new Minim(this) ;
  au_player1 = minim.loadFile("go.wav");
  au_player2 = minim.loadFile("explosion.wav");
  au_player3 = minim.loadFile("whySoSerious.wav");
  au_player4 = minim.loadFile("whySoSerious1.wav");
  rectMode(CENTER);
}

void draw()
{
  background(255);
  println("x: " + mouseX + " y: " + mouseY);
  println(progressTimer);

  progressTimer++;
  if (timer >=90)
  {
    timer=0;
  }
  if (timer < 90)
  {
    timer++;
  }

  if (progressTimer <400)
  {

    //draw poker face
    strokeWeight(3);
    stroke(0);
    rect(250, 250, 440, 440);
    strokeWeight(4);
    //line(180, 360, 320, 360);

    if (timer < 60 || timer >= 70 && timer < 80)
    {
      noFill();
      ellipse(140, 140, 30, 30);
      ellipse(360, 140, 30, 30);
    }
    if (timer>=60 && timer < 70 || timer >= 80 && timer < 90)
    {
      fill(0);
      ellipse(140, 140, 30, 30);
      ellipse(360, 140, 30, 30);
      noFill();
    }

    fill(0);
    textFont(joker, 38);
    text("POKER FACE", 166, 400);
    noFill();

    if (y<300)
    {
      y=-300+g;
      g+=3;
    }

    if (progressTimer >180 && progressTimer < 190)
    {
      au_player3.play();
    }

    pushMatrix();
    fill(255, 0, 0);
    textFont(joker);
    translate(60, y-15);
    rotate(3/PI);
    text("Why So", 0, 0);
    noFill();
    popMatrix();

    pushMatrix();
    fill(255, 0, 0);
    textFont(joker);
    translate(355, y+80);
    rotate(1.7*PI);
    text("Serious", 0, 0);
    noFill();
    popMatrix();
  }

  if (progressTimer>=400 && progressTimer<420)
  {
    background(0);
  }

  if (progressTimer >= 420 && progressTimer < 430)
  {
    au_player4.play();
  }
  if (progressTimer >= 420 && progressTimer < 700)
  {
    image(face1, 0, 0, width, height);
    if (timer < 60 || timer > 70 && timer < 80)
    {
      noFill();
      ellipse(140, 140, 30, 30);
      ellipse(360, 140, 30, 30);
    }
    if (timer>60 && timer < 70 || timer > 80 && timer < 90)
    {
      fill(255, 0, 0);
      ellipse(140, 140, 30, 30);
      ellipse(360, 140, 30, 30);
      noFill();
    }

    fill(0);
    textFont(joker, 38);
    text("JOKER FACE", 166, 400);
    noFill();

    pushMatrix();
    fill(0);
    textFont(joker);
    translate(60, y-15);
    rotate(3/PI);
    text("Why So", 0, 0);
    noFill();
    popMatrix();

    pushMatrix();
    fill(0);
    textFont(joker);
    translate(355, y+80);
    rotate(1.7*PI);
    text("Serious", 0, 0);
    noFill();
    popMatrix();

    fill(random(255), random(255), random(255));
    text("ASR", random(500), random(500));
    noFill();

    fill(random(255), random(255), random(255));
    text("SMILE", random(500), random(500));
    noFill();
  }

  if (progressTimer >= 650)
  {
    au_player1.play();
  }

  if (progressTimer >= 700 && progressTimer < 740)
  {
    background(0); 

    pushMatrix();
    fill(255, 0, 0);
    textFont(joker);
    translate(175, 100);
    scale(2);
    text("And.", 0, 0);
    noFill();
    popMatrix();
  }

  if (progressTimer >= 740 && progressTimer < 780)
  {
    background(0); 

    pushMatrix();
    fill(255, 0, 0);
    textFont(joker);
    translate(200, 100);
    scale(1.5);
    text("And.", 0, 0);
    noFill();
    popMatrix();

    pushMatrix();
    fill(255, 0, 0);
    textFont(joker);
    translate(175, 200);
    scale(2);
    text("Here.", 0, 0);
    noFill();
    popMatrix();
  }


  if (progressTimer >= 780 && progressTimer < 860)
  {
    background(0); 

    pushMatrix();
    fill(255, 0, 0);
    textFont(joker);
    translate(200, 100);
    scale(1.5);
    text("And.", 0, 0);
    noFill();
    popMatrix();

    pushMatrix();
    fill(255, 0, 0);
    textFont(joker);
    translate(200, 200);
    scale(1.5);
    text("Here.", 0, 0);
    noFill();
    popMatrix();

    pushMatrix();
    fill(255, 0, 0);
    textFont(joker);
    translate(175, 300);
    scale(2);
    text("We.", 0, 0);
    noFill();
    popMatrix();
  }

  if (progressTimer >= 860 && progressTimer < 900)
  {
    background(0); 

    pushMatrix();
    fill(255, 0, 0);
    textFont(joker);
    translate(200, 100);
    scale(1.5);
    text("And.", 0, 0);
    noFill();
    popMatrix();

    pushMatrix();
    fill(255, 0, 0);
    textFont(joker);
    translate(200, 200);
    scale(1.5);
    text("Here.", 0, 0);
    noFill();
    popMatrix();

    pushMatrix();
    fill(255, 0, 0);
    textFont(joker);
    translate(200, 300);
    scale(1.5);
    text("We.", 0, 0);
    noFill();
    popMatrix();

    pushMatrix();
    fill(255, 0, 0);
    textFont(joker);
    translate(175, 400);
    scale(2);
    text("Go.", 0, 0);
    noFill();
    popMatrix();
  }

  if (progressTimer >= 900)
  {
    background(0); 
    au_player2.play();
    for (int i = 0; i < plist.size(); i++) 
    {
      Particle p = (Particle) plist.get(i);
      p.run();
      p.update();
      p.gravity();
    }

    if (progressTimer <910)
    {
      for (int i = 0; i < MAX; i ++)
      {
        plist.add(new Particle(250, 200)); 
        if (plist.size() > 5*MAX) 
        {
          plist.remove(0);
        }
      }
    }
  }

  if (progressTimer >= 930)
  {
    //letter A
    pushMatrix();
    fill(255, 85, 0);
    textFont(joker);
    textSize(30);
    translate(20, 365);
    rotate(1.58*PI);
    text("Aaron Huang Rockford", 0, 0);
    noFill();
    popMatrix();

    pushMatrix();
    fill(255, 85, 0);
    textFont(joker);
    textSize(30);
    translate(90, 100);
    rotate(4/PI);
    text("Youze Huang BeijingCn", 0, 0);
    noFill();
    popMatrix();

    pushMatrix();
    fill(255, 85, 0);
    textFont(joker);
    textSize(16);
    translate(55, 250);
    text("My Name Is", 0, 0);
    noFill();
    popMatrix();
  }

  if (progressTimer >= 945)
  {
    //letter S
    pushMatrix();
    fill(255, 125, 0);
    textFont(joker);
    textSize(34);
    translate(190, 360);
    text("Archangel", 0, 0);
    noFill();
    popMatrix();

    pushMatrix();
    fill(255, 125, 0);
    textFont(joker);
    textSize(30);
    translate(300, 265);
    rotate(5/PI);
    text("HATE", 0, 0);
    noFill();
    popMatrix();

    pushMatrix();
    fill(255, 125, 0);
    textFont(joker);
    textSize(36);
    translate(160, 255);
    text("ShepardN7", 0, 0);
    noFill();
    popMatrix();

    pushMatrix();
    fill(255, 125, 0);
    textFont(joker);
    textSize(36);
    translate(188, 230);
    rotate(15/PI);
    text("WTFWTF", 0, 0);
    noFill();
    popMatrix();

    pushMatrix();
    fill(255, 125, 0);
    textFont(joker);
    textSize(30);
    translate(160, 111);
    text("NeVerForEver", 0, 0);
    noFill();
    popMatrix();
  }

  if (progressTimer >= 960)
  {
    //letter R
    pushMatrix();
    fill(255, 165, 0);
    textFont(joker);
    textSize(34);
    translate(340, 112);
    text("Warcraft", 0, 0);
    noFill();
    popMatrix();

    pushMatrix();
    fill(255, 165, 0);
    textFont(joker);
    textSize(32);
    translate(350, 360);
    rotate(15/PI);
    text("Lord of the Rings", 0, 0);
    noFill();
    popMatrix();

    pushMatrix();
    fill(255, 165, 0);
    textFont(joker);
    textSize(30);
    translate(467, 116);
    rotate(5/PI);
    text("Stranger", 0, 0);
    noFill();
    popMatrix();

    pushMatrix();
    fill(255, 165, 0);
    textFont(joker);
    textSize(36);
    translate(364, 240);
    text("Eminem", 0, 0);
    noFill();
    popMatrix();

    pushMatrix();
    fill(255, 165, 0);
    textFont(joker);
    textSize(34);
    translate(350, 261);
    rotate(2.3/PI);
    text("Harry Potter", 0, 0);
    noFill();
    popMatrix();
  }
}

class Particle {
  float r = 2;
  PVector pos, speed, grav;
  ArrayList tail;
  float splash = 5;
  int margin = 2;
  int taillength = 25;

  Particle(float tempx, float tempy) {
    float startx = tempx + random(-splash, splash);
    float starty = tempy + random(-splash, splash);
    startx = constrain(startx, 0, width);
    starty = constrain(starty, 0, height);
    float xspeed = random(-3, 3);
    float yspeed = random(-3, 3);

    pos = new PVector(startx, starty);
    speed = new PVector(xspeed, yspeed);
    grav = new PVector(0, 0.02);

    tail = new ArrayList();
  }

  void run() {
    pos.add(speed);

    tail.add(new PVector(pos.x, pos.y, 0));
    if (tail.size() > taillength) {
      tail.remove(0);
    }

    float damping = random(-0.5, -0.6);
    if (pos.x > width - margin || pos.x < margin) {
      speed.x *= damping;
    }
    if (pos.y > height -margin) {
      speed.y *= damping;
    }
  }

  void gravity() {
    speed.add(grav);
  }

  void update() {
    for (int i = 0; i < tail.size(); i++) {
      PVector tempv = (PVector)tail.get(i);
      noStroke();
      fill(6*i + 50, (6*i + 50)/2, 0);
      ellipse(tempv.x, tempv.y, r, r);
    }
  }
}


//Font found on http://www.dafont.com/diediedie.font
//Here we go sound from The Dark Knight movie
//Explosion sound effect from http://www.youtube.com/watch?v=ngXjJoNCzu4
//Particle effect of explision made by Jonathan Fraser on http://www.openprocessing.org/sketch/28053#


