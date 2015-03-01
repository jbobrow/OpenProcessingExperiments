
// My interpretation of Psychedelia for the Commodore 64
// Original written in 1984 by Jeff Minter (aka Llamasoft)

// declare colours to be used
color[] palette = { 
  #FFFFFF, // WHITE
  #FF0000, // RED
  #FF7F00, // ORANGE
  #FFFF00, // YELLOW
  #00FF00, // GREEN
  #0000FF, // BLUE
  #8F00FF, // VIOLET
  #4B0082, // INDIGO // swapped indigo and violet around as indigo is darker and gives a better fade
  #000000  // BLACK
};

// set number of blocks to be displayed on the screen
int screen_width = 80;
int screen_height = 50;

// set the scaling of the blocks
int screen_scale = 8; // originally 16 in Processing 2.2.1

// create an array containing all of the on-screen blocks to be stored as colours
color[][] screenArray = new color[screen_width][screen_height];

// declare some PVector variables used to store x and y locations
PVector screen_size = new PVector( screen_width * screen_scale, screen_height * screen_scale );
PVector cursor = new PVector( mouseX/screen_scale, mouseY/screen_scale );

// declare variables used for the preset shapes
PVector[][] preset;
int selectedPreset = 0;
int decaySpeed = 4;

// declare variable used for selection of on-screen symmetry 
int selectedSymmetry = 0;

// declare variables used for the on-screen display of messages
String osd_message = "";
int osd_counter = 0;
int osd_change = 6;

// set up the variables for the auto mode
boolean autoMode = false;
int autoX = cursor.x;
int autoY = cursor.y;
float autoAngle = 0;
float autoRadius = 3;
int autoMovementType = 0;


// setup function
void setup() {
  // set the output screen size
  size( 640, 400 ); // originally 1280, 800 in Processing 2.2.1

  // set all the array variables to their start-up values
  populateArrays();

  // set the frame rate to 30 fps
  frameRate(30);

  // do not allow strokes on all graphical shapes
  noStroke();

  // set the text size for the on-screen display
  textSize(28); // originally 36 in Processing 2.2.1
} // end void setup()


// draw function
void draw() {
  // make the background colour black 
  background(0);

  // only decay the block colours on certain frames selected by decaySpeed
  if (frameCount%decaySpeed==0) { 
    decayColours();
  }

  // only add the preset shape to the screen if the mouse button is pressed
  if (mousePressed) { 
    displayPreset();
  }

  // draw the the blocks to the screen
  displayScreen();

  // execute the following is auto mode is off
  if (!autoMode) {
    // set the cursor position to the mouse position
    cursor.x = mouseX/screen_scale;
    cursor.y = mouseY/screen_scale;
  } else {  // execute the following is auto mode is on
    // run automatically
    executeAutoMode();
  } // end if(!autoMode)

  // draw the cursor to the screen
  displayCursor();

  // display start up messages only at the beginning
  if (frameCount<580) { displayStartUpMessages(); }

  // display messages to the screen
  displayOSD();

} // end void draw()


void displayStartUpMessages() {
  if (frameCount == 30) { 
    setOSDmessage("BASED UPON 'PSYCHEDELIA'");
  }
  if (frameCount == 120) { 
    setOSDmessage("BY JEFF 'YAK' MINTER");
  }
  if (frameCount == 210) { 
    setOSDmessage("Hold down the mouse button to draw");
  }
  if (frameCount == 300) { 
    setOSDmessage("Select preset shapes with keys 1-6");
  }
  if (frameCount == 390) { 
    setOSDmessage("or by pressing the spacebar");
  }
  if (frameCount == 480) { 
    setOSDmessage("Press the 's' key to change the symmetry");
  }
  if (frameCount == 570) { 
    setOSDmessage("Press the 'a' key to start/stop auto mode");
  }
} // end void displayStartUpMessages()


