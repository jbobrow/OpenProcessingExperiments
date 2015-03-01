
import ddf.minim.*;
import java.util.*;
// firmata library import
import processing.serial.*;
import cc.arduino.*;

Minim minim;
AudioPlayer player1;
AudioPlayer player2;
static AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;
static Arduino ard;
Engineer engineer;
Vehicle leifr; 
Planet planetA;
Planet planetB;
Planet planetC;
Planet planetD;
Blackhole blackH;
Spice spices;
static Torpedo[] torpedoLeft = new Torpedo[50];
Crosshair xhair;
Artillery[] art = new Artillery[500];
Colonial[] colony = new Colonial[10];
static ArrayList<Asteroid> asteroids;
static PVector mousePos;
static PVector torpLeftPos;
static PVector torpRightPos;
static PVector targetLeft;
static PVector targetRight;
static PVector asteroidTarget;
static PImage shipL;
static PImage starA;
static PImage starB;
static PImage torp;
static PImage pod;
static PImage shieldHex;
static PImage shieldHex1, shieldHex2;
static PImage shieldSphere;
static PImage shieldSphere1, shieldSphere2;
static PImage crosshair;
static PImage artilleryshell;
static PImage asteroid;
static PImage spice;
static PImage pA;
static PImage pB;
static PImage pC;
static PImage pD;
static PImage bH;
PFont f1;
static float starX = 166;//1754;, 1920 - 1754 = 166
static float starY = -674;//1754; 1080 - 1754 = -674
static float tLeft;
static float tRight;
static float xTarget;
static float rotateSpeed;
static int numShipHit = 0;
Boolean moveShip = false;
Boolean clickShip = false;
static Boolean fired = false;
static Boolean dead = false;
static Boolean playOnce = false;
static boolean keyup = false;
static boolean keyright = false;
static boolean keyleft = false;
static boolean keydown = false;
static boolean keyspace = false;
static boolean podA = false;
static boolean podB = false;
static boolean podC = false;
static boolean podD = false;
static boolean colonizedA = false;
static boolean colonizedB = false;
static boolean colonizedC = false;
static boolean colonizedD = false;
static boolean podLanded = false;
static boolean spicePresent = true;
static boolean warpDrive = false;
static int numArtillery = 300;
static int numTorpLeft = 20;
static int numColonyPod = 3;
static int numAlphaAmmo = 0;
static int numAlphaPod = 0;
static int numAlphaShield = 255;
static int numPlayerHealth = 5;
static float tArtillery = 0;
static float theta;
static boolean bFiring = false;
float savedTime = millis();
float totalTime = 75;

void setup() {
  size(1920, 1080); //(7016, 7016);
  smooth();
  minim = new Minim(this);
  player1 = minim.loadFile("SpaceAmbientAcrossTheUniverse.mp3");
  player2 = minim.loadFile("PhotonTorpedo.mp3");
  player3 = minim.loadFile("AsteroidDeath.mp3");
  player4 = minim.loadFile("MegaManDeath.mp3");
  player5 = minim.loadFile("FlakAutoCannon.mp3");
  shipL = loadImage("Leifr01.png");
  starA = loadImage("AndromedaGalaxy.png");
  starB = loadImage("OrionNebula.png");
  torp = loadImage("Torpedo.png");
  pod = loadImage("ColonialPod.png");
  shieldHex = loadImage("ShieldHoneyComb.png");
  shieldHex1= loadImage("ShieldHoneyCombFade1.png");
  shieldHex2= loadImage("ShieldHoneyCombFade2.png");
  shieldSphere = loadImage("ShieldSphere.png");
  shieldSphere1 = loadImage("ShieldSphereFade1.png");
  shieldSphere2 = loadImage("ShieldSphereFade2.png");
  crosshair = loadImage("Crosshair.png");
  artilleryshell = loadImage("ArtShell.png");
  asteroid = loadImage("Asteroid02.png");
  spice = loadImage("Spice01.png");
  pA = loadImage("Planet01.png");
  pB = loadImage("Planet02.png");
  pC = loadImage("Planet03.png");
  pD = loadImage("Planet04.png");
  bH = loadImage("Blackhole01.png");
  f1 = createFont("Arial", 28, false);
  imageMode(CENTER);
  planetA = new Planet(random(-300, -200), random(300, 800));
  planetB = new Planet(random(-1300, -1200), random(-2000, -1700));
  planetC = new Planet(random(-1300, -1000), random(0, 30));
  planetD = new Planet(random(500, 850), random(-1900, -2000));
  blackH = new Blackhole(-820, -1260);
  spices = new Spice(-500, -500);
  leifr = new Vehicle(width/2, height/2);
  xhair = new Crosshair(width/2, height/2);
  rotateSpeed = radians(0);
  asteroids = new ArrayList<Asteroid>();
  mousePos = new PVector(width/2, height/2);
  player1.play();
  // ARDUINO INITIALIZE VARIABLE
  //ard = new Arduino(this, Arduino.list()[0], 57600);
  //engineer = new Engineer();

  for (int i = 0;i < 100; i++) {
    float randSize = random(0.25, 1.25);
    float randX = random(-1000, -300);//(-1334, 1910);
    float randY = random(-1000, -300);//(-1334, 1070);
    asteroids.add(new Asteroid(random(width) - 1250, random(height) - 1250, randSize));//randX, randY, randSize));
  }
}

