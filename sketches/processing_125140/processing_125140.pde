
//FINAL PROJECT CDT208
//simplfied sketch
//combines image, code, and mostly audio


//main imageeeeeeeeeee
PImage GlobeLove;

//Import 'Minim' library files
import ddf.minim.*;

//Global Variables

Minim minim;

AudioSample Europe;

AudioSample Africa;

AudioSample Antartica;

AudioSample Asia;

AudioSample Australia;

AudioSample NorthAmerica;

AudioSample SouthAmerica;

AudioSample WORLDBEAT;

//Loaded audio file HD
void setup() {
  background(#0AC0FF); 
 size(1000, 800);
  GlobeLove = loadImage("CDT-Numbered-and-in-Space.png");
  minim = new Minim(this);
  Europe = minim.loadSample("Europe.mp3");
    
//
minim = new Minim(this);
Africa = minim.loadSample("Africa.mp3");

//

minim = new Minim(this); 
Antartica = minim.loadSample("Antarticaa.mp3");


//

minim = new Minim(this); 
Asia = minim.loadSample("Asia.mp3");


//

minim = new Minim(this); 
Australia = minim.loadSample("Australia.mp3");


//

minim = new Minim(this); 
NorthAmerica = minim.loadSample("North America.mp3");


//

minim = new Minim(this); 
SouthAmerica = minim.loadSample("South America.mp3"); 


//

minim = new Minim(this); 
WORLDBEAT = minim.loadSample("WORLD BEAT.mp3"); 
}

//Draw code block (oh so pretty)
void draw () {
  image(GlobeLove, 0, 0);
}

//Create a key trigger
void keyReleased() {
  if ( key == '5') Europe.trigger();
  if ( key == '5') println("sample triggered");

if ( key == '1') Africa.trigger();
if ( key == '1') println("sample triggered");

  if ( key == '2') Antartica.trigger();
  if ( key == '2') println("sample triggered");

if ( key == '3') Asia.trigger();
if ( key == '3') println("sample triggered");

  if ( key == '4') Australia.trigger();
  if ( key == '4') println("sample triggered");

if ( key == '6') NorthAmerica.trigger();
if ( key == '6') println("sample triggered");

  if ( key == '7') SouthAmerica.trigger();
  if ( key == '7') println("sample triggered");

if (key == ' ' )WORLDBEAT.trigger();
if (key == ' ' ) println("sample triggered"); 
}

{
 if (key=='5') keyReleased();
 if (key=='1') keyReleased();
 if (key=='2') keyReleased();
 if (key=='3') keyReleased();
 if (key=='4') keyReleased();
 if (key=='6') keyReleased();
 if (key=='7') keyReleased();
 if (key==' ') keyReleased();
 
}

//*Stops the audio*

void keyPressed()
{
  if ( key == 's' ) Europe.stop();
  if ( key == 's' ) Africa.stop();
  if ( key == 's' ) Antartica.stop();
  if ( key == 's' ) Asia.stop();
  if ( key == 's' ) Australia.stop();
  if ( key == 's' ) NorthAmerica.stop();
  if ( key == 's' ) SouthAmerica.stop();
  if ( key == 's' ) WORLDBEAT.stop();
}


