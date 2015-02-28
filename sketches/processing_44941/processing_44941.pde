

Ball[] me;
int numberBall=1;
int rankUpTimer=150;
int countdown= 250;
int number = 2;
int downLightG=255;
int downLightB=255;
int aimer=600;
int hitLight;
int hitLight2;
int hitLight3;
int hitLight4;
int hitLight5;
int gameOverTimer=0;
int hitTimer=50;
int score;
float rectX=mouseX-100;
float rectY=mouseY-100;
PImage bgs1;
PImage play;
PImage paddle;
PImage paddleHit;
PImage three;
PImage twoo;
PImage onee;
PImage GO;
PImage bg;
PImage out;
PImage highlight;
PImage highlight2;
PImage highlight3;
boolean lightOn=false;
boolean lightOn2=false;
boolean lightOn3=false;
boolean lightOn4=false;
boolean lightOn5=false;
boolean showImage=true;
boolean showThis=false;
int screenNum=0;
int trans=100;
int trans2=0;
// end of variables
PFont tt1;


void setup() {
  size (640, 640, P3D);

  tt1 = loadFont("VisitorTT1-BRK--48.vlw");

  bgs1 = loadImage("title.png");
  play = loadImage("play.png");
  paddle = loadImage("paddle.png");
  paddleHit = loadImage("paddlehit.png");
  three = loadImage("3.png");
  twoo = loadImage("2.png");
  onee = loadImage("1.png");
  GO = loadImage("go.png");
  bg = loadImage("bg.png");
  out = loadImage("out.png");
  highlight = loadImage("highlight.png");
  highlight2 = loadImage("highlight2.png");
  highlight3 = loadImage("highlight3.png");


  me = new Ball[number];
  for (int i=0; i<1; i++)
  {
    me[i] = new Ball();
    me[i].xPos = 320;
    me[i].yPos = 320;
    me[i].zPos = 1;

    me[i].xSpeed = 5;
    me[i].ySpeed = 5;
    me[i].zSpeed = 5;

    me[i].xDirection = 0;
    me[i].yDirection = 0;
    me[i].zDirection = 0;
  }
  
  for (int i=0; i<2; i++)
  {
    me[i] = new Ball();
    me[i].xPos = 320;
    me[i].yPos = 320;
    me[i].zPos = 1;

    me[i].xSpeed = 5;
    me[i].ySpeed = 5;
    me[i].zSpeed = 5;

    me[i].xDirection = 0;
    me[i].yDirection = 0;
    me[i].zDirection = 0;
  }
}

void draw() {
  if (hitTimer>0) {
    hitTimer-=4;
  }
  if (screenNum==0) {
    tint(255, trans); 
    image(bgs1, 0, 0);
    if (mouseX>210 && mouseX<420 && mouseY>100 && mouseY <290) {
      image(play, 78, -40);
    }
    if (mouseX>210 && mouseX<420 && mouseY>100 && mouseY <290 && mousePressed) {
      trans=0;
      screenNum=1;
    }
    
    fill(255, 255, 255);
      textFont(tt1, 16);
      text("Objective: Get the highest score you possibly can", 120, 410);
       text("in a 3D game of pong against a wall.",180, 425);
  }

  if (screenNum==1) {
    tint(255, downLightG, downLightB, 99);
    image(bg, 0, 0);
    if (countdown<351 & countdown>0) {
      countdown-=1;
      countdownNum();
    }
    if (countdown==1) {
      for (int i=0; i<number; i++)
      {
        me[i].xDirection = random(-1, 1);
        me[i].yDirection = random(-1, 1);
        me[i].zDirection = 1;
      }
    }

    //fill(2, 99);
    //rect(0, 0, height, width);

    lights();

    //boxSetup();
    boxLightup();
    boxLightup2();
    boxLightup3();
    boxLightup4();
    boxLightup5();
    lighting();
    rankUp();
    
    /* for (int i=0; i<me.length; i++)
     {
     strokeWeight(5);
     stroke(255,99);
     line(1.2 * -width/2, 1.2 * -height/2, me[i].zPos/2, 1.2 * -width/2, 1.2 * height/2, me[i].zPos/2);
     line(1.2 * -width/2, 1.2 * height/2, me[i].zPos/2, 1.2 * width/2, 1.2 * height/2, me[i].zPos/2);
     line(1.2 * width/2, 1.2 * height/2, me[i].zPos/2, 1.2 * width/2, 1.2 * -height/2, me[i].zPos/2);
     line(1.2 * width/2, 1.2 * -height/2, me[i].zPos/2, 1.2 * -width/2, 1.2 * -height/2, me[i].zPos/2);
     }
     */
    for (int i=0; i<1; i++)
    {
      me[i].show();
      me[i].movement();
      me[i].border();
    }
    
    if(numberBall==2){
        for (int i=0; i<2; i++)
    {
      me[i].show();
      me[i].movement();
      me[i].border();
    }
    }
    racket();
  }

  if (screenNum==2) {
    if (gameOverTimer<150) {
      gameOverTimer+=1;
      tint(255, downLightG, downLightB, 99);
      image(bg, 0, 0);
      downLightG-=2;
      downLightB-=2;
    }
    if (gameOverTimer==150) {
      background(0);
      fill(255, 255, 255);
      textFont(tt1, 48);
      text("Score:", 215, 199);
      text(score, width/2+65, 199);
      strokeWeight(1);
      stroke(255);
      if (showThis) {
        fill(255, 255, 255, trans2);
        //rect(width/2-75, height/2-25, 150, 50);
        textFont(tt1, 32);
        fill(255);
        text("REPLAY", width/2-55, height/2+10);
        replay();
      }
    }
  }
}

