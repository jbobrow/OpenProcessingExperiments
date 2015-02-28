

/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/120611*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

var audio1 = new Audio("Shook.mp3");

void setup() {
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
      audio1.loop = true;
      audio1.play();
    }
    else
    {
      audio1.pause();
    }
  }
}



