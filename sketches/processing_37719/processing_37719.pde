
import ddf.minim.*;

AudioPlayer player;
Minim minim;


void setup(){
  size(600, 400, P2D);

  minim = new Minim(this);
  player = minim.loadFile("March.mp3", 2048);
  player.play();

}

void draw(){
  background(255);
  noStroke();
  for(int i = 0; i < player.left.size()-1; i+=15){
   fill(255,0,0,100);  
   ellipse(i,height/2+player.right.get(i)*150,20,20);
   fill(0,255,0,100);  
   ellipse(i,height/2+player.right.get(i)*100,15,15);
   fill(0,0,255,100);  
   ellipse(i,height/2+player.right.get(i)*50,10,10);
  }
}

void stop(){
  player.close();
  minim.stop();
  
  super.stop();
}

