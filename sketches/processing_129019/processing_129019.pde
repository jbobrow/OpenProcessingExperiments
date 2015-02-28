
float blink = 1; //Create the blink variable
int centreX=512;
int centreY=192;
int mousepoint=100; // creating the mouse x axis variable
float upordown=1; // off or on switch for the cat looking up or down
int screen=1; //Displaying an image or not



//creating our image variables
PImage title;
PImage won;
PImage gameover;
PImage field;
PImage cheese;
PImage mouse;

//Setting up the size of the project and setting smooth animation
void setup(){
size(1024,768);
smooth();
frameRate(30);

//Setting our images
title = loadImage("title.jpg");
won = loadImage("won.jpg");
gameover = loadImage("gameover.jpg");
field = loadImage("field.jpg");
cheese = loadImage("cheese.png");
mouse = loadImage("mouse.png");

}

//Setting up code that constantly refreshes
void draw(){
background(255); //Setting the background to white

//Screens

//Title screen 
if (screen==1) {
image(title,0,0);

if ((keyCode == ENTER || keyCode == RETURN) && screen == 1)
  screen = 2; 
}

  
  
  
//Game over screen
else if (screen==3){
  image(gameover,0,0);

if ((keyCode == ENTER || keyCode == RETURN) && screen == 3)
  screen = 2; 
}

  
  
  
//Won screen
else if (screen==4){
  image(won,0,0);
   
if ((keyCode == ENTER || keyCode == RETURN) && screen == 4)
  screen = 2; 
}






//Actual game
else if (screen==2) {
image(field,0,0);
stroke (100); //Setting the outline colour to dark grey
fill(200); //Setting the inside colour to light grey




line(centreX,centreY+180,centreX,centreY+280); //Drawning the moving tail


ellipseMode (CENTER); //Setting the ellipse mode to center 
ellipse (centreX,centreY+100,85,200); //Drawing the main body

fill(255,157,244); //Setting the fill colour to pink 
ellipse (centreX,centreY+120,50,110); //Drawing the belly

fill(200);  //Setting the fill to grey
ellipseMode (CENTER); //Setting the circle coordonites to be drawn out from a center location
ellipse (centreX,centreY-10,100,100); //Drawing the head of the cat
triangle (centreX-20,centreY-56,centreX-40,centreY-85,centreX-45,centreY-33); //Drawing the left outter ear
triangle (centreX+20,centreY-56,centreX+40,centreY-85,centreX+45,centreY-33); //Drawing the right outter ear

fill (232,154,242); // Coloured the inner ear pink
triangle (centreX-25,centreY-51,centreX-35,centreY-70,centreX-38,centreY-39); //Drawing the left inner ear
triangle (centreX+27,centreY-50,centreX+35,centreY-69,centreX+40,centreY-38); //Drawing the right innear ear



// Making the eyes blink

//Looking down
if (blink < 200 && upordown<=1) { // State 1, open eyes
  fill (255);// Coloured the eyes white
  ellipse (centreX-20,centreY-30,20,20); // Drawing first eye
  ellipse (centreX+20,centreY-30,20,20); // Drawing second eye
 
  fill (0); // Coloured eyes black
  ellipse (centreX-20,centreY-25,5,5); // Inside left eye
  ellipse (centreX+20,centreY-25,5,5); // Inside right eye
  blink = (blink + 1); } // Add 1 to blink
  
  //Looking up
 else if (blink < 200 && upordown>=2) { // State 1, open eyes
  fill (255);// Coloured the eyes white
  ellipse (centreX-20,centreY-30,20,20); // Drawing first eye
  ellipse (centreX+20,centreY-30,20,20); // Drawing second eye
 
  fill (0); // Coloured eyes black
  ellipse (centreX-20,centreY-35,5,5); // Inside left eye
  ellipse (centreX+20,centreY-35,5,5); // Inside right eye
  blink = (blink + 1); } // Add 1 to blink

  else if (blink >= 200 && blink <= 205) { // State 2, change the eyes to lines for a short blink
  line (centreX-30,centreY-30, centreX-10, centreY-30);
  line (centreX+10,centreY-30, centreX+30, centreY-30);
  blink = (blink + 1); // Add 1 to blink
  }
  
  else  { // Reset blink to a random number between 1-200 to make the blinking natural
  blink = random(1,200);
  upordown = random(0,3); //make the up or down switch value random
}



fill (232,154,242); // Coloured the nose pink
ellipse (centreX,centreY,5,5); // Drawing cats nose

line (centreX-10,centreY+20,centreX+10,centreY+20); // Drawing mouth


// When mouse is pressed the whiskers will move
if (mousePressed){
  line (centreX-10,centreY,centreX-75,centreY); // Draw left center whisker 
  line (centreX-8,centreY-5,centreX-70,centreY-15); // Draw upper left whisker 
  line (centreX-8,centreY+5,centreX-70,centreY+15); // Draw lower left whisker

  line (centreX+10,centreY,centreX+75,centreY); // Draw right center whisker
  line (centreX+8,centreY-5,centreX+73,centreY-15); // Draw upper right whisker 
  line (centreX+8,centreY+5,centreX+73,centreY+15);// Draw lower right whisker 
}

else
{
  line (centreX-10,centreY,centreX-75,centreY); // Draw left center whisker 
  line (centreX-8,centreY-5,centreX-70,centreY-20); // Draw upper left whisker 
  line (centreX-8,centreY+5,centreX-70,centreY+20); // Draw lower left whisker

  line (centreX+10,centreY,centreX+75,centreY); // Draw right center whisker
  line (centreX+8,centreY-5,centreX+73,centreY-20); // Draw upper right whisker 
  line (centreX+8,centreY+5,centreX+73,centreY+20);// Draw lower right whisker 
}


fill(180); //Set colour to dark grey
ellipseMode (CORNER); //Setting the eliipse mode to Corner
ellipse (centreX-33,centreY+60,25,80); //Drawing the left arm
ellipse (centreX+15,centreY+60,25,80); //Drawing the right arm

line (centreX-21,centreY+130,centreX-21,centreY+140); //Drawing the left middle claw
line (centreX-25,centreY+129,centreX-27,centreY+136); //Drawing the left left claw
line (centreX-17,centreY+128,centreX-16,centreY+136); //Drawing the left right claw

line (centreX+27,centreY+130,centreX+27,centreY+140); //Drawing the right middle claw
line (centreX+23,centreY+129,centreX+21,centreY+136); //Drawing the right left claw
line (centreX+31,centreY+128,centreX+32,centreY+136); //Drawing the right right claw

fill (240); // Changing fill colour to light grey 
ellipse (centreX-28,centreY+230,20,25); // Drawing left foot
ellipse (centreX+10,centreY+230,20,25); // Drawing right foot

fill (180); // Changing fill colour to dark grey
ellipse (centreX-28,centreY+180,20,65); // Drawing the left leg
ellipse (centreX+10,centreY+180,20,65); // Drawing the right leg

line (centreX-18,centreY+249,centreX-18,centreY+255);// Drawing the left middle foot claw
line (centreX-22,centreY+248,centreX-24,centreY+251);// Drawing the left left foot claw
line (centreX-14,centreY+247,centreX-12,centreY+251); // Drawing the left right foot claw


line (centreX+20,centreY+249,centreX+20,centreY+255);// Drawing the right middle foot claw
line (centreX+16,centreY+248,centreX+14,centreY+251); // Drawing the right left foot claw
line (centreX+24,centreY+247,centreX+26,centreY+251); // Drawing the right right foot claw


image(mouse,mousepoint,630);

image(cheese,800,630);



//making the mouse move 
if(keyPressed == true && keyCode == RIGHT) {
mousepoint=(mousepoint+4); }

// when the mouse gets the cheese and image appears 
if (mousepoint >= 630) {
  screen = 4;
  mousepoint=100;
}

//When the cat is looking at the moving mouse, game over
if (keyPressed == true && keyCode == RIGHT && upordown <=1) {
  screen = 3;
  mousepoint=100;
}

}

}



