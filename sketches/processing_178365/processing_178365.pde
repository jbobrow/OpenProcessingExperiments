
//My project is called Spartascope. It is a multimedia simple java interactive sketch I created in order to honor my beloved Ancient Sparta.
//I used a fantasy Sparta artwork (which highlights the spartan women as well) as the viewed image and inserted sound clips from the movie 300.
//Run the project to view the image and then you can hear those 5 sound clips by pressing on your keyboard the numbers from #1 to #5 consecutively. 
//I hope this will give the feeling of the Ancient Spartan glory!



//Declare image
PImage spartans;

//Import 'Minim' files1
import ddf.minim.*;


//Declare global variables
 Minim minim;
 AudioSample prepare;
 AudioSample die;
 AudioSample hell;
 AudioSample profession;
 AudioSample everything;


//Setup and image and sound samples loading
void setup() { 
  size(800, 700);
  spartans = loadImage("spartans.jpg");
  minim = new Minim(this);
  prepare = minim.loadSample("prepare.wav");
  die = minim.loadSample("die.wav");
  hell = minim.loadSample("hell.wav");
  profession = minim.loadSample("profession.wav");
  everything = minim.loadSample("everything.wav");
  
 }

//Insert image
void draw() {
 image(spartans, 0, 0);  
    
 }
  
 
//Create a key trigger
void keyPressed() {
  if ( key == '1' ) prepare.trigger();
  if ( key == '2' ) die.trigger();
  if ( key == '3' ) hell.trigger();
  if ( key == '4' ) profession.trigger();
  if ( key == '5' ) everything.trigger();
 }


//Image is free licensed and was selected from: http://www.rafater.com/images/gallery_pict_spartans.jpg
//Soundclips of the film 300 were selected from: http://www.moviesoundclips.net/sound.php?id=92

//End of the project

  


