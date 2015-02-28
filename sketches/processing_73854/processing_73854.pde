
import ddf.minim.*;
 
AudioPlayer player;
Minim minim;
 
void setup()
{
  size(512, 200);
 
  minim = new Minim(this);
   

  player = minim.loadFile("here comes the minuto.mp3", 2048);
 
  player.play();
}
 
void draw()
{
  background(0);
  stroke(random(255),random(255),random(255));
  

  
  for(int i = 0; i < player.left.size()-2; i++)
  {
    line(i, 50 + player.left.get(i)*200, i+1, 50 + player.left.get(i+1)*50);
    line(i, 150 + player.right.get(i)*500, i+1, 150 + player.right.get(i+1)*50);
 
   
  }
}
 
 
 



  
 
 

