

import ddf.minim.*;
import ddf.minim.signals.*;
//import ddf.minim.effects.*;
 

float ballX, ballY; 
float difX, difY; 
float friction = 0.01; 
float bounce = 1;
boolean bUp = true;

int sptAmount = 35;
float [] bncx = new float [sptAmount];
float [] bncy = new float [sptAmount];
int sptCount = 1; 


Minim minim;
Minim m;
AudioSample kick;
AudioOutput out;
SineWave sine;

float freq = 0;
float pan = 0;

 
void setup(){
  size(500, 500);
  background(230);
  
   minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 2048);
  sine = new SineWave(0, 0.5, out.sampleRate());
  out.addSignal(sine);
   m = new Minim(this);
  kick = m.loadSample("kick.wav",2048);
  if (kick == null)println("didnt load");
  
    for (int i = 0; i > sptAmount; i++){
    bncx[i] = width/2;
    bncy[i] = height/2;    
  }

  
  mouseX = width/2;
  mouseY = height/2;

  ballX  = width/2;
  ballY  = height/2;
   
   

  smooth();
}
 
void draw(){
  background (230);
  
  difX = mouseX - ballX;
  difY = mouseY - ballY;  

  ballX += difX * friction;
  ballY += difY * friction;

  
  for (int j= 0; j < sptAmount; j++){
    noStroke();
    

    
  } 
  stroke (0);
  strokeWeight(4);
  
  
  for (int c = 0; c < sptAmount; c ++){
    if (c >= 1 ){
      if (c == sptCount ){
        noStroke();
        
      }else{
        stroke(0);
        
      }
      line (bncx[c],bncy[c],bncx[c-1],bncy[c-1]);
      
    } else {
      if (c== sptCount || sptCount == sptAmount){
        noStroke();
      }else {
        stroke(0);
        ellipse(bncx[sptAmount-c-1],bncy[sptAmount-c-1],freq/10,freq/10);
        
      }
      line (bncx[c],bncy[c],bncx[sptAmount-1],bncy[sptAmount-1]);
    }

  }
 
  sine.setFreq(freq);
  sine.setPan(pan);
  ball(ballX, ballY);
  
  stroke(0);
  
  noFill();
  //ellipse(mouseX, mouseY, 20, 20);
}
 
void ball(float x, float y){
  
  noStroke();
   
// Clac the dist between ball and mouse
  float d = dist(ballX, ballY, mouseX, mouseY);
  
  
 
 //Bounce lower when close to mouse
  if (bUp){
    bounce +=(30*friction);
  }else{
    bounce -=(30*friction);
  }
  if (bounce >= d/15){
    bUp = false;
  }
  if (bounce <= 1 && bUp == false){
    bUp = true;
    background(255);
    kick.trigger();
    if (sptCount < sptAmount){
      bncx[sptCount] = ballX;
      bncy[sptCount] = ballY;
      if (sptCount < sptAmount-1){
        freq = bncx[sptCount+1];
        pan = map(bncx[sptCount+1],0,width,-1,1);
       }else if (sptCount == sptAmount-1){
      freq = bncx[0];
      pan = map(bncx[0],0,width,-1,1);
      }
    }else{
      sptCount = 0;
      bncx[sptCount] = ballX;
      bncy[sptCount] = ballY;
      freq = bncx[1]/2 +100;
      pan = map(bncx[1],0,width,-1,1);
    }
    sptCount++;
    
  }
  
  fill(0,100);
  ellipse(x+bounce*2, y+bounce*2, 10+bounce, 10 +bounce ); 
  //rect (
  
  fill(0);
  ellipse(x, y, 10+bounce, 10 +bounce );
  fill (255);
  ellipse(x-bounce*6, y-bounce*6, 3+(bounce/3), 3+(bounce/3) );
  
 
  
}
void stop()
{
 
  out.close();
  minim.stop();
 
  super.stop();
}







