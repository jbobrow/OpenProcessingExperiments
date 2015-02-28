
//Particle by James Frankis - 2012//

TouchProcessor touch;

System system;
DustSystem ds;
gParticleMenu pm;
bParticleMenu bm;
exampleMenu em;
PFont futura;

//drawings
PImage gravityImg;
PImage createImg;
PImage absorbImg;
PImage destroyImg;

PImage flockerImg;
PImage seekerImg;
PImage destroyerImg;
PImage absorberImg;
PImage colourImg;

boolean planetsExample, orbitsExample, flocksExample, feedbackExample;


import apwidgets.*;
APMediaPlayer player;
APMediaPlayer player2;

//
boolean flocksTap;
boolean orbitsTap;
boolean blaePartMenu = false;
boolean fernPartMenu = false;
boolean anyMenuOn;
boolean particleAbout;

boolean justPressed = false;
boolean moving;
color darkGrey = color(80);
color lightGrey = color(150);
color textWhite = color(250);
float fade = 80;
color orange = color(242, 165, 12);
color blae = color(126, 152, 183);
color fern = color(144, 183, 114);
color crimson = color(193, 39, 45);
boolean pause;
float butSize = 44;
boolean helpOn = false;
boolean sideBarShow = false;
float barEdge;
boolean barGrabbed;
float maxParticles = 40;
boolean trails = false;
//float last, interval;
boolean pmousePressed;
float counter;
boolean GshotOn, Grelease;
boolean GfireMode;
float GSeek, GFlock, GAbsorb, GDestroy, GnewVelX, GnewVelY, GmouseX, GmouseY;
float GinitialX, GinitialY;
boolean BshotOn, Brelease;
boolean BfireMode;
float BSeek, BFlock, BAbsorb, BDestroy, BnewVelX, BnewVelY;
float BinitialX, BinitialY;

//help menus
boolean examples, howWorks;
boolean gravityHold, createHold, absorbHold, destroyHold;
boolean seekerHold, flockerHold, destroyerHold, absorberHold, colourHold;




//  boolean createFlocker, createAttractor, createAbsorber, createInhibitor, createDestroyer;

boolean removeAll;

//multiTouch
boolean DRAG;
boolean ROTATE;
boolean PINCH;
boolean MULTI_DRAG;
boolean TAP;
boolean DOUBLE_TAP;
boolean FLICK;
boolean HOLD;
float pinchR;
float pinchZ = 1;



//Setup/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void setup() {
  orientation(LANDSCAPE);
  size(screenWidth, screenHeight);
  smooth();
  system = new System();
  ds = new DustSystem();
  pm = new gParticleMenu();
  bm = new bParticleMenu();
  em = new exampleMenu();
  touch = new TouchProcessor();
  futura = loadFont("Futura-48.vlw"); 
  textFont(futura); 
  barEdge = width-22;
  player = new APMediaPlayer(this);
  player2 = new APMediaPlayer(this);
  player.setMediaFile("beep.mp3");
  player2.setMediaFile("pop.m4a");
  pmousePressed = false;

  gravityImg = loadImage("gravityImg.gif");
  absorbImg = loadImage("absorbImg.gif");
  createImg = loadImage("createImg.gif");
  destroyImg = loadImage("destroyImg.gif");

  flockerImg = loadImage("flockerImg.gif");
  seekerImg = loadImage("seekerImg.gif");
  destroyerImg = loadImage("destroyerImg.gif");
  absorberImg = loadImage("absorberImg.gif");
  colourImg = loadImage("colourImg.gif");

  //initial particles to be removed

  //  for (int i = 0; i < 1; i++) {
  // system.addMajor(new Major(width/2, height/2, 0, 0));
  system.addMajor(new Major(width/2, height/2, 0, 0));
  //    pinchR = 0;
  //  }

  //  for (int i = 0; i < 20; i++) {
  //    //                                                                                     c,fl,at,ab,de
  //system.addMinor(new Minor(random(width), random(height), random(-1, 1), random(-1, 1), 1, 0, 0, 0, 0));
  //    //    system.addMinor(new Minor(random(width), random(height), random(-1, 1), random(-1, 1), 0, 0, 0, 0, 0));
  //  }
}


//Draw/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void draw() {
  println(screenHeight);
  FLICK = TAP = DOUBLE_TAP = ROTATE = DRAG = MULTI_DRAG = PINCH = HOLD = false;
  //createFlocker = createAttractor = createAbsorber = createInhibitor = createDestroyer =false;
  if ((trails == true)&&(pause==false)) {
    noStroke();
    fill(80, 20);
    rect(0, 0, width, height);
  }
  else {
    background(darkGrey);
  }
  Hold();
  touch.analyse();
  touch.sendEvents();
  


  helpMenu();
  sideBar(); 
  bm.run();
  pm.run();

  em.Menu();
  examples();
  system.run();  
  holdMenus();
//println(planetsExample);
  ds.run();
  if ((system.particles.size()==maxParticles)&&(pause==false)) {
    fill(crimson);
    textSize(40);
    textAlign(CENTER);
    //toEdit
    text("Maximum Particles!", width/2, 40);
  }


  if ((pause==false)&&(DOUBLE_TAP==true)&&(mouseX<barEdge)) {
    system.addMajor(new Major(mouseX, mouseY, 0, 0));
  }




  //vibrate technique
  //  gNotificationManager.notify(1, gNotification);
  //add dust technique 
  //  ds.addDust(mouseX,mouseY, 20, crimson);
  if (GfireMode == true) {
    BfireMode = false;
  }
  if (BfireMode == true) {
    GfireMode = false;
  }
  pmousePressed = mousePressed;
  justPressed = false;
  Brelease = false;
  Grelease = false;
  orbitsTap=false;
  flocksTap = false;
}



public void onDestroy() {
  super.onDestroy(); 
  if (player != null) { 
    player.release();
  }
  if (player2 != null){
   player2.release(); 
  }
  
}

//Possible code for shutdown of application
//2.2 only shuts down code when back button is pressed if HOME is pressed it pauses the application for later
//this code overrides that and destroys the memory of the app from in the pause function however this is not ideal
//it could lead to corruption of save data or the the app itself. (unlikely) Better just to use the back button and
//home buttons correctly.


////Close application when user presses HOME button
//public void onUserLeaveHint() { // this only executes when Home is selected.
//  super.onUserLeaveHint();
//  onDestroy();
//}
//public void onDestroy() {
//  //end game
//  super.onDestroy(); //call onDestroy on super class
//  System.exit(0); //shutdown game
//}

class bParticleMenu {
  float pos1X1, pos1Y1, pos1X2, pos1Y2, pos1A, pos1D;
  float pos2X1, pos2Y1, pos2X2, pos2Y2, pos2A, pos2D;
  float pos3X1, pos3Y1, pos3X2, pos3Y2, pos3A, pos3D;
  float pos4X1, pos4Y1, pos4X2, pos4Y2, pos4A, pos4D;
  boolean deleteOn, pos1On, pos2On, pos3On, pos4On;
  float menuTheta;
  float r;
  float butSize;
  boolean createMinors;
  PVector createLoc;
  PVector createVel;
  boolean createFern, createBlae;
  float CFlock, CSeek, CAbsorb, CDestroy, newColor;
  float  bPartX, bPartY;

  float initialX, initialY;
  float newVelX, newVelY;


  bParticleMenu() {
    //leave this here!
  }

  void run() {

    blueParticleMenu();

    pos1On = false;
    pos2On = false;
    pos3On = false;
    pos4On = false;
  }


  void blueParticleMenu() {


    if (blaePartMenu==true) {
      fernPartMenu = false;
      textAlign(CENTER);
      fill(textWhite);
      textSize(20);
      text("Select the attributes you want your new particle to have.\nWhen you're done drag your finger across the screen to launch particles.\nPress and hold to find out more about an attribute.", width/2, 500);       
      r = 80;
      butSize = 44;

      pause = true;

      bPartX = barEdge+86;
      bPartY =  275;
      menuTheta = 0;

      pos1A = 240;
      pos2A = 200;
      pos3A = 160;
      pos4A = 120;

      pos1X1 = bPartX + cos(radians(menuTheta+pos1A))*(r);
      pos1Y1 = bPartY + sin(radians(menuTheta+pos1A))*(r);
      pos1X2 = bPartX + cos(radians(menuTheta+pos1A))*(r/2);
      pos1Y2 = bPartY + sin(radians(menuTheta+pos1A))*(r/2);

      pos2X1 = bPartX + cos(radians(menuTheta+pos2A))*(r);
      pos2Y1 = bPartY + sin(radians(menuTheta+pos2A))*(r);
      pos2X2 = bPartX + cos(radians(menuTheta+pos2A))*(r/2);
      pos2Y2 = bPartY + sin(radians(menuTheta+pos2A))*(r/2);       

      pos3X1 = bPartX + cos(radians(menuTheta+pos3A))*(r);
      pos3Y1 = bPartY + sin(radians(menuTheta+pos3A))*(r);
      pos3X2 = bPartX + cos(radians(menuTheta+pos3A))*(r/2);
      pos3Y2 = bPartY + sin(radians(menuTheta+pos3A))*(r/2);  

      pos4X1 = bPartX + cos(radians(menuTheta+pos4A))*(r);
      pos4Y1 = bPartY + sin(radians(menuTheta+pos4A))*(r);
      pos4X2 = bPartX + cos(radians(menuTheta+pos4A))*(r/2);
      pos4Y2 = bPartY + sin(radians(menuTheta+pos4A))*(r/2);  

      textSize(18);
      fill(textWhite);
      textAlign(RIGHT);
      pushMatrix();
      translate(bPartX, bPartY);
      rotate(radians(60));
      text("Seek", - r-butSize, 5);
      rotate(radians(-60));
      rotate(radians(20));
      text("Flock", -r-butSize, 5);
      rotate(radians(-20));
      rotate(radians(-20));
      text("Absorb", -r-butSize, 5);
      rotate(radians(20));
      rotate(radians(-60));
      text("Destroy", -r-butSize, 5);
      popMatrix();

      noFill();
      strokeWeight(2);
      stroke(255);
      if (CSeek == 1) {
        fill(fern);
      }
      if (CSeek == 2) {
        fill(blae);
      }
      if (CSeek == 0) {
        noFill();
      }  
      ellipse(pos1X1, pos1Y1, butSize, butSize);
      if (CFlock == 1) {
        fill(fern);
      }
      if (CFlock == 2) {
        fill(blae);
      }
      if (CFlock == 0) {
        noFill();
      }  
      ellipse(pos2X1, pos2Y1, butSize, butSize);
      if (CAbsorb == 1) {
        fill(fern);
      }
      if (CAbsorb == 2) {
        fill(blae);
      }
      if (CAbsorb == 0) {
        noFill();
      }  
      ellipse(pos3X1, pos3Y1, butSize, butSize);
      if (CDestroy == 1) {
        fill(fern);
      }
      if (CDestroy == 2) {
        fill(blae);
      }
      if (CDestroy == 0) {
        noFill();
      }  
      ellipse(pos4X1, pos4Y1, butSize, butSize);


      pos1D = dist(mouseX, mouseY, pos1X1, pos1Y1);
      if (pos1D <= butSize/2) {
        pos1On = true;
      }

      pos2D = dist(mouseX, mouseY, pos2X1, pos2Y1);
      if (pos2D <= butSize/2) {
        pos2On = true;
      }

      pos3D = dist(mouseX, mouseY, pos3X1, pos3Y1);
      if (pos3D <= butSize/2) {
        pos3On = true;
      }
      pos4D = dist(mouseX, mouseY, pos4X1, pos4Y1);
      if (pos4D <= butSize/2) {
        pos4On = true;
      }


      if ((TAP==true)&&(pos1On==true)) {
        CSeek+= 1;
      }

      if ((TAP==true)&&(pos2On==true)) {
        CFlock+=1;
      }


      if ((TAP==true)&&(pos3On==true)) {

        CAbsorb += 1;
      }

      if ((TAP==true)&&(pos4On==true)) {
        CDestroy +=1;
      }

      if ((HOLD==true)&&(pos1On==true)) {
        seekerHold = true;
        pause = true;
      }


      if ((HOLD==true)&&(pos2On==true)) {
        flockerHold = true;
        pause = true;
      }

      if ((HOLD==true)&&(pos3On==true)) {
        absorberHold = true;
        pause = true;
      }



      if ((HOLD==true)&&(pos4On==true)) {
        destroyerHold = true;
        pause = true;
      }


      if (CFlock>2) {
        CFlock = 0;
      }
      if (CSeek>2) {
        CSeek = 0;
      }            
      if (CAbsorb>2) {
        CAbsorb = 0;
      }
      if (CDestroy>2) {
        CDestroy = 0;
      }


      if ((CFlock == 0)&&(CSeek == 0)&&(CAbsorb == 0)&&(CDestroy == 0)&&(pos1On==false)&&(pos2On==false)&&(pos3On==false)&&(pos4On==false)&&(TAP==true)&&(justPressed==false)&&(destroyerHold==false)&&(absorberHold==false)&&(seekerHold==false)&&(flockerHold==false)&&(colourHold==false)) {
        blaePartMenu = false;
        pause= false;
      }

      if ((CFlock > 0)||(CSeek > 0)||(CAbsorb > 0)||(CDestroy > 0)) {
        if ((pos1On==false)&&(pos1On==false)&&(pos2On==false)&&(pos3On==false)&&(pos4On==false)&&(DRAG==true)&&(destroyerHold==false)&&(absorberHold==false)&&(seekerHold==false)&&(flockerHold==false)&&(colourHold==false)) {    
          BfireMode = true;
          pause = false;
        }
      }
      if ((CFlock > 0)||(CSeek > 0)||(CAbsorb > 0)||(CDestroy > 0)) {
        if ((pos1On==false)&&(pos1On==false)&&(pos2On==false)&&(pos3On==false)&&(pos4On==false)&&(TAP==true)&&(justPressed==false)&&(destroyerHold==false)&&(absorberHold==false)&&(seekerHold==false)&&(flockerHold==false)&&(colourHold==false)) {    
          BfireMode = true;
          pause = false;
        }
      }
    }
    //blae menu ends

    // fire mode ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (BfireMode==true) {
      //render mini ellipses.

      r = 44;
      butSize = 20;


      bPartX = barEdge+86;
      bPartY =  275;
      menuTheta = 0;

      pos1A = 240;
      pos2A = 200;
      pos3A = 160;
      pos4A = 120;

      pos1X1 = bPartX + cos(radians(menuTheta+pos1A))*(r);
      pos1Y1 = bPartY + sin(radians(menuTheta+pos1A))*(r);
      pos1X2 = bPartX + cos(radians(menuTheta+pos1A))*(r/2);
      pos1Y2 = bPartY + sin(radians(menuTheta+pos1A))*(r/2);

      pos2X1 = bPartX + cos(radians(menuTheta+pos2A))*(r);
      pos2Y1 = bPartY + sin(radians(menuTheta+pos2A))*(r);
      pos2X2 = bPartX + cos(radians(menuTheta+pos2A))*(r/2);
      pos2Y2 = bPartY + sin(radians(menuTheta+pos2A))*(r/2);       

      pos3X1 = bPartX + cos(radians(menuTheta+pos3A))*(r);
      pos3Y1 = bPartY + sin(radians(menuTheta+pos3A))*(r);
      pos3X2 = bPartX + cos(radians(menuTheta+pos3A))*(r/2);
      pos3Y2 = bPartY + sin(radians(menuTheta+pos3A))*(r/2);  

      pos4X1 = bPartX + cos(radians(menuTheta+pos4A))*(r);
      pos4Y1 = bPartY + sin(radians(menuTheta+pos4A))*(r);
      pos4X2 = bPartX + cos(radians(menuTheta+pos4A))*(r/2);
      pos4Y2 = bPartY + sin(radians(menuTheta+pos4A))*(r/2);  

      noFill();
      strokeWeight(1);
      stroke(255);
      if (pause == true) {
        fill(255, fade);
      }
      if (CSeek == 1) {
        fill(fern);
        if (pause == true) {
          fill(fern, fade);
        }
      }
      if (CSeek == 2) {
        fill(blae);
        if (pause == true) {
          fill(blae, fade);
        }
      }
      if (CSeek == 0) {
        noFill();
      }  
      ellipse(pos1X1, pos1Y1, butSize, butSize);
      if (CFlock == 1) {
        fill(fern);
        if (pause == true) {
          fill(fern, fade);
        }
      }
      if (CFlock == 2) {
        fill(blae);
        if (pause == true) {
          fill(blae, fade);
        }
      }
      if (CFlock == 0) {
        noFill();
      }  
      ellipse(pos2X1, pos2Y1, butSize, butSize);
      if (CAbsorb == 1) {
        fill(fern);
        if (pause == true) {
          fill(fern, fade*1.5);
        }
      }
      if (CAbsorb == 2) {
        fill(blae);
        if (pause == true) {
          fill(blae, fade*1.5);
        }
      }
      if (CAbsorb == 0) {
        noFill();
      }  
      ellipse(pos3X1, pos3Y1, butSize, butSize);
      if (CDestroy == 1) {
        fill(fern);
        if (pause == true) {
          fill(fern, fade*1.5);
        }
      }
      if (CDestroy == 2) {
        fill(blae);
        if (pause == true) {
          fill(blae, fade*1.5);
        }
      }
      if (CDestroy == 0) {
        noFill();
      }  
      ellipse(pos4X1, pos4Y1, butSize, butSize);



      //      println("BfireMode");
      blaePartMenu = false;
      //      textSize(30);
      //      fill(crimson);
      //      textAlign(LEFT);
      //      text("Launch Mode", 27, 40);

      if ((BshotOn == false)&&(DRAG==true)&&(Brelease==false)) { 
        initialX = mouseX;
        initialY = mouseY;
      }


      if ((DRAG==true)&&(moving==false)&&(barGrabbed==false)&&(anyMenuOn==false)) {
        strokeWeight(1);
        stroke(crimson);
        line(initialX, initialY, mouseX, mouseY);
        stroke(lightGrey);
        line(initialX+12, initialY, mouseX+5, mouseY);
        line(initialX-12, initialY, mouseX-5, mouseY);
        fill(blae);
        stroke(255);
        ellipse(mouseX, mouseY, 5, 5);
        Brelease = false;
        BshotOn = true;
      }

      if ((DRAG==false)&&(BshotOn==true)) {
        Brelease=true; 
        BshotOn=false;
      }

      if (Brelease == true) {
        //          println(mouseX-initialX); 
        BinitialX = initialX;
        BinitialY = initialY;
        newVelX=mouseX-initialX;
        newVelY=mouseY-initialY;
        BnewVelX = -newVelX/100;
        BnewVelY = -newVelY/100;
      }

      BSeek = CSeek;
      BFlock = CFlock;
      BAbsorb = CAbsorb;
      BDestroy = CDestroy;




      //        float blaeButD = dist(bPartX, bPartY, mouseX, mouseY);
    }
  }
}

