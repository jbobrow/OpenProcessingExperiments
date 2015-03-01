
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioSample sofia;
float x = 0;
float a = 10.2;
float b = 3.5;
float c = 4.2;
float cSpeed = 1.1;
float bSpeed = 1.2;
float radiusMe=10;
float radius= 20;
float distance = dist (a,b,radiusMe,radius);




void setup() {
  size(300, 400);
  minim = new Minim(this);
  sofia= minim.loadSample("sofia.mp3");
}

void draw() {
  background(0, 10, 200);
  b = b+ bSpeed;
  ellipse( a, b, radius*2, radius*2);

  b = b+ bSpeed;
  c = c+cSpeed;
  ellipse(c, b, radiusMe*2, radiusMe*2);


  if (distance < radius+radiusMe){
    fill(255,0,0);
    sofia.trigger();
     radius = random(width);
    radiusMe = random(height);
  }else{
    fill(255);
  }
  if( b>400){
    bSpeed = -1 * bSpeed;
  }
    if(b<0){
    bSpeed =-1 *bSpeed  ;
  
  }
  if(c>width){
  cSpeed = -1 * cSpeed ;
  }
  
  if(c<0){
    float seed = .3;
  cSpeed = -1 * cSpeed * (random(2) - 1);
  }
}


void mousePressed() {
  a = 10.2;
  b = 3.5;
  c= 4.2;
}



