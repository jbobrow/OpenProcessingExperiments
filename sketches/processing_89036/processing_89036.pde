
//    _____ _           ___                 ___                
//   |_   _| |_  ___   / __|_ _ ___ _ _    / __|__ _ _ __  ___ 
//     | | | ' \/ -_) | (_ | '_/ -_) ' \  | (_ / _` | '  \/ -_)
//     |_| |_||_\___|  \___|_| \___|_||_|  \___\____|_|_|_\___|
//                                                             


//----------------------------------------------------------------------------------
//Globala
//----------------------------------------------------------------------------------
// Bilder
/* @pjs preload="rubrik.png, start.png, nuke.png, bakgrund.png, stad.png, berg.png, tree.png, mark.png, mist.png,
   gren1.png, gren4.png, gren5.png, fireball.png, muzzleflash.png, heart.png, heart2.png,
   gren_0000.png, gren_0001.png, gren_0002.png, gren_0003.png, gren_0004.png, gren_0005.png, gren_0006.png, gren_0007.png, gren_0008.png, gren_0009.png,
   alien1_0000.png, alien1_0001.png, alien1_0002.png, alien1_0003.png, alien1_0004.png, alien1_0005.png, alien1_0006.png, alien1_0007.png, alien1_0008.png, alien1_0009.png,
   alien2_0000.png, alien2_0001.png, alien2_0002.png, alien2_0003.png, alien2_0004.png, alien2_0005.png, alien2_0006.png, alien2_0007.png, alien2_0008.png, alien2_0009.png, alien2_0010.png, 
   alien2_0011.png, alien2_0012.png, alien2_0013.png, alien2_0014.png, alien2_0015.png, alien2_0016.png, alien2_0017.png, alien2_0018.png",
   plasma.png, alienCar.png;  */
/* @pjs font="PressStart2P.ttf"; */
PImage rubrikImg, startImg, nukeImg;                               // Startmeny
PImage bakgrundImg, stadImg, bergImg, treeImg, markImg, mistImg;   // Världen
PImage gren1Img, gren4Img, gren5Img;                               // Gren
PImage fireballImg, muzzleflashImg;                                // Gren vapen
PImage heartImg, heart2Img;                                        // Stats
PImage plasmaImg, alienCarImg;                                     // Fiende
 
// Startmeny var
float rubrikX = 100,    rubrikY = -100;
float startX = 300,     startY = -100;
float nukeX = 0,        nukeY = 500;
float nukeSizeX = 800,  nukeSizeY = 0; 
float text1X = 20,      text1Y = 250;
float text2X = 450,     text2Y = 250;
float text1A = 0,       text2A = 0;
int inBlackScreenA =  255;
int utBlackScreenA =  255;
int whiteScreenA =    0;
int startColor =      400;
boolean frysGren  =      false;
boolean animation =      true;
boolean outroAnimation = false;

// Bakgrund var
float stadX = 500,  stadY = 16;
float bergX = 600,  bergY = 12;
float treeX = 1000, treeY = 210;
float markX = -100, markY = 0;
float mistX = 3000, mistY = 0;

// Gren var
Animation grenAni;
float grenX = -200,    grenY = 170;
float grenSizeX = 143, grenSizeY = 300;
float grenSize2X = 161, grenSize2Y = 300;
float grenSpeed = 4;
float tempJump = grenY;
int grenAniDelay = 30;
int grenImgState = 0;
int jumpDelay = 400;
int lastJumpMillis = 0;
int millisJump = 0;
boolean grenJump = false;
boolean grenDuck = false;
boolean grenHitt = false;
boolean grenDead = false;

// Gren vapen var
float fireballX,         fireballY;
float fireballSizeX = 85,fireballSizeY = 64;
boolean hitt = false;
boolean fireballActiv = false;
int fireRate = 400;
int lastFireMillis = 0;
float muzzleflashX, muzzleflashY;
float muzzleflashSizeX = 130, muzzleflashSizeY = 100;

// Stats var
float heartX = 30, heartY = 30;
float heartSizeX = 20, heartSizeY = 20;
int score = 0;
int grenLiv = 5;
int grenGrundLiv = grenLiv;


