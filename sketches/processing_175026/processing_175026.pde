
/* Hannibal the Cannibal
By: Alex Richardson
Using Processing 2.1.1
Assignment 8 */
float[] consumeableX = new float [10];
float[] consumeableY = new float [10];
int startingTime;

int jumpDistance = 45;
int moveDistance = 5;

int cannibalX = 300;
int cannibalY = 300;
int eaten = 0;
int jump=0;
int boosts=5;
int cannibalcolor=0;
int gamestart=0;
int loadgame=0;
void setup() {
  size(600, 600);
  startingTime = millis();
  for (int index=0; index<consumeableX.length;index++) {  
    consumeableX[index]= random(width);
    consumeableY[index]= random(height);
  }
}
void draw() {
  PREGAMELOADING();
  if (loadgame==4) {
    int seconds = (millis() - startingTime) / 1000;
    int minutes = seconds / 60;
    int hours = minutes / 60;
    int days = hours / 24;
    seconds -= minutes * 60;
    minutes -= hours * 60;
    hours -= days * 24;
    background(200, 0, 0);
    for (int index=0; index<consumeableX.length;index++) {  
      ellipse(consumeableX[index], consumeableY[index], 20, 20);
    } 
    GameIntroScreen();
    //PLAYER COLOR
    if (jump>=1) {
      fill(0, 0, 255);
    }
    if (jump==0) {
      fill(255, 255, 0);
    }
    ellipse(cannibalX, cannibalY, 20, 20);
    fill(255);
    text("Time: "+minutes+":"+seconds, 400, 50);
if(jump>=1){
 text("Boost activated!",200,250); 
}
    Teleports();
    IfEaten();
    if (eaten==10) {
      noLoop();
      background(0);
      textSize(32);
      text("Congratulations, you win!", 125, 30); 
      text("Time: "+minutes+":"+seconds, 170, 90);
    }
  }
}
void keyPressed() {
  if (key == 32) {
    gamestart=1;
    if (boosts>=1) {
      boosts=boosts-1;
      jump=jump+1;
    }
  }
  if (keyCode == 127) {
    if (loadgame<=4) {
      loadgame=loadgame+1;
    }
    if (loadgame==5) {
      loadgame=4;
    }}
    if (key == CODED) {

      if (keyCode == UP) {
        gamestart=1;
        if (jump>=1) {
          cannibalY=cannibalY-jumpDistance;
          jump=jump-1;
        }
        if (jump==0) {
          cannibalY=cannibalY-moveDistance;
        }
      }
      if (keyCode == DOWN) {
        gamestart=1;
        if (jump>=1) {
          cannibalY=cannibalY+jumpDistance;
          jump=jump-1;
        }
        if (jump==0) {
          cannibalY=cannibalY+moveDistance;
        }
      }
      if (keyCode == LEFT) {
        gamestart=1;
        if (jump>=1) {
          cannibalX=cannibalX-jumpDistance;
          jump=jump-1;
        }
        if (jump==0) {
          cannibalX=cannibalX-moveDistance;
        }
      }
      if (keyCode == RIGHT) {
        gamestart=1;
        if (jump>=1) {
          cannibalX=cannibalX+jumpDistance;
          jump=jump-1;
        }
        if (jump==0) {
          cannibalX=cannibalX+moveDistance;
        }
      }
    }
  }

void GameIntroScreen() {
  if (gamestart==0) {
    textSize(32);
    fill(0);
    text("Press any movement key to start!", 50, 250);
    startingTime=millis();
  }
}
void PREGAMELOADING() {
  fill(255);
  if (loadgame==0) {
    background(0);
    slideadvanceinstruction();
    textSize(40);
    text("Welcome to:", 100, 150);
    fill(255,0,0);
    textSize(90);
    text("Hannibal",75,225);
    text("Cannibal",175,350);
    fill(255);
    textSize(25);
    text("the",245,260);
    textSize(20);
    fill(random(255),random(255),random(255));
    text("Created by: Alex Richardson",300,500);
    fill(255);
  }
  if (loadgame==1) {
    background(0);
    slideadvanceinstruction();
    textSize(32);
    text("You are Hannibal, the goal of the \n game is to eat all the white circles", 25, 100);
    textSize(20);
    text("This is Hannibal:",25,295);
    fill(255,255,0);
    ellipse(205, 290, 20, 20);
  }
  if (loadgame==2) {
    background(0);
    slideadvanceinstruction();
    textSize(20);
    text("Control Hannibal by using the arrows keys \n You can boost his speed 5 times using the space bar \n   (When boosted Hannibal will change color to blue) \n", 25, 125);
    text("The game will start as soon as you move. \n Speed is everything!", 25, 450);
    fill(255, 255, 0);
    
  }
  if (loadgame==3) {
    background(0);
    slideadvanceinstruction();
    textSize(25);
    text("Good luck, you sick disgrace of a circle...", 65, 275);
  }
}
void slideadvanceinstruction() {
  textSize(20);
  fill(80,170,100);
  text("Press Delete to continue", 360, 25);
  fill(255);
}
void IfEaten() {
  float d0 = dist(cannibalX, cannibalY, consumeableX[0], consumeableY[0]);
  float d1 = dist(cannibalX, cannibalY, consumeableX[1], consumeableY[1]);
  float d2 = dist(cannibalX, cannibalY, consumeableX[2], consumeableY[2]);
  float d3 = dist(cannibalX, cannibalY, consumeableX[3], consumeableY[3]);
  float d4 = dist(cannibalX, cannibalY, consumeableX[4], consumeableY[4]);
  float d5 = dist(cannibalX, cannibalY, consumeableX[5], consumeableY[5]);
  float d6 = dist(cannibalX, cannibalY, consumeableX[6], consumeableY[6]);
  float d7 = dist(cannibalX, cannibalY, consumeableX[7], consumeableY[7]);
  float d8 = dist(cannibalX, cannibalY, consumeableX[8], consumeableY[8]);
  float d9 = dist(cannibalX, cannibalY, consumeableX[9], consumeableY[9]);

  if (d0<20) {
    consumeableX[0]-=9001;
    consumeableY[0]-=9001;
    eaten+=1;
  }
  if (d1<20) {
    consumeableX[1]-=9001;
    consumeableY[1]-=9001;
    eaten+=1;
  }
  if (d2<20) {
    consumeableX[2]-=9001;
    consumeableY[2]-=9001;
    eaten+=1;
  }
  if (d3<20) {
    consumeableX[3]-=9001;
    consumeableY[3]-=9001;
    eaten+=1;
  }
  if (d4<20) {
    consumeableX[4]-=9001;
    consumeableY[4]-=9001;
    eaten+=1;
  }
  if (d5<20) {
    consumeableX[5]-=9001;
    consumeableY[5]-=9001;
    eaten+=1;
  }
  if (d6<20) {
    consumeableX[6]-=9001;
    consumeableY[6]-=9001;
    eaten+=1;
  }
  if (d7<20) {
    consumeableX[7]-=9001;
    consumeableY[7]-=9001;
    eaten+=1;
  }
  if (d8<20) {
    consumeableX[8]-=9001;
    consumeableY[8]-=9001;
    eaten+=1;
  }
  if (d9<20) {
    consumeableX[9]-=9001;
    consumeableY[9]-=9001;
    eaten+=1;
  }
}
void Teleports() {
  if (cannibalX >= 595) {
    cannibalX=10;
  }
  if (cannibalX <= 5) {
    cannibalX=590;
  }
  if (cannibalY >= 595) {
    cannibalY=10;
  }
  if (cannibalY <= 5) {
    cannibalY=590;
  }
}

