
// Project3: Bringing it all together
/* Instructions: 
   'd' or 'D'  - Day time
   'n' or 'N'  - Night time
   mouse click on sky at different places for view at different times of the day,
   east to west, i.e., right to left as sun or moon rises and sets */

import ddf.minim.*;           // Library for audio

//Global Variables

PImage background, beachDay, beachNoon, beachEvening, beachNight1, beachNight2, beachNight3, beachNight4;   //Declare PImage variable type
Minim minim;   // object of Minim class
AudioPlayer dayWaves, nightWaves;   // Audio pkayer to play two different sounds
float centreX, centreY;            // variables for centre of sun or moon
int phase;
char mode;

void setup()
{
  size(800, 600);
  //Load images file fromm HDD
  background = loadImage("Background.jpg");
  beachDay = loadImage("Beach.jpg");
  beachNoon = loadImage("BeachNoon.jpg");
  beachEvening = loadImage("BeachEvening.jpg");
  beachNight1 = loadImage("BeachNight1.jpg");
  beachNight2 = loadImage("BeachNight2.jpg");
  beachNight3 = loadImage("BeachNight3.jpg");
  beachNight4 = loadImage("BeachNight4.jpg");  
 //load sound files
  minim = new Minim(this);
  dayWaves = minim.loadFile("DayWaves.wav");
   dayWaves.loop();
  nightWaves = minim.loadFile("NightWaves.wav");
  //set default values for global variables
  centreX = 550;
  centreY = 90;
  phase = 1;
  mode = 'D';
}


void draw()
{
  
  image(background, 0, 0);  //Draw background at (0,0)
  
  if(mode == 'D'){          //When Day time
   
  switch(phase){                          // Phases from right to left
    case 1:
       image(beachDay, 20, 20);           // Draw relevant view
        stroke(245, 116, 30);
        fill(254,247,95);
        ellipse(centreX, centreY, 50,50);  // Draw sun
       break;
    case 2: 
       image(beachNoon,20, 20);
        stroke(252, 252, 59);
        fill(254,247,95);
        ellipse(centreX, centreY, 50,50);
       break; 
    case 3:
       image(beachDay, 20, 20);
        stroke(245, 116, 30);
        fill(254,247,95);
        ellipse(centreX, centreY, 50,50);
       break;
    case 4:
       image(beachEvening, 20, 20);
        stroke(245, 116, 30);
        fill(245, 142, 32);
        ellipse(centreX, centreY, 50,50);
       break;
  }
  } else if ( mode == 'N'){                  //Night time
    switch(phase){
    case 1:
       image(beachNight1, 20, 20);
        stroke(252, 250, 204);
        fill(250, 252, 127);
        ellipse(centreX, centreY, 50,50);        // Draw moon
       break;
    case 2: 
       image(beachNight2, 20, 20);
        stroke(252, 250, 204);
        fill(253, 255, 173);
        ellipse(centreX, centreY, 50,50);
       break; 
    case 3:
       image(beachNight4, 20, 20);
        stroke(252, 250, 204);
        fill(253, 255, 173);
        ellipse(centreX, centreY, 50,50);
       break;
    case 4:
       image(beachNight3, 20, 20);
        stroke(252, 250, 204);
        fill(253, 255, 173);
        ellipse(centreX, centreY, 50,50);
       break;
  }
  }
  
}

void mouseClicked(){
  if(mouseY < 200 && mouseX < 650){    // Check if mouse is clikced on the sky within the image
  centreX = mouseX;                    // Set the centre of the sun or moon according to the point clicked
  centreY = mouseY;
  
  if(mouseX > 0 && mouseX <= 160)       // Set the phase of day or night depending on the horizontal position of mouse click
  {
    phase = 4;
  }
  else if(mouseX > 160 && mouseX <= 320)
  {
    phase = 3;
  }
  else if(mouseX > 320 && mouseX <= 480)
  {
    phase = 2;
  }
  else if(mouseX > 480 && mouseX < 640)
  {
    phase = 1;
  }
  }
 
}

void keyPressed()                            // Set mode and play respective audio file when key pressed
{
  if ( key == 'd' || key == 'D')                   
  {
    mode = 'D';
    dayWaves.loop();
  }
  else if (key == 'n' || key == 'N')
  {
    mode = 'N';
    nightWaves.loop();
  }
}



