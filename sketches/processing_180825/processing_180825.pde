
import ddf.minim.*;
import de.looksgood.ani.*;
PImage startImg, backImg, gameoverImg, tvImg, wolkenImg, baeumeImg, balloonImg, gebMask, geb1, geb2, geb3, geb4, ins0, ins1, ins2, ins3, ins4, ins5, ins6, ins7, ins8, ins9, ins10, ins11, ins12, ins13, ins14, ins15, ins16, ins17, ins18, ins19, ins20;
PImage [] ins = new PImage [21];
int gamestate=1, hx, bx=-200, tvx=-300, i=0, vy=0, score=0, highScore=0, bbx=-300;
float y= 320, x=256;
float wx=0, gx = -2200, g=0.5, jy, ax=-200;
int gxSpeed = 7;
int counter = 0;
Minim minim;
AudioPlayer player1, player2;
void setup() {

  Ani.init(this);
  minim = new Minim(this);

  size(1000, 800);
  textSize(50);

  startImg =    loadImage ("start.png");
  backImg =     loadImage ("Hintergrund.png");
  gameoverImg = loadImage ("gameover.png");
  tvImg =       loadImage ("tvt.png");
  wolkenImg =   loadImage ("Wolken.png");
  baeumeImg =   loadImage ("baeume.png");
  balloonImg =  loadImage ("balloon.png");
  geb1 =        loadImage ("geb1.png");
  geb2 =        loadImage ("geb2.png");
  geb3 =        loadImage ("geb3.png");
  geb4 =        loadImage ("geb4.png");
  gebMask =     loadImage ("gebMask.gif");
  ins0 =        loadImage ("0.png");
  ins1 =        loadImage ("1.png");
  ins2 =        loadImage ("2.png");
  ins3 =        loadImage ("3.png");
  ins4 =        loadImage ("4.png");
  ins5 =        loadImage ("5.png");
  ins6 =        loadImage ("6.png");
  ins7 =        loadImage ("7.png");
  ins8 =        loadImage ("8.png");
  ins9 =        loadImage ("9.png");
  ins10 =       loadImage ("10.png");  
  ins11 =       loadImage ("11.png");
  ins12 =       loadImage ("12.png");
  ins13 =       loadImage ("13.png");
  ins14 =       loadImage ("14.png");
  ins15 =       loadImage ("15.png");
  ins16 =       loadImage ("16.png");
  ins17 =       loadImage ("17.png");
  ins18 =       loadImage ("18.png");
  ins19 =       loadImage ("19.png");
  ins20 =       loadImage ("20.png");

  ins [0] = ins0;
  ins [1] = ins1;
  ins [2] = ins2;
  ins [3] = ins3;
  ins [4] = ins4;
  ins [5] = ins5;
  ins [6] = ins6;
  ins [7] = ins7;
  ins [8] = ins8;
  ins [9] = ins9;
  ins [10] = ins10;
  ins [11] = ins11;
  ins [12] = ins12;
  ins [13] = ins13;
  ins [14] = ins14;
  ins [15] = ins15;
  ins [16] = ins16;
  ins [17] = ins17;
  ins [18] = ins18;
  ins [19] = ins19;
  ins [20] = ins20;
  
  player1 = minim.loadFile("bgsound.mp3");
  player2 = minim.loadFile("gameover.mp3");

player1.loop();

  hx=  -backImg.width+width;
  wx=  -wolkenImg.width+width;
  bx=  -baeumeImg.width+width;
  tvx= tvx;
}

