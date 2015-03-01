
float fade;
int passedTime;
int maxTime = 50;
boolean boolFade;
boolean bFadeIn;
 float x = 100;
float y = 100;
float xspeed = 15;
float yspeed = 10;
  
void setup() {    //Within the void set up, the size and background color is determined
  size(1000, 800); //The size of the canvas
smooth(); 
  background(255); //determines the color of the background
}

void draw() { //this is where the action of the coding takes place
  background(0); 
  ellipseFade(); //This is to set that the void of a later code is used into the void draw
   noStroke(); //This causes a shadow to follow along the ellipse
  fill(255,10); //This shows the fill in which the background overlay is
  rect(0,0,width,height); //A rectangle that helps create the foreshadow to the ellipse
  
  x = x + xspeed; //this combines two of the int variables so they add together and make the ellipse move at a certain speed for the x variable
  y = y + yspeed; //this combines the two of the int variables so that the ellipse moves a certain speed for the y variable
  
 

if ((x > width) || (x < 0)) { //This determines the movement of the circle x-axis movement, via left and right but it also stops it from passing the boundary once it hits the edge of the left or right of the screen.
    xspeed = xspeed * -1;
}
 if((y>height) || (y < 0)) { //This determines the movement of the circle's y-axis movement, via up and down but it also stops it from passing the boundary once it hits the edge of the up or down of the screen.
    yspeed = yspeed * -1;
  }
 
 
  }

  void mousePressed() { //This puts the fadeing int variables into ply, making it true if the mouse is pressed
  boolFade = true;
  bFadeIn = !bFadeIn;
  }
  
  void ellipseFade() { //These are if then variables that cause the images to fade if the mouse is pressed. 
  if (boolFade) {
    passedTime++;
    if (bFadeIn) { 
      fade = map(passedTime, 0, maxTime, 0, 255);
    } else {
      fade = map(maxTime - passedTime, 0, maxTime, 0, 255);
    }

    if (fade > 254 || fade < 1) { //This sets a limit on the fade, making the colors go from white to black.
      boolFade = false; //This makes the code stop fading further once it reaches a certain limit
      passedTime = 0;
    }
  }
  fill(255, fade); //This determines the initial color of the ellipse then
  ellipse(x,y,50,50); //this is the ellipse of the project
  }
