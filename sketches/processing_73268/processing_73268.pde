
import ddf.minim.*;
import ddf.minim.effects.*;
PImage bg;
Minim minim;
Minim minim1;
Minim minim2;
AudioPlayer groove;
AudioSample win1;
AudioSample lose;
float ballX = 125;
float ballY = 125;

float xSpeed = 4;
float ySpeed = 4;

float ballSz = 25;
float somethingY = 0;
float somethingSpeed = 5;

int playerScore = 0;
int computerScore = 0;
int win = 1;
PImage PadComputer;
PImage PadUser;
PImage ball;
int m=0;
// happens only once
void setup()
{
  size(756, 680, P2D);
  PadComputer = loadImage("PadComputer.png");
  PadUser = loadImage("PadUser.png");
  ball = loadImage("ball.png");
  minim = new Minim(this);
  groove = minim.loadFile("groove.mp3");
  groove.loop();
  bg = loadImage("background.jpg");
  smooth();
}

// happens over & over
void draw()
{
  background(bg);
  image(PadUser, 0, mouseY);
  image(PadComputer, 700, somethingY);


  color a = color(235, 0, 0);
  color b = color(247, 173, 36);
  color c = color(250, 240, 84);
  color d = color(61, 130, 56);
  color e = color(89, 190, 174);
  color f = color(0, 88, 169);
  color g = color(182, 88, 157);
  // These statements are equivalent to the statements above.
  // Programmers may use the format they prefer.
  //color inside = #CC6600;
  //color middle = #CC9900;
  //color outside = #993300;

  pushMatrix();
  float level = groove.mix.level();
  //println("level="+ level);

  float rectW = level * width;
  translate(80, 80);
  fill(a);
  rect(width/16-rectW/16, height/2-rectW+200, rectW/10, -4*rectW);
  fill(b);
  rect(width/15-rectW/15, height/2-rectW+200, rectW/10, -rectW);
  fill(c);
  rect(width/14-rectW/14, height/2-rectW+200, rectW/10, -rectW/2);
  fill(d);
  rect(width/13-rectW/13, height/2-rectW+200, rectW/10, -rectW/3);
  fill(e);
  rect(width/12-rectW/12, height/2-rectW+200, rectW/10, -rectW/4);
  fill(f);
  rect(width/11-rectW/11, height/2-rectW+200, rectW/10, -rectW/5);
  fill(g);
  rect(width/10-rectW/10, height/2-rectW+200, rectW/10, -rectW/6);
  fill(a);
  rect(width/10-rectW/10+528, height/2-rectW+200, rectW/10, -4*rectW);
  fill(b);
  rect(width/11-rectW/11+528, height/2-rectW+200, rectW/10, -rectW);
  fill(c);
  rect(width/12-rectW/12+528, height/2-rectW+200, rectW/10, -rectW/2);
  fill(d);
  rect(width/13-rectW/13+528, height/2-rectW+200, rectW/10, -rectW/3);
  fill(e);
  rect(width/14-rectW/14+528, height/2-rectW+200, rectW/10, -rectW/4);
  fill(f);
  rect(width/15-rectW/15+528, height/2-rectW+200, rectW/10, -rectW/5);
  fill(g);
  rect(width/16-rectW/16+528, height/2-rectW+200, rectW/10, -rectW/6);
  popMatrix();




  fill(mouseX, mouseY, RGB);
  image(ball, ballX, ballY);

  ballX = ballX + xSpeed;
  ballY = ballY + ySpeed;

  somethingY = somethingY + somethingSpeed;

  // ball collision with top/bottom walls
  if ((ballY > height-50) || (ballY < 0)) {

    ySpeed = ySpeed * -1;
  }

  //ball collision with paddles
  if ((ballX <30) && (ballY > mouseY && ballY < mouseY + 120)) {
    minim1 = new Minim(this);
    win1 = minim1.loadSample("win.wav");
    win1.trigger();
    text("Player Win", 225, 580);
    win1.close();
    
    
    xSpeed = xSpeed * -1;
    ySpeed = ySpeed * -1;
    ballX = 400;
    ballY = 400;
  }
  if ((ballX > width -50) && (ballY > somethingY && ballY <somethingY + 120)) {
    xSpeed=0;
    ySpeed=0;
    somethingSpeed=0;
    minim1 = new Minim(this);
    lose = minim1.loadSample("lose.wav");
    lose.trigger();
    text("Computer Win", 225, 580);
    lose.close();
  }

  // computer moving
  if (somethingY < 0 || somethingY >500) {
    somethingSpeed = somethingSpeed * -1;
  }

  // when player scores
  if (ballX > width-80) {
    playerScore = playerScore + win;
    xSpeed = xSpeed * -1;
  }

  // when computer scores
  if (ballX < 0) {
    computerScore = computerScore + win;
    xSpeed = xSpeed * -1;
  }
  text("Player", 225, 580);
  text("VS", 390, 580);
  text("Computer", 510, 580);
  //title
  PFont font;
  font = loadFont("AgencyFB-Reg-48.vlw");
  textFont(font, 32);
  text("SCORE", 370, 630);
}
void stop()
{ 
  minim.stop();
  minim1.stop();
}


