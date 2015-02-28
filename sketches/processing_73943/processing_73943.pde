
 import ddf.minim.*;
 
AudioPlayer player;
Minim minim;
 
void setup()
{
  size(500, 500);
 
  minim = new Minim(this);
   

  player = minim.loadFile("here comes the minuto.mp3", 2048);
 
  player.play();
}
 
void draw()
{
  background(0);
  
  frameRate(2);
  stroke(random(150),random(150),random(150));

  
  for(int i = 0; i < player.left.size()-2; i++)
  {
    
    rotate(0.2);
    
    random(height,width);
    
    rect(i, 0,20,5 + player.left.get(i)*200, i+1, 50 + player.left.get(i+1)*50);
    rect(i, 150 + player.right.get(i)*500, i+1, 150 + player.right.get(i+1)*50);
    ellipse(random(height),random(width),100,100);
   
  }
}
 
 
 



  
 
 

