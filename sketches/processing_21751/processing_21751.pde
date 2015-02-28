
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;        
AudioPlayer mySound;
//library

int num=1000;
Ball[] myBall = new Ball[num];
color[] myColors = new color[5];
//define class

void setup(){
  size(500,500); 
  background(255);
   minim = new Minim(this);                     
  mySound = minim.loadFile("3.mp3"); 
  mySound.play();
  myColors[0] = color (254,67,101,90);
  myColors[1] = color (252,157,154,90);
  myColors[2] = color (249,205,173,90);
  myColors[3] = color (200,200,169,90);
  myColors[4] = color (131,175,155,90);
  //colors
  
 for(int i=0;i<myBall.length;i++){
   myBall[i]= new Ball();
 }
 smooth();
}

void draw() {
  background(0);
  for(int i=0; i < myBall.length; i++) {
    myBall[i].update();
    myBall[i].draw();
  }
}


class Ball {
  float x=random(20,width-20);  //positions of the balls
  float y=random(20,width-20);  //positions of the balls
  float vx;
  float vy; 
  float r=mySound.left.level()*100;  //radius of the balls
  float gravity = 0.1;
  color col = myColors[floor(random(0,5))];

  Ball(){
}

  void update() {
    vx=vx+mySound.mix.level();
    vy = vy + gravity;
    y += vy;
    x += vx;
   if(x>width){
     vx=vx*-1;
   }
    if(x<0){
     vx=vx*-1;
   }
    if (y>height-10){
    vy=vy*-1;

  }
  }
 void draw() {
  
    fill(col);
    noStroke();
    ellipse(x,y,mySound.left.level()*100,mySound.left.level()*100);
    
  }

}