void draw() {
  torpLeftPos = new PVector(leifr.location.x, leifr.location.y);
  torpRightPos = new PVector(leifr.location.x, leifr.location.y);
  
  if (dead != true) {
    leifr.pan(starX, starY);
  }
  background(0);
  float passedTime = millis() - savedTime;
  
  if (warpDrive == false) {
    image(starB, starX, starY);
    planetA.display();
    planetB.display();
    float blackD = PVector.dist(blackH.location, leifr.location);
    if (blackD < 50) warpDrive = true;
  } 
  else if (warpDrive == true) {
    image(starA, starX, starY);
    for (int c = 0;c < asteroids.size();c++) {
      asteroids.remove(c);
    }
  }

  //engineer.update(millis()/1000);
  //println(int(engineer.opacity));
  if (dead != true) {
    fill(255, numAlphaShield);
    //////remove when using Arduino///////////////////////////////////////////////////////////
    if (numAlphaShield > 10) {
      image(shieldSphere, leifr.location.x, leifr.location.y);
    }
    //////Arduino Engineer Code///////////////////////////////////////////////////////////////
    /*if (engineer.opacity >= 230) {
     image(shieldSphere, leifr.location.x, leifr.location.y);
     }
     else if (engineer.opacity < 200 && engineer.opacity > 100) {
     
     image(shieldSphere1, leifr.location.x, leifr.location.y);
     }
     else if (engineer.opacity <= 100 && engineer.opacity > 0) {      
     image(shieldSphere2, leifr.location.x, leifr.location.y);
     }*/
    fill(255);
    leifr.update();
    leifr.display();
    fill(255, numAlphaShield);
    //////remove when using Arduino///////////////////////////////////////////////////////////
    if (numAlphaShield > 10) {
      image(shieldHex, leifr.location.x, leifr.location.y);
    }
    //////Arduino Engineer Code///////////////////////////////////////////////////////////////
    /*if (engineer.opacity >= 230) {
     image(shieldHex, leifr.location.x, leifr.location.y);
     }
     else if (engineer.opacity < 200 && engineer.opacity > 100) {
     
     image(shieldHex1, leifr.location.x, leifr.location.y);
     }
     else if (engineer.opacity <= 100 && engineer.opacity > 0) {      
     image(shieldHex2, leifr.location.x, leifr.location.y);
     }
    image(shieldHex, leifr.location.x, leifr.location.y);*/
    rotateSpeed += radians(1);
    xhair.display(rotateSpeed);
  }
  
  if (warpDrive == false) {
    planetC.display();
    planetD.display();
    blackH.display();
    if (spicePresent) {
      spices.display();
    }
  }

  textFont(f1, 14);  
  textAlign(LEFT);
  stroke(0);
  fill(255, numAlphaAmmo); 
  text("Photon Torpedoes: " + numTorpLeft, 10, 20); //month + " " + y,1265,80);
  text("Autocannon Rounds: " + numArtillery, 10, 40);

  fill(255, numAlphaPod); 
  text("Colonial Pods: " + numColonyPod, 10, 60);
  alphaPodOut();

  pushMatrix();
  translate(leifr.location.x, leifr.location.y);
  theta = atan2(leifr.location.y-xhair.location.y, leifr.location.x-xhair.location.x);
  rotate(theta);
  popMatrix();

  if (dead != true) {
    if (moveShip == true) {
      leifr.seek(mousePos);
    } 
    else {
      leifr.seek(mousePos);
    }
  } 
  else {
    if (playOnce == false) {
      player4.play();
      playOnce = true;
      if (!player4.isPlaying()) {
        player4.rewind();
        player4.close();
        minim.stop();
      }
    }
  }

  for (Iterator<Asteroid> it = asteroids.iterator(); it.hasNext();) {
    Asteroid a = it.next();
    float asteroidD = PVector.dist(a.location, leifr.location);
    //println(asteroidD);

    if (numAlphaShield > 50) {
      if (asteroidD < 150) {
        it.remove();
        if (!player3.isPlaying()) {
          player3.rewind();
          player3.play();
        }
        numAlphaShield -= 50;
      } 
      else {
        a.separate(asteroids);
        a.update();
        a.display();
      }
    } 
    else {
      if (asteroidD < 75) {
        it.remove();
        if (!player3.isPlaying()) {
          player3.rewind();
          player3.play();
        }
        numPlayerHealth--;
      } 
      else {
        a.separate(asteroids);
        a.update();
        a.display();
      }
    }
  }

  if (dead != true) {
    if (fired) {  
      alphaTorpIn();
      if (numTorpLeft > 0 ) { 
        numTorpLeft--;
        PVector mouseTarget = new PVector(mouseX, mouseY);
        torpedoLeft[numTorpLeft] = new Torpedo(leifr.location.x, leifr.location.y);
        torpedoLeft[numTorpLeft].fireTorpedo(mouseTarget);
        if (!player2.isPlaying()) {
          player2.rewind();
          player2.play();
        }
        fired = false;
      }
    }

    if (keyup && xhair.location.y > 30) {
      xhair.location.y-=8;
    }
    if (keydown && xhair.location.y < height - 30) {
      xhair.location.y+=8;
    }
    if (keyleft && xhair.location.x > 32) {
      xhair.location.x-=8;
    }
    if (keyright && xhair.location.x < width - 32) {
      xhair.location.x+=8;
    }

    if (keyspace) {
      alphaAmmoIn();
      if (numArtillery > 0) {
        if (passedTime > totalTime) {
          savedTime = millis();
          numArtillery--;
          art[numArtillery] = new Artillery(leifr.location.x, leifr.location.y);
          art[numArtillery].fireArtillery(xhair.location);
        }
        if (!player5.isPlaying()) {
          player5.rewind();
          player5.play();
        }
      }
    } 
    else {
      alphaAmmoOut();
    }
  }

  for (int i = 0;i < art.length;i++) {
    if (art[i]!=null) {
      art[i].update();
    }
  }

  for (int a = 0;a < torpedoLeft.length;a++) {
    if (torpedoLeft[a]!=null) {
      torpedoLeft[a].update();
    }
  }

  for (int b = 0;b < colony.length;b++) {
    if (colony[b]!=null) {
      if (colonizedD == false) {
      colony[b].update();
      }
    }
  }

  if (numPlayerHealth == 4) {
    shipL = loadImage("Leifr02.png");
  } 
  else if (numPlayerHealth == 3) {
    shipL = loadImage("Leifr03.png");
  } 
  else if (numPlayerHealth == 2) {
    shipL = loadImage("Leifr04.png");
  } 
  else if (numPlayerHealth == 1) {
    shipL = loadImage("Leifr05.png");
  } 

  if (numPlayerHealth < 1) {
    dead = true;
  }

  if (spicePresent) {
    float spiceD = PVector.dist(spices.location, leifr.location);
    //println(spiceD);
    if (spiceD < 100) {
      numArtillery = 300;
      numTorpLeft = 20;
      spicePresent = false;
    }
  }
}