void rankUp() {
  if (score>10) {
    aimer=200;
    if (rankUpTimer>0) {
      fill(255, 255, 255);
      textFont(tt1, 48);
      text("RANK UP!", 220, 100);
    }
    if (rankUpTimer>-1) {
      rankUpTimer-=1;
    }
  }
  
    if (score>50) {
    aimer=250;
    rankUpTimer=50;
    if (rankUpTimer>0) {
      fill(255, 255, 255);
      textFont(tt1, 48);
      text("RANK UP!", 220, 100);
      numberBall=2;
    }
    if (rankUpTimer>-1) {
      rankUpTimer-=1;
    }
  }
}

void zeroDirection() {
  for (int i=0; i<number; i++)
  {
    me[i].xDirection = 0;
    me[i].yDirection = 0;
    me[i].zDirection = 0;
  }
}

void countdownNum() {
  tint(255, 255);
  if (countdown>201 & countdown<250) {
    image(three, 295, 235);
  }
  if (countdown>151 & countdown<200) {
    image(twoo, 295, 235);
  }
  if (countdown>101 & countdown<150) {
    image(onee, 295, 235);
  }
  if (countdown>1 & countdown<100) {
    image(GO, 270, 235);
  }
}
void replay() {
  if (mouseX>width/2-75 && mouseX<width/2-75+150 && mouseY>height/2-25 && mouseY <height/2-25+50) {
    fill(0, 0, 0, trans2);
    zeroDirection();
    //rect(width/2-75, height/2-25, 150, 50);
    textFont(tt1, 32);
    fill(155);
    text("REPLAY", width/2-55, height/2+10);
  }
  if (mouseX>width/2-75 && mouseX<width/2-75+150 && mouseY>height/2-25 && mouseY <height/2-25+50 && mousePressed) {
    showThis=false;
    numberBall=1;
    rankUpTimer=150;
    aimer=600;
    countdown=350;
    trans2=255;
    score=0;
    downLightG=255;
    downLightB=255;
    gameOverTimer=0;
    screenNum=1;
    for (int i=0; i<number; i++)
    {
      me[i] = new Ball();
      me[i].xPos = 320;
      me[i].yPos = 320;
      me[i].zPos = 1;

      me[i].xSpeed = 5;
      me[i].ySpeed = 5;
      me[i].zSpeed = 5;

      me[i].xDirection = 0;
      me[i].yDirection = 0;
      me[i].zDirection = 0;
    }
  }
}
void boxLightup() {
  //light up when hit
  noStroke();
  fill(157, 230, 255, hitLight);
  rect(230, 230, 180, 180);
  if (lightOn) {
    directionalLight(160, 160, 500, 0, 0, -1);
    ambientLight(0, 0, 255);
  }
}
void boxLightup2() {
  //light up when hit left
  noStroke();
  fill(157, 230, 255, hitLight2);
  quad(0, 0, 0, 640, 225, 415, 225, 220);
  if (lightOn) {
    directionalLight(160, 160, 500, 0, 0, -1);
    ambientLight(0, 0, 255);
  }
}

void boxLightup3() {
  //light up when hit right
  noStroke();
  fill(157, 230, 255, hitLight3);
  quad(640, 640, 640, 0, 415, 220, 415, 415);
  if (lightOn) {
    directionalLight(160, 160, 500, 0, 0, -1);
    ambientLight(0, 0, 255);
  }
}


void boxLightup4() {
  //light up when hit bottom
  noStroke();
  fill(157, 230, 255, hitLight4);
  quad(0, 0, 640, 0, 415, 230, 225, 230);
}

void boxLightup5() {
  //light up when hit
  noStroke();
  fill(157, 230, 255, hitLight5);
  quad(0, 640, 640, 640, 415, 410, 225, 410);
}



