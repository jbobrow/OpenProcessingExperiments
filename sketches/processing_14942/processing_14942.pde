
// Project 4 "The Lion and the Boar"
// Zach Spitulski, Fall 2010
// UCLA, DESMA 28

// SETUP
// tell program what slide to start with, size, define colors, etc.
int slide = 1;
float hydration = 150;
int score = 0;

color yellow = color (255,194,95);
color red = color(255,0,0);
color blue = color(0,255,255);

PFont arcadeLarge;
PFont arcadeMedium;
PFont arcadeSmall;
PImage slide1;
PImage slide2;
PImage slide3;
PImage slide4;
PImage slide5;
PImage slide6;
PImage slide7;
PImage slide8;
PImage slide9;
PImage slide10;
PImage slide11;
PImage slide12;
PImage slide13;


// keep buttons on seperate pages
boolean move = true;

void setup() {
  size(640, 480);
  smooth();
  frameRate(60);
  arcadeLarge = loadFont("M01_CPS-48.vlw");
  arcadeMedium = loadFont("M01_CPS-20.vlw");
  arcadeSmall = loadFont("M01_CPS-10.vlw");

  slide1 = loadImage("slide-01.png");
  slide2 = loadImage("slide-02.png");
  slide3 = loadImage("slide-03.png");
  slide4 = loadImage("slide-04.png");
  slide5 = loadImage("slide-05.png");
  slide6 = loadImage("slide-06.png");
  slide7 = loadImage("slide-07.png");
  slide8 = loadImage("slide-08.png");
  slide9 = loadImage("slide-09.png");
  slide10 = loadImage("slide-10.png");
  slide11 = loadImage("slide-11.png");
  slide12 = loadImage("slide-12.png");
  slide13 = loadImage("slide-13.png");
}

