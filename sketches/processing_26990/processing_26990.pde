

import ddf.minim.*;

Minim minim;
AudioPlayer song;


float diameter = 5;
float space = 10;
float counter = 50;
float distance;

void setup(){
  size (500,500);
  background(0);
    minim = new Minim(this);
    song = minim.loadFile("Chimes.mp3");
    song.play();

}


void draw()
{
  
  background(2);
 for (float x = 0; x < 100; x = x + 1)
  {
    for (float y = 0; y < 150; y = y + 3)
    {
    distance = dist(mouseX,mouseY,5,5);
    fill(255);
  
    if (distance< 100)
    {
      fill (250,243,28);
    }
    if (distance >100)
    {
      fill(168,47,245);
    }
    if (distance >200)
    {
      fill (113,56,2);
    }
    if (distance >300)
    {
      fill (5,77,21);
    }
   ellipse(mouseX,mouseY,25,25);
      ellipse(x * counter, y *space , diameter, diameter);
  }
  }
   
  counter = counter + 0.2;
  

  if (counter > 100)
  {
    counter = 10;
  }

}
void stop()
{
    song.close();
    minim.stop();
    super.stop();
}

