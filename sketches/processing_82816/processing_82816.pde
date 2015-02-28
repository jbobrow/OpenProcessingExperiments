
/* Dana Silberberg-Sahar
 Final Project
 What's my Baby's Position?"
 Math, Programming & Art
 Nick Lally __ Fall 2012
 */
//Declaring Images:
PImage belly;
//Array:
ShapeButton [ ] button = new ShapeButton [6]; //how many buttons+1 here I need 6

void setup ( ) {
  size( 700, 550 );
  belly = loadImage ( "Belly.png" );
  colorMode (RGB, 255, 255, 255, 100);//for screen
  smooth ( );
  background   (126, 168, 198);//Background Blue

  //Array definition:
  for (int i=0; i < 5 ; i++) {
    //(locX, locY, bSize, shhape) - just for me, to know what the parameters are... 
    button [i] = new ShapeButton ( 612, 72+i*97, 80, i);
  }
}
void draw ( ) {
  image ( belly, 0, 0 ) ; //location of image

  if (mousePressed) {
    println ("x:"+mouseX+"y:"+ mouseY ); //gets x,y coords (to draw the frame to the pic and  help "navigate" it later..)
  }

  //Frame for the pic:
  noFill ( ) ;
  stroke (179, 200, 216);//Background Blue, but lighter...
  strokeWeight ( 3 );
  rect (12, 40, 590, 500);

  //"What's my Baby's Position" button (calculates the data..) ** will calculate....
  strokeWeight ( 2 );
  stroke (179, 200, 216);//Background Blue, but lighter...
  fill (129, 164, 211);
  rect (32, 5, 550, 65);
  fill (255, 255, 255);
  textSize (30);
  text ("What's my Baby's Position?", 105, 50);

  //for-loops to make the shapes buttons
  for (int i=0; i < 5; i++) {
    button [i].display ( );
  }

  //buttons text
  fill (255, 255, 255);
  textSize (18);
  text ("Bulge", 617, 134);
  text ("Nudge", 617, 232);
  text ("Kick", 617, 330);
  text ("Wigggle", 617, 428);
  text ("Hickups", 617, 524);

  //to check mouse location (y/n hover over button)
  for (int i=0; i < 5; i++) {
    if (mouseX >= button [i].locX && mouseX <= (button [i].locX + button [i].bSize) && mouseY >= button [i].locY && mouseY <= (button [i].locY + button [i].bSize)) {
    }
  }
}
// Function for shapes drawing on the Belly-pic area
void mousePressed ( ) {
  println("HELP!!!");
  for (int i=0; i < 5; i++) {

    if (button [i].belLoc( ) == true ) {

      button [i].dropShape=true;
    }
  }
  for (int i=0; i < 5; i++) {
    button [i].bLocCk ( );
  }
}

//Class/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class ShapeButton {

  int bSize;
  int locX;
  int locY;
  int shhape;
  boolean selected;//for the buttons
  int belx;
  int bely;
  boolean dropShape; //if true then show the shape on belly

  //builder
  ShapeButton (int _locX, int _locY, int _bSize, int _shhape) {
    bSize = _bSize;
    locX = _locX;
    locY = _locY;
    shhape = _shhape;
    selected = false;
    dropShape = false;
  }

  //Checks if mouse loc is over the button
  void bLocCk ( ) {
    if (mouseX >= locX && mouseX <= (locX + bSize) && mouseY >= locY && mouseY <= (locY + bSize)) {
      println ("xbut:"+mouseX+"ybut:"+ mouseY );
      selected = true;
    }
    else {
      selected = false;
    }
  }
  //Checks if mouse loc is over the belly pic - - - - DOES WORK!!! *****************************************************************************************************************************************************
  boolean belLoc ( ) {
    println( "YES!YES!YES!YES!YES!YES!YES!YES!YES!YES!YES!YES!YES!");
    if (mouseX >= 140 && mouseX <= 470 && mouseY >= 180 && mouseY <= 480 && selected == true) {
      println ("belx:"+mouseX+"bely:"+ mouseY );
      dropShape = true;
      belx=mouseX;
      bely=mouseY;
      return true;
    }
    return false;
  }




  //function for shapes
  void shapePick (int pick, int locx, int locy) {
    //bulge
    if (pick == 0 ) {
      stroke (255, 0, 0 ) ;
      noFill ( ) ;
      strokeWeight (5);
      bezier(locx+10, locy+20, locx+25, locy+15, locx+79, locy+0, locx+65, locy+70);
    } 
    //Nudge
    if (pick == 1 ) {
      stroke (255, 120, 30 ) ;
      noFill ( ) ;
      strokeWeight (5);
      line (locx+40, locy+15, locx+50, locy+8);
      line (locx+30, locy+30, locx+60, locy+23);
      line (locx+20, locy+45, locx+70, locy+38);
    }
    //kick
    if (pick == 2 ) {
      stroke (45, 140, 40 ) ;
      noFill ( ) ;
      strokeWeight (5);
      bezier (locx+20, locy+10, locx+5, locy+80, locx+80, locy+5, locx+70, locy+70);
    }
    //Wiggle
    if (pick == 3 ) {
      stroke (25, 75, 250) ;
      noFill ( ) ;
      strokeWeight (5);
      ellipse ( locx+40, locy+32, 20, 20);
      ellipse ( locx+40, locy+32, 35, 35);
      ellipse ( locx+40, locy+32, 50, 50);
    }    
    //Hickup
    if (pick == 4 ) {
      fill (250, 250, 0);
      ellipse ( locx+30, locy+22, 20, 20);
      ellipse ( locx+50, locy+42, 20, 20);
    }
  }

  // display:
  void display ( ) {
    strokeWeight(2);
    stroke (179, 200, 216);//Background Blue, but lighter...
    fill (129, 164, 211);
    rect (locX, locY, bSize, bSize);
    shapePick (shhape, locX, locY);

    if (dropShape ==  true) {
      shapePick(shhape, belx, bely);
      println("shape" + shhape);
    }
  }
}


