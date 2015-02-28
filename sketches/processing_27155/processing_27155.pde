
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer deadSound;
AudioPlayer aliveSound;

int segments = 50;
ArrayList<Float> xCoords; 
ArrayList<Float> yCoords;

int spike = segments-10;

void setup(){
  size(500, 500);
  smooth();
  frameRate(20);
  
  m = new Minim(this);
  
  deadSound = m.loadFile("dead.wav");
  aliveSound = m.loadFile("alive.wav");
    
  xCoords = new ArrayList();
  yCoords = new ArrayList();
  int i = 0;
  while(i <segments){
    float newX = (width/segments) * i;
    xCoords.add(newX);
    yCoords.add(new Float(250));
   
    i = i + 1;
  }
}
  
float y = 250;
  
  
void draw (){
  background(0);
  stroke(252, 36, 239);
  strokeWeight(4); 
  
  println(y);
  
  if (deadSound.isPlaying() && y != 250) {
    deadSound.pause();
    deadSound.rewind();
    aliveSound.loop();
  } else if (!deadSound.isPlaying() && y == 250) {
    deadSound.loop();
    aliveSound.pause();
    aliveSound.rewind();
  }
  
  for (int k = 0; k < segments-1; k++){
         
    yCoords.set(spike-2, y);
    yCoords.set(spike, width-y);
    yCoords.set(spike+1, 250.0);
    
    stroke(252, 36, 239);
    line (xCoords.get(k+1), yCoords.get(k+1)-30, xCoords.get(k),yCoords.get(k)-30);
      
    stroke(255);
    line (xCoords.get(k+1), yCoords.get(k+1)+30, xCoords.get(k+1),yCoords.get(k+1)+30);
  }
    
  if (spike >=3){
    spike -=2;
      
  } else {
    spike = 48;
    yCoords.set(0, 250.0);
    yCoords.set(0, 250.0);
  }
  
  y = 250;
}

void mouseMoved(){
  y = mouseY;
  
}


