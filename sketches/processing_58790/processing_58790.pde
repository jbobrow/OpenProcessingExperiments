
import ddf.minim.*;

Minim minim;
AudioPlayer music,laser,game_over;
PImage p,b;
float x = 100;
boolean shoot = false;
int score = 0;
int lives = 3;
int level = 1;
PFont f;


int[] xpos = {(int)random(20,560),(int)random(20,560),(int)random(20,560),(int)random(20,560),(int)random(20,560)};
int[] ypos = {0,0,0,0,0};

void setup()
{
  size(580,610);
  p = loadImage("mario.gif");
  b = loadImage("bowzer.gif");
  
  minim = new Minim(this);
  music = minim.loadFile("mario.mp3");
  laser = minim.loadFile("shot.mp3");
  game_over = minim.loadFile("game_over.wav");
  
  f = loadFont("Meiryo-20.vlw");
  
  music.play();
}

void draw()
{
  background(0);
  
  textFont(f,20);
  fill(random(10,390),random(500,610), random(20, 100));
  text("Score:   "+ score,400,70);
  text("Level:   "+ level,400,100);
  text("Lives:    "+ lives,400,130);
  
  if(mouseX > (width-74)){
    image(p,width-74,height-75);
  }
  else{
    image(p,mouseX-37,height-75);
  }
  
  obstacles();
  
  if(shoot == true){
    shot(mouseX);
    shoot = false;
  }
  
  for(int i=0;i<5;i++){
    if(ypos[i] == 610){
      lives--;
    }
  }
  
    if(score == 10){
    frameRate(70);
    level = 2;
    }
    
    if(score == 30){
      frameRate(80);
      level = 3;
    }
    
    if(score == 60){
      frameRate(90);
      level = 4;
    }
  
  if(lives == 0){
    textFont(f,20);
    fill(random(10,390),random(500,610), random(20, 100));
    text("GAME OVER!",220,300);
    game_over.play();
    
    music.pause();
    laser.pause();
    noLoop();
  }
}

void mousePressed(){
  shoot = true;
  laser.play();
  laser.rewind();
}


void obstacles(){
  stroke(random(10,390),random(500,610), random(20, 100));
  
  for (int i=0; i < 5; i++)
  {
    image(b,xpos[i], ypos[i]++,20,20);
  }
}


void shot(int xCord){
  for(int i=0; i<5; i++){
    if((xCord >= (xpos[i])) && (xCord <= (xpos[i]+20))){
      score++;
      xpos[i] = (int)random(20,560);
      ypos[i] = 0;
    }
  }
  line(mouseX,height-75,mouseX, 0);
}

