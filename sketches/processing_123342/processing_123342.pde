

/* 

Triangle drawing program
Language: Processing

Draws a triangle whenever the mouse buttonis press.
Erases when the mouse button is pressed.

*/

// declare your variables:
float redValue = 0; //varable to hold the red colour
float greenValue = 0; //varable to hold the red colour
float blueValue = 0; //varable to hold the red colour

// the setup() method runs at the begining of the program:

void setup() {
   size(600, 400); //sets the size of the applet window
   background(0); //sets background to black
   fill(0); //sets the colour fill shapes with (o = black)
   smooth(); //draw with antialiased edges
}

/*
the draw() method runs repeatedly, as long as the applet window
is open. It refreshes the window, and anything else you program
it to do:
*/

void draw() {
// Pick random colours for red, green, and blue:
redValue = random(255);
greenValue = random(255);
blueValue = random(255);

   //set the line colour:
   stroke(redValue, greenValue, blueValue);

   // draw when the mouse is up (to hell with conventions):
   if (mousePressed == false) {
       // draw a triangle:
       triangle(mouseX, mouseY, width/2, height/2, pmouseX, pmouseY);
       }
       //erase when the mouse is down:
       else {
       background(0);
       fill(0);
       }
       
}





