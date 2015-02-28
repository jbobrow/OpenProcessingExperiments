
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

// Spaceman Game
PImage img,img2;

Minim maxim;
AudioPlayer player;
AudioPlayer player2;

int rad = 90;        // Width of the shape
float xpos, ypos;    // Starting position of shape    
float xspeed;  // Speed of the shape
float yspeed;  // Speed of the shape
int xdirection;  // Left or Right
int ydirection;  // Top to Bottom
int Disable_Image = 0;
int HumanX = 170;
int HumanY = 81;
int Human_Radius = 15;
int lives = 3;
int score = 0;

void setup()
{
  size(480, 240);
  img = loadImage("lunar.jpg");
  img2 = loadImage("asteroid_blue.png");
  frameRate(30);
  maxim = new Minim(this);
//  player = maxim.loadFile("atmos1.wav");
//  player.setLooping(true);
//  player.play();
//  player.volume(0.15);
  player2 = maxim.loadFile("explosion.wav");
//  player2.setLooping(false);
  set_rock_info();
  lives = 3;
  score = 0;
}

void draw()
{
  image(img,0,0,width,height);
  text("Lives: " + str(lives),20,20);
  text("Score: " + str(score),400,20);
  if (lives != 0) {
    if (sqrt(sq(HumanX - (xpos+45)) + sq(HumanY - (ypos+45))) < 60) {
      set_rock_info();
      lives -= 1;
    } 
    if (Disable_Image == 0) {   
      xpos = xpos + ( xspeed * xdirection );
      ypos = ypos + ( yspeed * ydirection );    
      // Test to see if the shape exceeds the boundaries of the screen
      // If it does, reverse its direction by multiplying by -1
      if (xpos > width-rad || xpos < 0) {
        xdirection *= -1;
      }
      if (ypos > height-rad || ypos < 0) {
        ydirection *= -1;
      }
    }
    if (Disable_Image == 0) image(img2,xpos,ypos,90,90);
    else {
      Disable_Image--;
    }
  }  
}

void mousePressed() {
  if (sqrt(sq(mouseX - (xpos+45)) + sq(mouseY - (ypos+45))) < 45) { 
      player2.loop(0);
//    player2.play();
//    player2.volume(0.5);
    Disable_Image = 60;
    set_rock_info();
    score++;
  }
}

void set_rock_info()
{
  int checkrange;
  checkrange = 0;
  while (checkrange == 0) {
    xpos = random(width-rad);
    ypos = random(height-rad);
    if (sqrt(sq(HumanX - (xpos+45)) + sq(HumanY - (ypos+45))) > 120) checkrange = 1;
  }
  xspeed = 1.0+random(4.0);  // Speed of the shape
  yspeed = 1.0+random(4.0);  // Speed of the shape
  if (random(1.0) > 0.5) xdirection = 1;  // Left or Right
  else
    xdirection = -1;
  if (random(1.0) >  0.5) ydirection = 1;  // Top to Bottom
  else
    ydirection = -1;  
}


