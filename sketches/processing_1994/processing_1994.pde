
import processing.video.*;
import ddf.minim.*;

AudioPlayer player;
Minim minim;

void setup()
{
  size(600,450,P2D);
  minim = new Minim(this);
  player = minim.loadFile("Navoevertospeakwithamico.mp3", 2048);
  player.play();
}

void draw()
{
  background(0);
  stroke(255);
  for(int i = 0; i < player.left.size()-1; i++)
  {
    line(i, 50 + player.left.get(i)*50, i+1, 50 + player.left.get(i+1)*50);
    stroke(123,45,69);
    line(i, 100 + player.left.get(i)*50, i+1, 600 + player.left.get(i+1)*50);
    stroke(130,50,75);
    line(200, 50 + player.left.get(i)*10, i+1, 50 + player.left.get(i+1)*50);
    stroke(230,35,67);
    line(400, 300 + player.left.get(i)*10, i+1, 50 + player.left.get(i+1)*50);
    line(i, 150 + player.right.get(i)*50, i+1, 150 + player.right.get(i+1)*50);
    stroke(230,65,80);
    line(150, 150 + player.right.get(i)*50, i+1, 150 + player.right.get(i+1)*50);
  }
}