void checkMouse() {
  if (dist(mouseX, mouseY, leifr.location.x, leifr.location.y) < 30) {
    clickShip = true;
    alphaPodIn();
    if (numColonyPod > 0) {
      float xDistA =  leifr.location.x - planetA.location.x;
      float yDistA = leifr.location.y - planetA.location.y;
      PVector distA = new PVector(xDistA, yDistA);
      //println("Distance to Planet A is: " + abs(distA.x));

      float xDistB =  leifr.location.x - planetB.location.x;
      float yDistB = leifr.location.y - planetB.location.y;
      PVector distB = new PVector(xDistB, yDistB);
      //println("Distance to Planet B is: " + abs(distB.x));

      float xDistC =  leifr.location.x - planetC.location.x;
      float yDistC = leifr.location.y - planetC.location.y;
      PVector distC = new PVector(xDistC, yDistC);
      //println("Distance to Planet C is: " + abs(distC.x));

      float xDistD =  leifr.location.x - planetD.location.x;
      float yDistD = leifr.location.y - planetD.location.y;
      PVector distD = new PVector(xDistD, yDistD);
      //println("Distance to Planet D is: " + abs(distD.x));

      if (abs(distA.x) < 400 && colonizedA == false) {
        podA = true;
        colony[numColonyPod] = new Colonial(leifr.location.x, leifr.location.y);
        colony[numColonyPod].fireColonialPod(planetA.location);
        numColonyPod--;
      }

      else if (abs(distB.x) < 400 && colonizedB == false) {
        podB = true;
        colony[numColonyPod] = new Colonial(leifr.location.x, leifr.location.y);
        colony[numColonyPod].fireColonialPod(planetB.location);
        numColonyPod--;
      }

      else if (abs(distC.x) < 400 && colonizedC == false) {
        podC = true;
        colony[numColonyPod] = new Colonial(leifr.location.x, leifr.location.y);
        colony[numColonyPod].fireColonialPod(planetC.location);
        numColonyPod--;
      }

      else if (abs(distD.x) < 400 && colonizedD == false) {
        podD = true;
        colony[numColonyPod] = new Colonial(leifr.location.x, leifr.location.y);
        colony[numColonyPod].fireColonialPod(planetD.location);
        numColonyPod--;
      }
    }
  } 
  else {
    clickShip = false;
  }
}