// Fiende var
int fiendeType = 1;
float alienX = 6000, alienY = 170;
float plasmaX = -400, plasmaY = 210;
int alienFireDelay = 0;
int alien1AniDelay = 40;
int alien2AniDelay = 100;
int alienLiv = 5;
boolean alienHitt = false;
float alienCarSpeed = 1.2;
float alienCarX = 9999, alienCarY = 150;


// Keys
boolean space = false;
boolean up    = false;
boolean down  = false;
boolean left  = false;
boolean right = false;

// Övriga var
int frames = 60;
float fpsComp = 1;
float grenSpeedConst = grenSpeed;
boolean play = false;
boolean animation = true;


//----------------------------------------------------------------------------------
// Setup
//----------------------------------------------------------------------------------
void setup() {
  size(800,500);
  frameRate(frames);
  smooth();
  noStroke();
  textFont(createFont("PressStart2P",10));
  
  // Gör animation
  grenAni  =  new Animation("gren_", 10);
  alien1Ani = new Animation("alien1_", 10);
  alien2Ani = new Animation("alien2_", 19);
  
  // Particlesystem
  ps = new ParticleSystem(new PVector(400,200));
  
  // Läsin bilder
  rubrikImg      = loadImage("rubrik.png");
  startImg       = loadImage("start.png");
  nukeImg        = loadImage("nuke.png");
  bakgrundImg    = loadImage("bakgrund.png");
  stadImg        = loadImage("stad.png");
  bergImg        = loadImage("berg.png");
  treeImg        = loadImage("tree.png");
  markImg        = loadImage("mark.png");
  mistImg        = loadImage("mist.png");
  gren1Img       = loadImage("gren1.png");
  gren4Img       = loadImage("gren4.png");
  gren5Img       = loadImage("gren5.png");
  fireballImg    = loadImage("fireball.png");
  muzzleflashImg = loadImage("muzzleflash.png");
  heartImg       = loadImage("heart.png");
  heart2Img      = loadImage("heart2.png");
  plasmaImg      = loadImage("plasma.png");
  alienCarImg    = loadImage("alienCar.png");
}


//----------------------------------------------------------------------------------
//Startmeny
//----------------------------------------------------------------------------------
void startmeny() {
  image(rubrikImg, rubrikX, rubrikY);
  if (startColor>=0) {
    startColor-=9*fpsComp;
  } else if (startColor<400) {
    startColor=400;
  }
  tint(255, startColor);
  image(startImg, startX, startY);
  noTint();
  
  if (inBlackScreenA >= 0) {
    fill(0, 0, 0, inBlackScreenA);
    rect(0, 0, 800, 500);
    inBlackScreenA-=((6/grenSpeed)*grenSpeed);
    
  } else if (grenX<=330) {
    grenX+=grenSpeed; 
    
  } else if ((animation == true) && (outroAnimation == false)) {
    frysGren = true;
    animation = false;
    
  } else if (rubrikY <= 25) {
    rubrikY+=1*fpsComp; 
    
  } else if (text1A <= 255) {
    fill(255, 255, 255, text1A);
    text("VOLVO HAS BEEN INVADED BY ALIENS.", text1X, text1Y);
    text1A+=2*fpsComp;
    
  } else if (text2A <= 255) {
    fill(255, 255, 255, text1A);
    text("VOLVO HAS BEEN INVADED BY ALIENS.", text1X, text1Y);
    fill(255, 255, 255, text2A);
    text("ARE YOU BAD ENOUGH TO STOP THEM?", text2X, text2Y);
    text2A+=2*fpsComp;
    
  } else if (whiteScreenA <= 355) { 
    fill(255, 255, 255, whiteScreenA);
    rect(0, 0, 800, 500);
    whiteScreenA+=10*fpsComp;
    
  } else if (nukeSizeY <= 500) {
    nukeSizeX=800;
    nukeY-=36*fpsComp;
    nukeSizeY+=40*fpsComp;
    
  } else if (startY <= 120) {
    startY+=1*fpsComp;
    
  } else if (outroAnimation == false) {
    if ((mousePressed) && (mouseX > startX) && (mouseX < startX+200) && (mouseY > startY) && (mouseY < startY+70)) {
      outroAnimation = true;
    }
    
  } else {
    animation = true;
    frysGren = false;
    if (grenX<=850) {
      grenX+=grenSpeed;
    } else if (utBlackScreenA >= 0) {
      bakgrund();
      fill(0, 0, 0, utBlackScreenA);
      rect(0, 0, 800, 500);
      utBlackScreenA-=2*fpsComp;
    } else {
      nukeY = 500;
      grenX = 0;
      play = true;
      animation = false;
    }
  }
}


