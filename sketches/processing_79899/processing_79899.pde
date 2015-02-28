
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
AudioPlayer audio;
Minim minim;

float cx1,cy1,cx2,cy2;

void setup(){
  size(400,400);
  noFill();
  smooth();
  background(255);
  strokeWeight(5);
  minim=new Minim(this);
  audio=minim.loadFile("music.mp3");
  audio.play();
  frameRate(10);
}

void draw(){
  background(255);
  cx1=random(-100,0);
  cy1=random(-200,200);
  cx2=random(0,100);
  cy2=random(-200,200);
  
  if(pow(pow(cx1,2)+pow(cy1,2),1/2)<=200)
  {
    if(pow(pow(cx2,2)+pow(cy2,2),1/2)<=200)
    {
      stroke(random(0,250),random(0,250),random(0,250));
      bezier(10,200,cx1+200,cy1+200,cx2+200,cy2+200,390,200);
    }
  }
  stroke(0,0,0);
  arc(200,200,390,390,0,TWO_PI);
  
  
   if(pow(pow(cx1,2)+pow(cy1,2),1/2)<=200)
  {
    if(pow(pow(cx2,2)+pow(cy2,2),1/2)<=200)
    {
      stroke(random(0,250),random(0,250),random(0,250));
      bezier(200,10,cx1+200,cy1+200,cx2+200,cy2+200,200,390);
    }
  }
  stroke(0,0,0);
  arc(200,200,390,390,0,TWO_PI);
}
