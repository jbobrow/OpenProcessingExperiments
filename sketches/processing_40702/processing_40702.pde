
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer p;
AudioPlayer a;

int x = -1000;
int xx = 1000;
int y = 200;

int mx = 50;


void setup(){
  
 size(700,400);
 
 m = new Minim(this);
 p = m.loadFile("snap_back.wav");
 a = m.loadFile("zip.wav");
 
}

void draw(){
  background(0);
 stroke(255, 100);
 strokeWeight(2);
 noFill();
 smooth();
 
  if(mousePressed == true && mouseY < 600 && mouseY > -200 && mouseX > -100 && mouseX < 800){
  curve(mouseX, mouseY, -2, height/2, 702, height/2, mouseX, mouseY);
 p.loop(0);
  }
  if(mouseY > 600 && mousePressed == true){line(0, 200, 700, 200);}
  if(mouseY < -200 && mousePressed == true){line(0, 200, 700, 200);}
  if(mouseX < -100 && mousePressed == true){line(0, 200, 700, 200);}
  if(mouseX > 800 && mousePressed == true){line(0, 200, 700, 200);}

  if(mousePressed == false){
  curve(x, y, -2, height/2, 702, height/2, xx, y);
   a.loop(0);
  }
}