// A simple Dust class

class Dust {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  color col;
  

  Dust(float x, float y, float n, color c) {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-2,2),random(-2,0));
    location = new PVector(0,0,0);
    location.set(x,y,0);
    lifespan = 255.0;
    col = color(c);
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 3.0;
    
  }

  // Method to display
  void display() {
    if (lifespan>0){
    stroke(col,lifespan);
    fill(col,lifespan);
    ellipse(location.x,location.y,3,3);
    }
  }
  
  // Is the Dust still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}



class DustSystem {
  ArrayList<Dust> dustParticles;
  PVector origin;

  DustSystem() {
//    origin = location.get();
    dustParticles = new ArrayList<Dust>();
  }

  void addDust(float x, float y, float n, color c) {
     for (int i = 0; i < n; i++) {
       dustParticles.add(new Dust(x,y,n,c));
     }
  }

  void run() {
    Iterator<Dust> it = dustParticles.iterator();
    while (it.hasNext()) {
      Dust p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove(); 
      }
    }
  }
}
class exampleMenu {
  float pos1X1, pos1Y1, pos1X2, pos1Y2, pos1A, pos1D;
  float pos2X1, pos2Y1, pos2X2, pos2Y2, pos2A, pos2D;
  float pos3X1, pos3Y1, pos3X2, pos3Y2, pos3A, pos3D;
  float pos4X1, pos4Y1, pos4X2, pos4Y2, pos4A, pos4D;
  boolean deleteOn, pos1On, pos2On, pos3On, pos4On;
  float menuTheta;
  float r;
  float butSize;
  boolean exampleMenu;
  float exampleMenuX, exampleMenuY;

  exampleMenu() {
    //leave this here!
  }

  void Menu() {


    float exampleD = dist(mouseX, mouseY, 200, 34);
    fill(lightGrey);
    rectMode(CORNER);
    //   rect(10,10, 140, 40,5,5,5,5);

    textSize(24);
    fill(textWhite);
    textAlign(LEFT);
    text("Examples", 57, 40);
    noFill();
    stroke(255);
    ellipse(200, 34, 44, 44); 

    if ((TAP==true)&&(exampleD<44)) {
      exampleMenu=true;
      justPressed = true;
    }

    if (exampleMenu == true) {

      textAlign(CENTER);
      fill(textWhite);
      textSize(20);
      text(" \n \nSelect from a range of example real life pattern systems", width/2, 500);       
      r = 80;
      butSize = 44;

      pause = true;
      exampleMenuX = 200;
      exampleMenuY =  34;
      menuTheta = 0;

      pos1A = 30;
      pos2A = 70;
      pos3A = 110;
      pos4A = 150;

      pos1X1 = exampleMenuX + cos(radians(menuTheta+pos1A))*(r);
      pos1Y1 = exampleMenuY + sin(radians(menuTheta+pos1A))*(r);
      pos1X2 = exampleMenuX + cos(radians(menuTheta+pos1A))*(r/2);
      pos1Y2 = exampleMenuY + sin(radians(menuTheta+pos1A))*(r/2);

      pos2X1 = exampleMenuX + cos(radians(menuTheta+pos2A))*(r);
      pos2Y1 = exampleMenuY + sin(radians(menuTheta+pos2A))*(r);
      pos2X2 = exampleMenuX + cos(radians(menuTheta+pos2A))*(r/2);
      pos2Y2 = exampleMenuY + sin(radians(menuTheta+pos2A))*(r/2);       

      pos3X1 = exampleMenuX + cos(radians(menuTheta+pos3A))*(r);
      pos3Y1 = exampleMenuY + sin(radians(menuTheta+pos3A))*(r);
      pos3X2 = exampleMenuX + cos(radians(menuTheta+pos3A))*(r/2);
      pos3Y2 = exampleMenuY + sin(radians(menuTheta+pos3A))*(r/2);  

      pos4X1 = exampleMenuX + cos(radians(menuTheta+pos4A))*(r);
      pos4Y1 = exampleMenuY + sin(radians(menuTheta+pos4A))*(r);
      pos4X2 = exampleMenuX + cos(radians(menuTheta+pos4A))*(r/2);
      pos4Y2 = exampleMenuY + sin(radians(menuTheta+pos4A))*(r/2);  

      textSize(18);
      fill(textWhite);
      textAlign(LEFT);
      pushMatrix();
      translate(exampleMenuX, exampleMenuY);
      rotate(radians(30));
      text("Orbits", + r+butSize, 5);
      rotate(radians(-30));
      rotate(radians(70));
      text("Spheres", +r+butSize, 5);
      rotate(radians(-70));
      rotate(radians(110));
      text("Flocks", +r+butSize, 5);
      rotate(radians(-110));
      rotate(radians(150));
      text("Feedback", +r+butSize, 5);
      popMatrix();

      noFill();
      strokeWeight(2);
      stroke(255);

      ellipse(pos1X1, pos1Y1, butSize, butSize);

      ellipse(pos2X1, pos2Y1, butSize, butSize);

      ellipse(pos3X1, pos3Y1, butSize, butSize);

      ellipse(pos4X1, pos4Y1, butSize, butSize);


      pos1D = dist(mouseX, mouseY, pos1X1, pos1Y1);
      if (pos1D <= butSize/2) {
        pos1On = true;
      }

      pos2D = dist(mouseX, mouseY, pos2X1, pos2Y1);
      if (pos2D <= butSize/2) {
        pos2On = true;
      }

      pos3D = dist(mouseX, mouseY, pos3X1, pos3Y1);
      if (pos3D <= butSize/2) {
        pos3On = true;
      }
      pos4D = dist(mouseX, mouseY, pos4X1, pos4Y1);
      if (pos4D <= butSize/2) {
        pos4On = true;
      }


      if ((TAP==true)&&(pos1On==true)) {
        planetsExample = true;
        pause = true;
        justPressed = true;
        exampleMenu = false;
        removeAll = true;
        GfireMode = true;
      }

      if ((TAP==true)&&(pos2On==true)) {
        orbitsExample= true;
        pause = true;
        justPressed = true;
        removeAll = true;
        exampleMenu = false;
        GfireMode = true;
      }


      if ((TAP==true)&&(pos3On==true)) {
        flocksExample= true;
        pause = true;
        justPressed = true;
        removeAll = true;
        exampleMenu = false;
        GfireMode = true;
      }

      if ((TAP==true)&&(pos4On==true)) {
        feedbackExample= true;
        pause = true;
        justPressed = true;
        removeAll = true;
        exampleMenu = false;
      }

      if ((pos1On==false)&&(pos2On==false)&&(pos3On==false)&&(pos4On==false)&&(TAP==true)&&(justPressed==false)) {
        exampleMenu = false;
        pause = false;
      }
    }
        pos1On = false;
    pos2On = false;
    pos3On = false;
    pos4On = false;
  }
}

void examples() {
  if (planetsExample == true) { 
    //create particles
    pause = true;
   
    //render example explination
    fill(darkGrey, fade/2);
    stroke(255);
    strokeWeight(3);
    rectMode(CORNERS);
    rect(width*0.1, height*0.1, width*0.9, height*0.9, 30, 30, 30, 30);
    
    textSize(40);
    textAlign(LEFT);
    text("Orbits", width/4.5, height*0.2);
    textSize(20);
    fill(textWhite);
    text("From keeping the earth at an even distance to the sun to the structure of atoms,\norbits are hard to see but essential to our very existence.\nAn orbit is created when a smaller object (like the Moon) is attracted\nto a larger object (like the Earth). Fortunately for Earth the Moon is moving\nfast enough that it constantly misses a collision. This is called a stable orbit;\nand because the moon is moving in a vacuum, it will not slow down enough\nto hit Earth - at least not for billions of years.\n\nDrag your finger across the screen to launch planets into orbit.", width/4.5, height*0.3);
    

    //close on tap{
    if ((TAP == true)&&(justPressed == false)) {
      planetsExample = false;
      system.addMajor(new Major(width/2, height/2, 1, 0));
      pause = false;
      justPressed = true;
    }
  }
  if (orbitsExample == true) { 
    //create particles
    pause = true;
   
    //render example explination
    fill(darkGrey, fade/2);
    stroke(255);
    strokeWeight(3);
    rectMode(CORNERS);
    rect(width*0.1, height*0.1, width*0.9, height*0.9, 30, 30, 30, 30);

textSize(40);
    textAlign(LEFT);
    text("Spheres", width/4.5, height*0.2);
    textSize(20);
    fill(textWhite);
    text("Spheres are natural spherical objects such as bubbles, planets and\nwater droplets. They form from smaller particles pulling evenly upon each other;\nthis even pull from all sides causes the particles to form a circle.\nAfter the Big Bang, billions of tiny particles were tumbling through space\neach with its own tiny sphere of gravity. As these particles\npulled together their collective mass grew larger and their gravity strengthened,\nattracting evermore particles. This caused a runaway effect that led\nto the gigantic stars and planets we see today.", width/4.5, height*0.3);
    

    //close on tap{
    if ((TAP == true)&&(justPressed == false)) {
      orbitsExample = false;
      pause = false;
      justPressed = true;
      orbitsTap=true;
      system.addMajor(new Major(width/4, height/4, 2, 0));
      system.addMajor(new Major(width*0.75, height*0.75, 2, 0));
    }
  }
  
  if (flocksExample == true) { 
    //create particles
    pause = true;
   
    //render example explination
    fill(darkGrey, fade/2);
    stroke(255);
    strokeWeight(3);
    rectMode(CORNERS);
    rect(width*0.1, height*0.1, width*0.9, height*0.9, 30, 30, 30, 30);

textSize(40);
    textAlign(LEFT);
    text("Flocks", width/4.5, height*0.2);
    textSize(20);
    fill(textWhite);
    text("A flock of birds or shoal of fish can look like one giant animal\nmoving seamlessly together. Although it can seem that all the animals\nhave a plan or are aware of the flock as a whole,\nthey are really only watching the others closest to them.\nParticle simulates this by making the particles cluster together,\nwithout ever moving too close and, more importantly, align to each\nothers direction of movement. These simple rules create the same\nmovements we see in flocking animals.", width/4.5, height*0.3);

    //close on tap{
    if ((TAP == true)&&(justPressed == false)) {
      flocksExample = false;
      pause = false;
      justPressed = true;
      flocksTap=true;
trails = true;
    }
  }
  
    if (feedbackExample == true) { 
    //create particles
    pause = true;
   
    //render example explination
    fill(darkGrey, fade/2);
    stroke(255);
    strokeWeight(3);
    rectMode(CORNERS);
    rect(width*0.1, height*0.1, width*0.9, height*0.9, 30, 30, 30, 30);
    
    textSize(40);
    textAlign(LEFT);
    text("Feedback", width/4.5, height*0.2);
    textSize(20);
    fill(textWhite);
    text("The reason for animals’ varied spots and stripes is usually\nrooted in camouflage or mating, but how they are created \nis much more complicated.  Feedback is the interaction between\ntwo conflicting particles. As they flow through the system,\nthey create lines and formations, which are thought to generate\nthe great variety of spirals, spots and stripes we see in nature today.", width/4.5, height*0.3);


    //close on tap{
    if ((TAP == true)&&(justPressed == false)) {
      feedbackExample = false;
      pause = false;
      justPressed = true;
     trails = true;
     system.addMajor(new Major(width/3, height/3, 3, 0));
     system.addMajor(new Major(width*0.66, height*0.66, 4, 0));
    }
  }
  
}


void holdMenus() {
  holdMajors();
  holdMinors();
}