// executeAutoMode() automatically changes cursor position, preset shape and symmetry
void executeAutoMode() {

  // change movement type if random(10) is equal to zero
  if ((int)random(10)==0) {
    autoMovementType = (int) random(2);
  }
  // change the symmetry if random(40) is equal to zero 
  if ((int)random(40)==0) {
    selectedSymmetry = (int) random(5);
  }
  // change the preset shape if random(40) is equal to zero 
  if ((int)random(40)==0) {
    selectedPreset = (int) random(6);
  }

  // move in a clockwise direction
  if (autoMovementType == 0) { 
    autoAngle += TWO_PI/45;
    if ((int) random(5) == 0) {
      autoRadius=(int)random(1, 6);
    }
  }
  // move in an anticlockwise direction
  if (autoMovementType == 1) { 
    autoAngle -= TWO_PI/45;
    if ((int) random(5) == 0) {
      autoRadius=-(int)random(1, 6);
    }
  }

  // update auto mode x and y position
  autoX = autoX + (sin(autoAngle) * autoRadius);
  autoY = autoY + (cos(autoAngle) * autoRadius);

  // if x and y leaves screen boundaries then wrap
  if (autoX < 0) { 
    autoX = screen_width;
  }
  if (autoX > screen_width) { 
    autoX = 0;
  }
  if (autoY < 0) { 
    autoY = screen_height;
  }
  if (autoY > screen_height) { 
    autoY = 0;
  }

  // update cursor position to auto positions
  cursor.x = autoX;
  cursor.y = autoY;

  // add the preset shape to the screen if random(10) > 1 (simulates clicking and releasing the mouse button)
  if ((int)random(10)>3) { displayPreset(); }
} // end void executeAutoMode()


// decayColors() cycles the block colours through the palette until they become black
void decayColours() {
  for (int y=0; y<screen_height; y++) {
    for (int x=0; x<screen_width; x++) {
      color c = screenArray[x][y];
      for (int i=0; i<palette.length-1; i++) {

        // if the block at x,y equals a palette colour
        if (c==palette[i]) {

          // increase the palette colour of the block
          screenArray[x][y] = palette[i+1];
        } // end if(c==palette[i])
      } // end for(i)
    } // enf for(x))
  } // end for(y)
} // end void decayColors()


// displayPreset() draws the selected preset shape to the screen array of blocks
void displayPreset() {
  for (int i=0; i<50; i++) {

    // if the preset data is not -1
    if (preset[selectedPreset][i].z != -1) {

      // get the location of a block from the preset data
      int x = (int)cursor.x + (int)preset[selectedPreset][i].x;
      int y = (int)cursor.y + (int)preset[selectedPreset][i].y;

      // ensure that the preset shape wraps around the edges of the screen
      if (x<0) { 
        x=screen_width+x;
      }
      if (x>screen_width-1) { 
        x=x-screen_width;
      }
      if (y<0) { 
        y=screen_height+y;
      }
      if (y>screen_height-1) { 
        y=y-screen_height;
      }

      // draw each preset shape's block to screenArray

      // do this for all symmetry as this is drawn at the current cursor location
      screenArray[x][y] = palette[ (int)preset[selectedPreset][i].z ];

      // y-axis and quad symmetry 
      if (selectedSymmetry==1 || selectedSymmetry==4) {
        screenArray[x][screen_height-1-y] = palette[ (int)preset[selectedPreset][i].z ];
      }

      // x-y-axis and quad symmetry
      if (selectedSymmetry==2 || selectedSymmetry==4) {
        screenArray[screen_width-1-x][screen_height-1-y] = palette[ (int)preset[selectedPreset][i].z ];
      }

      // x-axis and quad symmetry
      if (selectedSymmetry==3 || selectedSymmetry==4) {
        screenArray[screen_width-1-x][y] = palette[ (int)preset[selectedPreset][i].z ];
      }
    } // end for(i)
  } // end for(i)
} // end void displayPreset


// displayScreen() draws all of the blocks held in the screenArray[][] to the screen
void displayScreen() {
  for (int y=0; y<screen_height; y++) {
    for (int x=0; x<screen_width; x++) {
      drawBlock(x, y, screenArray[x][y]);
    } // end for(y)
  } // end for(x)
} // end void displayScreen()


// drawBlock() draws a single block to the screen
void drawBlock( int x, int y, color c ) {
  // .75 turns 8 pixel blocks into 6 pixel blocks
  // .125 is the offset that is half the gap (.25/2) between blocks
  fill(c); 
  rect( (x*screen_scale)+(screen_scale*.125), (y*screen_scale)+(screen_scale*.125), screen_scale*.75, screen_scale*.75);
} // end void drawBlock()


// displayCursor() draws the white cursor to the screen
void displayCursor() {
  drawBlock((int)cursor.x, (int)cursor.y, 255);
} // end void displayCursor()


