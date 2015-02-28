

float s;
float m;
float h;
int ss, mm, hh;
int lastSecond;
PFont timefont;
import ddf.minim.*;
Minim minim;
AudioPlayer song;


void setup(){
  size(600,700);
  background(255);
  smooth();
  minim = new Minim(this);
  song = minim.loadFile("water.wav");
  timefont = loadFont("MyriadPro-Bold-48.vlw");
  textFont (timefont, 48);
  
}

void draw() {
  background (255);
  noStroke();
  s = second();
  m = minute();
  h = hour();
  ss = second();
  mm = minute();
  hh = hour();
  
  if(h>12||hh>12){
    h=h-12;
    hh=hh-12;
  }
  
  fill(80,200,255,250);
  rect(100,500,100,0-((h/23)*300));
  
  fill(0,255,200,100);
  rect(250,500,100,0-((m/59)*300));
  
  fill(255,100,200,100);
  rect(400,500,100,0-((s/59)*300));

  fill(0,0,0,150);
  textFont (timefont, 25);
  textAlign(CENTER);
  text(hh,150,540);
  text(mm,300,540);
  text(ss,450,540);
  
  noFill();
  stroke(0,100);
  strokeWeight(2);
  rect(100,190,100,310);
  rect(250,190,100,310);
  rect(400,190,100,310);
  
  if(ss == 0){ 
    song.play();
  }
  
  if(hh == 0){ 
    song.play();
  }
  
  if(mm == 0){ 
    song.play();
  }
}


