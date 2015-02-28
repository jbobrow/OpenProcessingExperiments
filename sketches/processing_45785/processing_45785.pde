
PImage lupin;
PImage castillo;
import ddf.minim.*;

Minim minim;
AudioSample kick;

 
float xpos;
float ypos;
float drag = 30;
 
void setup() {
  size(700, 472);
  lupin = loadImage("lupin.gif");
  castillo = loadImage ("castillo1.jpg");
  xpos = width/2;
  ypos = height/2;
  minim = new Minim(this);
  // load BD.mp3 from the data folder with a 1024 sample buffer
  // kick = Minim.loadSample("BD.mp3");
  // load BD.mp3 from the data folder, with a 512 sample buffer
  kick = minim.loadSample("lupin.mp3", 2048);

}
 
void draw() {
  background (castillo);
   
  float difx = mouseX - xpos-lupin.width/2;
  if (abs(difx) > 1) {
    xpos = xpos + difx/drag;
    xpos = constrain(xpos, 0, width-lupin.width);
  } 
   
  float dify = mouseY - ypos-lupin.height/2;
  if (abs(dify) > 1) {
    ypos = ypos + dify/drag;
    ypos = constrain(ypos, 0, height-lupin.height);
  } 
   
  // Display the sprite at the position xpos, ypos
  image(lupin, xpos, ypos);
  for (int i = 0; i < kick.bufferSize() - 1; i++)
  
 
 {
    //line(i, 100 - kick.left.get(i)*50, i+1, 100 - kick.left.get(i+1)*50);
 }
  }
void keyPressed()
{
  if ( key == 'k' ) kick.trigger();
}

void stop()
{
  // always close Minim audio classes when you are done with them
  kick.close();
  minim.stop();
  
  super.stop();

}