void mousePressed() {
  checkMouse();
  if (mouseButton == LEFT && clickShip == false) {
    mousePos = new PVector(pmouseX, pmouseY);
    moveShip = true;
  } 
}

void mouseReleased() {
  //clickShip = false;
  if (mouseButton == RIGHT && clickShip == false) {
    fired = true;
    alphaAmmoIn();
  }
}

void keyPressed() {
  if (key == 'w') keyup = true; 
  if (key == 's') keydown = true; 
  if (key == 'a') keyleft = true; 
  if (key == 'd') keyright = true; 
  if (key == ' ') keyspace = true;
}

void keyReleased() {
  if (key == 'w') keyup = false; 
  if (key == 's') keydown = false; 
  if (key == 'a') keyleft = false; 
  if (key == 'd') keyright = false; 
  if (key == ' ') keyspace = false;
}

void alphaAmmoIn () {
  if (keyspace) {
    if (numAlphaAmmo < 255) {
      numAlphaAmmo += 10;
    }
  }
}

void alphaAmmoOut() {
  if (numAlphaAmmo > -1000) {
    numAlphaAmmo -= 1;
  }
}

void alphaTorpIn () {
  if (numAlphaAmmo < 255) {
    numAlphaAmmo = 255;
  }
}

void alphaPodIn () {
  if (numAlphaPod < 255) {
    numAlphaPod = 255;
  }
}

void alphaPodOut() {
  if (numAlphaPod > 0) {
    numAlphaPod -= 1;
  }
}

class Artillery {
  //Data
  PVector artillerypos;
  float xArt, yArt, xSpeed, ySpeed = 0;
  float xRand, yRand;
  Boolean destroy;

  //Constructor
  Artillery(float x, float y) {
    xRand = random(-5, 5);
    yRand = random(-5, 5);
    artillerypos = new PVector(x + xRand, y + yRand);
    destroy = false;
  }

  //Functionality
  void fireArtillery(PVector target) {
    xArt = artillerypos.x;
    yArt = artillerypos.y;
    float xDist = target.x - xArt;
    float yDist = target.y - yArt;
    PVector dist = new PVector(xDist, yDist);
    dist.normalize();
    xSpeed = dist.x * 5;
    ySpeed = dist.y * 5;
    bFiring = true;
  }

