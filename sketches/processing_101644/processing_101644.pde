
Maxim maxim;
AudioPlayer player;

void setup()
{
  size(200, 200);
  
  background(0);
  maxim = new Maxim(this);
  player = maxim.loadFile("mykbeat.wav");
  player.setLooping(false);
 
}

void draw()
{
// code that happens every frame
}

void mouseDragged()
{
// code that happens when the mouse moves
// with the button down
  //player.cue(0);
  
}

void mousePressed()
{

// code that happens when the mouse button
// is pressed
  player.play();

}

void mouseReleased()
{
// code that happens when the mouse button
// is released
  player.stop();
}





