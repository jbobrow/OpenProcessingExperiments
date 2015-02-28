
import ddf.minim.*;
import javax.sound.midi.*;

float x = 100, y = 100;
float xSpeed = random(3, 5);
float ySpeed = random(3, 5);
float barLength = 40;

int S = 0;
int gameMode = 0 ; // 0 = Menu ,  1 = Playing , 2 = Game Over , 3 = Ending

int[][] row = new int[10][3];
color[][] rowColor = new color[10][3];
int life = 3;
int ballX, ballY;
int blockW=30;
int blockH=7;
int blockNumber = 30;


boolean pressing = false;  

PImage logo, o, player, bgImage ;

PFont T;

Minim minim;
AudioSample hit,jump;
AudioPlayer bgm;


void initialise() {
  for (int i = 0 ;i<=9;i++) {
    for (int j = 0 ;j<=0;j++) {
      row[i][j]=2;
      rowColor[i][j]=color(0, 255, random(255));
    }
    for (int j = 1 ;j<=2;j++) {
      row[i][j]=1;
      rowColor[i][j]=color(255, 255, random(255));
    }
  }


  blockNumber = 30;
  x = random(10, 300);
  y = random(150, 175);
  life = 3; 
  S=0;
}


void setup() {
  size(400, 400);
  noStroke();
  o = loadImage("heart.png");
  player = loadImage("player.png");
  bgImage = loadImage("background.jpg");
  logo = loadImage("logo.png");
  T = loadFont("ARDELANEY-25.vlw");
  
  minim = new Minim(this);

  hit = minim.loadSample("hit.wav");
  jump = minim.loadSample("jump.wav");
  bgm = minim.loadFile("bgm.mp3");
  bgm.loop();
  bgm.play();
}

void draw() {

  background(0);



  if ( gameMode == 0 ) { // Menu
    noCursor();
    image(logo, 40, 30 );
    fill(255);
    textFont(T, 25); 
    text("Press SpaceBar to start.", 60, 250);
    fill(0,255,0);
    textFont(T, 16); 
    text("Using Mouse to control the platform\nto bounce the man to hit the blocks!", 60, 350);
  } 
  else if ( gameMode == 1 ) {  // Playing

    image(bgImage, 0, 0);
    noCursor();
    fill(255);
    rect(mouseX-barLength/2, height-40, barLength, 5, 7);
    fill(255, 0, 0);
    image(player, x-10, y-30);
    fill(255, 255, 0);
    for (int i=0;i<=9;i++) {
      for (int j=0;j<=2;j++) {
        if (row[i][j]==1 || row[i][j]==2) {
          fill(rowColor[i][j]);
          rect(50+(blockW+2)*i, 50+(blockH+3)*j, blockW, blockH, 3);
        }
      }
    }


    fill(0);
    textSize(18);
    text("Score : "+S, 30, 30);
    text("Life  : ", 150, 30);
    for (int i=0 ; i<life-1 ; i++) {
      image(o, 200+i*29, 15);
    }

    x = x + xSpeed;
    y = y + ySpeed;

    if ( y >= height - 25 && y <= height - 20) {
      if (x > mouseX -barLength/2 && x < mouseX + barLength/2) {
        y = height - 26;
        ySpeed = -ySpeed;
      jump.trigger();
      }
    }

    ballX =int( ( x - 60 )/ (blockW+2));
    ballY =int(( y - 80 )/ (blockH+3));
    if ( ballX>=0 && ballX <=9) {
      if ( ballY>=0 && ballY <=2) {
        if ( row[ballX][ballY] !=0) {
          if (row[ballX][ballY]==2) {
            row[ballX][ballY]=1;
              hit.trigger();
            rowColor[ballX][ballY]=color(255, 255, random(255));
          } 
          else if (row[ballX][ballY]==1) {
            row[ballX][ballY]=0;
              hit.trigger();
            S++;
          }

          if (y > (ballY)*( blockH+3)+80 && x < (ballY+1)*( blockH+3) + 80 ) { // Top or Bottom
            xSpeed *=-1;

          } 
          else { 
            ySpeed *=-1;

          }
        }
      }
    }


    if (x > width-10 || x < 10) {
      xSpeed = -xSpeed;
    }
    if ( y < 30) {
      ySpeed = -ySpeed;
    }

    if ( y > height + 30 ) {
      life -= 1 ;
      x = random(10, 300);
      y = random(150, 175);
      xSpeed = random(3, 5);
      ySpeed = random(3, 5);
    }
    if (life <=0) {
      gameMode=2;
    }
    if (S >=30) {
      gameMode=3;
    }
  } 
  else if ( gameMode == 2 ) { // Game over
    noCursor();
    fill(255, 0, 0);
    textSize(45); 
    text("Game Over  >< ", 55, 100);
    fill(255);
    textSize(25); 
    text("Press SpaceBar to back to menu.", 15, 250);
  }
  else if ( gameMode == 3 ) { // Game over
    noCursor();
    fill(0, 255, 0);
    textSize(45); 
    text("Congrats  ! ", 90, 80);
    fill(255);
    textSize(25); 
    text("Press SpaceBar to back to menu.", 15, 250);
  }
}

void keyPressed() {
  if (keyCode  == 32 && !pressing) {
    pressing=true;
    if (gameMode == 0) {
      initialise();
      gameMode = 1 ;
    } 
    else if (gameMode == 2) {
      gameMode = 0 ;
    }    
    else if (gameMode == 3) {
      gameMode = 0 ;
    }
  }
}

void keyReleased() {
  pressing = false;
}