void sideBar() {
  float gPartX, gPartY, bPartX, bPartY;
  float x, y, w, q, c, fl, at, ab, de;
  boolean particleSelected = false;


  

  gPartX = barEdge+86;
  gPartY =  160;
  bPartX = barEdge+86;
  bPartY =  275;
  float r = 44;

  if (pause==false) {
    fill(textWhite);
  }
  else {
    fill(textWhite, fade);
  }
  textSize(24);
  textAlign(RIGHT);
  text("Particle", width - 27, 40);
  


  rectMode(CORNER);
  noStroke();
  if (pause==false) {
    fill(lightGrey);
  }
  if (pause==true) {
    fill(lightGrey, fade);
  }
  rectMode(CORNERS);
  rect(barEdge, 100, width, height, 20, 0, 0, 20);
  strokeWeight(1);
  stroke(darkGrey);
  if (pause == true) {
    stroke(darkGrey, fade);
  }
  line(barEdge+20, 100, barEdge+20, height);

  noStroke();
  fill(darkGrey);
  if (pause == true) {
    fill(darkGrey, fade);
  }
  ellipse(barEdge+10, height/2+50, 8, 8);
  ellipse(barEdge+10, height/2+60, 8, 8);
  ellipse(barEdge+10, height/2+40, 8, 8);
  textSize(16);
  textAlign(CENTER);
//  text("Create\nNew", gPartX, 80); 

  fill(fern);
  if ((pause == true)&&(fernPartMenu==false)) {
    fill(fern, fade*1.5);
  }
  stroke(255);
  if ((pause == true)&&(fernPartMenu==false)) {
    stroke(255, fade);
  }
  strokeWeight(3); 
   pushMatrix();
    translate(gPartX, gPartY);

    if ((GSeek>0)||(GFlock>0)) {
      if ((GDestroy==0)&&(GAbsorb==0)) {
        //flocking triangles

        beginShape(TRIANGLES);
        vertex(0, -r*2/4);
        vertex(-r/4, r*2/4);
        vertex(r/4, r*2/4);
        endShape();
      }
    }

    if ((GDestroy>0)&&(GAbsorb>0)) {
      //tear drop

      rotate(radians(180));
      rectMode(CENTER);
      scale(0.5);
      rect(0, 0, r, r, r, r, 0, 0);
      beginShape();
      
      vertex(r, r/2-1);
      vertex(0, r);
      vertex(-r, r/2-1);
      endShape();
      rectMode(CORNER);
      rotate(radians(-180));
    }

    if ((GAbsorb>0)&&(GDestroy==0)) {
      if ((GSeek>0)||(GFlock>0)) {
        //squashed ellipse


        ellipse(0, 0, r*0.9, r*1.2);
      }
    }

    if ((GDestroy>0)&&(GAbsorb==0)) {
      //hexagon

      beginShape();
      scale(1.5);
      vertex(0, -12);
      vertex(10.5, -6);
      vertex(10.5, 6);
      vertex(0, 12);
      vertex(-10.5, 6);
      vertex(-10.5, -6);
      vertex(0, -12);
      endShape();
    }

    if ((GAbsorb>0)&&(GSeek==0)&&(GFlock==0)&&(GDestroy==0)) {
      //ellipse
      ellipse(0, 0, r, r);
    }
    if ((GAbsorb==0)&&(GSeek==0)&&(GFlock==0)&&(GDestroy==0)) {
       ellipse(0, 0, r, r);
    }
    popMatrix();
  

  fill(blae);
  if ((pause == true)&&(blaePartMenu==false)) {
    fill(blae, fade*1.5);
  }
  stroke(255);
  if ((pause == true)&&(blaePartMenu==false)) {
    stroke(255, fade);
  }
  strokeWeight(3);
  
   pushMatrix();
    translate(bPartX, bPartY);

    if ((BSeek>0)||(BFlock>0)) {
      if ((BDestroy==0)&&(BAbsorb==0)) {
        //flocking triangles

        beginShape(TRIANGLES);
        vertex(0, -r*2/4);
        vertex(-r/4, r*2/4);
        vertex(r/4, r*2/4);
        endShape();
      }
    }

    if ((BDestroy>0)&&(BAbsorb>0)) {
      //tear drop

      
      rectMode(CENTER);
      scale(0.5);
      rotate(radians(180));
      rect(0, 0, r, r, r, r, 0, 0);
      beginShape();
      
      vertex(r, r/2-1);
      vertex(0, r);
      vertex(-r, r/2-1);
      
      endShape();
      rectMode(CORNER);
      rotate(radians(-180));
    }

    if ((BAbsorb>0)&&(BDestroy==0)) {
      if ((BSeek>0)||(BFlock>0)) {
        //squashed ellipse


        ellipse(0, 0, r*0.9, r*1.2);
      }
    }

    if ((BDestroy>0)&&(BAbsorb==0)) {
      //hexagon

      beginShape();
      scale(1.5);
      vertex(0, -12);
      vertex(10.5, -6);
      vertex(10.5, 6);
      vertex(0, 12);
      vertex(-10.5, 6);
      vertex(-10.5, -6);
      vertex(0, -12);
      endShape();
    }

    if ((BAbsorb>0)&&(BSeek==0)&&(BFlock==0)&&(BDestroy==0)) {
      //ellipse
      ellipse(0, 0, r, r);
    }
    if ((BAbsorb==0)&&(BSeek==0)&&(BFlock==0)&&(BDestroy==0)) {
       ellipse(0, 0, r, r);
    }
    popMatrix();
  stroke(255,100);
  
//if (trails == false){
//noFill();
//}
//if (trails == true){
// fill(255,100); 
// if (pause == true){
//  noFill();
// noStroke(); 
// }
//}
//ellipse(bPartX, 387-20, 44,44);



stroke(255, 150);
if (trails == false){
noFill();
}
if (trails == true){
 fill(255,150);
 if(pause==true){
   fill(255,150-fade);
}
}
if (pause == true){
  stroke(255,fade);
}
ellipse(bPartX, 387, 44,44); 

//stroke(255);
//if (trails == false){
//noFill();
//}
//if (trails == true){
//  fill(255);
// if(pause==true){
//   fill(255, fade);
//}
//}
//if (pause == true){
//  stroke(255,fade);
//}
//
//ellipse(bPartX, 387+20, 44,44); 


if (pause==false){
  fill(crimson);
}
if(pause == true){
 fill(crimson,fade); 
}
  ellipse(bPartX, 500, 44, 44);
  strokeWeight(5);
  if (pause == false){
  stroke(255);
  }
  if (pause == true){
    stroke(255, fade);
  }
  strokeCap(ROUND);
  line(bPartX + cos(radians(-45))*(44/3), 500 + sin(radians(-45))*(44/3), bPartX + cos(radians(135))*(44/3), 500 + sin(radians(135))*(44/3));
  line(bPartX + cos(radians(45))*(44/3), 500 + sin(radians(45))*(44/3), bPartX + cos(radians(225))*(44/3), 500 + sin(radians(225))*(44/3));

  float tempDelete = dist(bPartX, 500, mouseX, mouseY);
float trailsD = dist(bPartX, 387, mouseX, mouseY);
  float fernButD = dist(gPartX, gPartY, mouseX, mouseY);
  float blaeButD = dist(bPartX, bPartY, mouseX, mouseY);

  if ((fernButD<22)&&(TAP==true)&&(pause==false)&&(justPressed == false)) {
    justPressed = true;
    fernPartMenu = true; 
    GfireMode = false;
    BfireMode = false;
  }

  if ((blaeButD<22)&&(TAP==true)&&(pause==false)&&(justPressed == false)) {
    justPressed = true;
    blaePartMenu = true; 
    BfireMode = false;
    GfireMode = false;
  }

  if ((tempDelete<22)&&(TAP==true)) {
    removeAll = true;
    gNotificationManager.notify(1, gNotification);
    player.start();
  }

  if ((trailsD<22)&&(TAP==true)&&(trails == false)&&(justPressed==false)) {
    trails = true;
    justPressed = true;
  }
    if ((trailsD<22)&&(TAP==true)&&(trails == true)&&(justPressed==false)) {
    trails = false;
    justPressed=true;
  }

  if (particleSelected == true) {
    //   system.creator(x, y, w, q, c, fl, at, ab, de);
  } 

  //    if ((mouseX>barEdge)&&(mouseX<barEdge+22)&&(TAP==true)&&(barEdge>width-64)&&(pause==false)){ 
  //    barEdge = width-150;
  //}
  //    if ((mouseX>barEdge)&&(mouseX<barEdge+22)&&(TAP==true)&&(barEdge<width-64)&&(pause==false)){ 
  //    barEdge = width-22;
  //}


  if ((mouseX>barEdge)&&(mouseX<barEdge+22)&&(DRAG==true)&&(moving==false)&&(pause==false)&&(GshotOn==false)) { 
    barGrabbed = true;
  }

  if (barGrabbed == true) {
    barEdge = mouseX;
  } 

  if (barEdge>width-22) {
    barEdge = width-22;
  }
  if (barEdge<width-150) {
    barEdge = width-150;
  }

  if (DRAG==false) {
    barGrabbed = false;
  }
}


class gParticleMenu {
  float pos1X1, pos1Y1, pos1X2, pos1Y2, pos1A, pos1D;
  float pos2X1, pos2Y1, pos2X2, pos2Y2, pos2A, pos2D;
  float pos3X1, pos3Y1, pos3X2, pos3Y2, pos3A, pos3D;
  float pos4X1, pos4Y1, pos4X2, pos4Y2, pos4A, pos4D;
  boolean deleteOn, pos1On, pos2On, pos3On, pos4On;
  float menuTheta;
  float r;
  float butSize;
  boolean createMinors;
  PVector createLoc;
  PVector createVel;
  boolean createFern, createBlae;
  float CFlock, CSeek, CAbsorb, CDestroy, newColor;
  float gPartX, gPartY, bPartX, bPartY;

  float initialX, initialY;
  float newVelX, newVelY;


  gParticleMenu() {
    //leave this here!
  }

  void run() {

    greenParticleMenu();

    pos1On = false;
    pos2On = false;
    pos3On = false;
    pos4On = false;
  }


  void greenParticleMenu() {


    if (fernPartMenu==true) {
       blaePartMenu = false;
      textAlign(CENTER);
      fill(textWhite);
      textSize(20);
      text("Select the attributes you want your new particle to have.\nWhen you're done drag your finger across the screen to launch particles.\nPress and hold to find out more about an attribute.", width/2, 500);       
      r = 80;
      butSize = 44;

      pause = true;
      gPartX = barEdge+86;
      gPartY =  160;
      menuTheta = 0;

      pos1A = 240;
      pos2A = 200;
      pos3A = 160;
      pos4A = 120;

      pos1X1 = gPartX + cos(radians(menuTheta+pos1A))*(r);
      pos1Y1 = gPartY + sin(radians(menuTheta+pos1A))*(r);
      pos1X2 = gPartX + cos(radians(menuTheta+pos1A))*(r/2);
      pos1Y2 = gPartY + sin(radians(menuTheta+pos1A))*(r/2);

      pos2X1 = gPartX + cos(radians(menuTheta+pos2A))*(r);
      pos2Y1 = gPartY + sin(radians(menuTheta+pos2A))*(r);
      pos2X2 = gPartX + cos(radians(menuTheta+pos2A))*(r/2);
      pos2Y2 = gPartY + sin(radians(menuTheta+pos2A))*(r/2);       

      pos3X1 = gPartX + cos(radians(menuTheta+pos3A))*(r);
      pos3Y1 = gPartY + sin(radians(menuTheta+pos3A))*(r);
      pos3X2 = gPartX + cos(radians(menuTheta+pos3A))*(r/2);
      pos3Y2 = gPartY + sin(radians(menuTheta+pos3A))*(r/2);  

      pos4X1 = gPartX + cos(radians(menuTheta+pos4A))*(r);
      pos4Y1 = gPartY + sin(radians(menuTheta+pos4A))*(r);
      pos4X2 = gPartX + cos(radians(menuTheta+pos4A))*(r/2);
      pos4Y2 = gPartY + sin(radians(menuTheta+pos4A))*(r/2);  

      textSize(18);
      fill(textWhite);
      textAlign(RIGHT);
      pushMatrix();
      translate(gPartX, gPartY);
      rotate(radians(60));
      text("Seek", - r-butSize, 5);
      rotate(radians(-60));
      rotate(radians(20));
      text("Flock", -r-butSize, 5);
      rotate(radians(-20));
      rotate(radians(-20));
      text("Absorb", -r-butSize, 5);
      rotate(radians(20));
      rotate(radians(-60));
      text("Destroy", -r-butSize, 5);
      popMatrix();

      noFill();
      strokeWeight(2);
      stroke(255);
      if (CSeek == 1) {
        fill(fern);
      }
      if (CSeek == 2) {
        fill(blae);
      }
      if (CSeek == 0) {
        noFill();
      }  
      ellipse(pos1X1, pos1Y1, butSize, butSize);
      if (CFlock == 1) {
        fill(fern);
      }
      if (CFlock == 2) {
        fill(blae);
      }
      if (CFlock == 0) {
        noFill();
      }  
      ellipse(pos2X1, pos2Y1, butSize, butSize);
      if (CAbsorb == 1) {
        fill(fern);
      }
      if (CAbsorb == 2) {
        fill(blae);
      }
      if (CAbsorb == 0) {
        noFill();
      }  
      ellipse(pos3X1, pos3Y1, butSize, butSize);
      if (CDestroy == 1) {
        fill(fern);
      }
      if (CDestroy == 2) {
        fill(blae);
      }
      if (CDestroy == 0) {
        noFill();
      }  
      ellipse(pos4X1, pos4Y1, butSize, butSize);


      pos1D = dist(mouseX, mouseY, pos1X1, pos1Y1);
      if (pos1D <= butSize/2) {
        pos1On = true;
      }

      pos2D = dist(mouseX, mouseY, pos2X1, pos2Y1);
      if (pos2D <= butSize/2) {
        pos2On = true;
      }

      pos3D = dist(mouseX, mouseY, pos3X1, pos3Y1);
      if (pos3D <= butSize/2) {
        pos3On = true;
      }
      pos4D = dist(mouseX, mouseY, pos4X1, pos4Y1);
      if (pos4D <= butSize/2) {
        pos4On = true;
      }


      if ((TAP==true)&&(pos1On==true)) {
        CSeek+= 1;
      }

      if ((TAP==true)&&(pos2On==true)) {
        CFlock+=1;
      }


      if ((TAP==true)&&(pos3On==true)) {

        CAbsorb += 1;
      }

      if ((TAP==true)&&(pos4On==true)) {
        CDestroy +=1;
      }

      if ((HOLD==true)&&(pos1On==true)) {
        seekerHold = true;
        pause = true;
      }


      if ((HOLD==true)&&(pos2On==true)) {
        flockerHold = true;
        pause = true;
      }

      if ((HOLD==true)&&(pos3On==true)) {
        absorberHold = true;
        pause = true;
      }



      if ((HOLD==true)&&(pos4On==true)) {
        destroyerHold = true;
        pause = true;
      }


      if (CFlock>2) {
        CFlock = 0;
      }
      if (CSeek>2) {
        CSeek = 0;
      }            
      if (CAbsorb>2) {
        CAbsorb = 0;
      }
      if (CDestroy>2) {
        CDestroy = 0;
      }

   

      if ((CFlock == 0)&&(CSeek == 0)&&(CAbsorb == 0)&&(CDestroy == 0)&&(pos1On==false)&&(pos2On==false)&&(pos3On==false)&&(pos4On==false)&&(TAP==true)&&(justPressed==false)&&(destroyerHold==false)&&(absorberHold==false)&&(seekerHold==false)&&(flockerHold==false)&&(colourHold==false)) {
        fernPartMenu = false;
        pause= false;
      }

      if ((CFlock > 0)||(CSeek > 0)||(CAbsorb > 0)||(CDestroy > 0)) {
        if ((pos1On==false)&&(pos1On==false)&&(pos2On==false)&&(pos3On==false)&&(pos4On==false)&&(DRAG==true)&&(destroyerHold==false)&&(absorberHold==false)&&(seekerHold==false)&&(flockerHold==false)&&(colourHold==false)) {    
          GfireMode = true;
          pause = false;
        }
      }
      if ((CFlock > 0)||(CSeek > 0)||(CAbsorb > 0)||(CDestroy > 0)) {
        if ((pos1On==false)&&(pos1On==false)&&(pos2On==false)&&(pos3On==false)&&(pos4On==false)&&(TAP==true)&&(justPressed==false)&&(destroyerHold==false)&&(absorberHold==false)&&(seekerHold==false)&&(flockerHold==false)&&(colourHold==false)) {    
          GfireMode = true;
          pause = false;
        }
      }
    }
    //fern menu ends

    // fire mode ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (GfireMode==true) {
      //set up examples///////////////////////////////////////
      if ((planetsExample == true)||(orbitsExample == true)){
      CSeek = 0;
      CFlock = 0;
      CAbsorb = 1;
      CDestroy = 0; 
      }
      
      if ((flocksExample == true)){
      CSeek = 0;
      CFlock = 1;
      CAbsorb = 0;
      CDestroy = 0; 
      }
      
      
      ////////////////////////////////////////////////////////
      
      
      
      
      //render mini ellipses.
      r = 44;
      butSize = 20;

      gPartX = barEdge+86;
      gPartY =  160;

      menuTheta = 0;

      pos1A = 240;
      pos2A = 200;
      pos3A = 160;
      pos4A = 120;

      pos1X1 = gPartX + cos(radians(menuTheta+pos1A))*(r);
      pos1Y1 = gPartY + sin(radians(menuTheta+pos1A))*(r);
      pos1X2 = gPartX + cos(radians(menuTheta+pos1A))*(r/2);
      pos1Y2 = gPartY + sin(radians(menuTheta+pos1A))*(r/2);

      pos2X1 = gPartX + cos(radians(menuTheta+pos2A))*(r);
      pos2Y1 = gPartY + sin(radians(menuTheta+pos2A))*(r);
      pos2X2 = gPartX + cos(radians(menuTheta+pos2A))*(r/2);
      pos2Y2 = gPartY + sin(radians(menuTheta+pos2A))*(r/2);       

      pos3X1 = gPartX + cos(radians(menuTheta+pos3A))*(r);
      pos3Y1 = gPartY + sin(radians(menuTheta+pos3A))*(r);
      pos3X2 = gPartX + cos(radians(menuTheta+pos3A))*(r/2);
      pos3Y2 = gPartY + sin(radians(menuTheta+pos3A))*(r/2);  

      pos4X1 = gPartX + cos(radians(menuTheta+pos4A))*(r);
      pos4Y1 = gPartY + sin(radians(menuTheta+pos4A))*(r);
      pos4X2 = gPartX + cos(radians(menuTheta+pos4A))*(r/2);
      pos4Y2 = gPartY + sin(radians(menuTheta+pos4A))*(r/2);  

      noFill();
      strokeWeight(1);
      stroke(255);
      if (pause == true) {
        fill(255, fade);
      }
      if (CSeek == 1) {
        fill(fern);
        if (pause == true) {
          fill(fern, fade);
        }
      }
      if (CSeek == 2) {
        fill(blae);
        if (pause == true) {
          fill(blae, fade);
        }
      }
      if (CSeek == 0) {
        noFill();
      }  
      ellipse(pos1X1, pos1Y1, butSize, butSize);
      if (CFlock == 1) {
        fill(fern);
        if (pause == true) {
          fill(fern, fade);
        }
      }
      if (CFlock == 2) {
        fill(blae);
        if (pause == true) {
          fill(blae, fade);
        }
      }
      if (CFlock == 0) {
        noFill();
      }  
      ellipse(pos2X1, pos2Y1, butSize, butSize);
      if (CAbsorb == 1) {
        fill(fern);
        if (pause == true) {
          fill(fern, fade*1.5);
        }
      }
      if (CAbsorb == 2) {
        fill(blae);
        if (pause == true) {
          fill(blae, fade*1.5);
        }
      }
      if (CAbsorb == 0) {
        noFill();
      }  
      ellipse(pos3X1, pos3Y1, butSize, butSize);
      if (CDestroy == 1) {
        fill(fern);
        if (pause == true) {
          fill(fern, fade*1.5);
        }
      }
      if (CDestroy == 2) {
        fill(blae);
        if (pause == true) {
          fill(blae, fade*1.5);
        }
      }
      if (CDestroy == 0) {
        noFill();
      }  
      ellipse(pos4X1, pos4Y1, butSize, butSize);



      //      println("GfireMode");
      fernPartMenu = false;
      //      textSize(30);
      //      fill(crimson);
      //      textAlign(LEFT);
      //      text("Launch Mode", 27, 40);

      if ((GshotOn == false)&&(DRAG==true)&&(Grelease==false)) { 
        initialX = mouseX;
        initialY = mouseY;
      }


      if ((DRAG==true)&&(moving==false)&&(barGrabbed==false)&&(anyMenuOn==false)) {
        strokeWeight(1);
        stroke(crimson);
        line(initialX, initialY, mouseX, mouseY);
        stroke(lightGrey);
        line(initialX+12, initialY, mouseX+5, mouseY);
        line(initialX-12, initialY, mouseX-5, mouseY);
        fill(fern);
        stroke(255);
        ellipse(mouseX, mouseY, 5, 5);
        Grelease = false;
        GshotOn = true;
      }

      if ((DRAG==false)&&(GshotOn==true)) {
        Grelease=true; 
        GshotOn=false;
      }

      if (Grelease == true) {
        //          println(mouseX-initialX); 
        GinitialX = initialX;
        GinitialY = initialY;
        newVelX=mouseX-initialX;
        newVelY=mouseY-initialY;
        GnewVelX = -newVelX/100;
        GnewVelY = -newVelY/100;
        GmouseX = mouseX;
        GmouseY = mouseY;
      }

      GSeek = CSeek;
      GFlock = CFlock;
      GAbsorb = CAbsorb;
      GDestroy = CDestroy;




      //        float fernButD = dist(gPartX, gPartY, mouseX, mouseY);
    }
  }
}

