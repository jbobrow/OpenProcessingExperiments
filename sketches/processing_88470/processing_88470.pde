
//    _____ _           ___                 ___                
//   |_   _| |_  ___   / __|_ _ ___ _ _    / __|__ _ _ __  ___ 
//     | | | ' \/ -_) | (_ | '_/ -_) ' \  | (_ / _` | '  \/ -_)
//     |_| |_||_\___|  \___|_| \___|_||_|  \___\____|_|_|_\___|
//                                                             


//----------------------------------------------------------------------------------
//Globala
//----------------------------------------------------------------------------------
// Bilder
/* @pjs preload="rubrik.png, start.png, nuke.png, bakgrund.png, stad.png, berg.png, tree.png, mark.png,
   gren1.png, gren4.png, gren5.png, fireball.png, muzzleflash.png, heart.png,
   gren_0000.png, gren_0001.png, gren_0002.png, gren_0003.png, gren_0004.png, gren_0005.png, gren_0006.png, gren_0007.png, gren_0008.png, gren_0009.png,
   alien1_0000.png, alien1_0001.png, alien1_0002.png, alien1_0003.png, alien1_0004.png, alien1_0005.png, alien1_0006.png, alien1_0007.png, alien1_0008.png, alien1_0009.png,
   alien2_0000.png, alien2_0001.png, alien2_0002.png, alien2_0003.png, alien2_0004.png, alien2_0005.png, alien2_0006.png, alien2_0007.png, alien2_0008.png, alien2_0009.png, alien2_0010.png, 
   alien2_0011.png, alien2_0012.png, alien2_0013.png, alien2_0014.png, alien2_0015.png, alien2_0016.png, alien2_0017.png, alien2_0018.png",
   plasma.png;  */
/* @pjs font="PressStart2P.ttf"; */
PImage rubrikImg, startImg, nukeImg;                      // Startmeny
PImage bakgrundImg, stadImg, bergImg, treeImg, markImg;   // Världen
PImage gren1Img, gren4Img, gren5Img;                      // Gren
PImage fireballImg, muzzleflashImg;                       // Gren vapen
PImage heartImg;                                          // Stats
PImage plasmaImg;                                         // Fiende
 
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

// Gren var
Animation grenAni;
float grenX = -500,    grenY = 170;
float grenSizeX = 143, grenSizeY = 300;
float grenSize2X = 161, grenSize2Y = 300;
float grenSpeed = 4;
float tempJump = grenY;
int grenAniDelay = 40;
int grenImgState = 0;
boolean grenJump = false;
boolean grenDuck = false;
boolean grenHitt = false;
boolean grenDead = false;

// Gren vapen var
float fireballX,         fireballY;
float fireballSizeX = 85,fireballSizeY = 64;
boolean hitt = false;
boolean fireballActiv = false;
float muzzleflashX, muzzleflashY;
float muzzleflashSizeX = 130, muzzleflashSizeY = 100;

// Stats var
float heartX = 30, heartY = 30;
float heartSizeX = 20, heartSizeY = 20;
int score = 0;
int grenLiv = 5;
int grenGrundLiv = grenLiv;


// Fiende var
float alienX = 6000, alienY = 170;
float plasmaX = -400, plasmaY = 210;
int alienFireDelay = 0;
int alien1AniDelay = 40;
int alien2AniDelay = 100;
int alienLiv = 5;
boolean alienHitt = false;

// Keys
boolean space = false;
boolean up    = false;
boolean down  = false;
boolean left  = false;
boolean right = false;

// Övriga var
int frames = 60;
float fpsComp = 1;
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
  
  // Läsin bilder
  rubrikImg      = loadImage("rubrik.png");
  startImg       = loadImage("start.png");
  nukeImg        = loadImage("nuke.png");
  bakgrundImg    = loadImage("bakgrund.png");
  stadImg        = loadImage("stad.png");
  bergImg        = loadImage("berg.png");
  treeImg        = loadImage("tree.png");
  markImg        = loadImage("mark.png");
  gren1Img       = loadImage("gren1.png");
  gren4Img       = loadImage("gren4.png");
  gren5Img       = loadImage("gren5.png");
  fireballImg    = loadImage("fireball.png");
  muzzleflashImg = loadImage("muzzleflash.png");
  heartImg       = loadImage("heart.png");
  plasmaImg      = loadImage("plasma.png");
}


