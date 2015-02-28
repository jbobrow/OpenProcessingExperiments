
Station hurpl;
ArrayList attacks;

PImage planetUR;

import ddf.minim.*;
AudioPlayer player;
AudioPlayer laser;
Minim minim;

int frame = 0;
int time = 0;
int laserOn;
int score;

PFont title;
PFont font;

boolean screenShake = false;

void setup() {
  size(800, 600);
  //size(displayWidth, displayHeight);
  smooth(8);
  planetUR = loadImage("The Ice Planet.png");
  title = createFont("myFont.ttf", 100);
  font = createFont("myFont.ttf", 32);
  minim = new Minim(this);

  laser = minim.loadFile("laser.mp3");
  laser.setGain(-20);

  player = minim.loadFile("TheValley.mp3");
  player.setGain(0);
  player.play();
  player.loop();

  hurpl = new Station();
  attacks = new ArrayList();
  //  for (int i = 0; i < 5; i = i+1) {
  //    attacks.add(new Orbit(random(width), 10, random(-2,2), 0));
  //  }
  //  for (int i = 0; i < 5; i = i+1) {
  //    attacks.add(new Orbit(random(width), height-10, random(-2,2), 0));
  //  }

}

void draw() { 

  screenShake();
  fill( 0, 100 );
  rect( 0, 0, width, height );
  cursor(CROSS);
  fill(255);
  textFont(font);
  text("SCORE: " + score, 30, 50);

  int rand = round(random(100));
  if (time == rand) {
    attacks.add(new Orbit(random(width), 50, random(-3, 3), 0));
  }

  if (time > 3) {
    for (int i=attacks.size()-1;i>=0;i--) {
      Orbit attack = (Orbit) attacks.get(i);
      attack.update(6000, 100);
      attack.display(color(255), 50);
      if (hurpl.checkHit(attack.planet, 24)) {
        attacks.remove(i);
        screenShake = true;
      }
      if (laserOn == 1) {
        if (attack.laserHitCheck()) {
          attacks.remove(i);
          score += 1;
        }
      }
    }
  }
  hurpl.update();
  laserOn = hurpl.mouseClick();
  hurpl.display();

  if (frame >=60) {
    time += 1;
    frame = 0;
  }
  frame += 1;
  // println();
  //  println(rand);

  if (time < 2) {
   
    background(0);
    fill(255);
    textFont(title);
    text("D-Ur-P", width/2- 80, height/2);
    textFont(font);
    text("(Defend-Ur-Planet)", width/2- 80, height/2+40);
  }
}

void mouseReleased() {
  hurpl.t = -5;
  hurpl.laserUp = 0;
}

void mousePressed() {
  laser.play();
  laser.cue(0);
}

int t;
void screenShake() {
  if (screenShake) {
    t += 1;
    if (t < 20) {
      translate(random(-5, 5), random(-5, 5));
    }
    else {
      t = 0;
      screenShake = false;
    }
  }
}

//boolean sketchFullScreen() {
//  return true;
//}

class Orbit {
  PVector core;
  PVector planet;
  float radius;
  PVector force;
  PVector velocity;
  PVector netForce;
  boolean setCore;
  PVector mouse;
  PVector laserCheck;

  Orbit(float px, float py, float vx, float vy) {
    planet = new PVector(px, py);
    velocity = new PVector(vx, vy);
    force = new PVector(0, 0);
    netForce = new PVector(0, 0);
    core = new PVector(width/2, height/2);
    mouse = new PVector(mouseX, mouseY);
    laserCheck = new PVector(0, 0);
    setCore = false;

  }

  void changeCore(PVector x) {
    core.set(x);
    setCore = true;
  }

  void addForce(PVector f) {
    netForce.x = netForce.x + f.x;
    netForce.y = netForce.y + f.y;
  }

  void update(int c, int limit, int l) {
    netForce.div(2);
    radius = core.dist(planet);
    if (radius < limit) {
      radius = limit;
    }

    force.x = ((core.x - planet.x)/pow(radius, 3))*c;
    force.y = ((core.y - planet.y)/pow(radius, 3))*c;
    velocity.add(force);
    velocity.limit(l);
    planet.add(velocity);
    netForce = new PVector(0, 0);
  }

