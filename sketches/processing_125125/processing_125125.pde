
//import ddf.minim.spi.*;
//import ddf.minim.signals.*;
//import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.ugens.*;
//import ddf.minim.effects.*;
//Minim minim;
//AudioPlayer Waves;
//AudioPlayer laugh;

PImage ghost1;
PImage Ghost2;
PImage ghost36;
PImage ghost37;
int stepX;
int stepY;

void setup(){
  size(800,800);
  background(0);
  ghost1=loadImage("ghost1.jpg");
  Ghost2=loadImage("Ghost2.jpg");
  ghost36=loadImage("ghost36.jpg");
  ghost37=loadImage("ghost37.jpg");
 // minim=new Minim(this);
 // Waves=minim.loadFile("Waves.wav");
 // Waves.play();
 // minim=new Minim(this);
  //laugh=minim.loadFile("laugh.wav");
  
  
  
  
}
void draw(){
  image(ghost36,0,0,100,100);
  image(ghost37,110,110,200,200);
  image(ghost1,250,250,300,300);
  image(Ghost2,400,400,500,500);
  colorMode(HSB,width,height,100);
  stepX=mouseX+20;
  stepY=mouseY+20;
  for (int gridY=0;gridY<height;gridY+=stepY){
    for(int gridX=0;gridX<width;gridX+=stepX){
      noStroke();
      fill(gridX,gridY,stepX,stepY);
      ellipse(gridX,gridY,stepX,stepY);
      rect(gridX,gridY,stepX,stepY);
    }
    }
    
}
//void keyReleased(){if(key=='s')
//augh.play();


//}


