
/** 
 * Title: ARCS WITH VARIABLES AND A MOUSE FUNCTION<br>
 * Name: CHARLES HANNA <br>
 * Date: 24/09/2013 <br>
 * Assignment: A_1_5 <br> 
 **/

// declaration of the x & y variables globally
  int xPos;
  int yPos;
    
//  PI shapes
  int pi1 = 0;
  float pi2 = QUARTER_PI;
  float pi3 = HALF_PI;
  float pi4 = HALF_PI+QUARTER_PI;
  float pi5 = PI;
  float pi6 = PI+QUARTER_PI;
  float pi7 = PI+HALF_PI;
  float pi8 = PI+HALF_PI+QUARTER_PI;
  float pi9 = TWO_PI;
  float pi10 = TWO_PI+QUARTER_PI;

// arc size
  int arcSize1 = 50;
  int arcSize2 = arcSize1*2;
  int arcSize3 = arcSize1*3;
  int arcSize4 = arcSize1*4;
  int arcSize5 = arcSize1*5;
  int arcSize6 = arcSize1*6;
  int arcSize7 = arcSize1*7;
  int arcSize8 = arcSize1*8;
  int arcSize9 = arcSize1*9;

// colors variables
  color lightest = color(51, 255, 255, 50);
  color lighter = color(102, 255, 0, 50);
  color light = color(204, 255, 0, 50);
  color midLight = color(255, 255, 51, 50);
  color mid = color(255, 153, 0, 50);
  color midDark = color(255, 0, 0, 50);
  color dark = color(153, 0, 0, 50);
  color darker = color(102, 0, 102, 50);
  color darkest = color(0, 0, 153, 50);

// text variable
  String pressBtn = "Press mouse button!"; 
  String pressBtnAgain = "  Press mouse button again!";



// setup function
void setup(){
  
  
  // Set the dimensions of the window
  size(500, 500);
  
  // Set the background to black
  background(0);
 

  // x position local variables value
  xPos = width/2;

  // y position local variables value
  yPos = height/2;
  

  //fill & stroke color of the first row
  stroke(255);
  strokeWeight(2);

  //text on top
  text(pressBtn, xPos/2, yPos/3);
  

  //initial arcs sizes and position and colors
  fill(darkest);
  arc(yPos, yPos, arcSize9, arcSize9, pi1, pi3);

  fill(darker);
  arc(xPos, yPos, arcSize8, arcSize8, pi2, pi4);

  fill(dark);
  arc(xPos, yPos, arcSize7, arcSize7, pi3, pi5);

  fill(midDark);
  arc(xPos, yPos, arcSize6, arcSize6, pi4, pi6);

  fill(mid);
  arc(xPos, yPos, arcSize5, arcSize5, pi5, pi7);

  fill(midLight);
  arc(xPos, yPos, arcSize4, arcSize4, pi6, pi8);

  fill(light);
  arc(xPos, yPos, arcSize3, arcSize3, pi7, pi9);

  fill(lighter);
  arc(xPos, yPos, arcSize2, arcSize2, pi8, pi10);
  
}


// draw function
void draw(){

  //condition: if the mouse button is pressed initiate function
  if (mousePressed) {
    //another text will show + a color
      fill(200);   
      text(pressBtnAgain, xPos, yPos/3);
      
      
    //another arcs series will show with different sizes and position and colors/alpha  
      fill(darkest);
      arc(xPos, yPos, arcSize1, arcSize1, pi8, pi10);
  
      fill(darker);
      arc(xPos, yPos, arcSize2, arcSize2, pi7, pi9);
  
      fill(dark);
      arc(xPos, yPos, arcSize3, arcSize3, pi6, pi8);
  
      fill(midDark);
      arc(xPos, yPos, arcSize4, arcSize4, pi5, pi7);
  
      fill(mid);
      arc(xPos, yPos, arcSize5, arcSize5, pi4, pi6);
  
      fill(midLight);
      arc(xPos, yPos, arcSize6, arcSize6, pi3, pi5);
  
      fill(light);
      arc(xPos, yPos, arcSize7, arcSize7, pi2, pi4);
  
      fill(lighter);
      arc(xPos, yPos, arcSize8, arcSize8, pi1, pi3);
  }
}
