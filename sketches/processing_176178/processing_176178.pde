
import ddf.minim.*;

// Global variables
PImage temple, door, piling;                       // Image variables
boolean triggerSky=true;                           // Triggers that change sky &
boolean triggerSeason = false;                     // snow - bells sound &
boolean triggerTrees = false;                      // trees - christmas carol
color colorSky;                                    // three colors: blue, white and black
int numberOfStars;                                 // Variables relative to sky with stars 
int[][] posStarXY;                                 //
int[][] posFireworks;                              //
int numPoints = 50;                                //
color[][] colorFireworks;                          // and fireworks color
color chosenColor;                                 // 
float angle = TWO_PI/(float)numPoints;             // Snow variable
Minim minim, minim1, minim2;                       // Audio variables
AudioSample fireworksSound;                        //
AudioPlayer bells;                                 // 
AudioPlayer carol;                                 //


void setup() {
  minim = new Minim(this);                                // Initialize sounds
  fireworksSound = minim.loadSample("fireworks.wav");     //  
  minim1 = new Minim(this);                               //     
  bells = minim1.loadFile("bells.wav");                   //
  minim2 = new Minim(this);                               // 
  carol = minim2.loadFile("carol.wav");                   //  
  //Window size      
  size(800, 627);
  //Load images
  temple = loadImage("temple.png");                       // Initialize images
  door = loadImage("door.png");                           // 
  piling = loadImage("piling.png");                       // 
  image(temple, 0, 0);                                    //  
  image(door, 0, 0);                                      //
  image(piling, 0, 0);                                    //
  colorSky = color(#8EEFF7);                              //
  mouseY = height;                                        // Initialize variables
  posStarXY = new int[width][220];                        //
  posFireworks = new int[width][height];                  //
  colorFireworks =new color[width][height];               //
  frameRate(10);                                          // frameRate < 10 is too slow for animation 
}

void draw() {
  setup_background();
  if (mouseY <300)                                                                 /////////////////////////// NIGHT
  {
   night();
   stars();
  }
  if (mouseY >= 300 && triggerSeason ==false)                                      /////////////////////////// DAY  
  {
   dayTime();
  }
 if (mouseY >= 300 && triggerSeason ==true)                                        ////////////////////////// SNOW
 {
   snow();
 } 
 if (mouseX > 357 && mouseX < 446 && mouseY >443 && mouseY < 526) {                ///////////////////////// CHANGE IMAGE COLOR
   psychedel();
 }
 if (triggerTrees == true) {                                                       ///////////////////////// CHANGE PILING BY TREES
  trees();
 }
} ////DRAW() ENDS

void mouseReleased() {
   if (mouseY < 240){                                                              //////////////////////////// FIREWORKS         
      fireworks();
      }
  if (mouseY > 351) {                                                              //////////////////////////// triggerSeason ==true? SNOW TRIGGER 
    if (triggerSeason == true) {
      bells.mute(); 
      triggerSeason = false;
    }
   else {  
      bells.unmute();
      bells.loop(); 
      colorSky = color(#8EEFF7);                                                  ///////////////////////////// triggerSeason == false? DAY TRIGGER 
      triggerSeason = true;
   }    
  }
  if ((mouseX > 175 && mouseX < 218 && mouseY > 548 && mouseY < height) || (mouseX > 414 && mouseX < 455 && mouseY > 548 && mouseY < height) || (mouseX > 658 && mouseX < 619 && mouseY > 548 && mouseY < height)) {
  if (triggerTrees == false) {                                                   ////////////////////////////// triggerTrees == false? mute carol & change piling
  triggerTrees = true;
     bells.mute();
     carol.unmute();
     carol.play();
  }
  else {
  triggerTrees = false;
  carol.mute();
  piling = loadImage("piling.png"); 
  
  }
  }
}

void setup_background()                                            ////////////////////////////// Initialize screen
{
 background(colorSky);
 image(temple, 0, 0);
 image(door, 0, 0);
 image(piling, 0, 0);
}

void trees() {                                                    ////////////////////////////// Trees function
 piling = loadImage("tree.png"); 
}

void psychedel() {                                                ///////////////////////////// Color change function 
fill(int(random(255)), int(random(255)), int(random(255)),100);
rect (0, 0, width, height, 3);

}

void fireworks() {                                                //////////////////////////// Fireworks function
    fireworksSound.trigger();
    strokeWeight(1);
    chosenColor = color (int(random(255)), int(random(255)), int(random(255)));      //////// Random color
    posFireworks[mouseX][mouseY] = int(random(40, 100));                             //////// Random size 
    colorFireworks[mouseX][mouseY] = chosenColor;
    stroke(0);
}

void dayTime() {                                                 ///////////////////////////// Day function
  colorSky = color(#8EEFF7);                                                         ///////// Blue color       
  triggerSky = true;                                                                 ///////// Initialize variable
    for (int x =0; x < width; x++) {                                                 ///////// Delete stars and fireworks 
    for (int y=0; y < 220; y++) {
      if (posStarXY[x][y] == 1) {
        posStarXY[x][y] = 0;
      }
     posFireworks[x][y] = 0; 
    }
  }
 }

void night() {                                                  ////////////////////////////// Night function
 bells.mute();                                                 
if (triggerSky == true) colorSky = color(0);
  colorSky = color(0,2);                                        ///////////////////////////// Soft darken
  fill(0,150);
  rect(0,0, width, height);
  triggerSeason = false;
   for (int x=0; x < width; x++) {                              //////////////////////////// Fireworks redraw
      for (int y=0; y < 220; y++) {
        if (posFireworks[x][y] != 0) {
          for (int radianCounter = 0; radianCounter < posFireworks[x][y]; radianCounter++) {
            for (int i = 0; i < numPoints; i++) {
              if (random(2) > 1) {
                stroke (colorFireworks[x][y]);
              }
              else {
                stroke(0);
              }
              point (radianCounter*sin(angle*i)+x, radianCounter*cos(angle*i)+y);
            }
          }
        }
        posFireworks[x][y]--;
      }
    }
    
}

void stars() {                                                      ////////////////////////// Stars function
if (triggerSky == true) {
 numberOfStars = int(random(30,50));                                ///////////////////////// Random number of stars
 for (int star =0; star< numberOfStars; star++){
    stroke(255);
    fill(255);
   posStarXY[int(random(width))][int(random(220))] = 1;             ///////////////////////// Random position - save position
 }
 triggerSky = false;
}
  for (int x =0; x < width; x++) {                                  //////////////////////// Paint star if x,y = 1
    for (int y=0; y < 220; y++) {
      if (posStarXY[x][y] == 1) {
        ellipse(x, y, 2, 2);
        noStroke();
        fill(255, 80);
        ellipse(x, y, 8, 8);
      }  
    }
  }
}

  void snow() {                                                    ////////////////////////// Snow function
  noStroke();
  colorSky = color(255);
  int quantity = 300;                                              ////////////////////////// Number of flakes
  float [] xPosition = new float[quantity];                        ///////////////////////// Initialize variables
  float [] yPosition = new float[quantity];
  int [] flakeSize = new int[quantity];
  fill(255);
   for(int i = 0; i < quantity; i++) {
    flakeSize[i] = round(random(1, 5));                           ////////////////////////// Random position and size
    xPosition[i] = random(0, width);
    yPosition[i] = random(0, height);
  }
  for(int i = 0; i < xPosition.length; i++) {                    
   ellipse(xPosition[i], yPosition[i], flakeSize[i], flakeSize[i]);     /////////////////// Draw flake?
   yPosition[i] += flakeSize[i]; 
   if(xPosition[i] > width + flakeSize[i] || xPosition[i] < -flakeSize[i] || yPosition[i] > height + flakeSize[i]) {   ////////// Out of screen limits? xPosition = random 
      xPosition[i] = random(0, width);
      yPosition[i] = -flakeSize[i];                                                                                    ////////// & y return to screen    
    }
  }
}