void helpMenu() {

  float helpX= 40;
  float helpY = height-40;
  float r = 30;
  float d = dist(helpX, helpY, mouseX, mouseY);

  fill(255);
  noStroke();
  ellipse(helpX, helpY, r, r);
  fill(darkGrey);
  textAlign(CENTER);
  textSize(20);
  text("?", 40, height-32);
  if ((d<= r)&&(TAP==true)) { 
    helpOn = true;
    pause = true;
  }
  
if ((mouseX>width-50)&&(mouseY<40)&&(TAP==true)){
   particleAbout = true; 
  }
  
  if (particleAbout == true){
    pause = true;
   fill(darkGrey,fade*3);
    stroke(255);
    strokeWeight(3);
    rectMode(CORNERS);
    rect(width*0.1, height*0.1, width*0.9, height*0.9, 30, 30, 30, 30);
       textAlign(LEFT);
       textSize(40);
       fill(textWhite);
    text("About", width/4.5, height*0.2);

    textSize(20);

    text("Particle Alpha1.0\nCreated by James Frankis\njamesfrankis.co.uk", width/4.5, height*0.3); 
    if (mousePressed){
     particleAbout = false; 
     pause = false;
    }
  }
  
  if (helpOn == true) {
    fill(darkGrey,fade/2);
    stroke(255);
    strokeWeight(3);
    rectMode(CORNERS);
    rect(width*0.1, height*0.1, width*0.9, height*0.9, 30, 30, 30, 30);

    fill(textWhite);
    textAlign(LEFT);
    textSize(20);
    //    text("What is Particle", width*0.12, height*0.15);
    textSize(40);
    textAlign(LEFT);
    text("Particle", width/4.5, height*0.2);

    textSize(20);
    text("From planets to molecules, everything we encounter\nis constructed from smaller components.\nParticle simulates some of the ways in which these elements\ninteract with each other to create the structures and patterns\nwe see every day.", width/4.5, height*0.3);
    text("Particle has two main types of particles: Major and Minor.\nMajor are large and orange.\nMinor are small and either blue or green.\nEach type has a set of different attributes which can be turned\non and off. You can double tap to create new Majors\nand use the side bar at the right to create Minors. ", width/4.5, height*0.6);
    fill(orange);
    noStroke();
    ellipse(width*0.83, height*0.6, 80, 80);

    fill(fern);
    stroke(255);
    strokeWeight(1);
    ellipse(width*0.83, height*0.75, 20, 20);

    pushMatrix();
    translate(width*0.83, height*0.82);
    rotate(radians(90));
    fill(blae);
    stroke(255);
    strokeWeight(1);
    beginShape(TRIANGLES);
    vertex(0, -20*2/2);
    vertex(-20/2, 20*2/2);
    vertex(20/2, 20*2/2);
    endShape();
    popMatrix();


    if (mousePressed) {
      helpOn = false;
      pause = false;
    }
  }

  if (examples == true) {
    fill(darkGrey,fade/5);
    stroke(255);
    strokeWeight(3);
    rectMode(CORNERS);
    rect(width*0.1, height*0.1, width*0.9, height*0.9, 30, 30, 30, 30);
      if (mousePressed) {
      examples = false;
      pause = false;
    }
  }
 
  
}

//boolean generalHelp, examples, howWorks;
//boolean gravityHold, createHold, absorbHold, destroyHold;
//boolean seekerHold, flockerHold, destroyerHold, absorberHold, colourHold;

void holdMajors() {
  
  //Gravity Hold
  
  if (gravityHold ==true) {
    fill(darkGrey,fade*3);
    stroke(255);
    strokeWeight(3);
    rectMode(CORNERS);
    rect(width*0.1, height*0.1, width*0.9, height*0.9, 30, 30, 30, 30);
       textAlign(LEFT);
       textSize(40);
       fill(textWhite);
    text("Gravity", width/4.5, height*0.2);

    textSize(20);
    text("This simulates the effects of gravity on any surrounding particles.\n \nTurn it on for all particles, just green or just blue.", width/4.5, height*0.3);
//    fill(crimson);
//    rectMode(CORNERS);
 image(gravityImg, width/4, height*0.48, 512, 240);
//    rect(width/4, height*0.45, width*0.75,height*0.85);

      
      
      if (TAP==true) {
      gravityHold = false;
      pause = false;
      justPressed = true;
    }
    
  } 

//create Hold

  if (createHold ==true) {
    fill(darkGrey,fade*3);
    stroke(255);
    strokeWeight(3);
    rectMode(CORNERS);
    rect(width*0.1, height*0.1, width*0.9, height*0.9, 30, 30, 30, 30);
       textAlign(LEFT);
       textSize(40);
       fill(textWhite);
    text("Create", width/4.5, height*0.2);

    textSize(20);

    text("This particle will start to create new minor particles\nwith the attributes and direction of your choosing.", width/4.5, height*0.3);
    
//    fill(crimson);
//    rectMode(CORNERS);
 image(createImg, width/4, height*0.48, 512, 240);
//    rect(width/4, height*0.45, width*0.75,height*0.85);

      if (TAP==true) {
      createHold = false;
      pause = false;
      justPressed = true;
    }
  }  

//absorb Hold

  if (absorbHold ==true) {
        fill(darkGrey,fade*3);
    stroke(255);
    strokeWeight(3);
    rectMode(CORNERS);
    rect(width*0.1, height*0.1, width*0.9, height*0.9, 30, 30, 30, 30);
       textAlign(LEFT);
       textSize(40);
       fill(textWhite);
    text("Absorb", width/4.5, height*0.2);

    textSize(20);
    text("When a smaller particle collides with this one,\nthe smaller is absorbed and the large particle grows larger.\nTurn it on for all particles, just green or just blue.", width/4.5, height*0.3);
    
//    fill(crimson);
//    rectMode(CORNERS);
 image(absorbImg, width/4, height*0.48, 512, 240);
//    rect(width/4, height*0.45, width*0.75,height*0.85);
    
      
      if (TAP==true) {
      absorbHold = false;
      pause = false;
      justPressed = true;
    }
    
  }  

//destroy hold

  if (destroyHold ==true) {
            fill(darkGrey,fade*3);
    stroke(255);
    strokeWeight(3);
    rectMode(CORNERS);
    rect(width*0.1, height*0.1, width*0.9, height*0.9, 30, 30, 30, 30);
       textAlign(LEFT);
       textSize(40);
       fill(textWhite);
    text("Destroy", width/4.5, height*0.2);

    textSize(20);



    text("When a smaller particle collides with this one, the smaller gets destroyed.\n \nTurn it on for all particles, just green, just blue.", width/4.5, height*0.3);
    
//    fill(crimson);
//    rectMode(CORNERS);
 image(destroyImg, width/4, height*0.48, 512, 240);
//    rect(width/4, height*0.45, width*0.75,height*0.85);
        
      if (TAP==true) {
      destroyHold = false;
      pause = false;
      justPressed = true;
    }
  }
}




void holdMinors() {
  if (seekerHold == true) {
    fill(darkGrey,fade*3);
    stroke(255);
    strokeWeight(3);
    rectMode(CORNERS);
    rect(width*0.1, height*0.1, width*0.9, height*0.9, 30, 30, 30, 30);
       textAlign(LEFT);
       textSize(40);
       fill(textWhite);
    text("Seek", width/4.5, height*0.2);

    textSize(20);

    text("This will create a particle that will seek out the particle colour of your choosing.\n \nEither seek green or blue particles.", width/4.5, height*0.3);
    
//    fill(crimson);
//    rectMode(CORNERS);
 image(seekerImg, width/4, height*0.48, 512, 240);
//    rect(width/4, height*0.45, width*0.75,height*0.85);
    
      if (TAP==true) {
      seekerHold = false;
      pause = false;
      justPressed = true;
    }
    
  }

  if (flockerHold == true) {
    fill(darkGrey,fade*3);
    stroke(255);
    strokeWeight(3);
    rectMode(CORNERS);
    rect(width*0.1, height*0.1, width*0.9, height*0.9, 30, 30, 30, 30);
       textAlign(LEFT);
       textSize(40);
       fill(textWhite);
    text("Flock", width/4.5, height*0.2);

    textSize(20);




    text("This will create a particle that will flock with the other particles of your choosing.\n \nEither flock green or blue particles.", width/4.5, height*0.3);
    
//    fill(crimson);
//    rectMode(CORNERS);
 image(flockerImg, width/4, height*0.48, 512, 240);
//    rect(width/4, height*0.45, width*0.75,height*0.85);
       
      if (TAP==true) {
      flockerHold = false;
      pause = false;
      justPressed = true;
    }
    
  }
  if (absorberHold == true) {
    fill(darkGrey,fade*3);
    stroke(255);
    strokeWeight(3);
    rectMode(CORNERS);
    rect(width*0.1, height*0.1, width*0.9, height*0.9, 30, 30, 30, 30);
       textAlign(LEFT);
       textSize(40);
       fill(textWhite);
    text("Absorb", width/4.5, height*0.2);

    textSize(20);

    text("This will create a particle that absorbs and grows larger\n with any smaller particles it collides with.\n Either absorb green or blue particles.", width/4.5, height*0.3);
    
//    fill(crimson);
//    rectMode(CORNERS);
 image(absorbImg, width/4, height*0.48, 512, 240);
//    rect(width/4, height*0.45, width*0.75,height*0.85);
    
      if (TAP==true) {
      absorberHold = false;
      pause = false;
      justPressed = true;
    }
    
  }

  if (destroyerHold == true) {
    fill(darkGrey,fade*3);
    stroke(255);
    strokeWeight(3);
    rectMode(CORNERS);
    rect(width*0.1, height*0.1, width*0.9, height*0.9, 30, 30, 30, 30);
       textAlign(LEFT);
       textSize(40);
       fill(textWhite);
    text("Destroy", width/4.5, height*0.2);

    textSize(20);


          
    text("This will create a particle which will destroy any smaller particles it collides with.\n \nEither destroy green or blue particles.", width/4.5, height*0.3);
    
//    fill(crimson);
//    rectMode(CORNERS);
 image(destroyerImg, width/4, height*0.48, 512, 240);
//    rect(width/4, height*0.45, width*0.75,height*0.85);
    
      if (TAP==true) {
      destroyerHold = false;
      pause = false;
      justPressed = true;
    }
    
  }


  if (colourHold == true) {
    
    fill(darkGrey,fade*3);
    stroke(255);
    strokeWeight(3);
    rectMode(CORNERS);
    rect(width*0.1, height*0.1, width*0.9, height*0.9, 30, 30, 30, 30);
       textAlign(LEFT);
       textSize(40);
       fill(textWhite);
    text("Colour", width/4.5, height*0.2);

    textSize(20);



    text("This changes the colour of the particle created.\n \nEither create green or blue particles.", width/4.5, height*0.3);
    
//    fill(crimson);
//    rectMode(CORNERS);
 image(colourImg, width/4, height*0.48, 512, 240);
//    rect(width/4, height*0.45, width*0.75,height*0.85);
    
      if (TAP==true) {
      colourHold = false;
      pause = false;
      justPressed = true;
    }
  }
}

void Hold(){ 
  //HOLD///////////////////////
  if ((mousePressed)&&!pmousePressed) {
    counter = 0;
  }

  if ((counter>=30)) {
    HOLD = true;
    counter = 0;
  }

  if ((mousePressed)&&(FLICK==false)&&(TAP==false)&&(DOUBLE_TAP==false)&&(ROTATE==false)&&(DRAG==false)&&(MULTI_DRAG==false)&&(PINCH==false)) {
    counter+=1;
  }
 ///////////////////////////
}

void mouseReleased(){
  counter = 0;
}
// The Major class

class Major {
  //  PVector Minorinitial;
  //  PVector Minorvel;
  PVector location;
  PVector velocity;
  PVector acceleration;
  color fillColor;


  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  boolean isDead;
  float Minornum, testcount;
  boolean isMajor;
  boolean isMinor;
  float timer, area, menuTheta, directionTheta, directionX, directionY;


  //menu variables
  float pos1X1, pos1Y1, pos1X2, pos1Y2, pos1A, pos1D;
  float pos2X1, pos2Y1, pos2X2, pos2Y2, pos2A, pos2D;
  float pos3X1, pos3Y1, pos3X2, pos3Y2, pos3A, pos3D;
  float pos4X1, pos4Y1, pos4X2, pos4Y2, pos4A, pos4D;
  float deleteX1, deleteY1, deleteX2, deleteY2, deleteA, deleteD;
  boolean deleteOn, pos1On, pos2On, pos3On, pos4On;
  boolean mainMenu, pullMenu, createMenu, absorbMenu, destroyMenu;
  //  boolean flMenu, atMenu, abMenu, inMenu, deMenu;
  float Gneighbordist;
  boolean menuOn, menuOnhold;
  float seek, absorb, destroy, flock;



  //flock
  float flockMaxforce;    
  float flockMaxspeed;

  //create variables
  float createTime = 30;
  boolean createMinors;
  PVector createLoc;
  PVector createVel;
  boolean createFern, createBlae;
  float CFlock, CSeek, CAbsorb, CDestroy, newColor;

  //  float typeColor, typeFlocker, typeAttractor, typeAbsorber, typeInhibitor, typeDestroyer;
  float gravOn = 0;
  float gravColor = 0;
  float absorbOn = 0;
  float absorbColor = 0;
  float destroyOn = 0;
  float destroyColor = 0;
  boolean createOn = false;
  boolean absorbBegin = false;
  boolean destroyBegin = false;
  boolean flockBegin = false;

  boolean isFern, isBlae;
  boolean seekAll, seekFern, seekBlae, flockAll, flockFern, flockBlae, absorbAll, absorbFern, absorbBlae, destroyAll, destroyFern, destroyBlae;




  //soft body variables/////////////////////////////
//  PVector Shapevelocity;
//  float rotAngle = -90;
//  float springing = .0009, damping = .98;
//  int nodes = 40;
//  float nodeStartX[] = new float[nodes];
//  float nodeStartY[] = new float[nodes];
//  float[]nodeX = new float[nodes];
//  float[]nodeY = new float[nodes];
//  float[]angle = new float[nodes];
//  float[]d = new float[nodes];
//  float[]accelX  = new float[nodes];
//  float[]accelY = new float[nodes];
//  float organicConstant;
//  float[]frequency = new float[nodes];
  /////////////////////////////////////////////////

