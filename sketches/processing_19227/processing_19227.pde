
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
AudioPlayer player;
Minim minim;
 
void setup (){
   size(250,250);
   minim = new Minim(this);
  player = minim.loadFile("voyage.mp3", 2400);
  player.play();
}
 
void draw (){
   background(0);
   strokeWeight(2);
  stroke(255,10,100,80);
  for(int i = 0; i < player.left.size()-1; i++)
  {
    
   line(i, 50 + player.left.get(i)*50, i+1, 50 + player.left.get(i+1)*50);
 
    line(i, 150 + player.right.get(i)*50, i+1, 150 + player.right.get(i+1)*50);
    
}
   
   
}
  void keyPressed (){
     
      strokeWeight(6);
      stroke(0,126,255,255);
       for(int i = 0; i < player.left.size()-1; i++)
  {
    rotate(PI/30);
     line(i, 50+player.left.get(i)*50, i+1, 50 + player.left.get(i+1)*50);
 line(i, 150 + player.right.get(i)*50, i+1, 150 + player.right.get(i+1)*50); 
  }
    }
void mousePressed(){
  noFill();
strokeWeight(1.3);
stroke(180,240,10);
 for(int i = 0; i < player.left.size()-1; i++)
 {
   rotate(PI/60);
 line(i, 50+player.left.get(i)*50, i+1, 50 + player.left.get(i+1)*50);
 line(i, 150 + player.right.get(i)*50, i+1, 150 + player.right.get(i+1)*50);
 {
 }
 }
}

