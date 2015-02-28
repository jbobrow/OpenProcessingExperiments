
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


//Rachel Ciavarella
//Homework 9

//press 'm' 
//mouse press and 
Minim minim;
AudioPlayer mmix;
final int MAX_IMAGE = 4;

String [ ] arrayOfStr = {
  "m    e    o    w", "m    e    o    w", "m    e    o    w"
};

float [] xVals = {
    random(0,width),random(0, 405),random(20, 330) ,random(60, 190)
};


float [] yVals = {
  random(0,height),random(0, 115),random(20, 330) ,random(60, 190)
};


float [] dim = {
    random(100,500),random(50, 215),random(20, 330) ,random(60, 190)
};

PImage spacecat, bg, fil;
PImage [] picArray;


void setup()
{
  size (600, 600);
   minim = new Minim (this); 
  mmix = minim.loadFile ("meowmix.mp3");
  textSize (20);
  fill (0);
  bg = loadImage("spacebg.jpeg");
  fil = loadImage("filter.png");
  imageMode(CORNER);
  picArray = new PImage [ MAX_IMAGE ];
  initImageArray( picArray );
}


void draw()
{
  imageMode(CORNER);
  image(bg, 0, 0, screenWidth, screenHeight);
  showImages( );
  printArray (arrayOfStr);

}


void printArray (String [ ] anyArray)
{
  for (int i = 0; i < anyArray.length; i++)
  { 
    textAlign(CENTER);
    textSize(60);
    text (anyArray[i], width/2, width/3 + i*100);
  }
}

void showImages ()
{
  for (int i = 0; i< picArray.length; i++)
  {
    image (picArray[i], xVals[i], yVals[i], dim[i], dim[i]);
  }
}

void initImageArray( PImage [ ] picArray)
{
  for (int i = 0; i< picArray.length; i++)
  {
    String imageName = "kitten2.png";
    picArray [i] = loadImage("kitten2.png");
  }
}


void keyPressed()
{
  
  if (key == 'm')
  {
    fill(random(0,255));
  }
 else
 {fill(0);
 }
}


void mouseDragged()
{
  filcall();
}


void filcall()
{
  imageMode(CORNER);
  image(fil, 0, 0, 600, 600); 
  textSize(100);
  fill(0);  
  text ("SPACE CATS!", width/2, height/2);
  mmix.play();
  mmix.rewind();
  
}



