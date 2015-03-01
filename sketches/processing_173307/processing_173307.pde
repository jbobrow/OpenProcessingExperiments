

//importar la librería minim
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//declarar el audio (minim) y el reproductor (player)
Minim minim;
AudioPlayer player;



float boxWidth = 50;
float boxHeight = 50;

float ballX = 100;
float ballY = 100;
float xSpeed = 3;
float ySpeed = 5;

float radius = 15;

void setup(){
 size(500, 500); 
 rectMode(CORNER);
 ellipseMode(CENTER);
 ellipseMode(RADIUS);

// definir el audio (minim) y el archivo que va a reproducir player  / sigo sin saber para que es el número después del archivo pero sin el no me funcionaba el código
minim = new Minim(this);
player = minim.loadFile ("bump.wav");
}


void draw(){

  background(231,245,156);

  //will the ball hit the box?
  if(intersectsBox(ballX+xSpeed, ballY)){
    xSpeed *= -1;
   
   //condicional, si la bolita golpea al cuadrado en X el reproductor está en play
   player.play (); 
  }
  //will the ball leave the screen?
  else if(ballX+xSpeed < 0 || ballX+xSpeed > width){
    xSpeed *= -1;
  }

  //will the ball hit the box?
  if(intersectsBox(ballX, ballY+ySpeed)){
    ySpeed *= -1;
       //condicional, si la bolita golpea al cuadrado en Y el reproductor está en play
   player.play (); 
  }
  //will the ball leave the screen?
  else if(ballY+ySpeed < 0 || ballY+ySpeed > height){
    ySpeed *= -1;
  }

  ballX += xSpeed;
  ballY += ySpeed;

  stroke (41,155,125);
  fill (41,155,125);
  ellipse(ballX, ballY, radius, radius);
  
  noStroke();
  fill (247,95,118);
   
   if (mousePressed) {
    fill(231,245,156);
  } else {
    noStroke();
  
 }
  
  rect(mouseX, mouseY, boxWidth, boxHeight);
  
}


boolean intersectsBox(float x, float y){
  if(x > mouseX && x < mouseX + boxWidth){
   if(y > mouseY && y < mouseY + boxHeight){
    return true;
   } 
  }

  return false;
}