  void update() {
    if (destroy == false) {
      xArt += xSpeed;
      yArt += ySpeed;
      fill(#FF0000);
      ellipse(xArt, yArt, 5, 5);
      
      for (int f = 0;f < asteroids.size();f++) {
        Asteroid ast = asteroids.get(f);
        //print("xTorp is: " + xTorp);
        //print("Ast #" + f + "is: " + ast.location.x);
        if (xArt > ast.location.x - 15.0f && xArt < ast.location.x + 15.0f && yArt > ast.location.y - 15.0f && yArt < ast.location.y + 15.0f) {
            asteroids.remove(f);
            destroy = true;
          if (!player3.isPlaying()) {
            player3.rewind();
            player3.play();
          }
        }
      }
    }
  }
}

class Asteroid {
  //Data
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxspeed;
  float maxforce;
  float size;

  //Constructor
  Asteroid(float x, float y, float z) {
    float randSpeed = random(2, 5);
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(x, y);
    maxspeed = randSpeed; //4
    maxforce = 0.1; //0.1
    size = z;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  //Functionality
  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    //Limit the magnitude of the steering force.
    steer.limit(maxforce);
    applyForce(steer);
  }

  void display() {
    //Vehicle is a triangle pointing in the direction of velocity; since it is drawn pointing up, rotate it an additional 90 degrees.
    float theta = velocity.heading();
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    scale(size);
    image(asteroid, 0, 0);
    popMatrix();
  }

  void separate (ArrayList<Asteroid> asteroids) {
    float desiredseparation = 80;
    PVector sum = new PVector();
    int count = 0;
    for (Asteroid a : asteroids) {
      float d = PVector.dist(location, a.location);
      float shipD = PVector.dist(location, leifr.location);

      if (shipD < 50) {
        numShipHit++;
        if (numShipHit > 2) {
          dead = true;
        }
      }

      if ((d > 0) && (d < desiredseparation)) {
        PVector diff = PVector.sub(location, a.location);
        diff.normalize();
        diff.div(d);
        sum.add(diff);
        count++;
      }
    }
    
    if (count > 0) {
      sum.div(count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      applyForce(steer);
    }
  }

  void destroy(ArrayList<Asteroid> asteroids) {
    for (Asteroid a : asteroids) {
      float asteroidD = PVector.dist(location, leifr.location);
      
      if (asteroidD < 50) {
        asteroids.remove(a);
      }
    }
  }
}

class Blackhole {
  //Data
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxspeed;
  float maxforce;

  //Constructor
  Blackhole(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(x, y);
    maxspeed = 4; //4
    maxforce = 0.1; //0.1
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  //Functionality
  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    //Limit the magnitude of the steering force.
    steer.limit(maxforce);
    applyForce(steer);
  }

  void display() {
    //Vehicle is a triangle pointing in the direction of velocity; since it is drawn pointing up, rotate it an additional 90 degrees.
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    image(bH, 0, 0);
    popMatrix();
  }
}

class Colonial {
  //Data
  PVector location;
  float xPod, yPod, xSpeed, ySpeed = 0;

  //Constructor
  Colonial(float x, float y) {
    location = new PVector(x, y);
  }

  //Functionality
  void fireColonialPod(PVector target) {
    xPod = leifr.location.x;
    yPod = leifr.location.y;
    float xDist = target.x - xPod;
    float yDist = target.y - yPod;
    PVector dist = new PVector(xDist, yDist);
    dist.normalize();
    xSpeed = dist.x * 5;
    ySpeed = dist.y * 5;
  }
  
  void update() {
    xPod += xSpeed;
    yPod += ySpeed;
    image(pod, xPod, yPod);
    
    for (int f = 0;f < colony.length;f++) {
      if (colony[f]!=null) {
        if (podD == true && colonizedD == false) {
          float distPodD = abs(colony[f].location.x - planetD.location.x);
          //println("Pod distance to Planet D is: " + distPodD);
          if (distPodD < 5) {
            colonizedD = true;
          }
        } 
      }
    }
  }
}
class Crosshair {
  //Data
  PVector acceleration;
  PVector location;
  PVector velocity;
  float maxspeed;
  float maxforce;

  //Constructor
  Crosshair(float x, float y) {
    location = new PVector(x, y);
  }

  void display(float rSpeed) {
    pushMatrix();
    translate(location.x, location.y);
    
    if (rSpeed > 359) {
      rSpeed = 0;
    }
    
    rotate(rSpeed);
    image(crosshair, 0, 0);
    popMatrix();
  }
}
class Enemy{
  // let's make some hostiles yo
  
