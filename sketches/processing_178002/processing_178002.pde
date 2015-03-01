
//Import 'Minim' library files
//press 'b' to get the sound to play
import ddf.minim.*;

//Declare global variables
//PImage Project2image;
//PImage Project2imagesmall;
//PImage background;
PImage JCP;
PImage Mall;
PImage Whitey;
PImage Younkers;
PImage forty;
PImage fifty;

Minim minim;
AudioSample project2audio;

//Load audio file from HDD
void setup () {
   size(1280,720);
 //  background = loadImage("background.png"); 
   JCP = loadImage("JCP.png");  
   Mall = loadImage("Mall.png"); 
   Whitey = loadImage("Whitey.png"); 
   Younkers = loadImage("Younkers.png"); 
   forty = loadImage("forty.png"); 
   fifty = loadImage("fifty.png"); 

 // Project2image = loadImage("Project2image.png"); 
 //   Project2imagesmall = loadImage("Project2imagesmall.png");
 minim = new Minim(this);
project2audio = minim.loadSample("DeckTheHalls.wav",512); 
 
}

//Draw code block (anything goes)
void draw () {
 // image(background,50,50);
  image(JCP,0,10);
  image(Mall,525,10);
  image(Whitey,0,375);
  image(Younkers,525,375);
  image(forty,800,300);
  image(fifty,0,275);

  //image(Project2image,50,50);
  //image(Project2imagesmall,0,0);
}
//Create a key trigger
void keyPressed() {
 if (key == 'b') project2audio.trigger();
if (key == 'b') println("sample triggered");

if (key=='s' || key=='S') saveFrame("screenshot.png");

}

