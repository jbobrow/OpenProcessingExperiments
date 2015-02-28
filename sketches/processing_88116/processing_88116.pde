
import ddf.minim.*;
AudioPlayer player; 
Minim minim;
PImage a;

void setup()
{
 size(500, 550, P2D);
  a = loadImage("Important.jpg");
  noLoop(); 
  minim = new Minim(this);
  player = minim.loadFile("bad wolf theme.mp3", 2048);
  player.play();
}
void draw()
{
  image(a, 0, 0);
  for(int i = 0; i < player.left.size()-1; i++)
  {
    line(i, 50 + player.left.get(i)*50, i+1, 50 + player.left.get(i+1)*50);
    line(i, 150 + player.right.get(i)*50, i+1, 150 + player.right.get(i+1)*50);
  }
}
void stop()
{
  player.close();
  minim.stop();
  
  super.stop();
}