//----------------------------------------------------------------------------------
//Rita världen
//----------------------------------------------------------------------------------
void bakgrund() {
  // bakgrunds bild
  background(bakgrundImg);
  
  // Stad
  if (stadX<=-stadX-4000) {
    stadX = random(1000, 2500);
  }
  image(stadImg, stadX, stadY);
  
  // Berg
  if (bergX<=-bergX-4000) {
    bergX = random(1000, 2500);
  }
  image(bergImg, bergX, bergY);
  
  // Träd
  if (treeX<=-500) {
    treeX = random(1000, 2000);
  }
  image(treeImg, treeX, treeY);
  
  // Markloop och hastigheter
  if ((grenX >= 200) && (right == true) && (frysGren == false) && (grenDuck == false) && (grenX <= alienX-30)) {
    markX-=grenSpeed;
    treeX-=0.2*grenSpeed;
    stadX-=0.1*grenSpeed;
    bergX-=0.15*grenSpeed;
    alienCarX-=0.5*grenSpeed;
    if (alienX > 1000) {
      alienX-=2*grenSpeed;
    } else if (alienX < 400) {
      alienX-=grenSpeed;
    }
  }
  if (markX <= -1500) {
    image(markImg, markX+2000, markY);
  }
  if (markX <= -2460) {
    markX = -460;
  }
  
  if (play == false) {
    image(nukeImg, nukeX, nukeY, nukeSizeX, nukeSizeY);  
  }
  image(markImg, markX, markY);
  
}

//----------------------------------------------------------------------------------
//Efx
//----------------------------------------------------------------------------------
void efx() {
  // Mist
  if (mistX<=-4000) {
    mistX = random(3000, 6000);
  }
  //image(mistImg, mistX, mistY);
}
//----------------------------------------------------------------------------------
//Rita Gren
//----------------------------------------------------------------------------------
void gren() {
  if ((frysGren == false) || (animation == true) || (grenJump == true) || (grenDuck == true)) {
    // Vänster
    if ((grenX >= -20) && (animation == false) && (left == true) && (grenDuck == false)) {
      grenX-=grenSpeed;
    // Höger
    } else if ((grenX < 250) && (animation == false) && (right == true) && (grenDuck == false) && (grenX <= alienX-30)) {
      grenX+=grenSpeed;
    // Ducka
    } else if ((animation == false) && (down == true) && (grenJump == false)) {
      grenDuck = true;
      image(gren4Img, grenX, grenY+50, grenSize2X, grenSize2Y);
    } else {
      grenDuck = false;
    }
    // Hoppa
    if ((animation == false) && (up == true) && (millis() > (lastJumpMillis+jumpDelay)) || (grenJump == true) && (grenDuck == false)) {
      grenJump = true;
     if (grenY >= 80) {
        image(gren5Img, grenX, grenY, grenSizeX, grenSizeY);
        grenY-=2*grenSpeed;
        if (grenY <=80) {
          tempJump = grenY;
        }
      } else if (tempJump<= 170) {
        image(gren5Img, grenX, tempJump, grenSizeX, grenSizeY);
        tempJump+=2*grenSpeed;
        if (tempJump>=170) {
          grenY = tempJump;
          grenJump = false;
        }
      } else {
        grenY = 170;
        image(gren5Img, grenX, grenY, grenSizeX, grenSizeY);
      }
      lastJumpMillis = millis();
    } else if ((((left == true) || (right == true)) && (grenDuck == false) && (animation == false && (grenJump == false) && (keyPressed == true))) || (animation == true)) {
      grenAni.display(grenAniDelay, grenX, grenY, grenSizeX, grenSizeY);
    } else if ((grenDuck == false)) {
      image(gren1Img, grenX, grenY, grenSizeX, grenSizeY);
    }
  } else {
    image(gren1Img, grenX, grenY, grenSizeX, grenSizeY);   
  }
}