void lighting() {
  //hitlight lower
  if (hitLight>0 && hitLight<101) {
    hitLight-=10;
    lightOn=true;
  }
  if (hitLight==0) {
    lightOn=false;
  }
  //
  if (hitLight2>0 && hitLight2<101) {
    hitLight2-=10;
    lightOn2=true;
  }
  if (hitLight2==0) {
    lightOn2=false;
  }
  //
  if (hitLight3>0 && hitLight3<101) {
    hitLight3-=10;
    lightOn3=true;
  }
  if (hitLight3==0) {
    lightOn3=false;
  }
  //
  if (hitLight4>0 && hitLight4<101) {
    hitLight4-=10;
    lightOn4=true;
  }
  if (hitLight4==0) {
    lightOn4=false;
  }
  //
  if (hitLight5>0 && hitLight5<101) {
    hitLight5-=10;
    lightOn5=true;
  }
  if (hitLight5==0) {
    lightOn5=false;
  }
  //
}

void boxSetup() {
  // box setup
  strokeWeight(5);
  stroke(0, 190, 255, 90);
  // background square
  line(0, 0, -1400, width, 0, -1400);
  line(0, 0, -1400, 0, height, -1400);
  line(0, height, -1400, width, height, -1400);
  line(width, height, -1400, width, 0, -1400);
  // perspective lines
  line(0, 0, -1400, 0, 0, 0);
  line(width, 0, -1400, width, 0, 0);
  line(0, height, -1400, 0, height, 0);
  line(width, height, -1400, width, height, 0);
}

void racket() {
  noStroke();

  rectX=mouseX-80;
  rectY=mouseY-80;
  //fill(255, 0, 0, 99);
  tint(255, 249);
  image(paddle, constrain(rectX, 50, 420), constrain(rectY, 50, 420));
  tint(255, 255, 255, hitTimer);
  image(paddleHit, constrain(rectX, 50, 420), constrain(rectY, 50, 420));
  
  fill(255, 255, 255);
  textFont(tt1, 18);
  text("Score:", rectX+20, rectY+140);
  text(score, rectX+80, rectY+140);
  tint(255, 255);
  //rect(constrain(rectX, 50, 420), 
  //constrain(rectY, 50, 420), 
  //160, 160);
  for (int i=0; i<numberBall; i++) {
    me[i].padHit();
  }
  
}


class Ball 
{
  float xPos;
  float yPos;
  float zPos;
  float randX=1;
  float xSpeed;
  float ySpeed;
  float zSpeed;

  float xDirection;
  float yDirection;
  float zDirection;

  // inital ball set up
  void show() {
    noStroke();
    /*if(zPos>-10 & zPos<1){
     fill(255,0,0,99);
     }
     else{
     fill(255, 99);
     }*/
    fill(255, 249);
    pushMatrix();
    translate(xPos, yPos, -zPos);
    sphere(20);
    popMatrix();
  }

void padHit(){
if (zPos>200 && zPos<aimer) {
      image(highlight, xPos-50, yPos-50);
    }
    if (zPos>10 && zPos<200) {
      image(highlight2, xPos-50, yPos-50);
    }
    if (zPos>-35 && zPos<10) {
      image(highlight3, xPos-50, yPos-50);
    }
    if (zPos<-35) {
      downLightG-=1;
      downLightB-=1;
      image(out, xPos-zPos/2, yPos-zPos/2, zPos-30, zPos-30);
    }
    if (abs(xPos - rectX - 80)< 80 &&
      abs(yPos - rectY - 80)< 80) {
      if (zPos>-35 && zPos<1) {
        xDirection *=-1;
        yDirection *=-1;
        zDirection *=-1;
        zSpeed+=0.5;
        xSpeed+=(mouseX - pmouseX) * 0.5;
        ySpeed+=(mouseY - pmouseY) * 0.5;
        zPos=0;
        hitTimer=255;
        image(paddleHit, constrain(rectX, 50, 420), constrain(rectY, 50, 420));
      }
    }
}


  void movement() {
    // motion setup
    xPos = xPos + (xSpeed * xDirection); 
    yPos = yPos + (ySpeed * yDirection);
    zPos = zPos + (zSpeed * zDirection);
  }
  void border() {
    if (xPos>width-100) {
      xDirection*=-1;
      hitLight3=100;
    }

    if (yPos>height-100) {
      yDirection*=-1;
      hitLight5=100;
    }

    if (zPos>600) {
      zDirection*=-1;
      xDirection=random(-1, 1);
      yDirection=random(-1, 1);
      xSpeed = random(5, 10);
      ySpeed = random(5, 10);
      hitLight=100;
      score+=1;
      zSpeed+=0.2;
    }

    if (xPos<100) {
      xDirection*=-1;
      hitLight2=100;
    }

    if (yPos<100) {
      yDirection*=-1;
      hitLight4=100;
    }

    if (zPos<-500) {
      screenNum=2;
      showThis=true;
      trans2=255;
    }
  }
}


