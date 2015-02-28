
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer p;
//AudioPlayer a;
AudioPlayer s;

int x = -1000;
int xx = 1000;
int y = 200;

int mx = 50;

int snapY = 2;
int snapX;

  int q = 300;
  int w = 200;
  int e = 400;
  int r = 200;

void setup(){
  
 size(700,400);
 
 m = new Minim(this);
 p = m.loadFile("snap_back.wav");
 s = m.loadFile("break.wav");
 //a = m.loadFile("zip.wav");
 //background(0);
}

void draw(){
  background(0);
 stroke(255, 100);
 strokeWeight(2);
 noFill();
 
 

  if(snapY == 2 && mousePressed == true && mouseY < 600 && mouseY > -200 && mouseX > -200 && mouseX < 900){
  curve(mouseX, mouseY, -2, height/2, 702, height/2, mouseX, mouseY);
 //s.loop(0);
  }
  if(mouseY > 600 && mousePressed == true){
    line(0, 200, q, w);
    line(700, 200, e, r);
   snapY = 1;
  
  }
  if(mouseY < -200 && mousePressed == true){line(0, 200, 700, 200);}
  if(mouseX < -200 && mousePressed == true){line(0, 200, 700, 200);}
  if(mouseX > 900 && mousePressed == true){line(0, 200, 700, 200);
}

  
  
  if(snapY == 1){
  
    line(0, 200, q, w);
    line(700, 200, e, r);
     w = w + 5;
     q = q - 2;
 r = r + 5;
 e = e + 2;
 p.play();
  }else{
  if(mousePressed == false && snapY == 2){
  line(0, 200, 700, 200);
//a.loop(0);

}
}
}



