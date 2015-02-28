
PVector pos, vel;
int radius, compScore, playerScore, rectlength;
double level;
float ballPos;
boolean gameStarted, gameOvered;
ArrayList<String> winners= new ArrayList<String>();

public void setup() {
  frameRate(100);
  size(700, 500);
  pos = new PVector((int)(.3*width), 300);
  vel = new PVector(7, 8);
  radius=10;
  compScore=0;
  playerScore=0;
  rectlength=80;
  level=1;
  ballPos=200;
  gameStarted=false;
  gameOvered=false;
  PFont font = loadFont("Jokerman-Regular-48.vlw");
  PFont font2= loadFont("Ravie-48.vlw");
  textFont(font, 20);
  textFont(font, 15);
}

public void border() {
  stroke(200, 200, 200);
  line(0, 40, width, 40);
  line(width/2, 0, width/2, height);
}

public void gameOver() {
  if (gameOvered==true) {
    background(0);
    if (compScore>=3) {
      PFont font = loadFont("Jokerman-Regular-48.vlw");
      fill(255, 0, 255);
      textFont(font, 35);
      text("Game Over: \n YOU LOSE!", 235, 280);
       winners.add("computer");
      fill(216, 216, 216);
      textFont(font, 30);
      text("Past winners: ",100, 35);
      for (int i=0; i< winners.size(); i++) 
        text("*" + winners.get(i), 200, 75+i*30);
    }
    if (playerScore>=3) {
      PFont font = loadFont("Jokerman-Regular-48.vlw");
      fill(0, 255, 0);
      textFont(font, 35);
      text("Game Over: \n YOU WIN!", 235, 280);
      winners.add("player");
      fill(216, 216, 216);
      textFont(font, 30);
      text("Past winners: ", 100, 35);
      for (int i=0; i< winners.size(); i++) 
        text("*" + winners.get(i), 200, 75+i*30);
    }
  }
}

public void restart() {
  fill(255, 0, 0);
  PFont font2= loadFont("Ravie-48.vlw");
  textFont(font2, 30);
  text("Press r to restart", 170, 450);
  if (key=='r' || key=='R') {
    setup();
  }
} 


public void changeVel(int x, int y) {
  vel=new PVector(x, y);
}
public void textSetUp() {
  PFont font = loadFont("Jokerman-Regular-48.vlw");
  PFont font2= loadFont("Ravie-48.vlw");
  fill(255);
  textFont(font, 50);
  text("Pong", 280, 70);
  fill(255);
  //rect(243, 120, 210, 50);
  textFont(font2, 35);
  fill(255, 200, 200);
  text("Easy", 286, 155);
  fill(255);
  //rect(243, 200, 210, 50);
  textFont(font2, 35);
  fill(205, 76, 80);
  text("Medium", 255, 240);
  fill(255);
  //rect(243, 280, 210, 50);
  textFont(font2, 35);
  fill(205, 0, 80);
  text("Hard", 285, 320);
  textFont(font2, 15); 
  fill(255);
  text("*Choose a difficulty level by clicking on easy, medium, or hard*", 25, 450);
}

public void paddleSetUp() {
  //setting up player paddle
  fill(0, 255, 0);  
  rect(690, mouseY, 10, rectlength);
  rectMode(CENTER);
  noStroke();

  //setting up computer paddle
  fill(255, 0, 0);
  rect(10, ballPos, 10, 80);
  rectMode(CENTER);
  noStroke();
  if (pos.y<ballPos) {
    ballPos-=level;
  }
  if (pos.y>ballPos) {
    ballPos+=level;
  }
}

public void draw() {
  if (gameOvered==false && gameStarted==false) {
    background(0);
    textSetUp();
    if (mousePressed && mouseY< 170 && mouseY >115 && mouseX< 455 && mouseX>240) {
      level=6.7;
      gameStarted=true;
    }
    else if (mousePressed && mouseY<250 && mouseY> 200 && mouseX< 455 && mouseX>240) {
      level=10.5;
      changeVel(8, 10);
      rectlength=60;
      gameStarted=true;
    }
    else if (mousePressed && mouseY<330&& mouseY> 280 && mouseX< 455 && mouseX>240) {
      level=13;
      changeVel(10, 12);
      rectlength=45;
      gameStarted=true;
    }
  }  
  else if (gameStarted==true && gameOvered==false) {
    background(0);
    border();
    PFont font2= loadFont("Ravie-48.vlw");
    textFont(font2, 15);
    fill(255);
    text("computer:  " + compScore, 80, 20);
    text("player:  " + playerScore, 450, 20);
    paddleSetUp(); 

    //creating and setting up the ball
    fill(255);
    noStroke();
    ellipseMode(CENTER);
    ellipse(pos.x, pos.y, radius, radius);
    pos.add(vel);

    //ball bouncing back from the top and bottom walls
    if ( pos.y + radius >= height ) {
      vel.y = -vel.y;
    }
    if ( pos.y + radius <= 0 ) {
      vel.y = -vel.y;
    }

    //temporary for right and left walls 
    if (pos.x>=width) {
      vel.x=-vel.x;
      compScore++;
    }
    if (pos.x <= 0) {
      vel.x=-vel.x;
      playerScore++;
    }

    //ball bounces back from the player paddle and right walls
    if (pos.x >=688&& pos.y<=mouseY+40 && pos.y >=mouseY-40) {
      if ( pos.y < mouseY) {
        pos.x=685;
        vel.x = -vel.x; 
        vel.y = -vel.y;
      }
      if (pos.y>mouseY) {
        pos.x=685;
        vel.x = -vel.x;
        vel.y= +vel.y;
      }
      if (pos.y==mouseY) {
        pos.x=685;
        vel.x= -vel.x;
        vel.y= 0;
      }
    }  

    //ball bounces back from the computer paddle and left walls
    if (pos.x<=10 && pos.y<=ballPos+40 && pos.y>=ballPos-40) {
      if (pos.y < ballPos) {
        pos.x=25;
        vel.x = -vel.x;
        vel.y = -vel.y;
      }
      if (pos.y> ballPos) {
        pos.x=25;
        vel.x = -vel.x;
        vel.y = +vel.y;
      }
      if (pos.y==ballPos) {
        pos.x=25;
        vel.x = -vel.x;
        vel.y = 0;
      }
    } 
    if (compScore>=3 || playerScore>=3) {
      gameOvered=true;
    }
    gameOver();
  }
  else if (gameStarted==true && gameOvered==true) {
    restart();
  }
}


