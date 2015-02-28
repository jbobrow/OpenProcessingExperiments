
/*
Ball42 by tzalex
A simple game, avoid the black balls, click to increase your score but be carefull because when you click you also increase the size of your grey ball.
You have 42 seconds.
*/
float diameter = 60;
float diameter0 = 40;
float ball1x = 600;
float ball1y = 240;
float ball2x = 600;
float ball2y = 340;
float ball0x = diameter/1.4;
float ball0y = diameter/1.4;
float move1x = random(1, 3);
float move1y = random(3, 6);
float move2x = random(3, 4);
float move2y = random(6, 8);
float acc=1.008;
int score=0;
int i=0;
String time = "42";
int t;
int interval = 42;
//Maxim maxim;  // library for sound
//AudioPlayer player1;         
//AudioPlayer player2;
PImage img;

void setup()
{
  size (640, 480);
  smooth();
  noCursor();

  //maxim = new Maxim(this);
  //player1 = maxim.loadFile("boing.wav");
  //player1.setLooping(false);
  //player2 = maxim.loadFile("go.wav");
  //player2.setLooping(false);

  img = loadImage("ima.png");  // background image
  size(640, 480);
}

void draw ()
{
  imageMode(CORNER);
  image(img, 0, 0, 640, 480);

  // background(100);
  fill (80, 80, 80);
  ellipse(mouseX, mouseY, diameter0, diameter0);  // player controlled ball

  ball1x = ball1x + move1x;
  ball1y = ball1y + move1y;
  ball2x = ball2x + move2x;
  ball2y = ball2y + move2y;
  fill (20, 20, 20);
  ellipse (ball1x, ball1y, diameter, diameter);  // other balls
  ellipse (ball2x, ball2y, diameter, diameter);

  if (ball1x > width-diameter/2 || ball1x < diameter/2)  // bounce
  {
    move1x = move1x * -acc;
    //player1.cue(0);
    //player1.play();
  }
  if (ball1y > height-diameter/2 || ball1y < diameter/2)
  {
    move1y = move1y * -acc;
    //player1.cue(0);
    //player1.play();
  }
  if (ball2x > width-diameter/2 || ball2x < diameter/2)
  {
    move2x = move2x * -acc;
    //player1.cue(0);
    //player1.play();
  }
  if (ball2y > height-diameter/2 || ball2y < diameter/2)
  {
    move2y = move1y * -acc;
    //player1.cue(0);
    //player1.play();
  }

  fill(10, 10, 10);  // score and time
  text(score, width/1.14, height/10);
  text(time, width/12, height/10);

  t = interval-int(millis()/1000);  // time calculation
  time = nf(t, 2);
  if (t  == 0)    // stops the game when time expires
  {
    noLoop();
    println("game over");
    background(200);
    textSize(42);
    text("Score:", 166, height/3);
    text(score, width/2-20, height/3);
  }
  // for collisions
  if ((dist(mouseX, mouseY, ball1x, ball1y))<=(diameter/2+diameter0/2) || (dist(mouseX, mouseY, ball2x, ball2y))<=(diameter/2+diameter0/2))
  {
    noLoop();
    println("game over");
    background(200);
    textSize(42);
    text("Score:", 166, height/3);
    text(score, width/2-20, height/3);
    //player2.cue(0);
    //player2.play();
  }
}

void mousePressed()  // score and size increase when you click
{
  i=i+1;
  score = score+2*i;
  diameter0 = diameter0+1.04;
}


