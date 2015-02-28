
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;
BeatDetect beat;
float x=0;
float t=0;
float eRadius;
PFont myfont;
void setup(){

size(1024, 640);
minim = new Minim(this);
in = minim.getLineIn(Minim.STEREO);

myfont=loadFont ("DeadKansas-48.vlw");
    textAlign(CENTER);

beat = new BeatDetect();
background(0);
ellipseMode(CENTER_RADIUS);
eRadius = 20;
smooth();




}

void draw(){
  fill(0,252);
  rect(0,0,width,height);
  beat.detect(in.mix);
   float a = map(eRadius, 20, 60, 100, 255);
//stroke(255,a);
noStroke();

//  fill(a,a);
      //stroke(255,a);
      //strokeWeight(random(25));
stroke(0,a);
strokeWeight(random(50));

  float b =2;
  float c =4;
  float d =8;
  if ( beat.isOnset() ) eRadius = 100;
//ellipse(width/2,height/2,eRadius,eRadius);
//ellipse(width,640,eRadius*c,eRadius*c);

  fill(a,a);
//ellipse(width,height/2,eRadius*d,eRadius*d);
//ellipse(0,height,eRadius*c,eRadius*c);
//ellipse(0,0,eRadius*c,eRadius*c);
fill(50,a);
ellipse(width/2,height/2,eRadius*25,eRadius*25);
fill(150,a);
ellipse(width/2,height/2,eRadius*15,eRadius*15);
 fill(255,a);  
 ellipse(width/2,height/2,eRadius*10,eRadius*10);
 fill(random(255),a);
   ellipse(width/2,height/2,eRadius*7,eRadius*7);
   fill(255,a);
  ellipse(width/2,height/2,eRadius*5,eRadius*5);

fill(255,0,0,a);
ellipse(width/2,height/2,eRadius*4,eRadius*4);
 

  eRadius *= 0.95;
  if ( eRadius < 20) eRadius = 20;
  x=x+1;
  t=t+0.01;
  fill(0);
  textFont(myfont);
  textSize(200*noise(x/5,t));

text("BANG",width/2,height/2+25);
if(mousePressed==true){
  println(mouseX);println(mouseY);}
}

