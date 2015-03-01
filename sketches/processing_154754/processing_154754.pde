

 
PImage myImg;
color[] pixelColors;
String[] message = {"Greetings"};
 
void setup()
{
  size(500, 500);
  myImg = loadImage("bye.jpg");
 
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
     
  }
 
}



