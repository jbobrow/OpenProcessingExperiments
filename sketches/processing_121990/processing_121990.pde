
PImage bg;                                                                          //background image variable
int currentScreen;                                                                  //variable to control which screen is displayed
int drawScreenZero;                                                                 //screen 1
int drawScreenOne;                                                                  //screen 2
int drawScreenTwo;                                                                  //screen 3
int drawScreenThree;                                                                //screen 4
boolean button1Over = false; 
boolean button2Over = false;
boolean button3Over = false;
boolean button4Over = false;
color button1color,button2color,button3color,button4color;                         // button colours
color button1highlight, button2highlight, button3highlight,button4highlight;       //button highlight colours
int button1size = 45;                                                              //button 1 size
int button2size = 45;                                                              //button 2 size
int button3size = 45;                                                              //button 3 size
int button4size = 45;                                                              //button 4 size
int button1X, button1Y;                                                           //button 1 position variables
int button2X, button2Y;                                                           //button 2 position variables
int button3X, button3Y;                                                           //button 3 position variables
int button4X, button4Y;                                                           //button 4 position variables
int pinsOn = 0;                                                                   // robustness variable for pins
PImage theNether;                                                                 //decleration of image variables start
PImage thePheonix;                                                                //
PImage medina;                                                                    //
PImage DCA;                                                                       //
PImage theSocial;                                                                 //
PImage tonic;                                                                     //
PImage braes;                                                                     //
PImage laings;                                                                    //
PImage artbar;                                                                    //
PImage droughys;                                                                  //
PImage theTaybridge;                                                              //
PImage theSpeedwell;                                                              //
PImage compassIcon;                                                               //
PImage beericon;                                                                  //
PImage dealsIcon;                                                                 //
PImage overview;                                                                  //
PImage graphs;                                                                    //                                                                 
PImage graphsIcon;                                                                //decleration of image variables end
PImage logo;

void setup() {
  size(1000,600);                                                                 // screen size
  background(0);                                                                  // background colour
  buttonSetup();                                                                  //button initilisation 
  pinSetup();                                                                     //call pin initilisation
  iconSetup();                                                                    //calls icon setup
}

void draw() {
  switch(currentScreen) {
    case 0: drawScreenZero(); break;                                              //calls screen 1
    case 1: drawScreenOne(); break;                                               //calls screen 2
    case 2: drawScreenTwo(); break;                                               //calls screen 3
    case 3: drawScreenThree(); break;                                             //calls screen 4
  }
}


void buttonIcons() {
//  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                                               //black menu bar
  fill(0);
  rect(0,316,1000,200);
                                                                            //sets up button icons on screen
  image(beericon,114,542);
  image(dealsIcon,184,540);
  image(compassIcon,26,542);
  image(graphsIcon,266,546); 
  image(logo,800,510);
}

void loadBackground() {
                                                                                 //inserts map background
  image(bg,0,0);
}

//===============================================================================================================================================================================

void buttonSetup() {
 
  button1color = color(255,50);                         //sets up button positions and
  button1highlight = color(100,50);                     //color of buttons and highlights
  button2color = color(255,50);                         //
  button2highlight = color(100,50);                     //   
  button3color = color(255,50);                         //
  button3highlight = color(100,50);                     //
  button4color = color(255,50);                         //
  button4highlight = color(100,50);                     //
  button1X = 24;                                        //
  button1Y = 540;                                       //
  button2X = 104;                                       //               
  button2Y = 540;                                       //
  button3X = 184;                                       //
  button3Y = 540;                                       //
  button4X = 264;                                       //
  button4Y = 540;                                       //
}

void buttonInteraction() {
                                                                       //detects mouse over buttons
  update(mouseX, mouseY);
  if (button1Over) {
    fill(button1highlight);
  } else { 
    fill(button1color);
  }
  rect(button1X,button1Y, button1size,button1size);
  if (button2Over) {
    fill(button2highlight);
  } else { 
    fill(button2color);
  }
  rect(button2X,button2Y, button2size,button2size);
  if (button3Over) {
    fill(button3highlight);
  } else { 
    fill(button3color);
  }
  rect(button3X,button3Y, button3size,button3size);
    if (button4Over) {
    fill(button4highlight);
  } else { 
    fill(button4color);
  }
  rect(button4X,button4Y, button4size,button4size);
}