//----------------------------------------------------------------------------------
//Grensvapen + träffkoll
//----------------------------------------------------------------------------------
void grenVapen() {
  if ((play == true) && (space == true) && (millis() > (lastFireMillis+fireRate))) {
    if (grenY >= 170) {
      if (down == true) {
          muzzleflashX = grenX+128;
          muzzleflashY = grenY+110;
          fireballX = grenX+80;
          fireballY = grenY+120;
      } else {
          muzzleflashX = grenX+118;
          muzzleflashY = grenY+63;
          fireballX = grenX+80;
          fireballY = grenY+76;
      } 
      lastFireMillis = millis();
      fireballActiv = true;
      muzzleflashSizeX = 1;
    } else if (grenY <= 80) {
      muzzleflashX = grenX+118;
      muzzleflashY = grenY+93;
      fireballX = grenX+80;
      fireballY = grenY+106;
      lastFireMillis = millis();
      fireballActiv = true;
      muzzleflashSizeX = 1;
    }  
  }
  if ((fireballX <= 800) && (fireballActiv == true)) { 
    image(fireballImg, fireballX, fireballY, fireballSizeX, fireballSizeX);
    fireballX+=16*fpsComp;
    if(fireballX >= alienX) {
      fireballX = -200;
      fireballActiv = false;
      alienHitt = true;
    } 
  } else {
    fireballX = -200;
    fireballActiv = false;
  }
  if (muzzleflashSizeX < 170) {
    image(muzzleflashImg, muzzleflashX, muzzleflashY, muzzleflashSizeX, muzzleflashSizeY);
    muzzleflashSizeX+=20*fpsComp; 
  }
}

//----------------------------------------------------------------------------------
//Gren liv och score
//----------------------------------------------------------------------------------
void stats() {
  for(int j=0; j<grenGrundLiv; j++) {
   image(heart2Img, heartX+j*15, heartY, heartSizeX, heartSizeY);
  }
  for(int i=0; i<grenLiv; i++) {
    image(heartImg, heartX+i*15, heartY, heartSizeX, heartSizeY); 
  }
  fill(230);
  text(score*10, 35, 63); 
}

//----------------------------------------------------------------------------------
//Gren träffad/dör
//----------------------------------------------------------------------------------
void grenDying() {
  if (grenHitt == true) {
    grenLiv--;
    grenHitt = false;
  }
  if (grenLiv <= 0) {
      
  }  
  
}


//----------------------------------------------------------------------------------
//Rita fiende
//----------------------------------------------------------------------------------
void fiende() { 
  if ((alienX <= -400) || (alienCarX < -600)) {
    alienLiv = 0;
  }

  if (fiendeType == 1) {
    if ((alienX <= 1000) && (alienX>=400)) {
      alienX-=1.2*grenSpeed;
      alien1Ani.display(alien1AniDelay, alienX, alienY); 
    } else if (alienX <= 1000) {
      alien2Ani.display(alien2AniDelay, alienX, alienY);
    }
    fill(150, 150, 200, 90);
    rect(alienX+110, alienY-20, 45, 3, 8);
    fill(220, 53, 53);
    rect(alienX+110, alienY-20, alienLiv*(45/5), 3, 8);
 
  } else if (fiendeType == 2) {
    if (alienCarX <= 1000) {
       alienCarX-=alienCarSpeed*grenSpeed;
       image(alienCarImg, alienCarX, alienCarY);
    }
    fill(150, 150, 200, 90);
    rect(alienCarX+130, alienCarY+100, 45, 3, 8);
    fill(220, 53, 53);
    rect(alienCarX+130, alienCarY+100, alienLiv*(45/5), 3, 8);
  }
}


