
/*
Breathing sound randomly generates boxes that flies through a 3d space on generation a midi sound will be generated and played 
 
 Controls: 
 Mouse pressed and moved = generate new boxes
 r = new random MIDI instrument
 l= lines on and off
 
 Made by David Sjunnesson 2010 Malmo Sweden
 */
import processing.opengl.*;
import arb.soundcipher.*;

// Declare a "Thing" object
ArrayList things;
int pos=0;
float speed=0.09;
float acceleration=0.01;
int maxSounds=500;

//sound stuff
SoundCipher sc = new SoundCipher(this);
int instrumentNr=1;
int oldInstrument=0;
int instrumentNrMax=3;
int sensorVal;
int val;      // Data received from the serial port
boolean drawLines=false;
void setup() {

  size(600,600,OPENGL);
  // size(screen.width,screen.height,OPENGL);
  smooth();
  things=new ArrayList();
  noStroke();
}

void draw() {
  background(0);
  noStroke();
  lights();
  //pointLight(51, 102, 126, 35, 40, 36);

  //  println(frameRate);
  // println(things.size());
  for(int p=0;p<things.size();p++){
    Thing t=(Thing)things.get(p);
    // Run the Thing object
    t.go();
    float lifeLeft=t.getLife();
    if(lifeLeft<1){
      things.remove(p);
    }
  }
  if(drawLines){
    for(int p=0;p<things.size()-1;p++){
      Thing t=(Thing)things.get(p);
      Thing t2=(Thing)things.get(p+1);
      stroke(255,t.getLife());
      line(t.getX(),t.getY(),t.getZ(),t2.getX(),t2.getY(),t2.getZ());
    }
  }
}
void mouseDragged(){
  addSound(1);
}
void addSound(int nrSounds){
  if(things.size()<maxSounds){
    for(int i =0;i<nrSounds;i++){
      color ballColor=color(0,0,0);
      ballColor = color(random(255),random(255),random(255));
      //ballColor=color(255);
      PVector a = new PVector(random(-acceleration,acceleration),random(-acceleration,acceleration),random(-acceleration,acceleration));
      PVector v = new PVector(random(-speed,speed),random(-speed,speed),random(-speed,speed));
      PVector l = new PVector(random((width/2)-50,(width/2)+50),random((height/2)-50,(height/2)+50),random(-500,200));
      float soundLife=random(200,255);
      things.add(new Thing(a,v,l,ballColor,1,soundLife,random(20,60)));
      sc.playNote((int)random(0,127), (int)random(60,127), soundLife);
    }
  }
}

void keyReleased(){
  if(key=='l'){
    drawLines=!drawLines; 
  }
  else{
    setInstrumentKey(key);
  }
}
void setInstrumentKey(char nr){
  switch(nr){
  case '1': 
    sc.instrument(sc.TELEPHONE);  
    println("Telephone"); 
    break;
  case '2': 
    sc.instrument(sc.SPACE_VOICE);
    println("Space voice"); 
    break;
  case '3': 
    sc.instrument(sc.XYLOPHONE);
    println("XYLOPHONE"); 
    break;
  case 'r': 
    int randInstr=(int)random(1,127);
    sc.instrument(randInstr);
    println("Random: "+randInstr); 
    break;
  default:             // Default executes if the case labels
    sc.instrument( 127);
    println("Default");   
    break;
  } 
}
void stop(){
  sc.stop(); 
}





































