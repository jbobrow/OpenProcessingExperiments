
import ddf.minim.*;
  
AudioPlayer player;
Minim minim;
  
void setup()
{
  size(800, 500);
  
  minim = new Minim(this);
    
 
  player = minim.loadFile("Madness.mp3", 3000);
  
  player.play();
}
  
void draw()
{
  background(0);
  stroke((0),(5),random(255));
   
 
   
  for(int i = 0; i < player.left.size()-8; i++)
  {
    line(i, 0 + player.left.get(i)*200, i+1, 50 + player.left.get(i+1)*50);
    line(i, 200 + player.right.get(i)*500, i+1, 150 + player.right.get(i+1)*50);
  
    
  }
}
  