//----------------------------------------------------------------------------------
//Fiendevapen + träffkoll
//----------------------------------------------------------------------------------
void fiendVapen() {
  if (fiendeType == 1) {
    if (alien2Ani.getFrame() == 14) {
      plasmaX = alienX-40;
    }
    if ((alienX<=400) || (plasmaX <= 800) && (plasmaX >=-200)) {
      plasmaX-=20*fpsComp;
      image(plasmaImg, plasmaX, plasmaY);
      if ((plasmaX >= grenX-100) && (plasmaX <= grenX+30) && (down == false)) {
        grenHitt = true;
        plasmaX = -400;
      }
    }
  } else if (fiendeType == 1) {
     if ((alienCarX+50 <= grenX) && (alienCarX+460 >= grenX) && (alienCarY-200 <= grenY) && (grenJump == false)) {
       grenHitt = true;
     }
  }
}

//----------------------------------------------------------------------------------
//Fiende träffad/dör
//----------------------------------------------------------------------------------
void fiendeDying() {
  if (alienHitt == true) {
    alienLiv--;
    alienHitt = false;
  }
  if (alienLiv <= 0) {
     if (fiendeType == 1) {
      ps = new ParticleSystem(new PVector(alienX+50, alienY+120));
      for(int i=0; i<100; i++) {
        ps.addParticle(); 
      }
     }
    alienX = 9999;
    alienCarX = 9999;
    alienLiv = 5;
    score++; 
    fiendeType = int(random(1,3));
    
    if (fiendeType == 1) {
      alienX = random(1300,4000);
    } else if (fiendeType == 2) {
      alienCarX = random(2000,4000);
    }
  }
}


//----------------------------------------------------------------------------------
//Highscore
//----------------------------------------------------------------------------------
void highscore() {
  
}


//----------------------------------------------------------------------------------
//Läsa tangenter 
//----------------------------------------------------------------------------------
void keyPressed() {
  if(keyCode == ' '  ) space = true;
  if(keyCode == UP   ) up    = true;
  if(keyCode == DOWN ) down  = true;
  if(keyCode == LEFT ) left  = true;
  if(keyCode == RIGHT) right = true;
}

void keyReleased() {
  if(keyCode == ' '  ) space = false;
  if(keyCode == UP   ) up    = false;
  if(keyCode == DOWN ) down  = false;
  if(keyCode == LEFT ) left  = false;
  if(keyCode == RIGHT) right = false;
}


//----------------------------------------------------------------------------------
//Draw/Gameloop
//----------------------------------------------------------------------------------
void draw() {
   //fpsComp
  fpsComp = frames/frameRate;
  grenSpeed = grenSpeedConst*fpsComp;
  
  bakgrund();
  fiendVapen();
  gren();
  grenVapen();
  fiende();
  grenDying();
  fiendeDying();
  efx();
  //if (ps.isDead() == false) {
    ps.run(); 
  //}
  if (play == false) {
    startmeny();
  } else {
    stats();
  } 
  
  // Debug
  text(frameRate, 700, 20);
  //text(fiendeType, 600, 20);
  //text(fpsComp, 500, 20);
  //text(alienX, 400, 20);
  //text(alienCarX,300, 20);
  //text(ps.isDead(),200, 20);
}













//----------------------------------------------------------------------------------
//Class för animation
//----------------------------------------------------------------------------------
class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  int lastMillis = 0;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + nf(i, 4) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(int delay, float xpos, float ypos, float xsize, float ysize) {
    if ((lastMillis == 0) || millis() > (lastMillis+delay)) {
      frame = (frame+1) % imageCount;
      lastMillis= millis();
    }
    if ((xsize == 0) && (ysize == 0)) {
      image(images[frame], xpos, ypos);
    } else {
      image(images[frame], xpos, ypos, xsize, ysize);
    }
  }
  
  int getFrame() {
    return frame; 
  }
}
// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan = 255.0;

  Particle(PVector l) {
    acceleration = new PVector(0,0.08);
    velocity = new PVector(random(-5,5),random(-8,0));
    location = l.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    fill(175, 20, 20, lifespan);
    ellipse(location.x,location.y,6,6);
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void run() {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove(); 
      }
    }
  }
}