  // These will be the sub classes of enemies that can occur in our Enemie class
  class Charger{    // The Charger will 
    
    PVector location;
  }
  class Shooter{  //
    PVector location;
  } 
  
}
static class Engineer{
  //Analogue read pins
  float a0;
  float a1;
  float opacity;
  
  // DigitalOutput for LEDs
  int pin8 = 8;
  int pin9 = 9;
  int pin11 = 11;
  
  int pbutton = 0;
  int button;
  
  float lastTime = 0;
  float time;
  // DigitalInput 10 for push button
  int pin10;
  Engineer(){
    ard.pinMode(pin8, ard.OUTPUT);
    ard.pinMode(pin9, ard.OUTPUT);
    ard.pinMode(pin11, ard.OUTPUT);
    ard.pinMode(pin10, ard.INPUT);
    
    ard.digitalWrite(pin8, ard.LOW);
    ard.digitalWrite(pin9, ard.LOW);
    ard.digitalWrite(pin11, ard.LOW);
  }
  
  void update(float m){
   time = m;
   button = ard.digitalRead(pin10);
   a0 = ard.analogRead(0);
   a1 = ard.analogRead(1);
   
   if(button == 1 && pbutton == 0){
     lastTime = time;
   } 
   
   countDown();
   print(button + " ");
   opacity = map(a1,0,1023,0,float( numAlphaShield));
  
   pbutton = ard.digitalRead(pin10);
  }
  void countDown(){
    if(button == 1){
     if(time - lastTime >= 0){
       ard.digitalWrite(pin8, 1);
     }else if(time - lastTime >= 1){
       ard.digitalWrite(pin9, 1);
     }else if(time - lastTime >= 2){
       ard.digitalWrite(pin11, 1);
     }
     
    if(button == 0){
      ard.digitalWrite(pin8,0);
    ard.digitalWrite(pin9,0);
    ard.digitalWrite(pin11, 0);
    }
   }
  }
  
}
class Planet {
  //Data
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxspeed;
  float maxforce;

  //Constructor
  Planet(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(x, y);
    maxspeed = 4;
    maxforce = 0.1;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  //Functionality
  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    //Limit the magnitude of the steering force.
    steer.limit(maxforce);
    applyForce(steer);
  }

  void display() {
    //Vehicle is a triangle pointing in the direction of velocity; since it is drawn pointing up, rotate it an additional 90 degrees.
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    
    if (this == planetA) {
    image(pA, 0, 0);
    } else if (this == planetB) {
    image(pB, 0, 0);
    } else if (this == planetC) {
    image(pC, 0, 0);
    } else if (this == planetD) {
    image(pD, 0, 0);
    }
    popMatrix();
  }
}

class Spice {
  //Data
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxspeed;
  float maxforce;

  //Constructor
  Spice(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(x, y);
    maxspeed = 4;
    maxforce = 0.1; 
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  //Functionality
  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    //Limit the magnitude of the steering force.
    steer.limit(maxforce);
    applyForce(steer);
  }

  void display() {
    //Vehicle is a triangle pointing in the direction of velocity; since it is drawn pointing up, rotate it an additional 90 degrees.
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    image(spice, 0, 0);
    popMatrix();
  }
}
class Torpedo {
  //Data
  PVector location;
  float xTorp, yTorp, xSpeed, ySpeed = 0;
  Boolean destroy;

  //Constructor
  Torpedo(float x, float y) {
    location = new PVector(x, y);
    destroy = false;
  }

  //Functionality
  void fireTorpedo(PVector target) {
    clickShip = false;
    xTorp = leifr.location.x;
    yTorp = leifr.location.y;
    float xDist = target.x - xTorp;
    float yDist = target.y - yTorp;
    PVector dist = new PVector(xDist, yDist);
    dist.normalize();
    xSpeed = dist.x * 5;
    ySpeed = dist.y * 5;
  }

  void update() {
    if (destroy == false) {
      xTorp += xSpeed;
      yTorp += ySpeed;
      image(torp, xTorp, yTorp);

      for (int f = 0;f < asteroids.size();f++) {
        Asteroid ast = asteroids.get(f);
        //print("xTorp is: " + xTorp);
        //print("Ast #" + f + "is: " + ast.location.x);
        if (xTorp > ast.location.x - 25.0f && xTorp < ast.location.x + 25.0f && yTorp > ast.location.y - 25.0f && yTorp < ast.location.y + 25.0f) {
          asteroids.remove(f);
          destroy = true;
          if (!player3.isPlaying()) {
            player3.rewind();
            player3.play();
          }
        }
      }
    }
  }
}

class Vehicle {
  //Data
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxspeed;
  float maxforce;
  Boolean boundRightX = false;
  Boolean boundLeftX = false;
  Boolean boundTopY = false;
  Boolean boundBottomY = false;