void draw() {
  if(mousePressed)
  player1.play();
  counter++;
  /*
   BACKGROUND
   */

  image(backImg, 0, 0);
  if (gamestate==0) {

    imageMode(CORNER);
    image(wolkenImg, wx, 0);
    wx+=0.75;


    if (wx>0) {
      wx=-wolkenImg.width+width;
    }
    image(balloonImg, 80, 270);

    image(tvImg, tvx, 150);
    tvx+=1;
    imageMode(CORNER);
    image(baeumeImg, bx, 450);
    bx+=4;
  }  

  if (bx>0) {
    bx=-baeumeImg.width+width;
  }  

  if (gamestate==0) {
    image(balloonImg, 80, 270);

    image(ins[i], 625, y+jy);
    i += 1;
    if (i >= ins.length) {
      i = 0;
    }



    /*
      GEBÃ�UDE
     */


    zeichneGeb();
    /*if((gx <= 7.0 && gx >= 0) || gx == -2093.0){
     saveFrame("bild####.jpg");
     }*/

    //  println(gx);
    if (gx > 0) {
      gx = -2100;
    }


    if (counter%375 == 0) {
      gxSpeed += 1;
    }


    gx += gxSpeed;
    /* 


    pushMatrix();
    translate(ax, 320);
    fill(0, 255, 0);
    noStroke();
    ellipse(100, 0, 20, 20);
    ellipse(900, 0, 20, 20);
    ellipse(1000, 0, 20, 20);
    ellipse(2400, 0, 20, 20);
    popMatrix();

    int c2 = get(684, 325);
    ax += 10;
    if (ax > 0) {
      ax = -2000;
    }

    fill(c2);
    println(c2);
    rect(0, 0, 20, 20);
    if (c2 == -16711936 && jy == 0) {
      //println(frameCount + "lost");
      ax = -200;
      gx = -2200;
      gamestate = 2;
      highScore = score;
    }
*/


    int c = get(730, 430);
    //int c = get(695, 450);
    /*if (mousePressed) {
     fill(c);
     println(c);
     rect(0, 0, 10, 10);
     }*/


    if (c == -14415064 && y >= 320) {
      //println(frameCount + "lost");
      ax = -200;
      gx = -2200;

      gamestate = 2;
      highScore = score;
    }


    if (c == -14415062 && y >= 320) {
      //println(c);
    }
    if (gamestate==0) {
      image(baeumeImg, bbx, 550);
      bbx+=9;
    }
    if (bbx>0) {
      bbx=-baeumeImg.width+width;
    }
    textSize(100);
    fill(0, 255, 0);
    text(""+score, width/2, 700);
  } else if (gamestate == 2) {
    player1.pause();
    player2.play();
    imageMode(CENTER);
    image(gameoverImg, width/2, height/2);
    counter = 0;
    if (mousePressed) {
      gamestate = 1;
    }
  } else {
    imageMode(CENTER);
    image(startImg, width/2, height/2);
    textSize(40);
    text(highScore, 460, 87);
  }
}

void mousePressed () {
  if (y == 320) {
    Ani.from(this, .60, "y", 250, Ani.QUINT_IN_OUT);
    score++;
    highScore=max(score, highScore);
  }
  if (gamestate==1) {
    x = gamestate = score = 0;
  }
}
void keyPressed() {
  if (keyCode == 32) {
    jy=25;
  }
}
void keyReleased() {
  jy=0;
}

void zeichneGeb() {
  pushMatrix();
  translate(gx, 420);
  image(geb1, 0, 0, 100, 380);
  image(geb2, 100, 0, 100, 380);
  image(geb3, 200, 0, 100, 380);
  image(geb4, 300, 0, 100, 380);
  image(geb4, 500, 0, 100, 380);
  image(geb3, 600, 0, 100, 380);
  image(geb2, 700, 0, 100, 380);
  image(geb1, 900, 0, 100, 380);
  image(geb1, 1000, 0, 100, 380);
  image(geb1, 1100, 0, 100, 380);
  image(geb4, 1300, 0, 100, 380);
  image(geb3, 1400, 0, 100, 380);
  image(geb2, 1500, 0, 100, 380);
  image(geb4, 1700, 0, 100, 380);
  image(geb3, 1800, 0, 100, 380);
  image(geb2, 1900, 0, 100, 380);
  image(geb1, 2100, 0, 100, 380);
  image(geb2, 2200, 0, 100, 380);
  image(geb3, 2300, 0, 100, 380);
  image(geb4, 2400, 0, 100, 380);
  image(geb4, 2600, 0, 100, 380);
  image(geb3, 2700, 0, 100, 380);
  image(geb2, 2800, 0, 100, 380);
  image(geb4, 3000, 0, 100, 380);
  image(geb3, 3100, 0, 100, 380);
  image(geb2, 3200, 0, 100, 380);
  popMatrix();
}



