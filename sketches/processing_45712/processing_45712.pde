
import ddf.minim.*;
AudioPlayer player;
Minim minim;

PImage snail;
PImage body;
PImage head;

int x = 150;

void setup()
{
  size(600, 600, P2D);
  minim = new Minim(this);
  player = minim.loadFile("I Gotta Feeling .Mp3", 2048);
  player.play();
  player.loop();
  body = loadImage ("body.gif");
   head = loadImage ("head.gif");
  snail = loadImage ("snail.gif");
}

void draw()
{
  background(random(256));
  changeBgColor();
  stroke(255);
  strokeWeight(5);
  
    for(int i = 0; i < player.left.size()-1; i++)
  {
    line(270 + player.left.get(i)*50,i,  270 + player.left.get(i+1)*50 , i+1 );
    line(290 + player.left.get(i)*50,i,  290 + player.left.get(i+1)*50 , i+1 );
    line(310 + player.left.get(i)*50,i,  310 + player.left.get(i+1)*50 , i+1 );
    line(330 + player.left.get(i)*50,i,  330 + player.left.get(i+1)*50 , i+1 );
    line(350 + player.left.get(i)*50,i,  350 + player.left.get(i+1)*50 , i+1 );
    line(370 + player.right.get(i)*50,i, 370 + player.right.get(i+1)*50, i+1);
    line(390 + player.left.get(i)*50,i,  390 + player.left.get(i+1)*50 , i+1 );
    line(410 + player.right.get(i)*50,i, 410 + player.right.get(i+1)*50, i+1);
    line(430 + player.left.get(i)*50,i,  430 + player.left.get(i+1)*50 , i+1 );
    line(450 + player.right.get(i)*50,i, 450 + player.right.get(i+1)*50, i+1);
   
  }
  image( body,x,500, 420,200);
  x += random(-3,3);
  if (x<=140){
    x=150;
  }
  if (x>=160){
    x=150;
  }
  
  image( head,130,195, 450,450);
  fill(random(255));
  changeColor();
  rect(240,360,90,50);
  rect(375,360,90,50);
  image( snail,player.position()/1000, 500, 120,120);
  
}

void mouseClicked() {
     player.cue((int)((mouseX/(float)width) * player.length()));
 }
 
 void changeBgColor(){
   if (player.position()>58000){
  background(random(256),random(256),random(256));
  fill(random(256),random(256),random(256));

    }
  }
   void changeColor(){
   if (player.position()>58000){
  
  fill(random(256),random(256),random(256));

    }
  }
 

