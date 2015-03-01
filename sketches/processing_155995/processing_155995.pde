
PImage doge;
PImage cage;

float tintR;
float tintG;
float tintB;

float headWidth;
float headHeight;

float dogeX=300;
float dogeY=0;
float dogeSize = 50;

float speedY=10;

void setup(){
  size (600,600);
  background(0);
  doge=loadImage("doge.png");
  cage=loadImage("cage.png");
}

void draw(){
  background(0);
  tintR=map(mouseX,0, width, 0, 255);
  tintG=map(mouseY,0, height, 0, 255);
  tintB=map(frameCount,0,300,0,255);
  
  headWidth=map(mouseX, 0, width, 0,400);
  headHeight=map(mouseY,0, width,0, 550);
  
 
  
  float freq = map(mouseX,0,10000, 0.001,0.1);
  float scale = map(sin(mouseY*freq),-1,1,150,450);
     
  pushMatrix ();
  tint(tintR,tintG,tintB);
  imageMode(CENTER);
  translate(width/2,height/2);
  rotate(radians(frameCount*0.5));
  image(cage,0, 0, scale + sin(frameCount*0.1)*100, scale);
  
  pushMatrix ();
  translate(width/2, height/5 - frameCount/10);
  rotate(radians(-frameCount*0.7));
  //textSize(20);
  PFont font;
  font = loadFont("ExocetLight-48.vlw");
  textFont(font,22);
  text("IM GOING TO STEAL THE DECLARATION OF INDEPENDENCE", 0,0);
  fill (255,255,204);
  
  
  popMatrix();
  popMatrix();

   tint(255);
   
   dogeX=(dogeX+1) %800;
   dogeY=dogeY+speedY;
    dogeY= dogeY+ speedY;
      if (dogeY>height-dogeSize) {
        dogeY= height-dogeSize;
        speedY = speedY * -0.9;
      }
      else if (dogeY <=0) {
        speedY = -speedY;
      }
     image(doge,dogeX,dogeY,dogeSize+dogeY*0.1,dogeSize+dogeX*0.1);
  
  
}


