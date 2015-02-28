
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer p;

void setup(){
  size(700,400);
  background(0);
}

void draw(){
  
  if (mousePressed && (mouseButton == LEFT)){
     stroke(255);
     line(mouseX,mouseY,400,700);
     mouseY = mouseY + 5;
     mouseX = mouseX - 5;
     { m = new Minim(this);
       p = m.loadFile("button-14.wav");
      p.play();}
  }
  
  if (mousePressed && (mouseButton == RIGHT)){
    background(0);
    { m = new Minim(this);
      p = m.loadFile("explosion.wav");
     p.play();}
  }
     
     /*line(mouseX,mouseY,400,700);
     mouseY = mouseY + 5;
     mouseX = mouseX + 5;*/
  
}

