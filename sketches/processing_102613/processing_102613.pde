
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


Maxim maxim;


int initialRadius, radius=10;
var draw = false;
AudioPlayer player1;
var circles={};

void setup()
{
  background(color(102, 102, 0));
  size(640, 960);
  maxim = new Maxim(this);
   player1 = maxim.loadFile("sound1.wav");
  player1 = maxim.loadFile("mykbeat.wav");
  player1.setLooping(true);


}

void draw()
{
// code that happens every frame
 }

void mouseDragged()
{
// code that happens when the mouse moves
// with the button down
}

void mouseMoved() {
  if (draw) {
    ellipse(mouseX, mouseY, radius, radius);
  }

}
void mousePressed()
{
// code that happens when the mouse button
// is pressed
}

void mouseReleased()
{
 draw = !draw;
  
  if (draw) {
    player1.play();
  } else {
    player1.stop();
  }
}

function Circle(int x, int y, int radius) {
  this.x = x;
  this.y = y;
  this.radius = radius;
}