  Major(float x, float y, float v1, float v2) {

    acceleration = new PVector(0, 0);
    
    
    velocity = new PVector(0, 0);
    location = new PVector(x, y);
    //    Minorinitial = new PVector(0, 0);
    //    Minorvel = new PVector(0, 0);
    createLoc = new PVector(0, 0);
    createVel = new PVector(0, 0);
//    Shapevelocity = new PVector(0, 0); 
    isMajor = true;
    isMinor = false;
    isBlae = false;
    isFern=false;
    mainMenu = true;
    timer = 255;
    r = 80;
    Gneighbordist = r*4;
    maxspeed = 10;
    maxforce = 0.02;
    menuTheta = 0;
//    organicConstant = 1;
    flockMaxspeed = 2;
    flockMaxforce = 0.03;
    fillColor = color(orange);
    //planet options
    if (v1== 1){
     gravOn = 1;
     destroyOn = 1;
    } 
        if (v1== 2){
     gravOn = 1;
     absorbOn = 1;
    } 
     if (v1== 3){
     gravColor = 1;
     destroyColor = 1;
     CDestroy = 1;
     newColor = 1;
     directionTheta = 70;
               directionX = location.x + cos(radians(directionTheta))*(r*1.5);
          directionY = location.y + sin(radians(directionTheta))*(r*1.5);
     createOn = true;
     
    } 
        if (v1== 4){     
     gravColor = 2;
     destroyColor = 2;
     CDestroy = 2;
     newColor = 0;
     directionTheta = 250;
               directionX = location.x + cos(radians(directionTheta))*(r*1.5);
          directionY = location.y + sin(radians(directionTheta))*(r*1.5);
     createOn = true;
     
    } 
  }

  void run(ArrayList<Major> particles) {
    // these 3 stay on at all times//
    render(particles);
    borders();
    majorMenu(particles);
    // on / off  to make particle absorb others
    absorb(particles);

    //on / off to make particle destroy others
    destroy(particles);

    //on / off to make particle a creator
    creator();
  }

  void update() {

    velocity.add(acceleration);
    velocity.limit(maxspeed);

    location.add(velocity);

    acceleration.mult(0);
  }

  //Render/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void render(ArrayList<Major> particles) {

    area = PI*r*r;

    if (menuOn==true) {
      if (moving == true) {
        noFill();
        stroke(crimson);
        strokeWeight(2);
        line(location.x+r/2, location.y, location.x-r/2, location.y);
        line(location.x, location.y+r/2, location.x, location.y-r/2);
      }
      else {
        fill(255);
      }
      if ((createOn == true)&&(moving==false)) {
        if (newColor == 0) {
          fill(fern);
        }
        if (newColor == 1) {
          fill(blae);
        }
      }
      strokeWeight(4);
      stroke(orange);
    }
    if ((menuOn==false)&&(pause==true)) {
      fill(orange, fade);
      noStroke();
    }
    if (pause==false) {
      fill(orange); 
      if (createOn==true) {
        if (newColor == 0) {
          fill(fern);
        }
        if (newColor == 1) {
          fill(blae);
        }
      }
      noStroke();
    }

    ellipse(location.x, location.y, r, r);

