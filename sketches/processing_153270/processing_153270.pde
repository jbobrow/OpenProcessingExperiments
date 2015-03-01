
/*
 * Creative Coding
 * Week 2, 03 - n squares
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * In the next iteration of the square drawing sketch, this version selects a pattern of 5 by 5 squares
 * colours (on average) 20% of them red.
 * Again with a 20% chance, it then chooses to move each square either horizontally or vertically 
 * in each case in one of two directions and over one of two distances 
 * Chose not to use the randomSeed functio 
 * Thus any one square can be brown or red, it can move to left or right over one of two distances
 * and it can move to left or right over one of two distances
 */

void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(0.5);  // set the frame rate to 1 draw() call per two seconds
  // randomSeed(hour() + minute() + second() + millis());
 //randomSeed(6);
}

void draw() {
  background(180); // clear the screen to grey
  int num = 5;
  int gap = 3;
  int margin = 20;
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - 2*margin - (num - 1) * gap ) / (float)num;
  println("       ");
  println("       ");
  print( "cellsize = " + cellsize);
  println("       ");

  for (int i=0; i<num; i++) {  //outer loop for the columns
    for (int j=0; j<num; j++) {  //inner loop for the rows

      int moveHoriz = (int) random(0, 5);
      int moveVert = (int) random(0, 5);
      //   int lf = 0; 
      int rt = 0; 
      int up = 0;
      int col = (int) random(0, 5);

      fill( 130, 60, 61, 220); // rectangle  There is an alpha value so the shadow can be seen through it
      if (col == 0) { 
        fill (163, 14, 32, 220);
        print( "  red ");
      }  //enf red if
      else {
        print( "  brn ");
      }  //end of brown else

      switch(moveHoriz) { //moveHoriz==0 so there is horizontal moveHorizment

      case 0:   //for moving to the left
        int moveLf = (int) random(0, 2);

        if (moveLf ==0) { 
          rt = -3;
          print( "  horiz = " + rt);
        } //end of if
        else {
          rt = -6;
          print( "  horiz = " + rt);
        }   //end of else
        break;

      case 1: //for moving to the right
        int moveRt = (int) random(0, 2);

        if (moveRt == 1) {      
          rt =3;
          print( "  horiz = " + rt);
        } //end of if
        else {
          rt = 6;
          print( "  horiz = " + rt);
        }   //end of else
        break;
      } //end of switch moveHoriz


      switch(moveVert) { //moveVert==0 so there is Vertical movement

        case 0:   //for moving up
        int moveUp = (int) random(0, 2);

        if (moveUp ==0) { 
          up = -3;
          print( "  vert = " + up);
        } //end of if
        else {
          up = -6;
          print( "  vert = " + up);
        }   //end of else
        break;

      case 1: //for moving to the right
        int moveDn = (int) random(0, 2);

        if (moveDn == 1) {      
          up =3;
          print( "  vert = " + up);
        } //end of if
        else {
          up = 6;
          print( "  vert = " + up);
        }   //end of else
        break;
      } //end of switch moveVert

      rect(20 +gap * i + cellsize * i + rt, 20 + gap * j + cellsize * j + up, cellsize, cellsize);
      rt = 0;
      up = 0;
      println("       ");
    }  //end of inner loop
  }  //end of outer loop
}  //end of draw



