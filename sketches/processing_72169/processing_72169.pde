
import ddf.minim.*;
Minim minim;
AudioPlayer music;
float posX = 25;
float posY = 10;
float paddleW = 10;
float paddleH = 50;
float comY = 150;
float c = 2;
float d = 3;
float player1 = 0;
float player2 = 0;
float ran = random(-6, 5);
PImage back;
PImage paddle;
PImage ball;
PImage film;
PFont font;


void setup()
{
  size(600, 500);
  minim = new Minim(this);
  music = minim.loadFile("drenched.mp3");
  music.play();
  back = loadImage("bluesky.jpg");
  paddle = loadImage("paddle.jpg");
  ball = loadImage("ball.png");
  film = loadImage("film.jpg");
  font = loadFont("DFPuDing-W7-HKP-BF-48.vlw"); 
  smooth();
  strokeWeight(1);
  posX = random(100,300);
  posY  =random(0,height-100);
}

void draw()
{
  image(back,0,0);
  image(film,0,400);
  
  fill(255);
  textFont(font, 25); 
  text("My score " + player1, 50, 450);
  text("Comp score " + player2, 350, 450);
  
  //comp paddle
  comY = constrain(comY, 0, height-150);
  image(paddle,width-50,comY);
  
  //player1 paddle
  float playerY = constrain(mouseY-paddleH/2, 0, height-150);
  image(paddle,50,playerY);
  
  //ball
  /*fill(mouseX, mouseY, 0);*/
  /*ellipse(posX, posY, 20, 20);*/
  image(ball,posX,posY);
  
  posY = posY+c;
  posX = posX+d;
  
  // check top and bottom walls
  if (posY > 400 || posY < 0 )
  {
    c = c*-1;
  }

  // check left and right walls
  if (posX > width-10)  
  {
    // player1 scores
    player1++;
    posX = width/2;
    posY = height/2;
    d = d * -1;
    println(player1 + " - " + player2);
  }
  else if (posX < 10) {
    // player2 scores
    player2++;
    posX = width/2;
    posY = height/2;
    d = d * -1;
    println(player1 + " - " + player2);
  }

  // check collision with paddle
  if ((posY >= mouseY-paddleH/2 && posY <= mouseY+paddleH/2)  && posX <= 60)
  {
    d = d * -1;
   // c = c * -1;
  }
  if ((posY >= comY && posY <= comY+50) && posX >= width-60) {
    d = d * -1;
    //c = c *- 1;
  }

  if ( d > 0 )
  { 
    if (comY < posY)
    { 
      comY = comY + ran/2.3;
    }

    if (comY > posY)
    { 
      comY = comY - ran/2;
    }
  }
  else {
    if (comY < 175)
    { 
      comY = comY + random(1,2);
    }

    if (comY > 175)
    { 
      comY = comY - random(1,2);
    }
  }

}


