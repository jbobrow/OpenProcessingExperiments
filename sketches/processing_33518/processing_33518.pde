
//Eye taken from: http://www.easy-drawings-and-sketches.com/manga-eyes.html

PImage Back;
PImage Lid;
PImage Eye;
PImage BlueEye;

void setup()
{
  size(340,247);
  background(255);
  Back = loadImage("Back.png");
  Lid = loadImage("Lid.png");
  Eye = loadImage("Eye.png");
  BlueEye = loadImage("BlueEye.png");
}

void draw()
{
  if(mouseX >=77 && mouseX <= 269 && mouseY >=96 && mouseY <= 220) {
    image(Back,34,73);
    image(BlueEye, mouseX-58, 91.5);
    image(Lid,0,0);
  } else {
    image(Back,34,73);
    image(Eye, mouseX-58, 91.5);
    image(Lid,0,0);
  }
}