// setOSDmessage() sets the variables used by displayOSD()
void setOSDmessage( String s ) {
  osd_message = s;
  osd_counter = 1;
} // end setOSDmessage()


// displayOSD() fades in and out messages to the screen
void displayOSD() {
  // only do the following if osd_counter is greater than zero (i.e. a message needs displaying)
  if (osd_counter > 0) {

    // set the message colour to white and the alpha value to osd_counter
    fill( 255, osd_counter );

    // display the message on screen
    text(osd_message, (width*.5)-(textWidth(osd_message)*.5), height-(height*.1));

    // change osd_counter and therefore the alpha value of the message
    osd_counter+=osd_change;

    // if the alpha value of the message reaches maximum opaqueness then
    // set osd_change to a negative value to fade out the current message
    if (osd_counter>255) { 
      osd_change=-osd_change;
    }

    // if the alpha value of the message reaches maximum transparency then
    // set osd_change to a positive value ready to fade in the next message
    if (osd_counter<0) { 
      osd_change=-osd_change;
    }
  } // end if(os_message)
} // end void displayOSD()


// keyPressed() captures any key strokes made the the participant
void keyPressed() {
  switch(key) {

    // change the preset shape if a number key is pressed and display a message on screen
  case '1':
    selectedPreset = 0;
    setOSDmessage("PRESET 1");
    break;
  case '2':
    selectedPreset = 1;
    setOSDmessage("PRESET 2");
    break;
  case '3':
    selectedPreset = 2;
    setOSDmessage("PRESET 3");
    break;
  case '4':
    selectedPreset = 3;
    setOSDmessage("PRESET 4");
    break;
  case '5':
    selectedPreset = 4;
    setOSDmessage("PRESET 5");
    break;
  case '6':
    selectedPreset = 5;
    setOSDmessage("PRESET 6");
    break;

    // rotate through the preset shapes if the spacebar is pressed
  case ' ':
    selectedPreset++;
    // if selectedPreset is greater than the number of presets available then reset to zero
    if (selectedPreset>5) { 
      selectedPreset=0;
    } // end if(selectedPreset)
    setOSDmessage("PRESET "+(selectedPreset+1));
    break;

    // turn auto mode on or off by pressing the 'a' key
  case 'A':
  case 'a':
    if (autoMode) { 
      autoMode=false;
    } else { 
      autoMode=true;
      autoX=cursor.x;
      autoY=cursor.y;
    }
    break;

    // change the selected symmetry is the 's' key is pressed and display a message on screen
  case 'S':
  case 's':

    // is the 's' key is pressed choose the next type of symmetry
    selectedSymmetry++;

    // if selectedSymmetry is more than the available types
    if (selectedSymmetry>4) { 

      // reset back to no symmetry
      selectedSymmetry=0;
    } // end if(selectedSymmetry)

    // based upon the new selected symmetry display a message to the screen
    switch (selectedSymmetry) {
    case 0:
      setOSDmessage("NO SYMMETRY");
      break;
    case 1:
      setOSDmessage("Y-AXIS SYMMETRY");
      break;
    case 2:
      setOSDmessage("X-Y AXIS SYMMETRY");
      break;
    case 3:
      setOSDmessage("X-AXIS SYMMETRY");
      break;
    case 4:
      setOSDmessage("QUAD SYMMETRY");
      break;
    } // end switch(selectedSymmetry)
    break;
  } // end switch(key)
} // end keyPressed()


