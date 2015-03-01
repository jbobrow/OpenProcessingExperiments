
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

AudioPlayer player;
Minim minim;

// variables - placement of x, y and size ... 
int baller = 200; 
float [] ballsize = new float [baller];
float [] xPos = new float [baller];
float [] yPos = new float [baller]; 
float [] xSp = new float [baller];
float [] ySp = new float [baller];

// size of the window
void setup (){
  size (600,600);
  minim = new Minim(this);
  player = minim.loadFile("Call.mp3", 2048);
  player.play();
// there is no structure, but random allows spontaneous movement and size
  for (int i=0; i<baller; i++){
    ballsize [i] = random(10,100);
    
// places the circles in random places of the window    
    xPos [i] = random(0, width);
    yPos [i] = random(0, height); 
    
// creates the speed at which the circles will move   
    xSp [i] = random(-2,2);
    ySp [i] = random(-2,2);
  }
  
}

void draw (){ 
  background (0);
  
// for loop is still confusig but used a simple sample from class  
  for (int i=0; i<baller; i++){
    
// creates the movement of the cirlces  
    xPos [i] += xSp [i];
    yPos [i] += ySp [i];
    
// the properties of the circles    
    smooth();
    fill(255,153,204,70);
    noStroke();
    ellipse(xPos[i], yPos[i], ballsize[i], ballsize[i]);
  }
  
}
void mousePressed(){
  stop();
}

void stop()
{
  player.close();
  minim.stop();
  super.stop();
}
  


