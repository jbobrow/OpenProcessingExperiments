
import ddf.minim.*;

AudioPlayer player;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;

Minim minim;
 
float angle = 0.0;
void setup()
{
  size(500,500);
  background(0);
  smooth();
  minim = new Minim(this);
  player = minim.loadFile("one.mp3");
  player2 = minim.loadFile("two.mp3");
  player3 = minim.loadFile("three.mp3");
  player4 = minim.loadFile("four.mp3");
  player5 = minim.loadFile("click.mp3");
  
 
}
void draw()
{
 
  pushMatrix();
  
   
   
translate(mouseX,mouseY);
  rotate(angle);
     fill(0);
  stroke(255);
  rect(-25,-25, 50,50);
  angle+=0.05;
 

  popMatrix();

stroke(255);
line(20,0,20,500);
line(0,20,500,20);
line(480,0,480,500);
line(0,480,500,480);
fill(255,0,0);
rect(0,20,20,460);
fill(0);
rect(20,0,460,20);
fill(0,0,255);
rect(480,20,20,460);
fill(0,255,0);
rect(20,480,460,20);
fill(160);
rect(0,0,20,20);
rect(480,0,20,20);
rect(0,480,20,20);
rect(480,480,20,20);

if (mousePressed) {translate(mouseX,mouseY);
player5.loop(0);
  rotate(angle);
     fill( random(255),random(255),random(255));
  stroke(255);
  rect(-40,-40, 80,80);
  angle+=0.05;
player5.loop(0);}



  if (mouseX < 40) {
    
  translate(mouseX,mouseY);
  rotate(angle);
     fill( random(255),random(0),random(0));
  stroke(255);
  rect(-60,-60, 120,120);
  angle+=0.05; 
  player.loop(0);
  
}
 
  if (mouseX > 460) {
    
  translate(mouseX,mouseY);
  rotate(angle);
     fill( random(0),random(0),random(255));
  stroke(255);
  rect(-60,-60, 120,120);
  
    angle+=0.05;
 player3.loop(0);
  }
  
     if (mouseY > 460) {
    
  translate(mouseX,mouseY);
  rotate(angle);
     fill( random(0),random(255),random(0));
  stroke(255);
  rect(-60,-60, 120,120);
  
    angle+=0.05;
    player2.loop(0);
  }

     if (mouseY < 40) {
    
  translate(mouseX,mouseY);
  rotate(angle);
     fill( random(255));
  stroke(255);
  rect(-60,-60, 120,120);
  
    angle+=0.05;
    player4.loop(0);
  }}

void stop()
{
 
  player.close();
  player2.close();
  player3.close();
  player4.close();
   player5.close();
  minim.stop();
  
  super.stop();
}