// set all the variables to their start-up values
void populateArrays() {

  // fill screen array with black blocks
  for (int y=0; y<screen_height; y++) {
    for (int x=0; x<screen_width; x++) {
      screenArray[x][y] = color(0);
    } // end for(y)
  } // end for(x)

  // create preset arrays and populate with x=0, y=0, z=-1
  // the third dimension ( the z-axis ) is used to store the block colour
  // .z equal to -1 means that block is unused ( i.e. black )
  // array limit is set 50 to allow for more complex preset shapes to be drawn
  // however this could currently be reduced to 28 as this is the length of the largest preset I have created
  preset = new PVector[6][50];
  for (int p=0; p<6; p++) {
    for (int i=0; i<50; i++) { 
      preset[p][i] = new PVector(0, 0, -1);
    }
  }

  // populate preset arrays with coordinates based around the cursor position

  // define preset[0] 
  preset[0][0].set( -1, -5, 0 );
  preset[0][1].set( 1, -5, 0 );
  preset[0][2].set( 0, -4, 1 );
  preset[0][3].set( 0, -3, 2 );
  preset[0][4].set( 0, -2, 3 );
  preset[0][5].set( -5, -1, 0 );
  preset[0][6].set( -5, 1, 0 );
  preset[0][7].set( -4, 0, 1 );
  preset[0][8].set( -3, 0, 2 );
  preset[0][9].set( -2, 0, 3 );
  preset[0][10].set( 5, -1, 0 );
  preset[0][11].set( 5, 1, 0 );
  preset[0][12].set( 4, 0, 1 );
  preset[0][13].set( 3, 0, 2 );
  preset[0][14].set( 2, 0, 3 );
  preset[0][15].set( -1, 5, 0 );
  preset[0][16].set( 1, 5, 0 );
  preset[0][17].set( 0, 4, 1 );
  preset[0][18].set( 0, 3, 2 );
  preset[0][19].set( 0, 2, 3 );
  preset[0][20].set( -1, -1, 3 );
  preset[0][21].set( 0, -1, 3 );
  preset[0][22].set( 1, -1, 3 );
  preset[0][23].set( -1, 0, 3 );
  preset[0][24].set( 1, 0, 3 );
  preset[0][25].set( -1, 1, 3 );
  preset[0][26].set( 0, 1, 3 );
  preset[0][27].set( 1, 1, 3 );

  // define preset[1] 
  preset[1][0].set( 2, -2, 4 );
  preset[1][1].set( 0, -1, 0 );
  preset[1][2].set( 1, -1, 4 );
  preset[1][3].set( 1, 0, 0 );
  preset[1][4].set( 2, 0, 2 );
  preset[1][5].set( 3, 0, 2 );
  preset[1][6].set( -1, 1, 1 );
  preset[1][7].set( 0, 1, 1 );
  preset[1][8].set( 1, 1, 3 );
  preset[1][9].set( -2, 2, 1 );
  preset[1][10].set( 0, 2, 1 );
  preset[1][11].set( 2, 2, 3 );
  preset[1][12].set( 0, 3, 1 );
  preset[1][13].set( 3, 3, 3 );
  preset[1][14].set( 4, 4, 3 );

  // define preset[2] 
  preset[2][0].set( -6, -6, 0 );
  preset[2][1].set( 5, -5, 0);
  preset[2][2].set( -4, -4, 1);
  preset[2][3].set( 3, -3, 1 );
  preset[2][4].set( -6, -2, 0 );
  preset[2][5].set( -2, -2, 2 );
  preset[2][6].set( 6, -2, 0 );
  preset[2][7].set( -4, -1, 1 );
  preset[2][8].set( 1, -1, 1 );
  preset[2][9].set( 4, -1, 1 );
  preset[2][10].set( -4, 1, 1 );
  preset[2][11].set( -1, 1, 2 );
  preset[2][12].set( 4, 1, 1 );
  preset[2][13].set( -6, 2, 0 );
  preset[2][14].set( 2, 2, 2 );
  preset[2][15].set( 6, 2, 0 );
  preset[2][16].set( -3, 3, 1 );
  preset[2][17].set( 4, 4, 1 );
  preset[2][18].set( -5, 5, 0 );
  preset[2][19].set( 6, 6, 0 );

  // define preset[3] 
  preset[3][0].set( -5, -6, 4 );
  preset[3][1].set( -6, -5, 4 );
  preset[3][2].set( -4, -5, 4 );
  preset[3][3].set( -10, -4, 3 );
  preset[3][4].set( -5, -4, 4 );
  preset[3][5].set( -10, -3, 3 );
  preset[3][6].set( 2, -2, 0 );
  preset[3][7].set( 1, -1, 0 );
  preset[3][8].set( 0, 0, 0 );
  preset[3][9].set( -7, 1, 1 );
  preset[3][10].set( 7, 2, 2 );
  preset[3][11].set( -9, 3, 1 );
  preset[3][12].set( -5, 3, 1 );
  preset[3][13].set( 6, 3, 2 );
  preset[3][14].set( -3, 5, 2 );
  preset[3][15].set( -2, 5, 2 );
  preset[3][16].set( -3, 6, 2 );
  preset[3][17].set( -2, 6, 2 );

  // define preset[4] 
  preset[4][0].set( 0, -1, 5 );
  preset[4][1].set( -1, 0, 5 );
  preset[4][2].set( 0, 0, 5 );
  preset[4][3].set( 0, 1, 5 );
  preset[4][4].set( 0, 2, 5 );
  preset[4][5].set( 5, 2, 4 );
  preset[4][6].set( 0, 3, 5 );
  preset[4][7].set( 1, 3, 4 );
  preset[4][8].set( 2, 3, 4 );
  preset[4][9].set( 3, 3, 4 );
  preset[4][10].set( 4, 3, 4 );
  preset[4][11].set( 6, 3, 4 );
  preset[4][12].set( 0, 4, 4 );
  preset[4][13].set( 1, 4, 4 );
  preset[4][14].set( 2, 4, 4 );
  preset[4][15].set( 3, 4, 4 );
  preset[4][16].set( 4, 4, 4 );
  preset[4][17].set( 0, 5, 0 );
  preset[4][18].set( 1, 5, 0 );
  preset[4][19].set( 2, 5, 0 );
  preset[4][20].set( 4, 5, 0 );
  preset[4][21].set( 0, 6, 0 );
  preset[4][22].set( 4, 6, 0 );
  preset[4][23].set( -1, 7, 2 );
  preset[4][24].set( 0, 7, 0 );
  preset[4][25].set( 3, 7, 2 );
  preset[4][26].set( 4, 7, 0 );

  // define preset[5] 
  preset[5][0].set( 0, -3, 5 );
  preset[5][1].set( 0, -2, 4 );
  preset[5][2].set( 0, -1, 3 );
  preset[5][3].set( 0, 0, 2 );
  preset[5][4].set( 0, 1, 3 );
  preset[5][5].set( 0, 2, 4 );
  preset[5][6].set( 0, 3, 5 );

  // below is an empty dataset used for adding new preset shapes
  /*  
   preset[][0].set( , ,  );
   preset[][1].set( , ,  );
   preset[][2].set( , ,  );
   preset[][3].set( , ,  );
   preset[][4].set( , ,  );
   preset[][5].set( , ,  );
   preset[][6].set( , ,  );
   preset[][7].set( , ,  );
   preset[][8].set( , ,  );
   preset[][9].set( , ,  );
   preset[][10].set( , ,  );
   preset[][11].set( , ,  );
   preset[][12].set( , ,  );
   preset[][13].set( , ,  );
   preset[][14].set( , ,  );
   preset[][15].set( , ,  );
   preset[][16].set( , ,  );
   preset[][17].set( , ,  );
   preset[][18].set( , ,  );
   preset[][19].set( , ,  );
   preset[][20].set( , ,  );
   preset[][21].set( , ,  );
   preset[][22].set( , ,  );
   preset[][23].set( , ,  );
   preset[][24].set( , ,  );
   preset[][25].set( , ,  );
   preset[][26].set( , ,  );
   preset[][27].set( , ,  );
   preset[][28].set( , ,  );
   preset[][29].set( , ,  );
   preset[][30].set( , ,  );
   preset[][31].set( , ,  );
   preset[][32].set( , ,  );
   preset[][33].set( , ,  );
   preset[][34].set( , ,  );
   preset[][35].set( , ,  );
   preset[][36].set( , ,  );
   preset[][37].set( , ,  );
   preset[][38].set( , ,  );
   preset[][39].set( , ,  );
   preset[][40].set( , ,  );
   preset[][41].set( , ,  );
   preset[][42].set( , ,  );
   preset[][43].set( , ,  );
   preset[][44].set( , ,  );
   preset[][45].set( , ,  );
   preset[][46].set( , ,  );
   preset[][47].set( , ,  );
   preset[][48].set( , ,  );
   preset[][49].set( , ,  );
   */

  // The following is an idea yet to be implemented to allow easier creation of preset shapes
  // fullstops would show where a block is to be drawn
  // lowercase o would be the cursor position
  // shapeRow[0] = "  .  .   .   . "
  // shapeRow[0] = "   .  ..   .   "
  // shapeRow[0] = "    . ..  .    "
  // shapeRow[0] = "     ..o..  .  "
  // shapeRow[0] = "        .      "
  // shapeRow[0] = "         .     "
  // shapeRow[0] = "          .    "
} // end void populateArrays()

