
import ddf.minim.*;
Minim minim;
AudioPlayer player;

float laser1=0;
float laser2=0;
float ls1=.05;
float ls2=.05;
float Tw=0;
float plus=0;
PFont txt;
float shadow=0;
float Sh=10;
float enl=0;
float Px=0;
float Py=0;
boolean play=false;

void setup() {
  size(250,250);
  smooth();
  txt = loadFont("Verdana-Bold-48.vlw");
  textMode(CENTER);
  frameRate(24); 
  background(0);
  minim = new Minim(this);
  player = minim.loadFile("vodoo.wav", 512);
}

void draw() {
  if(!play) {
    player.pause();
  }

  if(play) {
    player.play();
  }
  rectMode(CENTER);
  fill(0,20);
  noStroke();
  rect(width/2,height/2,width,height);
  Tw=random(-.1,.1);

  //popers
  stroke(255,random(50,180),0,15);
  for(int i=0; i<5; i+=1) {
    strokeWeight(enl+random(100));
    point(Px+i,Py+i);
    enl+=1;
  }
  if (enl>20) 
  { 
    enl=0; 
    Px=random(250);
    Py=random(250);
  }

  //postal code
  fill(shadow,30,250,90);
  text("L7P3R9",22,126);
  textFont(txt,50);
  fill(0);
  text("L7P3R9",20,125);

  if(shadow>255 || shadow<0) {
    Sh*=-1;
  }
  shadow+=Sh;

  stroke(#36ff00,90);
  strokeWeight(1);

  line(125,250,random(width),random(height));

  pushMatrix();
  translate(250,250);
  rotate(laser1+Tw);
  line(0,0,-200,-200);

  strokeWeight(30);
  stroke(#36ff00,10);
  line(0,0,-200,-200);

  if(laser1>.8 || laser1<-.8) {
    ls1*=-1;
  }
  laser1+=ls1;
  popMatrix();

  pushMatrix();
  translate(0,250);
  rotate(laser2+Tw);

  stroke(#36ff00,90);
  strokeWeight(1);
  line(0,0,-200,-200);

  strokeWeight(30);
  stroke(#36ff00,10);
  line(0,0,-200,-200);

  if(laser2<-.01 || laser2>2.35) {
    ls2*=-1;
  }
  laser2+=ls2;
  popMatrix();
}

void mousePressed() {
  if (mousePressed) {
    if (play) {
      play=false;
    }
    else if (!play) {
      play=true;
    }
  }
}


