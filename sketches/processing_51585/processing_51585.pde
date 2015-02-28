
/*

ERIC™                                    Bryn Mawr College
Legal name: Giang H. Nguyen              CS 110 - Section 2
Email: gnguyen@haverford.edu             Assignment 2
Description: A sketch of 2 circles       Date of submission: Tuesday, February 7, 2012

*/



// Customize your picture here:

    // Set background size:
       int wdth = 1280 ;                                        // default width = 1280 pixels
       int sky = 480 ;  int ocean = 154 ;  int coast = 326 ;    // default height: 480 - 154 - 326

    // Click on appropriate places to draw 3 different pokemons.

    // Now, right click on your pokemon to see it evolve!








































PImage pokemon; PImage horizon1; PImage horizon2; PImage horizon3;                          // set global variables

void setup () {
 
   size (wdth, sky+ocean+coast);                                                            // size of background

   // load background
       imageMode (CORNER);
       horizon1 = loadImage ("bground1.png"); image (horizon1, 0,0, width, sky);            // load sky
       horizon2 = loadImage ("bground2.png"); image (horizon2, 0,sky, width, ocean);        // load ocean
       horizon3 = loadImage ("bground3.png"); image (horizon3, 0,sky+ocean, width, coast);  // load coast
}

void draw () {

  frameRate (300);
  
if (mousePressed && (mouseButton == LEFT)){                                                                  // left click triggers drawing pokemon

  if (mouseY <= sky) {                                                                                       // check for sky area
    imageMode (CORNER); horizon1 = loadImage ("bground1.png"); image (horizon1, 0,0, width, sky);            // reload sky, erase old pokemon
    pokemon = loadImage ("016Pidgey.png");                                                                   // load sky pokemon
    imageMode (CENTER); image (pokemon, mouseX, mouseY, 26000.0/mouseY, 26000.0/mouseY);}    
  
  if ( (mouseY >= sky+ocean/5.0) && (mouseY <= (sky+ocean)) ) {                                              // check for ocean area
    imageMode (CORNER); horizon2 = loadImage ("bground2.png"); image (horizon2, 0,sky, width, ocean);        // reload ocean, erase old pokemon
    pokemon = loadImage ("129Magikarp.png");                                                                 // load ocean pokemon
    imageMode (CENTER); image (pokemon, mouseX, mouseY,
                               200.0*mouseY*mouseY*mouseY/height/height/height, 200.0*mouseY*mouseY*mouseY/height/height/height);}
  
  if (mouseY >= sky+ocean+coast*4.0/17.0) {                                                                  // check for coast area
    imageMode (CORNER); horizon3 = loadImage ("bground3.png"); image (horizon3, 0,sky+ocean, width, coast);  // reload coast, erease old pokemon
    pokemon = loadImage ("001Bulbasaur.png");                                                                // load coast pokemon
    imageMode (CENTER); image (pokemon, mouseX, mouseY, mouseY/6, mouseY/6);}
    
}



if (mousePressed && (mouseButton == RIGHT)){   // right click triggers pokemon evolution!

  if (mouseY <= sky) {                                                                                       // check for sky area
    imageMode (CORNER); horizon1 = loadImage ("bground1.png"); image (horizon1, 0,0, width, sky);            // reload sky, erase old pokemon
    for (int i=0; i<2*1.3*26000.0/mouseY; i+=10)
      { noStroke(); fill (255,15); ellipse (mouseX,mouseY, i,i); }                                           // evolution effect
    pokemon = loadImage ("018Pidgeot.png");                                                                  // sky pokemon evolves!
    imageMode (CENTER); image (pokemon, mouseX, mouseY, 1.3*26000.0/mouseY, 1.3*26000.0/mouseY);    
  }

    
  if ( (mouseY >= sky+ocean*2.6/8.0) && (mouseY <= (sky+ocean*5.8/10.0)) ) {                                 // check for ocean area
    imageMode (CORNER); horizon2 = loadImage ("bground2.png"); image (horizon2, 0,sky, width, ocean);        // reload ocean
    for (int i=0; i<10*1.3*26000.0/mouseY; i+=30)
      { noStroke(); fill (random(20,40),random(40,70),random(215,240),random(15,30)); arc (mouseX+ocean/7.0,mouseY-ocean/7, i, 70, -1,1);}  // attack effect
    pokemon = loadImage ("130Gyarados.png");                                                                 // ocean pokemon evolves!
    imageMode (CENTER); image (pokemon, mouseX, mouseY,
           3.4*200.0*mouseY*mouseY*mouseY/height/height/height, 3.4*200.0*mouseY*mouseY*mouseY/height/height/height);
  }
  
  if (mouseY >= sky+ocean+coast*4.0/17.0) {                                                                  // check for coast area
    imageMode (CORNER); horizon3 = loadImage ("bground3.png"); image (horizon3, 0,sky+ocean, width, coast);  // reload coast
    pokemon = loadImage ("003Venusaur.png");                                                                 // coast pokemon evolves!
    imageMode (CENTER); image (pokemon, mouseX, mouseY, 1.3*mouseY/6, 1.3*mouseY/6);}
    
}
    
}

