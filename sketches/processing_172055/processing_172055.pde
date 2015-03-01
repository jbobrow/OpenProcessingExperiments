
Screen currentScreen;
frameRate = 60;
boolean playopening = false;
boolean openingdone = false;
void setup() {
  size(600, 400);
  currentScreen = new OpeningScreen();
  noSmooth();
}
void draw() {
  currentScreen.drawScreen();
}


abstract class Screen {  
  //declare universal game font
  private PFont gameFont;

  public Screen() {
    //create and load font into game
   // gameFont = createFont("res/sapphirefont.ttf", 32);
    //textFont(gameFont);
  }
  public abstract void drawScreen();
}

class CreditsScreen extends Screen {
  public void drawScreen() {
    background(0);
    text("FIN", width/2, height/2);
  }
}

// all the important neato opening stuff goes here
class OpeningScreen extends Screen {
  private PImage grass;
  private PImage raindrop3;
  private PImage raindrop2;
  private PImage raindrop;
  private PImage leaves;
  private PImage plants;
  private PImage water;
  private PImage backlayer;
  private PImage background;
  private PImage bg;
  private PImage names;
  private PImage whitescreen;
  private PImage bg2;
  private PImage red;
  private PImage eyes;
  private PImage logo;
  private PImage logo2;
  private PImage bubbles;
  private PImage bubbles2;
  private PImage startbutton;
  private boolean redon = false;
  private boolean drawStart = true;

  private float rainx = 0, rainy = -700, nameopacity = 255, bgy = -200, white = 0;
  private float watery =-700, plantsy =-700, leavesy =-700, grassy =-700;
  private float rain2y = -700, rain3y = -700, backgroundy = -100, backlayery=-700;
  private float backlayeryt = 0, bg2o = 0, redo = 0, logoy = 50, logo2y = 60;
  private int bubblesn = 15;
  private float[] bubblesx = new float[bubblesn];
  private float[] bubblesy = new float[bubblesn];
  private float[] bubblesvy = new float[bubblesn];
  private float[] bubblesvx = new float[bubblesn];
  private float[] bubbles2x = new float[bubblesn];
  private float[] bubbles2y = new float[bubblesn];
  private float[] bubblesvy2 = new float[bubblesn];
  private float[] bubblesvx2 = new float[bubblesn];

  public OpeningScreen() {
    for (int i=0; i<bubblesn; i++) {
      bubblesx[i]=random(0, 600);
      bubblesy[i]= random(0, 400);
      bubbles2x[i]=random(-100, 600);
      bubbles2y[i]= random(0, 400);
      bubblesvy[i]=random(.1, 1.5);
      bubblesvx[i]=random(-1, 1);
      bubblesvy2[i]=random(.1, 1.5);
      bubblesvx2[i]=random(-1, 1);
    }
    grass = loadImage("1_grass1.png");
    raindrop3 = loadImage("2_raindrop3.png");
    raindrop2 = loadImage("3_raindrop2.png");
    raindrop = loadImage("4_raindrop.png");
    leaves = loadImage("5_leaves.png");
    plants = loadImage("6_plants.png");
    water = loadImage("7_water.png");
    backlayer = loadImage("8_backlayer.png");
    background = loadImage("9_background.png");
    bg = loadImage("10_bg.png");
    names = loadImage("11_names.png");
    whitescreen = loadImage("12_white.png");
    bg2 = loadImage("13_bg2.png");
    red = loadImage("14_red.png");
    eyes = loadImage("15_eyes.png");
    logo = loadImage("16_logo.png");
    logo2 = loadImage("17_logo2.png");
    bubbles = loadImage("18_bubble1.png");
    bubbles2 = loadImage("19_bubble2.png");
    startbutton = loadImage("20_start.png");
  }
  public void drawScreen() {
    image(background, 0, backgroundy);
    image(bg, 0, bgy);
    image(backlayer, 0, backlayery);
    image(water, 0, watery);
    image(plants, 0, plantsy);
    image(leaves, 0, leavesy);
    image(raindrop, rainx, rainy);
    tint(255, nameopacity);
    image(names, 0, -700);
    tint(255, 255);
    image(raindrop2, 0, rain2y);
    image(raindrop3, 0, rain3y);
    image(grass, 0, grassy);
    tint(255, white);
    image(whitescreen, 0, 0);
    tint(255, bg2o);
    image(bg2, 0, 0);
    tint(255, redo);
    image(red, 0, 0);
    tint(255, bg2o);
    image(eyes, 0, 0);
    image(logo, 0, logoy);
    image(logo2, 0, logo2y);
    tint(255, 255);

    if (playopening) {
      nameopacity-=10;
      if (nameopacity<0) {
        rainx-=2;
        rainy+=1;
        if (rainx<-101) {
          rainx = -100;
          rainy +=5;
          if (rainy>-400) {
            rain2y +=5;
            rain3y +=7;
            if (rain2y > -350) {
              rain2y +=7;
              grassy +=3;
              watery +=3;
              plantsy+=3;
              leavesy +=4;
              backlayery +=2.5;
              bgy +=2.5;
              if (backlayery > -150) {
                backlayeryt+=1;
                if (backlayeryt>40) {
                  white +=5;
                  backlayery -=2.4;
                  if (white >400) {
                    bg2o +=5;
                    logoy -=3;
                    logo2y -=4;
                    openingdone = true;
                    //if red is off and red is not visible
                    if (redo<256 && redon ==false) {
                      redo +=2;
                    }
                    //when red is visible, redon becomes true
                    if (redo==256) {
                      redon= true;
                    }
                    if (redon) {
                      redo -=2;
                    }
                    if (redo==0) {
                      redon=false;
                    }
                    if (frameCount % 30 == 0)
                      drawStart = !drawStart;
                    if (drawStart) {
                      image(startbutton, 0, -100);
                    }
                    for (int i = 0; i<bubblesn; i++) {
                      image(bubbles, bubblesx[i], bubblesy[i]);
                      image(bubbles2, bubbles2x[i], bubbles2y[i]);
                      bubbles2y[i] -= bubblesvy2[i];
                      bubblesx[i] += bubblesvx2[i];
                      bubblesy[i] -= bubblesvy[i];
                      bubblesx[i] += bubblesvx[i];
                      if (bubblesy[i]<-10) {
                        bubblesy[i]=420;
                        bubblesx[i]=random(-100, 600);
                      }
                      if (bubbles2y[i]<-10) {
                        bubbles2y[i]=420;
                        bubbles2x[i]=random(-100, 600);
                      }
                    }
                    if (logoy < 0) {
                      logoy = 0;
                      if (logo2y < 0) {
                        logo2y = 0;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}


void keyPressed() {
  //if current screen is opening screen, play the animation
  if (currentScreen instanceof OpeningScreen) {
    if (keyCode == ENTER) {
      playopening = true;
      if (playopening && openingdone) {
        //currentScreen = new WorldScreen();
      }
    }
  }
}



