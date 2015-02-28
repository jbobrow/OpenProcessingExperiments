
import ddf.minim.*;

Minim minim;
AudioSample game_over;
AudioPlayer gameover;

PImage bg;
float x = 100, y = 1-00;
float player1, player2, speedx = 1, speedy = 3;
PVector v1, v2;

void setup(){
  size(500,350);
  //load & resize background image
  bg = loadImage("Table.jpg");
  bg.resize(500,350);
  smooth();
  //set the vector point
  v1 = new PVector(50,100);
  v2 = new PVector(3,random(0.1, 2));
}

void draw(){
  //control the movement of the ping pong bar
  player1 = mouseY;
  player2 = mouseY;
  background(bg);
  v1.add(v2);
 //fill red to the bar of player on the lhs
  fill(255,0,0);
  rect(0,player1,20,100); 
 //fill blue to the bar of player on the lhs
  fill(0,0,255);
  rect(480,player2,20,100);
 //fill white colour to the ball 
  fill(255);
  ellipse(v1.x,v1.y,20,20);
 
 //limitation for the boundary 
  if ((v1.x>475 && v1.y>player2 && v1.y<player2+100)
    ||(v1.x<30 && v1.y>player1 && v1.y<player1+100) 
  ){
    v2.x = v2.x*-1;
    v2.y = v2.y*-1;
  }
  
  if (v1.y>height-5||v1.y<5){
    v2.y=v2.y*-1;

    
  }
}