  //Constructor
  Vehicle(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(x, y);
    r = 3.0;
    maxspeed = 4;
    maxforce = 0.1;
  }

  void update() {
    if (moveShip == true) {
      velocity.add(acceleration);
      velocity.limit(maxspeed);
      location.add(velocity);
    }
    acceleration.mult(0);
    //println(velocity);
  }

  void pan(float tempX, float tempY) {
    //left = 800, right = 1120, top = 300, bottom = 780
    if (moveShip == true) {
      if (leifr.location.x > width/2 + 4.0f && boundRightX == false) { 
        tempX-=maxspeed;
        planetA.location.x-=maxspeed;
        planetB.location.x-=maxspeed;
        planetC.location.x-=maxspeed;
        planetD.location.x-=maxspeed;
        blackH.location.x-=maxspeed;
        spices.location.x-=maxspeed;
        starX = tempX;
        for (Asteroid a : asteroids) {
          a.location.x-=maxspeed;
        }
      } else if (leifr.location.x < width/2 - 4.0f && boundLeftX == false) {
        tempX+=maxspeed;
        planetA.location.x+=maxspeed;
        planetB.location.x+=maxspeed;
        planetC.location.x+=maxspeed;
        planetD.location.x+=maxspeed;
        blackH.location.x+=maxspeed;
        spices.location.x+=maxspeed;
        starX = tempX;
        for (Asteroid a : asteroids) {
          a.location.x+=maxspeed;
        }
      } else if (leifr.location.x <= width/2 + 4.0f && leifr.location.x >= width/2 - 4.0f) {
        tempX=tempX;
        planetA.location.x=planetA.location.x;
        planetB.location.x=planetB.location.x;
        planetC.location.x=planetC.location.x;
        planetD.location.x=planetD.location.x;
        blackH.location.x=blackH.location.x;
        spices.location.x=spices.location.x;
        starX = tempX;
        for (Asteroid a : asteroids) {
          a.location.x=a.location.x;
        }
      }

      if (leifr.location.y < height/2 - 4.0f && boundTopY == false && moveShip == true) {
        tempY+=maxspeed;
        planetA.location.y+=maxspeed;
        planetB.location.y+=maxspeed;
        planetC.location.y+=maxspeed;
        planetD.location.y+=maxspeed;
        blackH.location.y+=maxspeed;
        spices.location.y+=maxspeed;
        starY = tempY;
        for (Asteroid a : asteroids) {
          a.location.y+=maxspeed;
        }
      } else if (leifr.location.y > height/2 + 4.0f && boundBottomY == false && moveShip == true) {
        tempY-=maxspeed;
        planetA.location.y-=maxspeed;
        planetB.location.y-=maxspeed;
        planetC.location.y-=maxspeed;
        planetD.location.y-=maxspeed;
        blackH.location.y-=maxspeed;
        spices.location.y-=maxspeed;
        starY = tempY;
        for (Asteroid a : asteroids) {
          a.location.y-=maxspeed;
        }
      } else if (leifr.location.y <= height/2 + 4.0f && leifr.location.y >= height/2 - 4.0f) {
        tempY=tempY;
        planetA.location.y=planetA.location.y;
        planetB.location.y=planetB.location.y;
        planetC.location.y=planetC.location.y;
        planetD.location.y=planetD.location.y;
        blackH.location.y=blackH.location.y;
        spices.location.y=spices.location.y;
        starY = tempY;
        for (Asteroid a : asteroids) {
          a.location.y=a.location.y;
        }
      }
    }
    
    else if (moveShip == false) {
      if (leifr.location.x > width/2 + 4.0f && boundRightX == false) {
        leifr.location.x-=maxspeed;
        tempX-=maxspeed;
        planetA.location.x-=maxspeed;
        planetB.location.x-=maxspeed;
        planetC.location.x-=maxspeed;
        planetD.location.x-=maxspeed;
        blackH.location.x-=maxspeed;
        spices.location.x-=maxspeed;
        starX = tempX;
        for (Asteroid a : asteroids) {
          a.location.x-=maxspeed;
        }
      } else if (leifr.location.x < width/2 - 4.0f && boundLeftX == false) { 
        leifr.location.x+=maxspeed;
        tempX+=maxspeed;
        planetA.location.x+=maxspeed;
        planetB.location.x+=maxspeed;
        planetC.location.x+=maxspeed;
        planetD.location.x+=maxspeed;
        blackH.location.x+=maxspeed;
        spices.location.x+=maxspeed;
        starX = tempX;
        for (Asteroid a : asteroids) {
          a.location.x+=maxspeed;
        }
      } else if (leifr.location.x <= width/2 + 4.0f && leifr.location.x >= width/2 - 4.0f) {
        tempX=tempX;
        planetA.location.x=planetA.location.x;
        planetB.location.x=planetB.location.x;
        planetC.location.x=planetC.location.x;
        planetD.location.x=planetD.location.x;
        blackH.location.x=blackH.location.x;
        spices.location.x=spices.location.x;
        starX = tempX;
        for (Asteroid a : asteroids) {
          a.location.x=a.location.x;
        }
      }
    
    if (leifr.location.y < height/2 - 4.0f && boundTopY == false) {
        leifr.location.y+=maxspeed;
        tempY+=maxspeed;
        planetA.location.y+=maxspeed;
        planetB.location.y+=maxspeed;
        planetC.location.y+=maxspeed;
        planetD.location.y+=maxspeed;
        blackH.location.y+=maxspeed;
        spices.location.y+=maxspeed;
        starY = tempY;
        for (Asteroid a : asteroids) {
          a.location.y+=maxspeed;
        }
      } 
      else if (leifr.location.y > height/2 + 4.0f && boundBottomY == false) {
        leifr.location.y-=2;
        tempY-=2;
        planetA.location.y-=2;
        planetB.location.y-=2;
        planetC.location.y-=2;
        planetD.location.y-=2;
        blackH.location.y-=2;
        spices.location.y-=2;
        starY = tempY;
        for (Asteroid a : asteroids) {
          a.location.y-=2;
        }
      } else if (leifr.location.y <= height/2 + 4.0f && leifr.location.y >= height/2 - 4.0f) {
        tempY=tempY;
        planetA.location.y=planetA.location.y;
        planetB.location.y=planetB.location.y;
        planetC.location.y=planetC.location.y;
        planetD.location.y=planetD.location.y;
        blackH.location.y=blackH.location.y;
        spices.location.y=spices.location.y;
        starY = tempY;
        for (Asteroid a : asteroids) {
          a.location.y=a.location.y;
        }
      }
    }

    if (starX <= 200 && leifr.location.x < 960) {
      boundRightX = false;
      boundLeftX = false;
    } 
    else if (starX <= 200 && leifr.location.x >= 960) { 
      boundRightX = true;
    } 

    if (starX >= 1750 && leifr.location.x >= 960) { 
      boundLeftX = false;
      boundRightX = false;
    } 
    else if (starX >= 1750 && leifr.location.x < 960) { 
      boundLeftX = true;
    } 

    if (starY <= 1720 && leifr.location.y < 540) { 
      boundTopY = false;
      boundBottomY = false;
    } 
    else if (starY > 1720 && leifr.location.y < 540) { 
      boundTopY = true;
    } 

    if (starY >= -680 && leifr.location.y >= 540) { 
      boundTopY = false;
      boundBottomY = false;
    } 
    else if (starY < -680 && leifr.location.y >= 540) {
      boundBottomY = true;
    }
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  //Functionality
  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    float d = desired.mag();
    desired.normalize();
    if (d < 10) {
      float m = map(d, 0, 100, 0, maxspeed);
      desired.mult(m);
      moveShip = false;
    } 
    else {
      desired.mult(maxspeed);
    }
    PVector steer = PVector.sub(desired, velocity);
    //Limit the magnitude of the steering force.
    steer.limit(maxforce);
    applyForce(steer);
  }


  void display() {
    //Vehicle is a triangle pointing in the direction of velocity; since it is drawn pointing up, rotate it an additional 90 degrees.
    float theta = velocity.heading() + PI/2;
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    image(shipL, 0, 0);
    popMatrix();
  }
}



