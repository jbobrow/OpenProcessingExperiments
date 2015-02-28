
PImage i;
import ddf.minim.*;
AudioPlayer player;
Minim minim;
float X;

void setup(){
  size(750, 800, P3D);
  X=0;
  minim = new Minim(this);
  player = minim.loadFile("Aphex Twin Mix.mp3", 2048);
  player.play();
}

void draw(){
  background(0,0,200);
  i=loadImage("text.png");
    image(i,0,0,750,800);
  smooth();
  directionalLight(255,0,0,0,0,-2);
  noStroke();
  for(int i=0; i<4; i++){
    pushMatrix();
    translate((i+1)*150,height/2);
    X+=1;
    if(X>360) X=0;
    rotateX(radians(X));
    rotateY(radians(X));
  for(int i2=0; i2<player.left.size()-5; i2+=100){
    //box(random(100), random(100),10);
    box(player.right.get(i)*200,player.right.get(i)*1500,player.left.get(i)*10);
    box(player.right.get(i)*100,player.right.get(i)*10,player.left.get(i)*200);
  }
    popMatrix();
 }
}

void stop(){
  player.close();
  minim.stop();
  super.stop();
}

