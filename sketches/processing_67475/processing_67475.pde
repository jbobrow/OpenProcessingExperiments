
//weapon
float[] xPos = new float[5];
float[] yPos = new float[5];

//enemy
float[] enemyBottomX = new float[30];
float[] enemyBottomY = new float[30];

//enemy speed
float[] xVel= new float[30];
float[] yVel= new float[30];

//hit
boolean[] isAlive= new boolean[30];

//font
PFont helvetica;
int score;

//stars
float[] starsxPos= new float[200];
float[] starsyPos= new float[200];

//sound
import ddf.minim.*;

Minim minim;
AudioPlayer player;

//game
int  gameState=0;
int  limitTime=30000;
int startTime;
int currentTime;

void setup() {
  size(1000, 500);

  //game
  gameState=0;
  limitTime=30000;

  //font
  helvetica = loadFont("Helvetica-24.vlw");
  textFont(helvetica);
  score = 0;

  //sound
  minim = new Minim(this);

  player=minim.loadFile("sfx5.wav");

  //stars
  for (int z = 0; z < 100; z++) {
    starsxPos[z]=int(random(0, width));
    starsyPos[z]=int(random(0, height));

    //enemy
    for (int i = 0; i < 30; i++) {
      enemyBottomX[i]=int(random(0, width));
      enemyBottomY[i]=height;
    }
    for (int i = 0; i < 30; i++) {
      xVel[i] =random(0, 5);
      yVel[i]= random(-2, -1 );
      isAlive[i]= true;
    }
  }
}


void draw() {
  background(0);
  noStroke();
  smooth();

  //game


  // ------------ TITLE SCREEN --------------

  if (gameState==0) {
    fill(random(255));
    textSize(72);
    text("HIT GAME", width/2-130, height/2);
    textSize(20);
    fill(255);
    text("(Press space to start the game)", width/2-95, 280);
  }


  // ------------ ACTUAL GAME --------------
  if (gameState == 1) {
    currentTime=millis();
    if ((currentTime-startTime>= limitTime)|| (score>=500)) {
      gameState=2;
    }



    //score
    fill(255);
    text(score, width-110, 80);
    text("Score:", width-200, 80);

    //enemies to be on the screen again

    for (int i= 0; i<30; i++) {
      enemyBottomY [i]= enemyBottomY [i] + yVel[i];

      if (enemyBottomY[i]< 0) {
        enemyBottomY[i]=height;
        isAlive[i] = true;
      }

      if (enemyBottomY[i]>height) {
        enemyBottomY[i]=0;
        isAlive[i] = true;
      }
    }


    //stars
    for (int z=0; z<200; z++) {
      stroke(3);
      fill(255, 255, 255, random(40, 100));
      ellipse(starsxPos[z], starsyPos[z], random(2, 5), random(2, 5));
    }


    //weapon
    for (int i = 0; i < 5; i++) {
      xPos[i] = i*mouseX + mouseX;
      yPos[i] = i*mouseY + mouseY;
      stroke(255);
      fill(i*50+50, 100, 255);
      rect(xPos[i], yPos[i], 20, 20);
    }
    //enemy  

    for (int i = 0; i < 30; i++) {

      if (isAlive[i]==true) {
        noStroke();
        fill(random(255), random(255), random(255), random(255));
        ellipse(enemyBottomX[i], enemyBottomY[i], random(10, 30), random(10, 30));
        ellipse(enemyBottomX[i], enemyBottomY[i], random(10, 30), random(10, 30));
      }
    }

    for (int i=0; i< 30; i++) {
      for (int k = 0; k < 5; k++) {
        if (dist(xPos[k], yPos[k], enemyBottomX[i], enemyBottomY[i])<=20) {
          if (isAlive[i]==true) {

            if (player.position() >= 100) {
              player.rewind();
            }

            player.play();

            xVel[i]= xVel[i]*(-1);
            yVel[i]= yVel[i]*(-1);
            isAlive[i]=false;
            score+=1;
            //println(score);
          }
        }
      }
    }
    fill(255); 
    text("Time left: "+ ((limitTime-(currentTime-startTime))/1000), width-200, 40);
  }

  // ------------ END SCREEN --------------

  if (gameState==2) {
    fill(random(255));
    textSize(72);
    text("GAME OVER", width/2-130, height/2);
    textSize(36);
    fill(255);
    text("Score:" + score, width-200, 80);
    textSize(20);
    fill(255);
    text("(Press space to start again)", width/2-50, 280);
  }
}

void stop()
{
  // always close Minim audio classes when you are done with them
  player.close();
  minim.stop();

  super.stop();
}

void keyPressed() {
  if ((key==32 && gameState == 0) || (key == 32 && gameState == 2)) {
    gameState++;
    if (gameState == 1) {
      startTime = millis();
    }
    if (gameState>2) {
      gameState=0;
    }
  }
}


