
PImage basketball;
PImage hoop;
float ballX=200;
float ballY=0;
int score = 0;
//import ddf.minim.* ;
//Minim minim;
//AudioPlayer clip ;

void setup()
{
//minim = new Minim(this) ;
//  clip = minim.loadFile("Boo.mp3") ;
//  clip.play();

  size(400, 600);
  smooth();
  background(0, 0, 255);
  basketball = loadImage("basketball court.jpg");
  hoop = loadImage("basketball hoop.jpg");
}

void draw()
{
  fill(255, 255, 255, 20);

  imageMode(CORNER);
  image(basketball, 0, 0, width, height);
  imageMode(CENTER);
  image(hoop, mouseX, mouseY);
  fill(222, 122, 0);
  ellipse(ballX, ballY, 30, 30);

  ballY=ballY+17;

  if (ballY >height)
  {
    ballY=0;
    ballX=random(width);
  }
  if (ballX >=mouseX-15&&ballX<=mouseX+15&&ballY>=mouseY+25&&ballY<=mouseY+35)
  {
    ballY=0;
    ballX=random(width);
    if (mouseY>height/2)
    {
      score=score+2;
    }
    else
    {
      score=score+3;
    }
  }
  fill(0);
  text("score: "+score, 10, 50);
  if (frameCount>800)
  {
    background(255);
    fill(0);
    textAlign(CENTER);
    textSize(36);
    text("gameover\n score: " + score, width/2, height/2);
    noLoop();
  }
}



