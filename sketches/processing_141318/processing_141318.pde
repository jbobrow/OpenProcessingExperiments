
//copyright Irene Joung 2014
//homework #9

final int MAX_IMAGE = 1;
String str;
String [ ] arrayOfStr = {"press spacebar to", "change color of text!"};

PImage pic;
PImage [ ] picArray;

void setup()
{
  size(550,400);
  textSize(18);
  fill(0);
  frameRate(24);
  str = "sohungry";
  
  imageMode(CENTER);
  picArray = new PImage [ MAX_IMAGE ];
  initImageArray(picArray);
}

void draw()
{
  background(255);
  spinCharacters(str);
  showImage();
  printArray(arrayOfStr);
}

void printArray(String [ ] anyArray)
{
  for (int i = 0; i < anyArray.length; i++)
  {
    text(anyArray[i], 1.2*width/4, 65 + i*25);
  }
}

void spinCharacters(String s)
{
  float degreesOfSeparation = 360/s.length();
  translate(width/3, height/2);
  
  pushMatrix();
    rotate(radians(frameCount));
    for(int i = 0; i < s.length(); i++)
    {
      rotate(radians(degreesOfSeparation));
      pushMatrix();
        translate(0,145);
        rotate(radians(-frameCount) - radians(degreesOfSeparation*(i+1)));
        text(s.charAt(i),0,0);
      popMatrix();
    }
  popMatrix();
}

void showImage()
{
  for(int i=0; i<picArray.length; i++)
  {
    image(picArray[i], 0, 0, 200, 200);
  }
}

void initImageArray(PImage [ ] picArray)
{
  for(int i = 0; i<picArray.length; i++)
  {
    String imageName = "tzuki.jpg";
    picArray [i] = loadImage(imageName);
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    fill(random(255),random(255),random(255));
  }
}
