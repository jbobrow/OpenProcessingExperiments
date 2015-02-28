

var audio1 = new Audio("Shook.mp3");

void setup() {
  background(255, 0, 0);
  size(300, 300);

}

void draw()
{
  background(0);
 
}

void keyReleased() 
{
  if(key == ' ')
  {
    if (audio1.paused == true)
    {
      audio1.currentTime = 200;
      audio1.play();
    }
    else
    {
      audio1.pause();
    }
  }
}



