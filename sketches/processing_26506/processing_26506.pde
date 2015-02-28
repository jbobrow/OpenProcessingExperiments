
PImage l;  
PImage c;
import ddf.minim.*;

AudioPlayer player;
Minim minim;

void setup() {
  size(600,450);
   stroke(0);
  smooth();
  l = loadImage("dearGod.jpg"); 
  image(l,0,0); 
     minim = new Minim(this);
player = minim.loadFile("icanonlyimagine.mp3");
 player.play();
  player.loop(2000);
}

void draw(){
  
  fill(0);
   if(mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  delay(20);

  
if(key=='w')
stroke(#1a1d2b);
 line(mouseX, mouseY, pmouseX, pmouseY);
  
}
/*d to delete*/
if(key=='d'){
   l = loadImage("dearGod.jpg"); 
  image(l, 0, 0); 
} 

}


