
// Homework 9 copyright 2014
// Hyun Doug Kim 

//press 'c' and the color of the text will change
//mouse press and secret word will appear but better watch out because it will disapper quickly!!

final int MAX_IMAGE = 1;
String [ ] arrayOfStr = {"1st day of every month", "say 'Rabbit Rabbit'", "and you'll be lucky for a whole month!"};
float [] xVals = {10, 50, 100, 150, 200, 250, 300, 0};

PImage pic; 
PImage [] picArray; 


void setup()
{
  size (500, 600);
  textSize (18);
  fill (0);
  
  imageMode(CENTER);
  picArray = new PImage [ MAX_IMAGE ];
  initImageArray( picArray );
  

}

void draw()
{
  background (255, 241, 133);
  printArray (arrayOfStr);
  showImages( );
}

void printArray (String [ ] anyArray)
{
  for (int i = 0; i < anyArray.length; i++)
  {
    text (anyArray[i], 40, 70 + i*40);
  }
}

void showImages () 
{
  for (int i = 0; i< picArray.length; i++)
  {
    image (picArray[i], 300, 400, 400, 400);
  }
}

void initImageArray( PImage [ ] picArray)
{
  for (int i = 0; i< picArray.length; i++)
{
  String imageName = "rabbit.png";
  picArray [i] = loadImage(imageName);
}
}

void keyPressed()
{
  if (key == ' ')
  {
    setup();
  }
  if (key == 'c')
  {
    fill(random(255),random(205), random(255));
  }
  else
  {
    exit();
  }
}

void mousePressed()
{
  showSpeech();
}

void showSpeech()
{
  noStroke();
  fill(255);
  ellipse(120, 300, 150, 80);
  fill (0);
  text ("rabbit! rabbit!", 65, 305);
}



