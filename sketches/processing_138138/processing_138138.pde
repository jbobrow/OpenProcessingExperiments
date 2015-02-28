
/* ARTISTIC STATEMENT.
Theme is a quick description of THE SEASONS IN MY COUNTRY. 
To do so, I start with a statement describing my subject, 
along with a sun sketch to metaphorically lead us to my country, 
which is always sunny. 

Then, by clicking on the mouse we are taken to next ‘pages’
(screenshots),  one for each season,  that has a photo relative 
to the season described. By pressing ‘s’ (or ‘S’) on the keyboard
we can save any screenshot we like.
*/

//This is used to start introduction with a harp SOUND!
import ddf.minim.*;

Minim minim;
AudioSample harp;

//Here, I declare the IMAGES to be used!
PImage fractalWinter;
PImage fractalSpring;
PImage fractalSummer;
PImage fractalAutumn;

int counter = 0;


//define setup()
void setup() {

  minim = new Minim(this);
  harp = minim.loadSample("harp.wav");

  size(1000, 700);
  background(#000000);
  textSize(42);
  fill(#FFF705);
  smooth(4);
  
  //Adding TEXT on first screen
  text("My Favorite Pics from Seasons in my Country.", 48, 150);
  textSize(30);
  text("Press mouse to start...", width/2, 500);

  //Add an ELLIPSE, looking like a sun, on 1st screen
  noStroke();
  for (int i = 200; i > 0; i=i-30) {
  fill(#FC8505, 80);
  ellipse(width-200, 250, i, i);
  fill(#FC6405, 100);
  ellipse(width-200, 250, i-20, i-15);
  fill(#FCC705, 100);
  ellipse(width-200, 250, i-10, i-15);
  }
  fill(#FFFFFF, 150);
  ellipse(width-200, 250, 10, 10);
  //END OF SUN
  
  //Trigger AUDIO, first screen
  if (counter == 0) harp.trigger();
  
  //start loading images to correlate to seasons
  fractalWinter = loadImage("fractalWinter.JPG");
  fractalSpring = loadImage("fractalSpring.jpg");
  fractalSummer = loadImage("fractalSummer.JPG");
  fractalAutumn = loadImage("fractalAutumn.JPG");
//End of setup
}


void draw() {
  //I use counters 1 to 4 to describe one screen per season...
  if (counter == 1) {
    background(#000000); 
    text("Winter time. Snow covers the mountains and...", 50, 50);
    text("... you can enjoy skiing with your friends...", 60, 85);
    image(fractalWinter, 300, 220, 400, 300);
    fill(#FFF97E);
    text("Press mouse to continue...", 610, 630);
    }
  else if (counter == 2) {
    background(#000000);
    text("Glamorous Spring: The fields are all covered up ", 50, 150);
    text("with promising crops and flowers", 65, 185);
    image(fractalSpring, 300, 220, 400, 300); 
    fill(#FFF97E);
    text("Press mouse to continue...", 610, 630);
  }
  else if (counter == 3) {
    background(#000000); 
    text("Summer: Time for visiting the islands to swim...", 50, 50);
    image(fractalSummer, 300, 220, 400, 300);
    fill(#FFF97E);
    text("Press mouse to continue...", 610, 630);
    }
  else if (counter == 4) {
    background(#000000); 
    text("The year closes with yet a glamorous season,", 50, 50);
    text("Autumn, when orange and olive trees", 50, 85);
    text("decorate the environment with their joyous presence.", 50, 120);
    image(fractalAutumn, 300, 220, 400, 300);
    fill(#FFF97E);
    text("The End.-", 610, 630);
    }  
    //End of draw
}


/*...and, I increase counter as mouse is clicked 
  to proceed to next image */
  
  void mouseClicked() {
    counter++;
  }
  
  
/*To get screenshots on any page during the presentation, 
  you can type 's' or 'S' for SAVE. */
  
  void keyReleased() {
    if (key == 's' || key == 'S') saveFrame("screenshotSeasons.png");
    if (key == 's' || key == 'S') println("Saved as screenshotSeasons.png");
  }


//The End

