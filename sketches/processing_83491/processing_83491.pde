
/* Dana Silberberg-Sahar
 Final Project
 Baby Position and Location Calculator 
 Math, Programming & Art
 Nick Lally __ Fall 2012
 */


//Declaring Images:
PImage belly;
PImage curl;
PImage img1;
PImage img2;
PImage img3;
PImage img4;

//Array:
ShapeButton [ ] button = new ShapeButton [6]; //how many buttons+1 here I need 6
PrintWriter output;
boolean exportSelect = false;

void setup ( ) {
  /* http://processing.org/reference/createWriter_.html
   // Create a new file in the sketch directory  */
  output = createWriter("positions.csv"); 

  size( 700, 550 );
  belly = loadImage ( "Belly.png" );
  img1 = loadImage ( "img1.png" );
  img2 = loadImage ( "img2.png" );
  img3 = loadImage ( "img3.png" );
  img4 = loadImage ( "img4.png" );
  curl = loadImage ( "curl.png" );
  colorMode (RGB, 255, 255, 255, 100);//for screen
  smooth ( );
  background   (126, 168, 198);//Background Blue

  //Array definition:
  for (int i=0; i < 5 ; i++) {
    button [i] = new ShapeButton ( 612, 72+i*97, 80, i);
  }
}


void draw ( ) {
  image ( belly, 0, 0 ) ; //location of image

  //Frame for the pic:
  noFill ( ) ;
  stroke  (31, 8, 252);
  strokeWeight ( 3 );
  rect (12, 40, 590, 500);
  boolean shapeSelect = false;

  //"Show Baby's Position - this displays the baby's position as well as exports the coordinates to a CSV files
  strokeWeight ( 2 );
  stroke (31, 8, 252);
  fill (252, 200, 8);
  rect (32, 5, 550, 65);
  fill (31, 8, 252);
  textSize (30);
  text ("Show Baby's Position", 155, 50);

  //for-loops to make the shapes buttons
  for (int i=0; i < 5; i++) {
    button [i].display ( );
    if (button [i].dropShape == true) {
      shapeSelect = true;
    }
  }

  //buttons text
  fill (255, 255, 255);
  textSize (18);
  text ("Bulge", 617, 134);
  text ("Nudge", 617, 232);
  text ("Kick", 617, 330);
  text ("Wigggle", 617, 428);
  text ("Hickups", 617, 524);


  //Checks if "Show Baby Position" is selected  
  if (exportSelect == true) {

    // Button selected - display the proper position shape based on the location of the movements
    if (shapeSelect == true ) {
      if (button[0].dropShape == false) {
        println("display image - default");
        image ( curl, 130, 150) ; //location of image
      } 
      else {
        if (button[0].belx <300) {
          if (button[0].bely <330) {
            println("display image - 1");  
            image ( img1, 170, 180) ; //location of image
          } 
          else {
            println("display image - 2");  
            image ( img2, 170, 180) ; //location of image
          }
        } 
        else {
          if (button[0].bely <330) {
            println("display image - 3");  
            image ( img3, 190, 180) ; //location of image
          } 
          else {
            println("display image - 4");  
            image ( img4, 190, 180) ; //location of image
          }
        }
      }
    }
  }
  //to check mouse location (y/n hover over button)
  for (int i=0; i < 5; i++) {
    if (mouseX >= button [i].locX && mouseX <= (button [i].locX + button [i].bSize) && mouseY >= button [i].locY && mouseY <= (button [i].locY + button [i].bSize)) {
    }
  }
}




// Function for shapes drawing on the Belly-pic area
void mousePressed ( ) {

  //Selection of export to file
  if (mouseX>= 32 && mouseX<= 550&& mouseY>= 5 && mouseY<= 65) {
    // println ("working button!!");
    output.flush(); // Writes the remaining data to the file
    output.close(); // Finishes the file
    exportSelect = true; //Indicate the button is selected for use in draw()
  } 
  else {
    exportSelect = false;
  }


  for (int i=0; i < 5; i++) {

    if (button [i].belLoc( ) == true ) {

      println("write coordinate to file");
      output.println(button [i].belx + "," +button [i]. bely + "," +button[i].shhape); // Write the coordinate to the file
      button [i].dropShape=true;
    }
  }
  for (int i=0; i < 5; i++) {
    button [i].bLocCk ( );
  }
}


//Classes///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
    if (mouseX >= 120 && mouseX <= 480 && mouseY >= 180 && mouseY <= 480 && selected == true) {
      println ("belx:"+mouseX+"bely:"+ mouseY );
      dropShape = true;
      belx=mouseX;
      bely=mouseY;
      println( "Dropping shape on belly");
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
      //      shapeMode(CENTER);
      bezier(locx+10, locy+20, locx+25, locy+15, locx+79, locy+0, locx+65, locy+70);
    } 

    //Nudge
    if (pick == 1 ) {
      stroke (255, 120, 30 ) ;
      noFill ( ) ;
      strokeWeight (5);
      //      shapeMode(CENTER);
      line (locx+40, locy+15, locx+50, locy+8);
      line (locx+30, locy+30, locx+60, locy+23);
      line (locx+20, locy+45, locx+70, locy+38);
    }

    //kick
    if (pick == 2 ) {
      stroke (45, 140, 40 ) ;
      noFill ( ) ;
      strokeWeight (5);
      //    shapeMode(CENTER);
      bezier (locx+20, locy+10, locx+5, locy+80, locx+80, locy+5, locx+70, locy+70);
    }

    //Wiggle
    if (pick == 3 ) {
      stroke (25, 75, 250) ;
      noFill ( ) ;
      strokeWeight (5);
      //    shapeMode(CENTER);
      ellipse ( locx+40, locy+32, 20, 20);
      ellipse ( locx+40, locy+32, 35, 35);
      ellipse ( locx+40, locy+32, 50, 50);
    }    

    //Hickup
    if (pick == 4 ) {
      fill (250, 250, 0);
      //shapeMode(CENTER);
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
    }
  }
}