  void update(int c, int limit) {
    netForce.div(2);
    radius = core.dist(planet);
    if (radius < limit) {
      radius = limit;
    }

    force.x = ((core.x - planet.x)/pow(radius, 3))*c;
    force.y = ((core.y - planet.y)/pow(radius, 3))*c;
    velocity.add(force);
    planet.add(velocity);
    netForce = new PVector(0, 0);
  }

  void followMouse() {
    if (mousePressed) {
      core.x = mouseX;
      core.y = mouseY;
    }
  }

  void planetFollowMouse() {
    if (mousePressed) {
      planet.x = mouseX;
      planet.y = mouseY;
      velocity.x = mouseX - pmouseX;
      velocity.y = mouseY - pmouseY;
    }
  }


  void edgeCheck(float x, float y) {
    if (planet.x > width - y) {
      planet.x = width - y - 1;
      velocity.x = velocity.x * -x;
    }
    if (planet.x < y) {
      planet.x = y + 1;
      velocity.x = velocity.x * -x;
    }
    if (planet.y > height - y) {
      planet.y = height - y - 1;
      velocity.y = velocity.y * -x;
    }
    if (planet.y < y) {
      planet.y = y + 1;
      velocity.y = velocity.y * -x;
    }
  }

  boolean laserHitCheck() {
    if (mousePressed) {
      mouse = new PVector(mouseX-width/2, mouseY-height/2);
      for (int i = 1; i < 1500; i = i+1) {
        mouse.setMag(i);
        laserCheck = new PVector(mouse.x+width/2, mouse.y+height/2); 
        if ((laserCheck.dist(planet)) < 27 ) {
          return true;
        }
      }
    }
    
    return false;
  }


  void display(color c, float r) {
    fill(c);
    noStroke();
    ellipse(planet.x, planet.y, r, r);
  }
}

class Station {
  PVector mouse;
  PVector location;
  PVector ur;

  float ang;
  int t = 0;
  int t2 = 0;
  int laserUp;

  Station( ) {
    location = new PVector(mouseX-(width/2), mouseY-(height/2));
    mouse = new PVector(mouseX, mouseY);
    ur = new PVector(width/2, height/2);
    ang = 0;
    t=0;
    t2 = 0;
    laserUp = 0;
  }

  void update() {
    location = new PVector(mouseX-(width/2), mouseY-(height/2));
    location.setMag(51);
    ang = atan2( mouseY - height/2, mouseX - width/2 );
  }

  void display() {
    noStroke(); 

    pushMatrix();
    translate(width/2, height/2);
    rotate(ang);
    fill(255);
    ellipse(50, 0, 30, 30);    
    fill(0);
    ellipse(44, 0, 28, 50);
    ellipse(64, 0, 6, 10);
    fill(255, 0, 0);
    ellipse(66, 0, 6, 4);
    popMatrix(); 

    planetUR.resize(130,130);
    image(planetUR,width/2-65,height/2-60);

//    fill(50);
//    ellipse(width/2, height/2, 110, 110);
//    fill(100);
//    ellipse(width/2, height/2, 108, 108);
//    fill(150);
//    ellipse(width/2, height/2, 106, 106);
//    fill(255);
//    ellipse(width/2, height/2, 104, 104);
//    fill(193,215,222);
//    ellipse(width/2, height/2, 100, 100);
//    fill(80,130,145);
//    ellipse(width/2, height/2, 96, 96);
//    fill(30,70,80);
//    ellipse(width/2, height/2, 94, 94);
//    fill(0,23,31);
//    ellipse(width/2, height/2, 92, 92);
  }

  int mouseClick() {
    if (mousePressed) {

      laserUp = 0;
      if (t <= 15 && t >= 0) {
        laserUp = 1;
        pushMatrix();
        translate(width/2, height/2);
        rotate(ang);
        fill(255, 0, 0);
        rect(0, -2, 1000, 4);
        popMatrix(); 
        resetMatrix();
      }
      t += 1;
    }
    return laserUp;
  }

  boolean checkHit(PVector attacker, int r) {
 
    if (ur.dist(attacker) < (54 +r)) {
      translate(random(-5, 5), random(-5, 5));
      score -= 1;
      return true;
      
    }
    return false;
  }
  
  
  
}


