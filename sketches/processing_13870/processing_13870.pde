
//Hey Bernard. Hope this can help you out!
//-Ben


//****************PRE LOAD********************

import ddf.minim.*; // vvv
Minim minim; //These two lines will basically load the music program.
AudioPlayer Lupe; //A variable may be given to an individual audio player-
AudioPlayer Cudi; //for an individual sound. In this case, our variables
                  //are 'Lupe' and 'Cudi'. Make sure AudioPlayer is before.

int radius = 150; //This sets up the height/width of an ellipse we use soon.
int radius2 = 150; //Same as above, but for different ellipse.

PImage Lmood, Lmood2, Rmood, Rmood2; //Variables for four images we'll use.
                                     //PImage will recognize them for images.

PFont moodfont; //Variable for a font we will use. PFont will recognize
                //it for a font/text.

//****************PRE LOAD********************






void setup () { //****************VOID SETUP********************

size (600, 150); smooth();

Lmood = loadImage("happy1.png");
Lmood2 = loadImage("happy2.png");
Rmood = loadImage("sad1.png");
Rmood2 = loadImage("sad2.png");  //The above four lines officially load
                                 //our images from the "data" folder.
                                 
moodfont = loadFont("moodfont.vlw"); //Loads font from data folder.

//P.S. To implement your own font for a programming sketch/work from your
//laptop memory, just go into TOOLS at top, "create font" and select which 
//one. It will end up in data folder as "filename.vlw".


minim = new Minim(this);
Lupe = minim.loadFile("imbeaming.mp3"); //Above two lines load .mp3 from data.
Lupe.cue(48600);//CUES start to be at 48600 millibytes into the song. It takes
                //a little adjusting to get it just right, but it will have
                //great and efficient results for your project.

minim = new Minim(this);
Cudi = minim.loadFile("skymightfall.mp3");
Cudi.cue(17000); //Follows same pattern as "Lupe". Except for variale "Cudi".


imageMode(CENTER);
ellipseMode(CENTER);


} //****************VOID SETUP********************









void draw () { //****************VOID DRAW********************
  

background(255);

  
noStroke();

fill (0, 100);
ellipse(width/2-150, height/2, radius, radius);
fill (0, 100);
ellipse(width/2+150, height/2, radius2, radius2); //These ellipses are to help
                                                  //decorate my images.



image(Lmood, width/2-150, height-70, 150, 150);
//First of images. The left mood face. Positioned at the left.


image(Rmood, width/2+150, height-70, 150, 150);
//The other mood face. Loaded and positioned to the right.



if (key == 'a'){
Lupe.play();//Commands AudioPlayer to play the "happy" song.
Cudi.pause();//...and pauses the opposing song on the map.
image(Lmood2, width/2-150, height-70, 150, 150);
//ANOTHER left mood face loaded atop the existing one to give it an animation.

fill(0);
textFont(moodfont, 20);
text("NOW PLAYING : L U P E  F I A S C O - i m  b e a m i n g", 80, 20);
//This is how you implement text in a sketch once loaded from above.
}


if (key == 'b'){
Cudi.play();
Lupe.pause();
image(Rmood2, width/2+150, height-70, 150, 150);
fill(0);
textFont(moodfont, 20);
text("NOW PLAYING : K I D   C U D I - s k y  m i g h t  f a l l", 100, 20);

//Same essential pattern as the face on the LEFT.

}
  

fill(0);
textFont(moodfont, 20);
text("PRESS A", 100, 140);
fill(0);
textFont(moodfont, 20);
text("PRESS B", 400, 140);

//This text is loaded on top of everything else, just to be in front.

  
} //****************VOID DRAW********************

  



