
//Screen Arrangements
size(850, 850); // Output Screen Size, in pixels
background(0); // Background color to Black

//Constrants
int rectSize = 60; // size value of rectangles, 60px.
int gap = 3; //Gap between rectangles, 3px.


//Variables
/*Fit the first rectangle's Coord. to the center of the screen*/
float x = width/2 - rectSize/2;
float y = height/2 - rectSize/2;
float previousRectCenterX = x;
float previousRectCenterY = y;

int numOfRect = 1; // Number of Rectangles to put
int wayToGo = 0; //Right(0), Bottom(1), Left(2), Top(3)
int number = 1; // The numbers to be written inside rectangles.
int fillColor = 255; // Start filling with White(255).


//Here Starts the Code
while (x < width & y < height & x > 0 & y > 0) {

  // Put rectangles towards the way given.
  for (int j = 0; j < numOfRect; j++) {

    /* Draw the Rectangle on Screen */
    stroke(50); // Stroke color of the rectangle's borders
    noStroke();
    rectMode(CENTER);
    fill(fillColor, 150); // 150 here is the opacity value [0, 255]
    rect(x, y, rectSize-gap, rectSize-gap);

    /* Put the number inside of the rectangle drawn */
    fill(0); // fill color arranges the text's color on screen here.
    textAlign(CENTER, CENTER);
    textSize(15);
    text(number, x, y); // Put the given value of number as Text to the given coord.

    /* Draw the line showing the movement */
    stroke(255, 80); // Stroke color of the line, white with 80 opacity value.
    line(previousRectCenterX, previousRectCenterY, x, y);
    previousRectCenterX = x;
    previousRectCenterY = y;
    
    
    /* HERE WE WILL DETERMINE THE NEXT RECTANGLE'S POSITION 
     EXPLANAITION : 
     We place our first rectangle to the center of the screen at step 1, 
     Then we have to place our second rectangle right next of it. 
     
     Basically there are four ways to go sequantally. Right, Bottom and Left and Top.
     We can code our ways with numbers as 0 for Right, 1 for Bottom, 2 for Left and 3 for Top.
     
     Rectnumber   wayToGo      total_NumberOfRectangles_@thisWay
     ----------------------------------------------------------
      1           Right(0)           1
      
      2           Bottom(1)          1
      
      3           Left(2)            
      4           Left(2)            2
      
      5           Top(3)
      6           Top(3)             2  
      
      7           Right(0)
      8           Right(0)
      9           Right(0)           3 
      
      10          Bottom(1)
      11          Bottom(1)
      12          Bottom(1)          3
      ...
       
      Each two sequental turn, numOfRect (the number of rectangles to put) increases by one.
     */ 
    

    /* Compute the next Rectangle's Coordinates */
    if (wayToGo % 4 == 0) { // Right
      x = x + rectSize;
    } // Go to Right
    else if (wayToGo % 4 == 1) { // Bottom 
      y = y + rectSize;
    } // Go to Down
    else if (wayToGo % 4 == 2) { // Left
      x = x - rectSize;
    } // Go to Left
    else if (wayToGo % 4 == 3) { // Top
      y = y - rectSize;
    }  

    number += 1;  // Increase the number to put inside of the next Rectangle
    fillColor -= 1; // Decrease the color value (gives visual effect)
  } // End of For

  // Turn to the next Way
  if( (wayToGo-1) % 2 == 0) { 
    numOfRect += 1; // Every two turn of line, increase the value of number Of Rectangles To Put
  }
  wayToGo += 1; // Change the way (Turn)
  
}




