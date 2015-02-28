
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer laser;
AudioPlayer construct;
AudioPlayer explosion;

int wc = 255;

boolean mve = false;

ArrayList<SquareBot> squares;
ArrayList smoke;
 
void setup(){  
  size(700, 400);
  smooth(); 
  cursor(CROSS);
  frameRate(30);  
   
  m = new Minim(this);
  construct = m.loadFile("create.wav");
  explosion = m.loadFile("explosion.wav");
   
  squares = new ArrayList();
  smoke = new ArrayList();
}
  
void draw(){
  
 background(255);
 
  fill(0);
  textSize(10);
  text("EARTH || 3012", 10, 390);
 
//FACTORY
  rectMode(CENTER);
//building
  stroke(0);
  fill(0);
  rect(350,200,100,50);

//chimmneys  
  rect(315,165,10,25);
  rect(330,165,10,25);
  
//door  
  fill(255);
  noStroke();
  rect(375,220,25,30);

//windows  
  stroke(0);
  fill(wc);
  rect(312,195,10,10);
  rect(322,195,10,10);
  rect(332,195,10,10);

  for(int i = 0; i < squares.size(); i++){
    SquareBot s = (SquareBot) squares.get(i);
    s.show_draw();
    for(int j = (i+1); j < squares.size(); j++){
      SquareBot next = (SquareBot) squares.get(j);     
      next.isOver(s.x, s.y, s.buffer());
      if(s.isOver(next.x, next.y, next.buffer()) == true){
        s.playSound();
        s.change();
        s.show_draw();
        squares.remove(i);
        squares.remove(j-1);
        break;
      }
    }
  }
  
//Smoke:
  for(int k = 0; k < smoke.size(); k++){
   Smoke_show sp = (Smoke_show) smoke.get(k);
    sp.update();
    sp.show(); 
  }
}


void mousePressed(){
  if(mouseButton == LEFT){  
    squares.add(new SquareBot(375,220,m.loadFile("explosion.wav")));
    smoke.add(new Smoke_show());
    wc = 170;
    construct.loop(0);
  }else if((mouseButton == RIGHT)&&(squares.size() > 0)){
    squares.remove(0);
  }
}

void mouseReleased(){
 wc=255; 
}

void mouseMoved(){
 mve = true;
}