    //grav circles
    if (gravOn == 1) {
      noFill();
      strokeWeight(1);
      stroke(crimson, fade);
      ellipse(location.x, location.y, Gneighbordist*2, Gneighbordist*2);
    }
    if (gravColor == 1) {
      noFill();
      strokeWeight(1);
      stroke(fern, fade);
      ellipse(location.x, location.y, Gneighbordist*2, Gneighbordist*2);
    }
    if (gravColor == 2) {
      noFill();
      strokeWeight(1);
      stroke(blae, fade);
      ellipse(location.x, location.y, Gneighbordist*2, Gneighbordist*2);
    }
  }


  //Menu/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  void majorMenu(ArrayList<Major> particles) {
    menuOnhold = false;
    deleteOn = false;
    pos1On = false;
    pos2On = false;
    pos3On = false;
    pos4On = false;

    if (isMajor == true) {
      float d = dist(mouseX, mouseY, location.x, location.y);

      //main menu/////////////////////////////////////////////////
      if (menuOn == true) { 

        //drag around

        if ((d<r/2)&&(DRAG==true)) {
          moving = true;
          location.x = mouseX;
          location.y = mouseY;
        }
        if (DRAG==false) {
          moving = false;
        }


        if (moving == false) {
          if (mainMenu == true) {

            pullMenu = false;
            createMenu = false;
            destroyMenu = false;
            absorbMenu = false;

            if (location.y<500-r) {
              textAlign(CENTER);
              fill(textWhite);
              textSize(20);

              text(" \nPress and hold to find out what differnet attributes do. Press and drag to move the particle.\nIf you can't see the options use two fingers to rotate them. Tap anywhere to exit.", width/2, 500);
            }
            else {
              textAlign(CENTER);
              fill(textWhite);
              textSize(20);
              text("\nPress and hold to find out what differnet attributes do. Press and drag to move the particle.\nIf you can't see the options use two fingers to rotate them. Tap anywhere to exit.", width/2, 500);
            }

            pos1A = -60;
            pos2A = -20;
            pos3A = 20;
            pos4A = 60;
            deleteA = 180;
            menuTheta=(degrees(pinchR));

            pos1X1 = location.x + cos(radians(menuTheta+pos1A))*(r);
            pos1Y1 = location.y + sin(radians(menuTheta+pos1A))*(r);
            pos1X2 = location.x + cos(radians(menuTheta+pos1A))*(r/2);
            pos1Y2 = location.y + sin(radians(menuTheta+pos1A))*(r/2);

            pos2X1 = location.x + cos(radians(menuTheta+pos2A))*(r);
            pos2Y1 = location.y + sin(radians(menuTheta+pos2A))*(r);
            pos2X2 = location.x + cos(radians(menuTheta+pos2A))*(r/2);
            pos2Y2 = location.y + sin(radians(menuTheta+pos2A))*(r/2);       

            pos3X1 = location.x + cos(radians(menuTheta+pos3A))*(r);
            pos3Y1 = location.y + sin(radians(menuTheta+pos3A))*(r);
            pos3X2 = location.x + cos(radians(menuTheta+pos3A))*(r/2);
            pos3Y2 = location.y + sin(radians(menuTheta+pos3A))*(r/2);  

            pos4X1 = location.x + cos(radians(menuTheta+pos4A))*(r);
            pos4Y1 = location.y + sin(radians(menuTheta+pos4A))*(r);
            pos4X2 = location.x + cos(radians(menuTheta+pos4A))*(r/2);
            pos4Y2 = location.y + sin(radians(menuTheta+pos4A))*(r/2);  

            deleteX1 = location.x + cos(radians(menuTheta+deleteA))*(r);
            deleteY1 = location.y + sin(radians(menuTheta+deleteA))*(r);
            deleteX2 = location.x + cos(radians(menuTheta+deleteA))*(r/2);
            deleteY2 = location.y + sin(radians(menuTheta+deleteA))*(r/2);   

            textSize(18);
            fill(textWhite);
            textAlign(LEFT);
            pushMatrix();
            translate(location.x, location.y);
            rotate(radians(menuTheta+pos1A));
            text("Gravity", r+butSize, 5);
            rotate(radians(-pos1A));
            rotate(radians(pos2A));
            text("Create", r+butSize, 5);
            rotate(radians(-pos2A));
            rotate(radians(pos3A));
            text("Absorb", r+butSize, 5);
            rotate(radians(-pos3A));
            rotate(radians(pos4A));
            text("Destroy", r+butSize, 5);
            popMatrix();


            strokeWeight(3);
            stroke(orange);
            noFill();
            if (gravOn==1) {
              fill(255);
            }
            if (gravColor==1) {
              fill(fern);
            }
            if (gravColor==2) {
              fill(blae);
            }
            ellipse(pos1X1, pos1Y1, butSize, butSize);
            noFill();
            if (createOn==true) {
              fill(255);
            }
            ellipse(pos2X1, pos2Y1, butSize, butSize);
            noFill();
            if (absorbOn==1) {
              fill(255);
            }
            if (absorbColor==1) {
              fill(fern);
            }
            if (absorbColor==2) {
              fill(blae);
            }
            ellipse(pos3X1, pos3Y1, butSize, butSize);
            noFill();
            if (destroyOn==1) {
              fill(255);
            }
            if (destroyColor==1) {
              fill(fern);
            }
            if (destroyColor==2) {
              fill(blae);
            }
            ellipse(pos4X1, pos4Y1, butSize, butSize);
            noFill();
            ellipse(deleteX1, deleteY1, butSize, butSize);

            //render delete cross//

            strokeWeight(5);
            stroke(255);
            strokeCap(ROUND);
            line(deleteX1 + cos(radians(-45))*(butSize/3), deleteY1 + sin(radians(-45))*(butSize/3), deleteX1 + cos(radians(135))*(butSize/3), deleteY1 + sin(radians(135))*(butSize/3));
            line(deleteX1 + cos(radians(45))*(butSize/3), deleteY1 + sin(radians(45))*(butSize/3), deleteX1 + cos(radians(225))*(butSize/3), deleteY1 + sin(radians(225))*(butSize/3));



            deleteD = dist(mouseX, mouseY, deleteX1, deleteY1);
            if (deleteD <= butSize) {
              deleteOn = true;
            }

            pos1D = dist(mouseX, mouseY, pos1X1, pos1Y1);
            if (pos1D <= butSize) {
              pos1On = true;
            }

            pos2D = dist(mouseX, mouseY, pos2X1, pos2Y1);
            if (pos2D <= butSize) {
              pos2On = true;
            }

            pos3D = dist(mouseX, mouseY, pos3X1, pos3Y1);
            if (pos3D <= butSize) {
              pos3On = true;
            }
            pos4D = dist(mouseX, mouseY, pos4X1, pos4Y1);
            if (pos4D <= butSize) {
              pos4On = true;
            }


            if ((TAP==true)&&(deleteOn==true)) {
              ds.addDust(location.x, location.y, r, fillColor);
              isDead = true;
              gNotificationManager.notify(1, gNotification);
            }

            if ((TAP==true)&&(pos1On==true)) {
              pullMenu=true;
              mainMenu = false;
            }

            if ((HOLD==true)&&(pos1On==true)) {
              gravityHold = true;
              pause = true;
            }
            if ((TAP==true)&&(pos2On==true)) {
              createMenu=true;
              mainMenu = false;
              justPressed = true;
            }
            if ((HOLD==true)&&(pos2On==true)) {
              createHold = true;
              pause = true;
            }

            if ((TAP==true)&&(pos3On==true)) {
              absorbMenu=true;
              mainMenu = false;
              justPressed = true;
            }
            if ((HOLD==true)&&(pos3On==true)) {
              absorbHold = true;
              pause = true;
            }
            if ((TAP==true)&&(pos4On==true)) {
              destroyMenu=true;
              mainMenu = false;
            }
            if ((HOLD==true)&&(pos4On==true)) {
              destroyHold = true;
              pause = true;
            }
          }
          //main menu ends/////////////////////////////////////////////////

          //pull menu/////////////////////////////////////////////////
          if (pullMenu == true) {
            mainMenu = false;

            createMenu = false;
            destroyMenu = false;
            absorbMenu = false;
            menuTheta=(degrees(pinchR));       
            fill(darkGrey);  
            textAlign(CENTER);
            textSize(16);
            text("Gravity", location.x, location.y+5);  

            pos2X1 = location.x + cos(radians(menuTheta+pos2A))*(r);
            pos2Y1 = location.y + sin(radians(menuTheta+pos2A))*(r);
            pos2X2 = location.x + cos(radians(menuTheta+pos2A))*(r/2);
            pos2Y2 = location.y + sin(radians(menuTheta+pos2A))*(r/2);       

            pos3X1 = location.x + cos(radians(menuTheta+pos3A))*(r);
            pos3Y1 = location.y + sin(radians(menuTheta+pos3A))*(r);
            pos3X2 = location.x + cos(radians(menuTheta+pos3A))*(r/2);
            pos3Y2 = location.y + sin(radians(menuTheta+pos3A))*(r/2);  

            deleteX1 = location.x + cos(radians(menuTheta+deleteA))*(r);
            deleteY1 = location.y + sin(radians(menuTheta+deleteA))*(r);
            deleteX2 = location.x + cos(radians(menuTheta+deleteA))*(r/2);
            deleteY2 = location.y + sin(radians(menuTheta+deleteA))*(r/2);   




            fill(50);
            textAlign(LEFT);
            fill(textWhite);
            pushMatrix();
            translate(location.x, location.y);
            rotate(radians(menuTheta+pos2A));
            text("On", r+butSize, 5);
            rotate(radians(-pos2A));
            rotate(radians(pos3A));
            text("Colour", r+butSize, 5);
            popMatrix();
            textAlign(RIGHT);
            //            text("Back", deleteX1-30, deleteY1+5);

            noFill();

            strokeWeight(3);
            stroke(orange);
            ellipse(pos2X1, pos2Y1, butSize, butSize);
            ellipse(pos3X1, pos3Y1, butSize, butSize);
            noFill();
            ellipse(deleteX1, deleteY1, butSize, butSize);
            fill(255);
            noStroke();
            beginShape(TRIANGLES);
            vertex(deleteX1-butSize/3, deleteY1);
            vertex(deleteX1+butSize/4, deleteY1-butSize/4);
            vertex(deleteX1+butSize/4, deleteY1+butSize/4);
            endShape();



            if ((gravOn == 1)||(gravColor>0)) {
              strokeWeight(3);
              stroke(orange);
              fill(255);
              ellipse(pos2X1, pos2Y1, butSize, butSize);
            }
            if (gravColor == 1) {
              strokeWeight(3);
              stroke(orange);


              fill(fern);
              ellipse(pos3X1, pos3Y1, butSize, butSize);
            }
            if (gravColor == 2) {
              strokeWeight(3);
              stroke(orange);


              fill(blae);
              ellipse(pos3X1, pos3Y1, butSize, butSize);
            }

            deleteD = dist(mouseX, mouseY, deleteX1, deleteY1);
            if (deleteD <= butSize/2) {
              deleteOn = true;
            }

            pos2D = dist(mouseX, mouseY, pos2X1, pos2Y1);
            if (pos2D <= butSize/2) {
              pos2On = true;
            }

            pos3D = dist(mouseX, mouseY, pos3X1, pos3Y1);
            if (pos3D <= butSize/2) {
              pos3On = true;
            }

            if ((TAP==true)&&(deleteOn==true)) {
              pullMenu = false;
              mainMenu = true;
            }

            if ((TAP==true)&&(pos2On==true)) {
              gravOn+=1;
            }

            if (gravOn>1) {
              gravOn=0;
            }
            if ((TAP==true)&&(pos3On==true)) {
              gravColor+=1;
            }
            if (gravColor>=3) {
              gravColor = 0;
            }

            if ((TAP==true)&&(pos2On==true)&&(gravColor>0)) {
              gravColor = 0;
              gravOn = 0;
            }
            if ((TAP==true)&&(pos3On==true)&&(gravOn==1)) {

              gravOn = 0;
            }
            if ((TAP==true)&&(d<r/2)) {
              gravityHold=true;
              pause = true;
            }
          }
          //pull menu ends/////////////////////////////////////////////////

          //Create menu/////////////////////////////////////////////////
          if (createMenu == true) {
            mainMenu = false;
            pullMenu = false;
            menuTheta=(degrees(pinchR));
            destroyMenu = false;
            absorbMenu = false;
            textAlign(CENTER);
            fill(textWhite);
            textSize(16);
            text("Create\nColour", location.x, location.y-5);  
            if (location.y<500-r) {

              textSize(20);
              text("\nChoose the attributes you want new particles to have\npress and hold to find out what each one does.", width/2, 500);
            }
            else {
              textAlign(CENTER);
              fill(textWhite);
              textSize(20);
              text("\nChoose the attributes you want new particles to have\npress and hold to find out what each one does.", width/2, 500);
            }

            //DIRECTION picker.
          directionX = location.x + cos(radians(directionTheta))*(r*1.5);
          directionY = location.y + sin(radians(directionTheta))*(r*1.5);
          float directionD = dist(mouseX, mouseY, directionX, directionY);
           
          
            if ((mouseX > location.x) && (mouseY<location.y)&&(DRAG==true)) {
              directionTheta += radians((mouseX-pmouseX+mouseY-pmouseY)*10);
            
            }
            if ((mouseX < location.x) && (mouseY<location.y) && (DRAG==true)) {
              directionTheta += radians((mouseX-pmouseX+pmouseY-mouseY)*10);
            }
            if ((mouseX < location.x) && (mouseY>location.y) && (DRAG==true)) {
              directionTheta += radians((pmouseX-mouseX+pmouseY-mouseY)*10);
            }
            if ((mouseX > location.x) && (mouseY>location.y) && (DRAG==true)) {
              directionTheta += radians((pmouseX-mouseX+mouseY-pmouseY)*10);
            }
          



pushMatrix();
          stroke(orange);
          strokeWeight(3);
          translate(location.x, location.y);
          rotate(radians(directionTheta));
          beginShape(TRIANGLES);
          vertex(r*1.5, -15);
          vertex(r*1.5, 15);
          vertex(r*1.5+44, 0);
          endShape();
popMatrix();



          pos1A = -60;
          pos2A = -20;
          pos3A = 20;
          pos4A = 60;
          deleteA = 180;

          pos1X1 = location.x + cos(radians(menuTheta+pos1A))*(r);
          pos1Y1 = location.y + sin(radians(menuTheta+pos1A))*(r);
          pos1X2 = location.x + cos(radians(menuTheta+pos1A))*(r/2);
          pos1Y2 = location.y + sin(radians(menuTheta+pos1A))*(r/2);

          pos2X1 = location.x + cos(radians(menuTheta+pos2A))*(r);
          pos2Y1 = location.y + sin(radians(menuTheta+pos2A))*(r);
          pos2X2 = location.x + cos(radians(menuTheta+pos2A))*(r/2);
          pos2Y2 = location.y + sin(radians(menuTheta+pos2A))*(r/2);       

          pos3X1 = location.x + cos(radians(menuTheta+pos3A))*(r);
          pos3Y1 = location.y + sin(radians(menuTheta+pos3A))*(r);
          pos3X2 = location.x + cos(radians(menuTheta+pos3A))*(r/2);
          pos3Y2 = location.y + sin(radians(menuTheta+pos3A))*(r/2);  

          pos4X1 = location.x + cos(radians(menuTheta+pos4A))*(r);
          pos4Y1 = location.y + sin(radians(menuTheta+pos4A))*(r);
          pos4X2 = location.x + cos(radians(menuTheta+pos4A))*(r/2);
          pos4Y2 = location.y + sin(radians(menuTheta+pos4A))*(r/2);  

          deleteX1 = location.x + cos(radians(menuTheta+deleteA))*(r);
          deleteY1 = location.y + sin(radians(menuTheta+deleteA))*(r);
          deleteX2 = location.x + cos(radians(menuTheta+deleteA))*(r/2);
          deleteY2 = location.y + sin(radians(menuTheta+deleteA))*(r/2);   

          textSize(18);
          fill(textWhite);
          textAlign(LEFT);
          pushMatrix();
          translate(location.x, location.y);
          rotate(radians(menuTheta+pos1A));
          text("Seek", r+butSize, 5);
          rotate(radians(-pos1A));
          rotate(radians(pos2A));
          text("Flock", r+butSize, 5);
          rotate(radians(-pos2A));
          rotate(radians(pos3A));
          text("Absorb", r+butSize, 5);
          rotate(radians(-pos3A));
          rotate(radians(pos4A));
          text("Destroy", r+butSize, 5);
          popMatrix();
          //CFlock == 1)||(CAttractor == 1)||(CAbsorber == 1)||(CDestroyer == 1

          noFill();
          strokeWeight(3);
          stroke(orange);
          if (CSeek == 1) {
            fill(fern);
          }
          if (CSeek == 2) {
            fill(blae);
          }
          if (CSeek == 0) {
            noFill();
          }  
          ellipse(pos1X1, pos1Y1, butSize, butSize);
          if (CFlock == 1) {
            fill(fern);
          }
          if (CFlock == 2) {
            fill(blae);
          }
          if (CFlock == 0) {
            noFill();
          }  
          ellipse(pos2X1, pos2Y1, butSize, butSize);
          if (CAbsorb == 1) {
            fill(fern);
          }
          if (CAbsorb == 2) {
            fill(blae);
          }
          if (CAbsorb == 0) {
            noFill();
          }  
          ellipse(pos3X1, pos3Y1, butSize, butSize);
          if (CDestroy == 1) {
            fill(fern);
          }
          if (CDestroy == 2) {
            fill(blae);
          }
          if (CDestroy == 0) {
            noFill();
          }  
          ellipse(pos4X1, pos4Y1, butSize, butSize);
          noFill();
          ellipse(deleteX1, deleteY1, butSize, butSize);
          fill(255);
          noStroke();
          beginShape(TRIANGLES);
          vertex(deleteX1-butSize/3, deleteY1);
          vertex(deleteX1+butSize/4, deleteY1-butSize/4);
          vertex(deleteX1+butSize/4, deleteY1+butSize/4);
          endShape();




          deleteD = dist(mouseX, mouseY, deleteX1, deleteY1);
          if (deleteD <= butSize) {
            deleteOn = true;
          }

          pos1D = dist(mouseX, mouseY, pos1X1, pos1Y1);
          if (pos1D <= butSize) {
            pos1On = true;
          }

          pos2D = dist(mouseX, mouseY, pos2X1, pos2Y1);
          if (pos2D <= butSize) {
            pos2On = true;
          }

          pos3D = dist(mouseX, mouseY, pos3X1, pos3Y1);
          if (pos3D <= butSize) {
            pos3On = true;
          }
          pos4D = dist(mouseX, mouseY, pos4X1, pos4Y1);
          if (pos4D <= butSize) {
            pos4On = true;
          }


          if ((TAP==true)&&(deleteOn==true)) {
            createMenu = false;
            mainMenu = true;
          }

          if ((TAP==true)&&(pos1On==true)) {
            CSeek+= 1;
          }

          if ((HOLD==true)&&(pos1On==true)) {
            seekerHold = true;
            pause = true;
          }

          if ((TAP==true)&&(pos2On==true)&&(justPressed == false)) {
            CFlock+=1;
          }
          if ((HOLD==true)&&(pos2On==true)) {
            flockerHold = true;
            pause = true;
          }

          if ((TAP==true)&&(pos3On==true)) {

            CAbsorb += 1;
          }
          if ((HOLD==true)&&(pos3On==true)) {
            absorberHold = true;
            pause = true;
          }

          if ((TAP==true)&&(pos4On==true)) {
            CDestroy +=1;
          }

          if ((HOLD==true)&&(pos4On==true)) {
            destroyerHold = true;
            pause = true;
          }
          if ((d<r/2)&&(TAP==true)) {
            newColor +=1;
          }

          if ((HOLD==true)&&((d<r/2))) {
            colourHold = true;
            pause = true;
          }

          if (newColor>1) {
            newColor = 0;
          }

          if (CFlock>2) {
            CFlock = 0;
          }
          if (CSeek>2) {
            CSeek = 0;
          }            
          if (CAbsorb>2) {
            CAbsorb = 0;
          }
          if (CDestroy>2) {
            CDestroy = 0;
          }


          if ((CFlock > 0)||(CSeek > 0)||(CAbsorb > 0)||(CDestroy > 0)) {
            createOn = true;
          }
          else {
            createOn = false;
          }
        }
        //Create menu ends/////////////////////////////////////////////////

        //Absorb menu/////////////////////////////////////////////////
        if (absorbMenu == true) {
          mainMenu = false;
          pullMenu = false;
          createMenu = false;
          destroyMenu = false;
          menuTheta=(degrees(pinchR));
          fill(darkGrey);  
          textAlign(CENTER);
          textSize(16);
          text("Absorb", location.x, location.y+5);  

          pos2X1 = location.x + cos(radians(menuTheta+pos2A))*(r);
          pos2Y1 = location.y + sin(radians(menuTheta+pos2A))*(r);
          pos2X2 = location.x + cos(radians(menuTheta+pos2A))*(r/2);
          pos2Y2 = location.y + sin(radians(menuTheta+pos2A))*(r/2);       

          pos3X1 = location.x + cos(radians(menuTheta+pos3A))*(r);
          pos3Y1 = location.y + sin(radians(menuTheta+pos3A))*(r);
          pos3X2 = location.x + cos(radians(menuTheta+pos3A))*(r/2);
          pos3Y2 = location.y + sin(radians(menuTheta+pos3A))*(r/2);  

          deleteX1 = location.x + cos(radians(menuTheta+deleteA))*(r);
          deleteY1 = location.y + sin(radians(menuTheta+deleteA))*(r);
          deleteX2 = location.x + cos(radians(menuTheta+deleteA))*(r/2);
          deleteY2 = location.y + sin(radians(menuTheta+deleteA))*(r/2);   

          fill(50);
          textAlign(LEFT);
          fill(textWhite);

          pushMatrix();
          translate(location.x, location.y);
          rotate(radians(menuTheta+pos2A));
          text("On", r+butSize, 5);
          rotate(radians(-pos2A));
          rotate(radians(pos3A));
          text("Colour", r+butSize, 5);
          popMatrix();



          noFill();

          strokeWeight(3);
          stroke(orange);
          ellipse(pos2X1, pos2Y1, butSize, butSize);
          ellipse(pos3X1, pos3Y1, butSize, butSize);
          noFill();
          ellipse(deleteX1, deleteY1, butSize, butSize);
          fill(255);
          noStroke();
          beginShape(TRIANGLES);
          vertex(deleteX1-butSize/3, deleteY1);
          vertex(deleteX1+butSize/4, deleteY1-butSize/4);
          vertex(deleteX1+butSize/4, deleteY1+butSize/4);
          endShape();
          strokeWeight(3);
          stroke(orange);

          if ((absorbOn == 1)||(absorbColor>0)) {
            strokeWeight(3);
            stroke(orange);
            fill(255);
            ellipse(pos2X1, pos2Y1, butSize, butSize);
          }
          if (absorbColor == 1) {
            strokeWeight(3);
            stroke(orange);


            fill(fern);
            ellipse(pos3X1, pos3Y1, butSize, butSize);
          }
          if (absorbColor == 2) {
            strokeWeight(3);
            stroke(orange);


            fill(blae);
            ellipse(pos3X1, pos3Y1, butSize, butSize);
          }

          deleteD = dist(mouseX, mouseY, deleteX1, deleteY1);
          if (deleteD <= butSize/2) {
            deleteOn = true;
          }

          pos2D = dist(mouseX, mouseY, pos2X1, pos2Y1);
          if (pos2D <= butSize/2) {
            pos2On = true;
          }

          pos3D = dist(mouseX, mouseY, pos3X1, pos3Y1);
          if (pos3D <= butSize/2) {
            pos3On = true;
          }

          if ((TAP==true)&&(deleteOn==true)) {
            absorbMenu = false;
            mainMenu = true;
          }

          if ((TAP==true)&&(pos2On==true)) {
            absorbOn+=1;
          }

          if (absorbOn>1) {
            absorbOn=0;
          }
          if ((TAP==true)&&(pos3On==true)&&(justPressed == false)) {
            absorbColor+=1;
          }
          if (absorbColor>=3) {
            absorbColor = 0;
          }

          if ((TAP==true)&&(pos2On==true)&&(absorbColor>0)) {
            absorbColor = 0;
            absorbOn = 0;
          }
          if ((TAP==true)&&(pos3On==true)&&(absorbOn==1)&&(justPressed == false)) {

            absorbOn = 0;
          }
          if ((TAP==true)&&(d<r/2)) {
            absorbHold=true;
            pause = true;
          }
        }
        //Absorb menu ends/////////////////////////////////////////////////

        //Destory menu/////////////////////////////////////////////////
        if (destroyMenu == true) {
          mainMenu = false;
          pullMenu = false;
          createMenu = false;
          menuTheta=(degrees(pinchR));
          absorbMenu = false;

          fill(darkGrey);  
          textAlign(CENTER);
          textSize(16);
          text("Destroy", location.x, location.y+5);  

          pos2X1 = location.x + cos(radians(menuTheta+pos2A))*(r);
          pos2Y1 = location.y + sin(radians(menuTheta+pos2A))*(r);
          pos2X2 = location.x + cos(radians(menuTheta+pos2A))*(r/2);
          pos2Y2 = location.y + sin(radians(menuTheta+pos2A))*(r/2);       

          pos3X1 = location.x + cos(radians(menuTheta+pos3A))*(r);
          pos3Y1 = location.y + sin(radians(menuTheta+pos3A))*(r);
          pos3X2 = location.x + cos(radians(menuTheta+pos3A))*(r/2);
          pos3Y2 = location.y + sin(radians(menuTheta+pos3A))*(r/2);  

          deleteX1 = location.x + cos(radians(menuTheta+deleteA))*(r);
          deleteY1 = location.y + sin(radians(menuTheta+deleteA))*(r);
          deleteX2 = location.x + cos(radians(menuTheta+deleteA))*(r/2);
          deleteY2 = location.y + sin(radians(menuTheta+deleteA))*(r/2);   

          fill(50);
          textAlign(LEFT);
          fill(textWhite);
          pushMatrix();
          translate(location.x, location.y);
          rotate(radians(menuTheta+pos2A));
          text("On", r+butSize, 5);
          rotate(radians(-pos2A));
          rotate(radians(pos3A));
          text("Colour", r+butSize, 5);
          popMatrix();

          noFill();

          strokeWeight(3);
          stroke(orange);
          ellipse(pos2X1, pos2Y1, butSize, butSize);
          ellipse(pos3X1, pos3Y1, butSize, butSize);
          noFill();
          ellipse(deleteX1, deleteY1, butSize, butSize);
          fill(255);
          noStroke();
          beginShape(TRIANGLES);
          vertex(deleteX1-butSize/3, deleteY1);
          vertex(deleteX1+butSize/4, deleteY1-butSize/4);
          vertex(deleteX1+butSize/4, deleteY1+butSize/4);
          endShape();
          noFill();

          strokeWeight(3);
          stroke(orange);
          if ((destroyOn == 1)||(destroyColor>0)) {
            strokeWeight(3);
            stroke(orange);
            fill(255);
            ellipse(pos2X1, pos2Y1, butSize, butSize);
          }
          if (destroyColor == 1) {
            strokeWeight(3);
            stroke(orange);


            fill(fern);
            ellipse(pos3X1, pos3Y1, butSize, butSize);
          }
          if (destroyColor == 2) {
            strokeWeight(3);
            stroke(orange);


            fill(blae);
            ellipse(pos3X1, pos3Y1, butSize, butSize);
          }

          deleteD = dist(mouseX, mouseY, deleteX1, deleteY1);
          if (deleteD <= butSize/2) {
            deleteOn = true;
          }

          pos2D = dist(mouseX, mouseY, pos2X1, pos2Y1);
          if (pos2D <= butSize/2) {
            pos2On = true;
          }

          pos3D = dist(mouseX, mouseY, pos3X1, pos3Y1);
          if (pos3D <= butSize/2) {
            pos3On = true;
          }

          if ((TAP==true)&&(deleteOn==true)) {
            destroyMenu = false;
            mainMenu = true;
          }

          if ((TAP==true)&&(pos2On==true)) {
            destroyOn+=1;
          }

          if (destroyOn>1) {
            destroyOn=0;
          }
          if ((TAP==true)&&(pos3On==true)) {
            destroyColor+=1;
          }
          if (destroyColor>=3) {
            destroyColor = 0;
          }

          if ((TAP==true)&&(pos2On==true)&&(destroyColor>0)) {
            destroyColor = 0;
            destroyOn = 0;
          }
          if ((TAP==true)&&(pos3On==true)&&(destroyOn==1)) {
            destroyOn = 0;
          }

          if ((TAP==true)&&(d<r/2)) {
            destroyHold=true;
            pause = true;
          }
        }
        //Destory menu ends/////////////////////////////////////////////////
      }
    }


    for (Major other : particles) {

      if ((other.menuOn == true)) {
        menuOnhold = true;
        pause = true;
        anyMenuOn = true;
      }



      float d2 = dist(other.location.x, other.location.y, location.x, location.y);
      if (d2<0) {
      }
    }

    if ((d<r/2)&&(menuOnhold == false)&&(pause==false)&&(TAP==true)) {
      menuOn = true;
      gNotificationManager.notify(1, gNotification);
    }

    if ((d>r/2)&&(deleteOn==false)&&(pos1On==false)&&(pos2On==false)&&(pos3On==false)&&(pos4On==false)&&(TAP==true)&&(gravityHold==false)&&(createHold==false)&&(absorbHold==false)&&(destroyHold==false)&&(destroyerHold==false)&&(absorberHold==false)&&(seekerHold==false)&&(flockerHold==false)&&(colourHold==false)&&(justPressed==false)&&(particleAbout==false)) {
      menuOn = false;
      pullMenu = false;
      absorbMenu=false;
      destroyMenu=false;
      createMenu=false;
      anyMenuOn = false;
      //        pause = false;
    }


    if ((menuOnhold == false)&&(menuOn==false)&&(helpOn==false)&&(fernPartMenu==false)&&(blaePartMenu==false)) {
      pause = false;
      pullMenu = false;
      absorbMenu=false;
      destroyMenu=false;
      createMenu=false;
      mainMenu = true;
      pinchR = 0;
    }
  }
}
//menu total Ends//////////////////////////////////////////////////////////////////////////////////////////////



