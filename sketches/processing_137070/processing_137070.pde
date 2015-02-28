
/* Final Project (weeek 5) of Svitlana Kuchmagra 02.03.2014
--------------------------------------
  "Make your own crazy world!"
  Standard program to write with a mouse. Just drag a mouse, and on the places, where move it, mouse will drive.
  I updated standart drawing : your mouse will be crazy and will drive with all possible colours and forms.
  You can add a nice smily to your "crazy world" by pressing "i" on the Keyboard.
  You can save your  "crazy world" by pressing "s".
  To destroy your "crazy world" press a key "del" or "backspace".
*/

// global variables
color strokeColor = color(0,10);
int hue = 0;
int saturation = 100;
int brightness = 50;
PImage smileImage;

//setup
void setup()
{
  size(800, 600);
  colorMode(HSB, 360, 100, 100);
  noFill();
  background(360);
  smileImage = loadImage("smile.jpg");
}

// draw
void draw()
{
  if (mousePressed)
  {
    pushMatrix();
    
    // drawing in mouse position
    translate(mouseX, mouseY);
    
    // use hue-value also for scale
    scale(1+hue*0.1);
    hue++; 
    saturation = saturation - 2;
    brightness= brightness+5;
    
    // change hue, saturation, brightness
    if (hue>100)
      hue = 0;
    if (saturation == 0)
      saturation = 100;
    if (brightness>100)
      brightness = 50;
    
    // style 
    strokeWeight(1+saturation*0.1);
    stroke(hue, saturation, brightness, strokeColor);
    
    // drawing
    ellipse(0,0, random(10), random(10));
    
    popMatrix();
  }
}

// key presed
void keyReleased()
{
  if (key == DELETE || key == BACKSPACE)
    background (360);
    
  if (key == 's' || key == 'S')
    saveFrame("screenshot.png");
    
  if (key == 'i' || key == 'I')
  {
    image(smileImage, mouseX, mouseY, 100, 100);
  }
}


