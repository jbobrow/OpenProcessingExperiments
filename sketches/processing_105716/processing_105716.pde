
int p1count=0;
int p2count=0;
PFont Impact;
int p1y;
int p2y;
float ballx;
float bally;
float ballspeedy = 1;
float ballspeedx = 1;
int radius=10;
int player1;
int player2;


void setup() {
  size(600, 400);

  ballx=300;
  bally=int(random(0, 400));
  Impact =loadFont("Impact-48.vlw");
}


void draw() {
  background(255);

  textFont(Impact);
  text(p1count, 150, 50);
  text(p2count, 450, 50);
  textSize(50);
  fill(255, 0, 0);
  strokeWeight(1);
  ellipse(ballx, bally, radius, radius);

  rect(50, mouseY, 5, 50);
  rect(550, p2y, 5, 50);

  bally=bally+ballspeedy;
  ballx=ballx+ballspeedx;


  strokeWeight(5);
  line(300, 0, 300, 400);

  bally=bally+ballspeedy;
  if (bally>height-radius/2) {
    //reduce speedy
    ballspeedy=ballspeedy*-0.95;
    // xspeed=xspeed+gravity;
  }

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
    if (player2<5 && player1<5){
    p1count++;
    player1++;
  }}

  if (ballx<0+radius/2) {
    ballspeedx=int(random(-2, 2)) *ballspeedx;
    if (ballspeedx==0) {
      ballspeedx=1;
    }
    ballx=300;
    bally=int (random (0, 400));
    if(player2<5 && player1<5){
    p2count++;
    player2++;
  }}

  if (bally>height-radius/2) {
    bally=height-radius/2;
    //reduce speedx
    // ballspeedx=ballspeedx*.9;
  }
  if (ballx>width-radius/2) {
    ballx=width-radius/2;
  }

  if (player1>4 || player2==5 ) {
   
    
  }
  if (p1count>4) {
      player1win();

  }
  
   if (p2count>4) {
      player2win();

  }








  if (ballx>49 && ballx<56 && bally<mouseY+55 && bally>mouseY) {
    ballspeedx=-ballspeedx;
  }

  if (ballx>549 && ballx<556 && bally<p2y+55 && bally>p2y) {
    ballspeedx=-ballspeedx;
  }

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


void player1win(){
text("PLAYER 1 WINS", 150, 200);
text("click mouse to reset", 150, 300);
p2count=player2;
p1count=player1;
  }
  
  void player2win(){
text("PLAYER 2 WINS", 150, 200);
text("click mouse to reset", 150, 300);
p2count=player2;
p1count=player1;
  }

void mousePressed() {
 p2count=0;
    p1count=0;
    player1=0;
    player2=0;
}

void keyPressed() {
}
