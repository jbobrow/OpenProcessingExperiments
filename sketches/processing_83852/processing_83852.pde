
PImage i;
import ddf.minim.*;
AudioPlayer player;
Minim minim;
float X;


void setup(){
  size(1280, 800, P3D);
  X=0;
  minim = new Minim(this);
  player = minim.loadFile("Chipmunk party.mp3", 2048);
  player.play();
}

void draw(){
  background(0,0,200);
  i=loadImage("2.png");
    image(i,0,80,1280,720);
 frameRate(8);
  directionalLight(255,0,0,0,0,-2);
  noStroke();
  for(int i=0; i<12; i++){
    pushMatrix();
    translate((i+1)*100,height/2);
    X+=1;
    if(X>360) X=0;
    rotateX(radians(X));
    rotateY(radians(X));
  for(int i2=0; i2<player.left.size()+15; i2+=400){
    //box(random(100), random(100),10);
    //box(20,player.bufferSize(),0);
    //box(player.left.get(i)*1000,3,player.right.get(i)*2000);
    box(player.right.get(i)*2000,player.left.get(i)*1000,3);
   
  
  }
    popMatrix();
 }
}

void stop(){
  player.close();
  minim.stop();
  super.stop();
}

