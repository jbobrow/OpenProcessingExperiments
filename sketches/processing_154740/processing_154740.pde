
/* Creative coding 2014 - FutureLearn
 * Joel Matos 6.15
 * Postcard
 **/

PImage myImg;
color[] pixelColors;
int scanLine;
String[] message = {"Greetings", "", "from", "", "Dominican", "", "Republic"};

void setup()
{
  size(800, 578);
  myImg = loadImage("barahona.jpg");

  pixelColors = new color[7];
  scanLine = height;
  smooth(4);
  
  frameRate(22);
}

void draw()
{
  background(0);

  for (int i=0; i<7; i++)
  {
    pixelColors[i] = myImg.get(i*110, scanLine);
  }
  
  image(myImg, 0, 0);
  
  for (int i = 0; i < 7; i++)
  {
    textSize(50);
    float textWidth1 = textWidth(message[i]) * 0.5;
    
    fill(pixelColors[i]);
    text(message[i], (i+1) * 25, (i+2) * 25);
  }

  if (frameCount % 2 == 0)
  {
    scanLine --;
  }

  if (scanLine < 0)
  {
    scanLine = height;
  }
}