//Wrap/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void borders() {

  if (location.x < -r/2) isDead = true;
  if (location.y < -r/2) isDead = true;
  if (location.x > barEdge+r/2) isDead = true;
  if (location.y > height+r/2) isDead = true;
}


//Destroy/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void destroy(ArrayList<Major> particles) {
  for (Major other : particles) {
    if (destroyOn == 1) {
      destroyBegin = true;
    }
    if ((destroyColor == 1)&&(other.isFern==true)) {
      destroyBegin = true;
    }
    if ((destroyColor == 2)&&(other.isBlae==true)) {
      destroyBegin = true;
    }

    if (destroyBegin == true) { 
      float d = PVector.dist(location, other.location);
      if ((d>0)&&(r>=other.r)) {
        if (d<r/2+other.r/2) {
          other.isDead = true;
          ds.addDust(other.location.x, other.location.y, other.r, other.fillColor);
          gNotificationManager.notify(1, gNotification);
        }
      }
    }
    destroyBegin = false;
  }
}

//Creator/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void creator() {
  createTime -= 1;

  if (createOn == true) {
    if ((createTime<0)&&(pause==false)) {
      float createA = directionTheta;
      createMinors = true;
      createLoc.set(location.x + cos(radians(createA))*(r/2), location.y + sin(radians(createA))*(r/2), 0);
      createVel.set ((directionX-location.x)/50, (directionY - location.y)/50,0);
//      if ((createA>0)&&(createA<90)) { 
//        createVel.set(random(0, 3), random(0, 3), 0);
//      }
//      if ((createA>90)&&(createA<180)) { 
//        createVel.set(random(-3, 0), random(0, 3), 0);
//      }
//      if ((createA>180)&&(createA<270)) { 
//        createVel.set(random(-3, 0), random(-3, 0), 0);
//      }
//      if ((createA>270)&&(createA<360)) { 
//        createVel.set(random(0, 3), random(-3, 0), 0);
//      }

      createTime = 50;
    }
    else {
      createMinors = false;
    }
  }
}

//Absorb/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void absorb(ArrayList<Major> particles) {

  for (Major other : particles) {
    if (absorbOn == 1) {
      absorbBegin = true;
    }
    if ((absorbColor == 1)&&(other.isFern==true)) {
      absorbBegin = true;
    }
    if ((absorbColor == 2)&&(other.isBlae==true)) {
      absorbBegin = true;
    }


    if (absorbBegin==true) {
          
      float d = PVector.dist(location, other.location);
      if ((d>0)&&(r>=other.r)) {
        if (d<r/2+other.r/2) {
          float velexc = r-other.r;
          if (velexc > 0) {
            other.velocity.div(velexc);
          }
          PVector velocalc = PVector.sub(velocity, other.velocity);
          velocity.sub(velocalc);
          float newR = sqrt((area+other.area)/PI);
          if (newR>= 100) {
            newR = 100;
          }
          r = newR;
          other.isDead = true;
          player2.start();
        }
      }
    }
    absorbBegin = false;
  }
}
}

class Minor extends Major {
  Minor(float x, float y, float v1, float v2, float c, float sk, float fl, float ab, float de) {
    super(x, y , v1, v2);
    velocity = new PVector(v1, v2);
    r = 10;

    seek = sk;
    flock = fl;
    absorb = ab;
    destroy = de;

    if (c == 0) {
      isFern = true;
    }
    else {
      isFern = false;
    }
    if (c == 1) {
      isBlae = true;
    }
    else {
      isBlae = false;
    }

    //seek
    if (sk== 1) {
      seekFern = true;
    }
    else {
      seekFern = false;
    }
    if (sk==2) {

      seekBlae = true;
    }
    else {
      seekBlae = false;
    }


    //flock
    if (fl== 1) {
      flockFern = true;
    }
    else {
      flockFern = false;
    }
    if (fl==2) {

      flockBlae = true;
    }
    else {
      flockBlae = false;
    }


    //Absorb
    if (ab== 1) {
      absorbFern = true;
    }
    else {
      absorbFern = false;
    }
    if (ab==2) {

      absorbBlae = true;
    }
    else {
      absorbBlae = false;
    }

    //destroy
    if (de== 1) {
      destroyFern = true;
    }
    else {
      destroyFern = false;
    }
    if (de==2) {

      destroyBlae = true;
    }
    else {
      destroyBlae = false;
    }
    

    isMajor = false;
    isMinor = true;
  }

  void run(ArrayList<Major> particles) {
    render();
    if (pause == false) {

      update();
      borders();

      attract(particles);
      flock(particles);
      absorb(particles);
      destroy(particles);
    }
  }

  //Wrap/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void borders() {

    if (location.x < -r/2) location.x = barEdge+r/2;
    if (location.y < -r/2) location.y = height+r/2;
    if (location.x > barEdge+r/2) location.x = -r/2;
    if (location.y > height+r/2) location.y = -r/2;
  }

  void render() {

    // Draw a triangle rotated in the direction of velocity
    area = PI*r*r;

    strokeWeight(1);
    if ((pause ==false)&&(isFern == true)) {
      stroke(255);
      fill(fern);
      fillColor = color(fern);
    }
    if ((pause ==false)&&(isBlae == true)) {
      stroke(255);
      fill(blae);
      fillColor = color(blae);
    }
    if ((pause ==true)&&(isFern == true)) {
      stroke(255, fade);
      fill(fern, fade);
    }
    if ((pause ==true)&&(isBlae == true)) {
      stroke(255, fade);
      fill(blae, fade);
    }


    pushMatrix();
    translate(location.x, location.y);

    if ((seek>0)||(flock>0)) {
      if ((destroy==0)&&(absorb==0)) {
        //flocking triangles
        float theta = velocity.heading2D() + radians(90);
        rotate(theta);
        beginShape(TRIANGLES);
        vertex(0, -r*2/2);
        vertex(-r/2, r*2/2);
        vertex(r/2, r*2/2);
        endShape();
      }
    }

    if ((destroy>0)&&(absorb>0)) {
      //tear drop
      float theta = velocity.heading2D() - radians(90);
      rotate(theta);
      
      rectMode(CENTER);
      rect(0, 0, r, r, r, r, 0, 0);
      beginShape();
      vertex(r, r/2-1);
      vertex(0, r);
      vertex(-r, r/2-1);
      endShape();
      rectMode(CORNER);
    }

    if ((absorb>0)&&(destroy==0)) {
      if ((seek>0)||(flock>0)) {
        //squashed ellipse
        float theta = velocity.heading2D() + radians(90);
        rotate(theta);
        ellipse(0, 0, r*0.9, r*1.2);
      }
    }

    if ((destroy>0)&&(absorb==0)) {
      //hexagon
      float theta = velocity.heading2D() + radians(90);
      rotate(theta);
      beginShape();
      vertex(0, -r);
      vertex(r*0.9, -r/2);
      vertex(r*0.9, r/2);
      vertex(0, r);
      vertex(-r*0.9, r/2);
      vertex(-r*0.9, -r/2);
      vertex(0, -r);
      endShape();
    }

    if ((absorb>0)&&(seek==0)&&(flock==0)&&(destroy==0)) {
      //ellipse
      ellipse(0, 0, r, r);
    }

    noFill();
    //grav circles
    if (gravOn == 1) {
      noFill();
      strokeWeight(1);
      stroke(crimson, fade);
      ellipse(0, 0, Gneighbordist*2, Gneighbordist*2);
    }
    if (gravColor == 1) {
      noFill();
      strokeWeight(1);
      stroke(fern, fade);
      ellipse(0, 0, Gneighbordist*2, Gneighbordist*2);
    }
    if (gravColor == 2) {
      noFill();
      strokeWeight(1);
      stroke(blae, fade);
      ellipse(0, 0, Gneighbordist*2, Gneighbordist*2);
    }
    popMatrix();
  }



  //Attract/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  PVector cohesion (ArrayList<Major> particles) {


    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Major other : particles) {
      float d = PVector.dist(location, other.location);


      //gravOn
      if ((d > 0)&&(d<other.Gneighbordist)&&(other.gravOn==1)) {
        for (int f = 0; f < int(other.r/r*3); f++) {
          sum.add(other.location); // Add location
          count++;
        }
      }
      if ((d > 0)&&(d<other.Gneighbordist)&&(other.gravColor==1)&&(other.isMajor)&&(isFern==true)) {
        for (int f = 0; f < int(other.r/r*3); f++) {
          sum.add(other.location); // Add location
          count++;
        }
      }
      if ((d > 0)&&(d<other.Gneighbordist)&&(other.gravColor==2)&&(other.isMajor)&&(isBlae==true)) {
        for (int f = 0; f < int(other.r/r*3); f++) {
          sum.add(other.location); // Add location
          count++;
        }
      }

      //        if ((d > 0)&&(seekAll==true)&&(other.isMinor==true)) {
      //          
      //            sum.add(other.location); // Add location
      //            count++;
      //          
      //        }
      if ((d > 0)&&(seekFern==true)&&(other.isFern==true)) {

        sum.add(other.location); // Add location
        count++;
      } 

      if ((d > 0)&&(seekBlae==true)&&(other.isBlae==true)) {

        sum.add(other.location); // Add location
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);

      return seek(sum);  // Steer towards the location
    } 
    else {
      return new PVector(0, 0);
    }
  }




  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void attract(ArrayList<Major> particles) {

    PVector coh = cohesion(particles);
    coh.mult(1.0);
    applyForce(coh);
  }

  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, location);  

    desired.normalize();
    desired.mult(maxspeed);

    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    return steer;
  }

  //seek, apply force, cohesion and attract are based the flocking example by Daniel Shiffman.

  //flock/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList<Major> particles) {
   
      PVector sep = separate(particles);   // Separation
      PVector ali = align(particles);      // Alignment
      PVector coh = flockCohesion(particles);   // Cohesion
      // Arbitrarily weight these forces
      sep.mult(1.5);
      ali.mult(1.0);
      coh.mult(1.0);
      // Add the force vectors to acceleration
      applyForce(sep);
      applyForce(ali);
      applyForce(coh);
    
  }


  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector flockSeek(PVector target) {
    PVector desired = PVector.sub(target, location);  // A vector pointing from the location to the target
    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(flockMaxspeed);
    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(flockMaxforce);  // Limit to maximum steering force
    return steer;
  }


  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList<Major> particles) {
    float desiredseparation;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Major other : particles) {
      float d = PVector.dist(location, other.location);
            if ((d>0)&&(flockFern == true)&&(other.isFern==true)) {
        flockBegin = true;
      }

      if ((d>0)&&(flockBlae == true)&&(other.isBlae==true)) {
        flockBegin = true;
      }
      
      if (flockBegin == true){
      
      desiredseparation = r+other.r*2;
      
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);        // Weight by distance
        steer.add(diff);
        count++;            // Keep track of how many
      }
    }
    flockBegin = false;
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(flockMaxspeed);
      steer.sub(velocity);
      steer.limit(flockMaxforce);
    }
    return steer;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList<Major> particles) {
    float neighbordist = r*5;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Major other : particles) {
       float d = PVector.dist(location, other.location);
                  if ((d>0)&&(flockFern == true)&&(other.isFern==true)) {
        flockBegin = true;
      }

      if ((d>0)&&(flockBlae == true)&&(other.isBlae==true)) {
        flockBegin = true;
      }
      
      if (flockBegin==true){
     
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    }
    flockBegin= false;
    if (count > 0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(flockMaxspeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(flockMaxforce);
      return steer;
    } 
    else {
      return new PVector(0, 0);
    }
  }

  // Cohesion
  // For the average location (i.e. center) of all nearby boids, calculate steering vector towards that location
  PVector flockCohesion (ArrayList<Major> particles) {
    float neighbordist = r*5;
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (Major other : particles) {
            
      float d = PVector.dist(location, other.location);
      if ((d>0)&&(flockFern == true)&&(other.isFern==true)) {
        flockBegin = true;
      }

      if ((d>0)&&(flockBlae == true)&&(other.isBlae==true)) {
        flockBegin = true;
      }
      if (flockBegin == true){
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.location); // Add location
        count++;
      }
    }
    flockBegin = false;
    }
    if (count > 0) {
      sum.div(count);
      return flockSeek(sum);  // Steer towards the location
    } 
    else {
      return new PVector(0, 0);
    }
  }

  //Destroy/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void destroy(ArrayList<Major> particles) {
    for (Major other : particles) {
      float d2 = PVector.dist(location, other.location);
      if ((d2>0)) {
        if ((destroyFern == true)&&(other.isFern==true)) {
          destroyBegin = true;
        }
        if ((destroyBlae == true)&&(other.isBlae==true)) {
          destroyBegin = true;
        }
      }

      if (destroyBegin == true) { 
        float d = PVector.dist(location, other.location);
        if ((d>0)&&(r>=other.r)) {
          if (d<r/2+other.r/2) {
            other.isDead = true;
            ds.addDust(other.location.x, other.location.y, other.r, other.fillColor);
            gNotificationManager.notify(1, gNotification);
          }
        }
      }
      destroyBegin = false;
    }
  }
  //Absorb/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void absorb(ArrayList<Major> particles) {

    for (Major other : particles) {
      float d2 = PVector.dist(location, other.location);
      if ((d2>0)) {
        if ((absorbFern == true)&&(other.isFern==true)) {
          absorbBegin = true;
        }
        if ((absorbBlae == true)&&(other.isBlae==true)) {
          absorbBegin = true;
        }


        if (absorbBegin==true) {
        
          float d = PVector.dist(location, other.location);
          if ((d>0)&&(r>=other.r)) {
            if (d<r/2+other.r/2) {
              float velexc = r-other.r;
              if (velexc > 0) {
                other.velocity.div(velexc);
              }
              PVector velocalc = PVector.sub(velocity, other.velocity);
              velocity.sub(velocalc);
              float newR = sqrt((area+other.area)/PI);
              if (newR>= 100) {
                newR = 100;
              }
              r = newR;
              other.isDead = true;
                player2.start();
            }
          }
        }
      } 
      absorbBegin = false;
    }
  }


  //class end///////////////////////////////////////
}

// Android Multi-Touch written by David Bouchard 
// http://www.deadpixel.ca 




//-------------------------------------------------------------------------------------
// MULTI TOUCH EVENTS!

void onTap( TapEvent event ) {
  if ( event.isSingleTap() ) {

//    ellipse(event.x, event.y, 200, 200);
    TAP = true;
  }  
  if ( event.isDoubleTap() ) {

//    rect(event.x, event.y, 200, 200);
    DOUBLE_TAP = true;
  }
}

//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
void onFlick( FlickEvent event ) {
//  println("FLICK! " + event.velocity.mag() );
  FLICK = true;
}

//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
void onDrag( DragEvent event ) { 
  if (event.numberOfPoints == 1) {
    DRAG = true;    
//    bx += event.dx;
//    by += event.dy;
  }
  else MULTI_DRAG = true;  
}

//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
void onRotate( RotateEvent event ) {
  ROTATE = true;
  pinchR += event.angle;
}

//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
void onPinch( PinchEvent event ) {
  PINCH = true;  
  pinchZ += event.amount * 0.003;
}

//-------------------------------------------------------------------------------------
// This is the stock Android touch event 
boolean surfaceTouchEvent(MotionEvent event) {
  
  // extract the action code & the pointer ID
  int action = event.getAction();
  int code   = action & MotionEvent.ACTION_MASK;
  int index  = action >> MotionEvent.ACTION_POINTER_ID_SHIFT;

  float x = event.getX(index);
  float y = event.getY(index);
  int id  = event.getPointerId(index);

  // pass the events to the TouchProcessor
  if ( code == MotionEvent.ACTION_DOWN || code == MotionEvent.ACTION_POINTER_DOWN) {
    touch.pointDown(x, y, id);
  }
  else if (code == MotionEvent.ACTION_UP || code == MotionEvent.ACTION_POINTER_UP) {
    touch.pointUp(event.getPointerId(index));
  }
  else if ( code == MotionEvent.ACTION_MOVE) {
    int numPointers = event.getPointerCount();
    for (int i=0; i < numPointers; i++) {
      id = event.getPointerId(i);
      x = event.getX(i);
      y = event.getY(i);
      touch.pointMoved(x, y, id);
    }
  } 

  return super.surfaceTouchEvent(event);
}

