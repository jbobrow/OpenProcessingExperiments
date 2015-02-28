
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


Maxim maxim;
AudioPlayer player;

void setup()
{
size (640, 480);
background (50, 255, 200);
maxim = new Maxim(this);
player = maxim.loadFile("compwarbles.wav");
player.setLooping(true);
}

void draw()
{
// code that happens every frame
}

void mouseDragged()
{
fill (100, 200, 255, 200);  
rect (mouseX, mouseY, 50, 50);  
// code that happens when the mouse moves
// with the button down
}

void mousePressed()
{
// code that happens when the mouse button
// is pressed
  player.cue(0);
  player.play();
}

void mouseReleased()
{
// code that happens when the mouse button
// is released
player.stop();
}