//----------------------------------------------------------------------------------
//Startmeny
//----------------------------------------------------------------------------------
void startmeny() {
  image(rubrikImg, rubrikX, rubrikY);
  if (startColor>=0) {
    startColor-=8;
  } else if (startColor<400) {
    startColor=400;
  }
  tint(255, startColor);
  image(startImg, startX, startY);
  noTint();
  
  if (inBlackScreenA >= 0) {
    fill(0, 0, 0, inBlackScreenA);
    rect(0, 0, 800, 500);
    inBlackScreenA--;
    
  } else if (grenX<=330) {
    grenX+=grenSpeed; 
    
  } else if ((animation == true) && (outroAnimation == false)) {
    frysGren = true;
    animation = false;
    
  } else if (rubrikY <= 25) {
    rubrikY++; 
    
  } else if (text1A <= 255) {
    fill(255, 255, 255, text1A);
    text("VOLVO HAS BEEN INVADED BY ALIENS.", text1X, text1Y);
    text1A+=0.5;
    
  } else if (text2A <= 400) {
    fill(255, 255, 255, text1A);
    text("VOLVO HAS BEEN INVADED BY ALIENS.", text1X, text1Y);
    fill(255, 255, 255, text2A);
    text("ARE YOU BAD ENOUGH TO STOP THEM?", text2X, text2Y);
    text2A+=0.5;
    
  } else if (whiteScreenA <= 355) { 
    fill(255, 255, 255, whiteScreenA);
    rect(0, 0, 800, 500);
    whiteScreenA+=9;
    
  } else if (nukeSizeY <= 500) {
    nukeSizeX=800;
    nukeY-=36;
    nukeSizeY+=40;
    
  } else if (startY <= 120) {
    startY++;
    
  } else if (nukeY <= 500) {
    nukeY++;
    
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
      utBlackScreenA-=2; 
    } else {
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
    if (alienX > 1000) {
      alienX-=1.2*grenSpeed;
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
  image(nukeImg, nukeX, nukeY, nukeSizeX, nukeSizeY);
  image(markImg, markX, markY);  
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
    } else if ((grenX < 250) && (animation == false) && (right == true) && (grenDuck == false)) {
      grenX+=grenSpeed;
    // Ducka
    } else if ((animation == false) && (down == true) && (grenJump == false)) {
      grenDuck = true;
      image(gren4Img, grenX, grenY+50, grenSize2X, grenSize2Y);
    } else {
      grenDuck = false;
    }
    // Hoppa
    if ((animation == false) && (up == true) || (grenJump == true) && (grenDuck == false)) {
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
  if ((play == true) && (fireballActiv == false) && (space == true)) {
        if(down == true) {
        muzzleflashX = grenX+112;
        muzzleflashY = grenY+110;
        fireballX = grenX+60;
        fireballY = grenY+120;
    } else {
        muzzleflashX = grenX+112;
        muzzleflashY = grenY+63;
        fireballX = grenX+70;
        fireballY = grenY+76;
    }  
    fireballActiv = true;
    muzzleflashSizeX = 1;  
  }
  if ((fireballX <= 800) && (fireballActiv == true)) { 
    image(fireballImg, fireballX, fireballY, fireballSizeX, fireballSizeX);
    fireballX+=3*grenSpeed;
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
    muzzleflashSizeX+=14; 
  }
}

//----------------------------------------------------------------------------------
//Gren liv och score
//----------------------------------------------------------------------------------
void stats() {
  for(int j=0; j<grenGrundLiv; j++) {
   // image(heartImg, heartX+j*15, heartY, heartSizeX, heartSizeY);
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
  
}


//----------------------------------------------------------------------------------
//Rita fiende
//----------------------------------------------------------------------------------
void fiende() { 
  if ((alienX <= 1000) && (alienX>=400)) {
    alienX-=1.2*grenSpeed;
    alien1Ani.display(alien1AniDelay, alienX, alienY); 
  } else if (alienX <= 1000) {
    alien2Ani.display(alien2AniDelay, alienX, alienY);
  }
  if (alienX <= -400) {
    alienX = random(1000,1300);
  }
  fill(150, 150, 200, 90);
  rect(alienX+110, alienY-20, 45, 3, 8);
  fill(220, 53, 53);
  rect(alienX+110, alienY-20, alienLiv*(45/5), 3, 8);
}


//----------------------------------------------------------------------------------
//Fiendevapen + träffkoll
//----------------------------------------------------------------------------------
void fiendVapen() {
  if (alien2Ani.getFrame() == 14) {
    plasmaX = alienX-40;
  }
  if ((alienX<=400) || (plasmaX <= 800) && (plasmaX >=-200)) {
    plasmaX-=5*grenSpeed;
    image(plasmaImg, plasmaX, plasmaY);
    if ((plasmaX >= grenX) && (plasmaX <= grenX+30) && (plasmaY >= grenY-90) && (plasmaY <= grenY+180)) {
      grenHitt = true;
      plasmaX = -400;
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
    alienX = random(1300,4000);
    alienLiv = 5;
    score++;   
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
  bakgrund();
  fiendVapen();
  gren();
  grenVapen();
  fiende();
  grenDying();
  fiendeDying();
  if (play == false) {
    startmeny();
  } else {
    stats();
  }
  
  //fpsComp
  fpsComp = frames/frameRate;
  grenSpeed = 4*fpsComp; 
  
  // Debug
  text(frameRate, 600, 20);
  //text(grenSpeed, 700, 20);
  //text(fpsComp, 500, 20);
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