void update(int x, int y) {
                                                        //detects which button is currently pressed
  if( button1Over(24,534,button1size,button1size)){
    button1Over = true;
    button2Over = false;
    button3Over = false;
    button4Over = false;
  } else if ( button2Over(104,534,button2size,button2size)){
    button1Over = false;
    button2Over = true;
    button3Over = false;
    button4Over = false;
  }else if ( button3Over(184,534,button3size,button3size)){
    button1Over = false;
    button2Over = false;
    button3Over = true;
    button4Over = false;
  }else if(button4Over(264,534,button4size,button4size)){
     button1Over = false;
     button2Over = false;
     button3Over = false;
     button4Over = true;
  } else {
    button1Over = button2Over = button3Over = button4Over = false;
  }
}

//=======================================================================================================================================================================

void mousePressed() {
 currentScreen++;
 if (currentScreen > 3){ 
   currentScreen = 0;
 }
}
 
void drawScreenZero() {
  if (button1Over) 
    pinsOn = 1;                                                      // allows pins to be shown
    loadBackground();
    buttonIcons();
    buttonInteraction();
    //action when button is pressed
  
 }
 
 void drawScreenOne(){
  if (button2Over) {
    pinsOn = 1;                                                         // allows pins to be shown
       loadBackground();
       buttonIcons();
       buttonInteraction();
       if (pinsOn == 1) {
       pinPlacement();
       };
  }
                                                                      //action when button is pressed
 }
 
 void drawScreenTwo(){
   if (button3Over) {
        pinsOn = 0;                                                   // does not allow pins to be shown
        buttonIcons();
        buttonInteraction();
        image(overview,0,0);                                          // displays overview image
    }
    //action when button is pressed
 }
 
  void drawScreenThree(){
   if (button4Over) {
        pinsOn = 0;                                                  // does not allow pins to be shown
        buttonIcons();
        buttonInteraction();
        image(graphs,0,0);                                           // displays graph image
    }
                                                                     //action when button is pressed
 }

//====================================================================================================

                                                            // detects if mouse is over button
boolean button1Over(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
  mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
                                                           // detects if mouse is over button
boolean button2Over(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
  mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
                                                           // detects if mouse is over button
boolean button3Over(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
  mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
                                                            // detects if mouse is over button
boolean button4Over(int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
  mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

//===================================================================================================

void pinSetup(){
                                                //loads files into the image variables
  theNether = loadImage("greenpin copy2.png");
  thePheonix = loadImage("redpin copy2.png");
  medina = loadImage("redpin copy2.png");
  DCA = loadImage("redpin copy2.png");
  theSocial = loadImage("amberpin2.png");
  tonic = loadImage("redpin copy2.png");
  braes = loadImage("amberpin2.png");
  laings = loadImage("redpin copy2.png");
  artbar = loadImage("redpin copy2.png");
  droughys = loadImage("redpin copy2.png");
  theTaybridge = loadImage("greenpin copy2.png");
  theSpeedwell = loadImage("amberpin2.png");
}

void pinPlacement() {
                                              //this function sets all the pins on the screen in the correct position
                                             //text labels are also set at correct position
    fill(0);
    image(theNether,980,10);
    text("the nether inn",925,10);
    image(thePheonix,943,37);
    text("the pheonix",934,37,0);
    image(medina,918,60);
    text("medina",918,60);
    image(DCA,928,87);
    text("DCA",928,87);
    image(theSocial,880,53);
    text("the social",880,53);
    image(tonic,854,122);
    text("tonic",854,122);
    image(braes,772,165);
    text("braes",772,165);
    image(laings,608,243);
    text("laings",608,243);
    image(artbar,390,235);
    text("artbar",390,290);
    image(droughys,370,239);
    text("droughys",370,239);
    image(theTaybridge,235,247);
    text("the taybridge",235,300);
    image(theSpeedwell,175,245);
    text("the speedwell",175,245);
}

void iconSetup() {
  bg = loadImage ("background.jpg");                // map background image
  overview = loadImage("overview.png");             // overview image
  graphs = loadImage("graphs.png");                 // drink comparison graphs
  currentScreen = 0;                                // start screen
  beericon = loadImage("beer_glass2 (1).png");      // loads image into variable
  dealsIcon = loadImage("deals icon 3.png");        // loads image into variable
  compassIcon = loadImage("compass icon3 (2).png"); // loads image into variable
  graphsIcon = loadImage("line graph.png");         // loads image into variable
  logo = loadImage("logo3.png");                    // loads image into variable
}
//===========================================================================================================

// references
// background loading code from "http://processing.org/examples/backgroundimage.html"
// button code from "http://processing.org/examples/button.html"
// image code from "http://processing.org/tutorials/pixels/"
// screen changing code from "http://amnonp5.wordpress.com/2012/01/28/25-life-saving-tips-for-processing/"
