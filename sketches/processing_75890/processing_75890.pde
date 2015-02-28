
int i = 1;	

Ripple myripple;
Vortex myvortex;
Spiral myspiral;
SpiralMath mySpiralMath;

ArrayList vortexes;
ArrayList spirals;
ArrayList spiralMaths;
PImage bg;

import ddf.minim.*;
import ddf.minim.analysis.*;

AudioPlayer song;
Minim minim;//audio context

BeatDetect beat;
BeatListener bl;

void setup(){
  size(1024,729);
  //size(displayWidth, displayHeight);  
  smooth();
  
  frameRate(960);
 
  bg = loadImage("starry-night.png"); 
  background(bg);
  //background(0,174,239);
  noFill();  
  
  minim = new Minim(this);
  song = minim.loadFile("Vincent.mp3", 2048);
  song.play();
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(300);
  bl = new BeatListener(beat, song);
  
  myripple = new Ripple(mouseX*4, mouseY*4);
  spirals = new ArrayList();
  vortexes = new ArrayList();
  spiralMaths = new ArrayList();
}

void draw(){ 
  for (int j = spirals.size()-1; j > 0; j--) { 
    Spiral aSpiral = (Spiral) spirals.get(j);
    //aSpiral.sdisplay(i);
  } 
  for (int h = spiralMaths.size()-1; h > 0; h--) { 
    SpiralMath aSpiralMath = (SpiralMath) spiralMaths.get(h);
    aSpiralMath.smDisplay();
  }
  int sNum = spiralMaths.size()-1;
  int hNum = int(random(sNum));
  if(true){
    
    if ( beat.isSnare() ) {
      background(bg);
      for (int i = spiralMaths.size()-1; i > 0; i--) { 
       SpiralMath spiralMath = (SpiralMath) spiralMaths.get(i);
         spiralMaths.remove(i);
      } 
    }
    if ( beat.isHat()) {
      
    }
    if ( beat.isKick()) {
       SpiralNum = int(random(3,6));
       float posX = random(30,994);
       float posY = random(30, 450);
       for(i=0; i<SpiralNum; i++){
         spiralMaths.add(new SpiralMath(posX, posY));
       }   
    } 
  }
}

int SpiralNum;
void mousePressed () {   
   myripple.wposx = mouseX;
   myripple.wposy = mouseY;
   myripple.rFlag = 1;
   
   for (int i = spiralMaths.size()-1; i > 0; i--) { 
     SpiralMath spiralMath = (SpiralMath) spiralMaths.get(i);
     if(spiralMath.finished()){
       spiralMaths.remove(i);
     }
   } 
   
   SpiralNum = int(random(3,10));
   for(i=0; i<SpiralNum; i++){
     spiralMaths.add(new SpiralMath(mouseX, mouseY));
   }
}

class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;
 
  BeatListener(BeatDetect beat, AudioPlayer source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
 
  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }
 
  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}
class Ripple {
  float wradius, wspeed, wposx, wposy, wstrokeWeight;
  int rFlag;
  Ripple(float tempWposx, float tempWposy){
   wposx = tempWposx;
   wposy = tempWposy;
   wradius = random(20,40);
   wspeed = wradius/3; 
   wstrokeWeight = wradius/4;
   rFlag = 1;
  }
  
  void display(){
      stroke(135, 217, 248, 255-5*rFlag);
      strokeWeight(wstrokeWeight);
      if(rFlag<52 && frameCount%2 == 0){
        ellipse(wposx, wposy, wradius + wspeed*rFlag, wradius + wspeed*rFlag); 
      } else if ( rFlag >= 52) {
       // background(0,174,239); 
      }       
      rFlag++;     
  }
}
class Spiral {
  float sradius,sspeed = 500, sposx, sposy, sstrokeWeight;
  float k;
  float dist = 40, radius = dist/2, alpha = 0, speed = 5000;
  float px, py, x, y;
  
  Spiral(float tempSposx, float tempSposy){
   sposx = tempSposx;
   sposy = tempSposy;
   sstrokeWeight = radius/2;
  }
  void sdisplay(int i){
    stroke(135, 217, 248, 255-i);
    strokeWeight(sstrokeWeight);
    if(true){
    //if(i<52 && frameCount%2 == 0){
      k = sspeed/radius;
      alpha += k;
      radius += dist/(360/k);
      x = radius*cos(radians(alpha));
      y = -radius*sin(radians(alpha));
      //pushMatrix();
      translate(sposx, sposy);
      //translate(width/2, height/2);
      line(px, py, x, y);
      px = x;
      py = y;    
      //popMatrix();
    } else if(i >= 52) {
      
    }
        
    
  }
  
}

class Vortex {
   float vradius, vnum, vspped, vposx, vposy, vstrokeWeight;
   Vortex(float tempVposx, float tempVposy){
    vposx = tempVposx;
    vposy = tempVposy;
    vnum = random(3,10);
    vradius = random(10,30);
    vstrokeWeight = vradius/4;
   } 
   void vdisplay(){
    
    stroke(135, 217, 248);
    strokeWeight(vstrokeWeight);
    
    final float RES = 1.05; // the line length
    PVector spiralCenter = new PVector(vposx, vposy);
    
    float startRadius = 100;
    float endRadius = 20;
    float currRadius = startRadius;
    
    float totalRadian = vnum * PI * 2;
    float startRadian = -PI;
    float endRadian = startRadian + totalRadian;
    float currentRadian = startRadian;
    
    // This depends on the current radius
    float deltaAngle;
    // Spiral starts from outside
    float lastX = cos(startRadian) * startRadius;
    float lastY = sin(startRadian) * startRadius;
    float nextX, nextY;
    
    while (currentRadian < endRadian)
    {
      deltaAngle = PI * RES / currRadius;
      currentRadian += deltaAngle;
      currRadius = map(currentRadian, startRadian, endRadian, startRadius, endRadius);
      
      nextX = cos(currentRadian) * currRadius;
      nextY = sin(currentRadian) * currRadius;
      line(lastX + spiralCenter.x, lastY + spiralCenter.y,
      nextX + spiralCenter.x, nextY + spiralCenter.y);
      lastX = nextX;
      lastY = nextY;
    }
   }
}





class SpiralMath {
 float smPosx, smPosy,a,b;
 float x, y, px, py;
 float smStrokeWeight;
 int flag;
 SpiralMath(float tempSmPosx,float tempSmPosy){
   smPosx = tempSmPosx;
   smPosy = tempSmPosy;
   a = 1;//random(5);
   b = random(0.4,3);
   px = x = smPosx;
   py = y = smPosy;
   flag = 1;
   smStrokeWeight = 2*b;
 }
 void smDisplay(){
  //background(0,174,239);background(16,22,177);
  //stroke(251-(251-16)*flag/360, 255-(255-22)*flag/360, 27-(27-177)*flag/360);
  //stroke(135-135*flag/360, 217-(217-174)*flag/360, 248-(248-239)*flag/360);
  stroke(251,255,27, 255-flag*255/360);
  //stroke(135, 217, 248, 255-flag*255/360);
  //stroke(135, 217, 248);
  strokeWeight(smStrokeWeight);
  if (flag < 360) {
    float angle = 0.1 * flag;
    x = smPosx + (a + b * angle)*cos(angle);
    y = smPosy + (a + b * angle) * sin(angle);
    line(px,py,x, y);
    px = x;
    py = y;
  }
  flag++;
 } 
 
 boolean finished(){
  if((255-flag*255/360)==0) {
     return true; 
  } else {
     return false; 
  }
 }
}


