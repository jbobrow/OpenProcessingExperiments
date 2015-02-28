
/* Written and coded by Alastair McDoougall Student Number z3335637 COFA UNSW April 2011*/

//--------------------------The Variable set up--------------------------//

//Stating variable for the code

int x;   // generic variable used below for creating a fill 
int y;  // generic variable used below for creating a fill 

int H;  // Variable used to randomly create a colour for the line/cure to draw in, named H to specify Hue
int S;  // Variable used to randomly create a colour for the line/cure to draw in, named S to specify Saturation
int V;  // Variable used to randomly create a colour for the line/cure to draw in, named V to specify Value/Brightness

float ufX;   // Variable used to trace mouse
float ufY;   // Variable used to trace mouse
float pufX;  // Variable used to trace mouse previous postion
float pufY;  // Variable used to trace mouse previous postion

float traceXY = 0.05; // Variable that determines the speed and easing amount the draw object follows the mouse


//--------------------------The setup section--------------------------//
void setup () {

  size(600,600);         // the size of the window
  background(255);       // thw default colour of the background currently set to white
  smooth();
  H = int(random(360));  //  Random variable 0-360 to determine Hue colour
  S = int(random(100));  //  Random variable 0-100 to determine Saturation
  V = int(random(100));  //  Random variable 0-100 to determine Brigthness
  x = width;             // Variable based on width of window
  y = height;            // Variable based on height of window
}


//--------------------------The draw setup section--------------------------//
void draw () {
  // Following section use to creat the mouse follow speed and easing
  pufX = ufX;
  pufY = ufY;

  ufX = ufX + traceXY * (mouseX - ufX);
  ufY = ufY + traceXY * (mouseY - ufY);

  fill(0,0,0,0); // Create a fill base on predetermined variable


  //--------------------------The main drawing function--------------------------//

  if (mousePressed) {    // When the mouse if pressed the colour of the line changes randomly
    H = int(random(360));
    S = int(random(100));
    V = int(random(100));
  }
  else {               // the actual drawing Section
    stroke(H,S,V,50);
      line(pufX,pufY,mouseX,ufX+S);
      line(pufX,pufY,mouseX,ufX-S);
      curve(pufX+2,pufY+2,mouseX+S,ufX+2,mouseY/2,pufY/2,pufX+S,S*2);
      curve(pufX,pufY,mouseX,ufX,mouseY,pufY,V,S);
    println("H = " + H +" S = "+ S + " V = "+ V);
  }
  if (keyPressed == true) { // Reset the window by apply a whtie backround over everything
    background(255);
  }
}


