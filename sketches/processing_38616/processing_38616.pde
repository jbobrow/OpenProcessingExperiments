
import ddf.minim.*;

AudioPlayer player;
Minim minim;

void setup(){
  size(600,400);
  minim = new Minim(this);
  player = minim.loadFile("08 - in the morning.mp3",1024);
  player.play();
}

void draw(){
  background(0);
  stroke(#14877f);
  for(int i=0; i<player.left.size()-1; i++){
    strokeWeight(abs(player.left.get(i)*20));
    line(i,100+player.left.get(i)*70,i+1, 100 + player.left.get(i+1)*70);
    line(i,200+player.right.get(i)*70,i+1,200 + player.right.get(i+1)*70);
  }
}

  

