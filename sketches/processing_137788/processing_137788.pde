
/*
* This is a sketch based on the popular song 'Any Colour You Like'
* by Pink Floyd from their 1973 album 'The Dark Side of the Moon'. The
* sketch depicts my personal interpretation of the song in which every
* note is intended to denote a new colour and the entire progression
* of the song is directed based on the change in colour profile of
* the sketch elements. To experience the intended effect, click on
* different positions on the canvas in multiples of the song's metronome.
*/

/*
* Increase ellipse size: Press Key 'm'
* Decrease ellipse size: Press Key 'n'
* Increase number of ellipses: Press Key 'i'
* Decrease number of ellipses: Press Key 'd'
* Save Screenshot: Press Key 's'
*/

//Import audio library
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


//Initialization of Global Parameters
float Hue,Saturation;
int weight=5;
float centerX=0.0;
float centerY=0.0;
float sizeX=30;
float sizeY=30;
float defaultSizeX=30;
float defaultSizeY=30;
float backX=0.0;
float backY=0.0;
float scale=1.0;
float r=0;
int circleCount=10;
float theta=90;
float alpha=80;
int count=0;
Minim minim;
AudioPlayer Song;
float i,j;

//Setup canvas, background color and color mode.
//Load Pink Floyd Song: 'Any Colour You Like'
void setup()
{
  size(800,600);
  colorMode(HSB,width,height,100);
  background(random(width),random(height), 80);
  minim = new Minim(this);
  Song = minim.loadFile("AnyColourYouLike.mp3");
  Song.play();
  centerX=width/2;
  centerY=height/2;
  Hue = random(0,width);
  Saturation = random(0,height);
  //noLoop();
}

//Draw loop
void draw()
{
  backX=mouseX;
  backY=mouseY;
  if(mouseX<width/2)backX=width-mouseX;
  if(mouseY<height/2)backY=height-mouseY;
  //Set Background based on Mouse Position(mirrored across the center)
  background(backX,backY, 80);
  
  fill(Hue,Saturation,alpha);
  stroke(Hue,Saturation,alpha);
  strokeWeight(weight);
  scale=1;
  
  //Draw Ellipses
  pushMatrix();
  translate(centerX,centerY);
  for(int p=0;p<circleCount;p++)
  {
    i = r*scale*cos(radians(theta*scale));
    j = r*scale*sin(radians(theta*scale));  
    ellipse(i,j,sizeX,sizeY);
    scale+=0.2;
  }
  r+=5;
  sizeX+=1;
  sizeY+=1;
  count++;
  alpha+=0.2;
  popMatrix();
  
  if(count==52)//Reset closest to beat count of Song.
  {
    count=0;
    theta+=5;
    r=0;
    sizeX=defaultSizeX;
    sizeY=defaultSizeY;
    alpha=80;
    Hue = random(0,width);
    Saturation = random(0,height);
  }
}

void mousePressed() //Change Center and reset on Mouse Click
{
  centerX = mouseX;
  centerY = mouseY;
  count=0;
  theta+=5;
  r=0;
  sizeX=defaultSizeX;
  sizeY=defaultSizeY;
  Hue = random(0,width);
  Saturation = random(0,height);
}

void keyPressed() //Key settings to save frame, increase/decrease circle counts and ellipse size.
{
  switch(key)
  {
    case 's':saveFrame("Screenshot.png");
             break;
    case 'i':circleCount++;
             if(circleCount>25)circleCount=25;
             break;
    case 'd':circleCount--;
             if(circleCount<5)circleCount=5;
             break;
    case 'm':defaultSizeX+=5;
             defaultSizeY+=5;
             if(defaultSizeX>60)defaultSizeX=60;
             if(defaultSizeY>60)defaultSizeY=60;
             break;
    case 'n':defaultSizeX-=5;
             defaultSizeY-=5;
             if(defaultSizeX<5)defaultSizeX=5;
             if(defaultSizeY<5)defaultSizeY=5;
             break;
  }
}



