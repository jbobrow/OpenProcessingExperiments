
////////////////////////////////////////////////
// This sketch is base on the work of
// openprocessing users for the base of sphere.
// I made it sound reactable.
////////////////////////////////////////////////

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer jingle;
FFT         fft;
float velocityX = 0;
float velocityY = 0;

////////////////////////////////////////////////

int shakeNum = 100;
ArrayList ms;
Sphere one;

////////////////////////////////////////////////

void setup(){
  size(800,800,P3D);
  minim = new Minim(this);
  jingle = minim.loadFile("chrome.mp3", 1024);
  jingle.loop();
  //grid = loadImage("grid.png");
  one = new Sphere(new PVector(width/2,height/2,0),200,color(255));

  ms = new ArrayList();

  noiseSeed(19);
   fft = new FFT( jingle.bufferSize(), jingle.sampleRate() );

}


////////////////////////////////////////////////

void draw(){
  background(0);
  int x = (int)random(3);
  int y = (int)random(3);
  fft.forward( jingle.mix );
  
  for(int i = 0 ; i < ms.size();i++){
    MicroShake tmp = (MicroShake)ms.get(i);
    tmp.shake();
  }
  one.draw();
}


////////////////////////////////////////////////

/*
 * camera shaker class
 */

class MicroShake{

  float amp;
  float speed;
  int id;

  MicroShake(int id,float _amp,float _speed){
    amp = _amp;
    speed = _speed;
  }

  void shake(){
    translate(
        (0.5-noise((id*1.0+frameCount)/speed,0,0))*amp,
        (0.5-noise(0,(id*1.0+frameCount)/speed,0))*amp,
        (0.5-noise(0,0,(id*1.0+frameCount)/speed))*amp
        );
  }

}

/*
 * deformed sphere class
 *
 */

////////////////////////////////////////////////
class Sphere{
  PVector pos;
  float radius;
  float density;
  color c;

  Sphere(PVector _pos, float _rad,color _c){
    pos = new PVector(_pos.x,_pos.y,_pos.z);
    radius = _rad;
    density = 6.0;
    c = _c;
  }

  void draw(){

    
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
    
    float d = noise(frameCount/300.0)*3000.0;
    density = noise(frameCount/313.0)*5.0+3.0;


   // Use this velocityX and velocityY value to get a rotation 
   //velocityX += (mouseY) * 0.01;
   //velocityY -= (mouseX) * 0.01;// Rotation rapide cool
   
   velocityX += (mouseX-pmouseX) * 0.01;
   velocityY -= (mouseY-pmouseY) * 0.01;
   //rotateX(velocityX);
   //rotateY(velocityY);
    rotateX(mouseY*1.0f/height*TWO_PI);
    rotateY(mouseX*1.0f/width*TWO_PI);
    for(float f =0 ; f < d; f += density){
       for(float ff = -90 ; ff < 90; ff += density){
        if(fft.getBand(40)>5){
          stroke(255,0,0);
          fill(255,0,0);
        }
        else{
          stroke(255);
        }
        float x = cos(radians(f)*(fft.getBand(40)/6))*radius*cos(radians(ff)*(fft.getBand(40)/6));
        float y = sin(radians(f*(fft.getBand(40)/6)))*radius*cos(radians(ff*(fft.getBand(40)/6)));
        float z = sin(radians(ff*(fft.getBand(40)/6)))*radius;

///// Some other value for y,z to get some different shape///
     
        //float y = sin(radians(f))*radius*cos(radians(ff)); Graphique
        //float z = sin(radians(ff))*radius; tube
        //float deform = noise((frameCount+lerp(f,ff,noise((frameCount+ff)/222.0)))/300.0)*1.33;
        //float deform = fft.getBand(40)/6;
//////////////////////////////////////////////////////////////
      
       strokeWeight(1);
       point(x,y,z); 
      }
    }

    axis();
    popMatrix();

  }

  void axis(){
    stroke(255,20);
    strokeWeight(3);
    line(-200,0,0,200,0,0);
    line(0,-200,0,0,200,0);
    line(0,0,-200,0,0,200);

  }

}


