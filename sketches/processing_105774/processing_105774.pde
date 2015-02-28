
//initial
int p1count=0;
int p2count=0;
int on=-1;
PFont Impact;
int p1y;
int p2y;
float ballx;
float bally;
float ballspeedy = 1;
float ballspeedx = 1;
int radius=20;
int player1;
int player2;

//set up play area
void setup() {
  size(600, 400);

  ballx=300;
  // random y position start for ball
  bally=int(random(0, 400));
  Impact =loadFont("Impact-48.vlw");
}


void draw() {
  
  background(200,150,178);
  
  //set on /off value for game
  if (on==-1){
    background(200,150,178);
    textSize(20);
     fill(0, 255, 0);
    text("click mouse to play", 225, 200);
  }
    
  //if "on" run pong
  if (on==1){
  textSize(20);
  //set text
  textFont(Impact);
  //write game score
  text(p1count, 150, 50);
  text(p2count, 450, 50);

  
  //draw ball
  strokeWeight(1);
  fill(0, 255, 0);
  ellipse(ballx, bally, radius, radius);
  //draw paddels
fill(255, 0, 0);
//move paddel w/ up key and mouse
  rect(50, mouseY, 5, 50);
  rect(550, p2y, 5, 50);

//set speep for ball
  bally=bally+ballspeedy;
  ballx=ballx+ballspeedx;


  strokeWeight(5);
  line(300, 0, 300, 400);
//Set wall bounce & set limits of ball
  bally=bally+ballspeedy;
  
  //bounce ball off bottom
  if (bally>height-radius/2) {
    //reduce speedy
    ballspeedy=ballspeedy*-0.95;
    // xspeed=xspeed+gravity;
  }
//redirect if ball goes left off screen
  if (bally<0+radius/2) {
    ballspeedy=-ballspeedy;
  }



  //restrain x
  ballx=ballx+ballspeedx;
  if (ballx>width-radius/2) {
    ballspeedx=int(random(-2, 2)) *ballspeedx;
    if (ballspeedx==0) {
      ballspeedx=1;
    }
    ballx=300;
    bally=int (random (0, 400));
    //count if player is under 5 points
    if (player2<5 && player1<5) {
      p1count++;
      player1++;
    }
  }

  if (ballx<0+radius/2) {
    ballspeedx=int(random(-2, 2)) *ballspeedx;
    if (ballspeedx==0) {
      ballspeedx=1;
    }
    ballx=300;
    bally=int (random (0, 400));
    if (player2<5 && player1<5) {
      p2count++;
      player2++;
    }
  }

  if (bally>height-radius/2) {
    bally=height-radius/2;
    //reduce speedx
    // ballspeedx=ballspeedx*.9;
  }
  if (ballx>width-radius/2) {
    ballx=width-radius/2;
  }
//if players win call win text
  if (player1>4 || player2>5 ) {
  }
  
  //check win ststus of players
  if (p1count>4) {
    player1win();
  }

  if (p2count>4) {
    player2win();
  }







//check ball bounces on paddle
  if (ballx>49 && ballx<56 && bally<mouseY+55 && bally>mouseY) {
    ballspeedx=-ballspeedx;
  }

  if (ballx>549 && ballx<556 && bally<p2y+55 && bally>p2y) {
    ballspeedx=-ballspeedx;
  }
//key inputs
  if (keyCode==DOWN) {
    p2y=p2y+3;
  }
  if (keyCode==UP) {
    p2y=p2y-3;
  }

  if (p2y>height-50) {
    p2y=height-50;
  }

  if (p2y<0) {
    p2y=1;
  }


  if (p1y>height-50) {
    p1y=height-50;
  }

  if (p1y<0) {
    p1y=1;
  }
  
  }
}

//call if play1 wins

void player1win() {
  text("PLAYER 1 WINS", 150, 200);
  text("click mouse to reset", 100, 300);
  p2count=player2;
  p1count=player1;
}
//call if play2 wins
void player2win() {
  text("PLAYER 2 WINS", 150, 200);
  text("click mouse to reset", 100, 300);
  p2count=player2;
  p1count=player1;
}

//call if mouse presses
void mousePressed() {
  
  p2count=0;
  p1count=0;
  player1=0;
  player2=0;
}