//-------------------------------------------------------------------------------------
void drawPoints(ArrayList touchPoints) {
  // show each points with their coordinate and ID
  Iterator i = touchPoints.iterator();
  while (i.hasNext ()) {
    TouchPoint p = (TouchPoint)i.next();
    float diameter = 50;
    stroke(0, 255, 0);
    noFill();
    ellipse(p.x, p.y, diameter, diameter);
    fill(0, 255, 0);
    ellipse(p.x, p.y, 8, 8);
    text( ("ID:"+ p.id + " " + int(p.x) + ", " + int(p.y) ), p.x-128, p.y-64);
  }

  // show the centroid of the gesture
  if (touchPoints.size() > 1 ) {
    stroke(255);
    fill(255, 0, 0);
    ellipse(touch.cx, touch.cy, 15, 15);
  }
}

//-------------------------------------------------------------------------------------
void drawLines(ArrayList touchPoints) {
  // draw lines between points and shows the midpoint + distances
  for (int i=0; i < touchPoints.size(); i++) {
    for (int j=0; j < touchPoints.size(); j++) {
      if (i != j) {
        TouchPoint p1 = (TouchPoint)touchPoints.get(i);
        TouchPoint p2 = (TouchPoint)touchPoints.get(j);
        stroke(0, 0, 255);
        line(p1.x, p1.y, p2.x, p2.y);
        float mx = (p2.x - p1.x)/2 + p1.x;
        float my = (p2.y - p1.y)/2 + p1.y;
        fill(255);
        text( dist(p1.x, p1.y, p2.x, p2.y), mx + 20, my);
        stroke(255);
        noFill();
        ellipse(mx, my, 10, 10);
      }
    }
  }
}

// Event classes
///////////////////////////////////////////////////////////////////////////////////
class TouchEvent {
  // empty base class to make event handling easier
}

///////////////////////////////////////////////////////////////////////////////////
class DragEvent extends TouchEvent {

  float x; // position
  float y;
  float dx; // movement 
  float dy; 
  int numberOfPoints;

  DragEvent(float x, float y, float dx, float dy, int n) {
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
    numberOfPoints = n;
  }
}

///////////////////////////////////////////////////////////////////////////////////
class PinchEvent extends TouchEvent {

  float centerX;
  float centerY;
  float amount; // in pixels
  int numberOfPoints;

  PinchEvent(float centerX, float centerY, float amount, int n) {
    this.centerX = centerX;
    this.centerY = centerY;  
    this.amount = amount;
  }
}

///////////////////////////////////////////////////////////////////////////////////
class RotateEvent extends TouchEvent {  

  float centerX;
  float centerY;
  float angle; // delta, in radians
  int numberOfPoints;

  RotateEvent(float centerX, float centerY, float angle, int n) {
    this.centerX = centerX;
    this.centerY = centerY;  
    this.angle = angle;
  }
}


///////////////////////////////////////////////////////////////////////////////////
class TapEvent extends TouchEvent {

  public static final int SINGLE = 0;
  public static final int DOUBLE = 1;

  float x;
  float y;
  int type;

  TapEvent(float x, float y, int type) {
    this.x = x;
    this.y = y;
    this.type = type;
  }  

  boolean isSingleTap() {
    return (type == SINGLE) ? true : false;
  }

  boolean isDoubleTap() {
    return (type == DOUBLE) ? true : false;
  }
}

///////////////////////////////////////////////////////////////////////////////////
class FlickEvent extends TouchEvent { 

  float x;
  float y;
  PVector velocity;

  FlickEvent(float x, float y, PVector velocity) {
    this.x = x; 
    this.y = y;
    this.velocity = velocity;
  }
}

class TouchPoint {
  
  float x;
  float y;
  float px;
  float py;
  int id;
  
  // used for gesture detection
  float angle;
  float oldAngle;  
  float pinch;
  float oldPinch;

  //-------------------------------------------------------------------------------------
  TouchPoint(float x, float y, int id) {
    this.x = x;
    this.y = y;
    this.px = x;
    this.py = y;
    this.id = id;  
  }

  //-------------------------------------------------------------------------------------
  void update(float x, float y) {
    px = this.x;
    py = this.y;
    this.x = x;
    this.y = y;
  }

  //-------------------------------------------------------------------------------------
  void initGestureData(float cx, float cy) {  
    pinch = oldPinch = dist(x, y, cx, cy);
    angle = oldAngle = atan2( (y-cy), (x-cx) );
  }
 
  //-------------------------------------------------------------------------------------
  // delta x -- int to get rid of some noise
  int dx() {
    return int(x - px);
  }
  
  //-------------------------------------------------------------------------------------
  // delta y -- int to get rid of some noise
  int dy() {
    return int(y - py);
  } 
  
  //-------------------------------------------------------------------------------------
  void setAngle(float angle) {
    oldAngle = this.angle;  
    this.angle = angle;
  }
  
  //-------------------------------------------------------------------------------------
  void setPinch(float pinch) {
     oldPinch = this.pinch;
     this.pinch = pinch; 
  }

}

// TODO: make distance thershold based on pixel density information!

class TouchProcessor {

  // heuristic constants 
  long  TAP_INTERVAL = 200;
  long  TAP_TIMEOUT  = 200;
  int   DOUBLE_TAP_DIST_THRESHOLD = 30;
  int   FLICK_VELOCITY_THRESHOLD = 20;
  float MAX_MULTI_DRAG_DISTANCE = 100; // from the centroid

  // A list of currently active touch points 
  ArrayList touchPoints;

  // Used for tap/doubletaps 
  TouchPoint firstTap;
  TouchPoint secondTap;
  long tap;
  int tapCount = 0;

  // Events to be broadcast to the sketch 
  ArrayList events;

  // centroid information
  float cx, cy;
  float old_cx, old_cy;
  
  boolean pointsChanged = false;

  //-------------------------------------------------------------------------------------
  TouchProcessor() {
    touchPoints = new ArrayList();
    events = new ArrayList();
  }

  //-------------------------------------------------------------------------------------
  // Point Update functions 
  synchronized void pointDown(float x, float y, int id) {    
    TouchPoint p = new TouchPoint(x, y, id);
    touchPoints.add(p);  
    
    updateCentroid();
    if ( touchPoints.size() >= 2) {
      p.initGestureData(cx, cy);
      if (touchPoints.size() == 2) {
        // if this is the second point, we now have a valid centroid to update the first point
        TouchPoint frst = (TouchPoint)touchPoints.get(0);
        frst.initGestureData(cx, cy);
      }
    }

    // tap detection 
    if (tapCount == 0) {
      firstTap = p;
    }
    if (tapCount == 1) {
      secondTap = p;
    }
    tap = millis();
    pointsChanged = true;
  }

  //-------------------------------------------------------------------------------------
  synchronized void pointUp(int id) {
    TouchPoint p = getPoint(id);
    touchPoints.remove(p);

    // tap detection 
    // TODO: handle a long press event here? 
    if ( p == firstTap || p == secondTap ) {
      // this could be either a Tap or a Flick gesture, based on movement 
      float d = dist(p.x, p.y, p.px, p.py);
      if ( d > FLICK_VELOCITY_THRESHOLD ) {
        FlickEvent event = new FlickEvent(p.px, p.py, new PVector(p.x-p.px, p.y-p.py));
        events.add(event);
      }
      else {      
        long interval = millis() - tap;
        if ( interval < TAP_INTERVAL ) {
          tapCount++;
        }
      }
    }
    pointsChanged = true;
  }

  //-------------------------------------------------------------------------------------
  synchronized void pointMoved(float x, float y, int id) {
    TouchPoint p = getPoint(id);
    p.update(x, y);
    // since the events will be in sync with draw(), we just wait until analyse() to
    // look for gestures
    pointsChanged = true;
  }

  //-------------------------------------------------------------------------------------
  // Calculate the centroid of all active points 
  void updateCentroid() {
    old_cx = cx;
    old_cy = cy;
    cx = 0;
    cy = 0;
    for (int i=0; i < touchPoints.size(); i++) {
      TouchPoint p = (TouchPoint)touchPoints.get(i);
      cx += p.x;
      cy += p.y;
    }
    cx /= touchPoints.size();
    cy /= touchPoints.size(); 
  }

  //-------------------------------------------------------------------------------------
  synchronized void analyse() {
    handleTaps();
    // simple event priority rule: do not try to rotate or pinch while dragging
    // this gets rid of a lot of jittery events 
    if (pointsChanged) {
      updateCentroid();
      if (handleDrag() == false) {
        handleRotation();
        handlePinch();
      }
      pointsChanged = false;
    }
  }


  //-------------------------------------------------------------------------------------
  // send events to the sketch
  void sendEvents() {
    for (int i=0; i < events.size(); i++) {
      TouchEvent e = (TouchEvent)events.get(i);
      if      ( e instanceof TapEvent ) onTap( (TapEvent)e );
      else if ( e instanceof FlickEvent ) onFlick( (FlickEvent)e );
      else if ( e instanceof DragEvent ) onDrag( (DragEvent)e );
      else if ( e instanceof PinchEvent ) onPinch( (PinchEvent)e );
      else if ( e instanceof RotateEvent ) onRotate( (RotateEvent)e );
    }
    events.clear();
  }

  //-------------------------------------------------------------------------------------
  void handleTaps() {
    if (tapCount == 2) {
      // check if the tap point has moved 
      float d = dist(firstTap.x, firstTap.y, secondTap.x, secondTap.y);
      if ( d > DOUBLE_TAP_DIST_THRESHOLD ) {
        // if the two taps are apart, count them as two single taps
        TapEvent event1 = new TapEvent(firstTap.x, firstTap.y, TapEvent.SINGLE);        
        onTap(event1);
        TapEvent event2 = new TapEvent(secondTap.x, secondTap.y, TapEvent.SINGLE);        
        onTap(event2);
      }
      else {
        events.add( new TapEvent(firstTap.x, firstTap.y, TapEvent.DOUBLE) );
      }
      tapCount = 0;
    }
    else if (tapCount == 1) { 
      long interval = millis() - tap;
      if (interval > TAP_TIMEOUT) {
        events.add( new TapEvent(firstTap.x, firstTap.y, TapEvent.SINGLE) );               
        tapCount = 0;
      }
    }
  }

  //-------------------------------------------------------------------------------------
  // rotation is the average angle change between each point and the centroid 
  void handleRotation() {
    if (touchPoints.size() < 2) return;
    // look for rotation events
    float rotation = 0;
    for (int i=0; i < touchPoints.size(); i++) {
      TouchPoint p = (TouchPoint)touchPoints.get(i);
      float angle = atan2( p.y-cy, p.x-cx );
      p.setAngle(angle);
      float delta = p.angle - p.oldAngle;
      if ( delta > PI ) delta -= TWO_PI;
      if ( delta < -PI ) delta += TWO_PI;
      rotation += delta;
    } 
    rotation /= touchPoints.size() ;
    if ( rotation != 0 ) events.add( new RotateEvent(cx, cy, rotation, touchPoints.size()) );
  }

  //-------------------------------------------------------------------------------------
  // pinch is simply the average distance change from each points to the centroid
  void handlePinch() {
    if (touchPoints.size() < 2) return;
    // look for pinch events 
    float pinch = 0;
    for (int i=0; i < touchPoints.size(); i++) {
      TouchPoint p = (TouchPoint)touchPoints.get(i);
      float distance = dist(p.x, p.y, cx, cy);
      p.setPinch(distance);
      float delta = p.pinch - p.oldPinch;
      pinch += delta;
    }
    pinch /= touchPoints.size(); 
    if (pinch != 0) events.add( new PinchEvent(cx, cy, pinch, touchPoints.size()) );
  }

  //-------------------------------------------------------------------------------------
  boolean handleDrag() {
    // look for multi-finger drag events
    // multi-drag is defined as all the fingers moving close-ish together in the same direction
    boolean x_drag = true;
    boolean y_drag = true;
    boolean clustered = false;
    int first_x_dir = 0;
    int first_y_dir = 0;

    for (int i=0; i < touchPoints.size(); i++) {
      TouchPoint p = (TouchPoint)touchPoints.get(i);
      int x_dir = 0;
      int y_dir = 0;
      if (p.dx() > 0) x_dir = 1;
      if (p.dx() < 0) x_dir = -1;
      if (p.dy() > 0) y_dir = 1;
      if (p.dy() < 0) y_dir = -1;

      if (i==0) {
        first_x_dir = x_dir;
        first_y_dir = y_dir;
      }
      else {
        if (first_x_dir != x_dir) x_drag = false;
        if (first_y_dir != y_dir) y_drag = false;
      }

      // if the point is stationary 
      if (x_dir == 0) x_drag = false;
      if (y_dir == 0) y_drag = false;
      
      if (touchPoints.size() == 1) clustered = true;
      else {
        float distance = dist(p.x, p.y, cx, cy);
        if ( distance < MAX_MULTI_DRAG_DISTANCE ) {
          clustered = true;
        }
      }
    }

    if ((x_drag || y_drag) && clustered) {
      if (touchPoints.size() == 1) {
        TouchPoint p = (TouchPoint)touchPoints.get(0);
        // use the centroid to calculate the position and delta of this drag event
        events.add(new DragEvent(p.x, p.y, p.dx(), p.dy(), 1));
      }
      else {  
        // use the centroid to calculate the position and delta of this drag event
        events.add(new DragEvent(cx, cy, cx-old_cx, cy-old_cy, touchPoints.size()));
      }
      return true;
    }
    return false;
  }

  //-------------------------------------------------------------------------------------
  synchronized ArrayList getPoints() {
    return (ArrayList)touchPoints.clone();
  }

  //-------------------------------------------------------------------------------------
  synchronized TouchPoint getPoint(int pid) {
    Iterator i = touchPoints.iterator();
    while (i.hasNext ()) {
      TouchPoint tp = (TouchPoint)i.next();
      if (tp.id == pid) return tp;
    }
    return null;
  }
 
}



// The System (a list of Major objects)

class System {
  ArrayList<Major> particles; // An ArrayList for all the particles

    System() {
    particles = new ArrayList<Major>(); // Initialize the ArrayList

  }

  void run() {
    println("run: "+removeAll);
    for (int i = 0; i < particles.size(); i++) {
      Major m = (Major) particles.get(i);
          m.run(particles);
      
      if (m.createMinors == true){
      creator(m.createLoc.x, m.createLoc.y, m.createVel.x, m.createVel.y, m.newColor, m.CSeek, m.CFlock, m.CAbsorb, m.CDestroy);
      }  
    }

      remove();
      REMOVEALL();
// if(planetExampleLaunch==true){
//
// }   
    
    
    if(Grelease == true){
//println("system "+ GinitialX);
creator(GmouseX, GmouseY, GnewVelX, GnewVelY, 0, GSeek, GFlock, GAbsorb, GDestroy);
    }
       if(Brelease == true){
//println("system "+ GinitialX);
creator(mouseX, mouseY, BnewVelX, BnewVelY, 1, BSeek, BFlock, BAbsorb, BDestroy);
    }
    
    if(orbitsTap == true){
      for (int i = 0; i <= 20; i++){
      creator(random(width), random(height), random(-1,1), random(-1,1), 0, GSeek, GFlock, GAbsorb, GDestroy);
      }
    }
        if(flocksTap == true){
      for (int i = 0; i <= 20; i++){
      creator(random(width), random(height), random(-1,1), random(-1,1), 0, 0, 1,0, 0);
      }
    }
   
   
  }
void creator(float x, float y, float w, float q, float c, float fl, float at, float ab,  float de){
  if (particles.size()<maxParticles){
particles.add(new Minor(x, y, w, q, c, fl, at, ab, de));
  }
}  
    void REMOVEALL(){
      println(removeAll);
      if (removeAll == true){
     for (int i = particles.size()-1; i >= 0; i--) {
      particles.remove(i);
     } 
      }
           removeAll = false;
    }
 

  void remove() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Major p = (Major) particles.get(i);
      if (p.isDead==true) {
        anyMenuOn=false;
        particles.remove(i);
        pause = false;
        
      }
    }
  }

  void addMajor(Major b) {
    if (particles.size()<maxParticles){
    particles.add(b);
    }
  }
  void addMinor(Minor b) {
    if (particles.size()<maxParticles){
    particles.add(b);
    }
  }
}


// Imports:
import android.content.Context;
import android.app.Notification;
import android.app.NotificationManager;

// Setup vibration globals:
NotificationManager gNotificationManager;
Notification gNotification;
long[] gVibrate = {0,50,0,0,0,0};

//-----------------------------------------------------------------------------------------
// Override the parent (super) Activity class:
// States onCreate(), onStart(), and onStop() aren't called by the sketch.  Processing is entered
// at the 'onResume()' state, and exits at the 'onPause()' state, so just override them as needed:

void onResume() {
  super.onResume();
  // Create our Notification Manager:
  gNotificationManager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
  // Create our Notification that will do the vibration:
  gNotification = new Notification();
  // Set the vibration:
  gNotification.vibrate = gVibrate;
}

//-----------------------------------------------------------------------------------------
// Override the parent (super) SurfaceView class to detect for touch events:



