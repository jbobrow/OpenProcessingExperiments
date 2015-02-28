
import ddf.minim.*;

AudioPlayer player;
Minim minim;

float X;

void setup(){
  size(600, 400, P3D);
  X=0;

  minim = new Minim(this);
  
  player = minim.loadFile("Resistance.mp3", 2048);
  player.play();
}

void draw(){
  background(0);
  directionalLight(255,0,0,0,0,-1);
  noStroke();
  
  for(int i=0; i<3; i++){
    pushMatrix();
    translate((i+1)*150,height/2);
    X+=3;
    if(X>360) X=0;
    rotateX(radians(X));
    rotateY(radians(X));
  for(int i2=0; i2<player.left.size()-1; i2+=100){
    box(player.right.get(i)*200,player.right.get(i)*200,player.left.get(i)*200);
  }
    popMatrix();
 }
}

void stop(){
  player.close();
  minim.stop();
  
  super.stop();
}