// RUN
// Draw the slides
void draw() {
  background(0);
  
// -----------------------------------------       SLIDE 1            ------------------------------
  if (slide == 1) {    
    image(slide1,0,0);
    fill(255);
    textFont(arcadeMedium);
    text("START",270,350);
    fill(150);
    textFont(arcadeSmall);

    int BTNleft = 260;
    int BTNright = 380;
    int BTNtop = 315;
    int BTNbottom = 350;
    if (mouseX > BTNleft && mouseX < BTNright && mouseY > BTNtop && mouseY < BTNbottom) {
      fill(blue);
      textFont(arcadeMedium);
      text("START",270,350);
      if (mousePressed && move) {
        slide=2;
        move=false;
      }
    }
  }

// ------------------------------------------       SLIDE 2          -----------------------
    else if (slide == 2) {
      
      image(slide2,0,0);
      textFont(arcadeMedium);
      fill(255);
      text("BEGIN",480,450);
      
      // Set up mouse locations
      int BTNleft = 470;
      int BTNright = 590;
      int BTNtop = 400;
      int BTNbottom = 470;
      
        if (mouseX > BTNleft && mouseX < BTNright && mouseY > BTNtop && mouseY < BTNbottom) {
      fill(blue);
      text("BEGIN",480,450);
      if (mousePressed && move) {
        slide=3;
        move=false;
      }
    }
    }
// ----------------------------------------------     SLIDE   3 -------------------
       else if (slide == 3) {
         image(slide3,0,0);
         textFont(arcadeMedium);
         fill(255);
         text("FIGHT!",175,150);
         text("SHARE",400,150);
         
          float fight = dist(mouseX, mouseY, 175,150);
          float share = dist(mouseX, mouseY, 400,150);
         
           if (fight < 100) {
             fill(blue);
             text("FIGHT!",175,150);
                 if (mousePressed && move) {
                   float next = random (4,7);
                    slide = int(next);
                    hydration=hydration-50;                 
                    move=false;
                 }      
         }
           else if (share < 100) {
               fill(blue);
               text("SHARE",400,150);
                 if (mousePressed && move) {
                   float next = random (7,10);
                   slide = int(next);
                   hydration = hydration-50;
                   move=false;
                 }
           }
       }

// ---------------------------------------------     SLIDE 4              ----------------------
       else if (slide == 4) {
         image(slide4,0,0);
          hydration = hydration + .7;
       }
       
       
// ---------------------------------------------     SLIDE 5              ----------------------
        else if (slide == 5) {
         image(slide5,0,0);
         hydration = hydration + 1;
        
         
       }
       
// ---------------------------------------------     SLIDE 6              ----------------------
// Slow down hydration meter while user picks weapon

        else if (slide == 6) {
          textFont(arcadeMedium);
         image(slide6,0,0);
         hydration = hydration - .1;
        
         float sword = dist(mouseX, mouseY, 180,240);
         float C4 = dist(mouseX, mouseY, 380,240);
         
          if (sword < 100) {
             fill(255);
             text("SWORD",100,400);
                 if (mousePressed && move) {
                   float next = random (10,12);
                    slide = int(next);
                    hydration=hydration-50;                 
                    move=false;
                 }      
         }
         
          if (C4 < 100) {
             fill(255);
             text("C4",370,400);
                 if (mousePressed && move) {
                   float next = random (10,12);
                    slide = int(next);
                    hydration=hydration-50;                 
                    move=false;
                 }      
         }
         
       }
       
              
// ---------------------------------------------     SLIDE 7              ----------------------
        else if (slide == 7) {
         image(slide7,0,0);
         
         textFont(arcadeMedium);
         fill(255);
         text("ACCEPT!",115,375);
         text("REJECT",315,375);
         
         float accept = dist(mouseX, mouseY, 115,375);
         float reject = dist(mouseX, mouseY, 315,375);
         
          if (accept < 100) {
             fill(blue);
             text("ACCEPT!",115,375);
                 if (mousePressed && move) {
                   float next = random (12,14);
                    slide = int(next);
                    hydration=hydration-50;                 
                    move=false;
                 }      
         }
         
         if (reject < 100) {
             fill(blue);
             text("REJECT",315,375);
                 if (mousePressed && move) {
                   float next = random (12,14);
                    slide = 11;
                 }      
         }
        
       }
       
       
// ---------------------------------------------     SLIDE 8              ----------------------
        else if (slide == 8) {
         image(slide8,0,0);
         
          float water = dist(mouseX, mouseY, 315,375);
         
          if (water < 150) {
             fill(255);
             textFont(arcadeMedium);
             text("DRINK!",220,375);
                 if (mousePressed && move) {
                   hydration = hydration - 200;
                   float next = random (12,14);
                    slide = int(next);                 
                    move=false;
                 }      
         }
         
        
       }
       
              
// ---------------------------------------------     SLIDE 9              ----------------------
        else if (slide == 9) {
         image(slide9,0,0);
         
         float waterspot = dist(mouseX, mouseY, 255,395);
         
          if (waterspot < 200) {
                 if (mousePressed && move) {
                   fill(255);
                   textFont(arcadeMedium);
                   text("+WATER",165,215);
                   hydration = hydration -.3;
                 }      
         }
        
       }
       
// ---------------------------------------------     SLIDE 10              ----------------------
        else if (slide == 10) {
         image(slide10,0,0);
        
       }
       
// ---------------------------------------------     SLIDE 11              ----------------------
        else if (slide == 11) {
         image(slide11,0,0);
         hydration = hydration + 1;
        
       }
              
// ---------------------------------------------     SLIDE 12              ----------------------
        else if (slide == 12) {
         image(slide12,0,0);
         
         hydration = hydration - .15;
        
       }
              
// ---------------------------------------------     SLIDE 13              ----------------------
        else if (slide == 13) {
         image(slide13,0,0);
         fill(255);
         textFont(arcadeMedium);
          text("POINT BREAK",165,315);
         text("OCEANS 11",175,395);
         
         float pointb = dist(mouseX, mouseY, 255,315);
         float oceans = dist(mouseX, mouseY, 255,395);
         
          if (pointb < 50) {
             fill(blue);
             text("POINT BREAK",165,315);
                 if (mousePressed && move) {
                   float next = random (12,14);
                    slide = 12;
                 }      
         }
         
         if (oceans < 50) {
             fill(blue);
             text("OCEANS 11",175,395);
                 if (mousePressed && move) {
                   float next = random (12,14);
                    slide = 11;
                 }      
         }
        
       }
       
 // ------------------------------------------------------- DEATH SLIDE ----------------------    
    else if (slide == 500) {
      textFont(arcadeLarge);
      fill(red);
      text("GAME OVER",120,270);
      fill(200);
      textFont(arcadeMedium);
      text("YOUR SCORE"+":"+score,178,300);
      
      textFont(arcadeSmall);
      fill(255);
      text("TRY AGAIN",480,450);
      
      int BTNleft = 470;
      int BTNright = 590;
      int BTNtop = 400;
      int BTNbottom = 470;
      
        if (mouseX > BTNleft && mouseX < BTNright && mouseY > BTNtop && mouseY < BTNbottom) {
      fill(blue);
      text("TRY AGAIN",480,450);
      if (mousePressed && move) {
        hydration = hydration - 150;
        slide=1;
        move=false;
      }
    }
  
    }
    
// -------------------------------------  !  HYDRATION BAR !     ----------------
if (slide > 2 && slide != 500) {
  fill(blue);
  hydration = hydration + .3;
  
  if (hydration <= 150) {
   hydration = 150; 
  }
  
  else if (hydration <= 350) {
    score = score + 1;
    textFont(arcadeMedium);
    fill(255);
    text("SCORE:" + score,50,460);
    
    
         if (hydration <= 250) {  
                        
               noStroke();
               fill(blue);
              quad(600,hydration,  630,hydration,  630,350,  600,350);
              textFont(arcadeSmall);
              text("HYDRATION",545,375);
              text("METER",565,390); 
                         
     }
         
         else {
              noStroke();
              fill(red);
              quad(600,hydration,  630,hydration,  630,350,  600,350);
              textFont(arcadeSmall);
              text("HYDRATION",545,375);
              text("LOW",577,390);
      } 
   }
   
   else {
    slide=500;
  }
}
}



// MousePress Events
void mouseReleased() {
  move=true;
}


