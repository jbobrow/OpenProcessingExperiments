
float blink = 1; //Create the blink variable
float red=200; // Create a variable for the colour red
float blue=200;// Creat a variable for the colour blue 


//Setting up the size of the project and setting smooth animation
void setup(){
size(640,480);
smooth();
frameRate(30);


// Start our cat in the middle
mouseX = width/2;
mouseY = height/3;
}


//Setting up code that constantly refreshes
void draw(){
background(255); //Setting the background to white

stroke (100); //Setting the outline colour to dark grey
fill(200); //Setting the inside colour to light grey

// Setting the boundaries 
if ( (mouseY-85) <= height*0) {
  mouseY=85; }

if ( (mouseY+250) >= height) {
  mouseY=230; }
  
if ( (mouseX-75) < width*0) {
  mouseX=75; }
  
if ( (mouseX+75) > width) {
  mouseX=565; }


line(mouseX,mouseY+180,pmouseX,pmouseY+280); //Drawning the moving tail


ellipseMode (CORNER); //Setting the ellipse mode to Corner
ellipse (mouseX-40,mouseY+10,85,200); //Drawing the main body

fill(red,50,blue); //Setting the fill colour to the values or our red and blue intergers 

if(mouseX > width/2) { // If the mouse is on the right hand of the screen it increases the red value 
  red = red+1;
} else { 
  red = red-1;
}
if(mouseY > height/2) { // If the mouse is on the left hand of the screen it increases the blue value
  blue = blue+1;
} else { 
  blue = blue-1;
}

red = constrain(red,0,255); // Making sure our values doesn't exceed 255 or go under 0
blue = constrain(blue,0,255);

ellipse (mouseX-22,mouseY+60,50,110); //Drawing the belly

fill(200);  //Setting the fill to grey
ellipseMode (CENTER); //Setting the circle coordonites to be drawn out from a center location
ellipse (mouseX,mouseY-10,100,100); //Drawing the head of the cat
triangle (mouseX-20,mouseY-56,mouseX-40,mouseY-85,mouseX-45,mouseY-33); //Drawing the left outter ear
triangle (mouseX+20,mouseY-56,mouseX+40,mouseY-85,mouseX+45,mouseY-33); //Drawing the right outter ear

fill (232,154,242); // Coloured the inner ear pink
triangle (mouseX-25,mouseY-51,mouseX-35,mouseY-70,mouseX-38,mouseY-39); //Drawing the left inner ear
triangle (mouseX+27,mouseY-50,mouseX+35,mouseY-69,mouseX+40,mouseY-38); //Drawing the right innear ear



// Making the eyes blink
if (blink < 200) { // State 1, open eyes
  fill (255);// Coloured the eyes white
  ellipse (mouseX-20,mouseY-30,20,20); // Drawing first eye
  ellipse (mouseX+20,mouseY-30,20,20); // Drawing second eye
 
  fill (0); // Coloured eyes black
  ellipse (mouseX-20,mouseY-30,5,5); // Inside left eye
  ellipse (mouseX+20,mouseY-30,5,5); // Inside right eye
  blink = (blink + 1); } // Add 1 to blink

  else if (blink >= 200 && blink <= 205) { // State 2, change the eyes to lines for a short blink
  line (mouseX-30,mouseY-30, mouseX-10, mouseY-30);
  line (mouseX+10,mouseY-30, mouseX+30, mouseY-30);
  blink = (blink + 1); // Add 1 to blink
  }
  
  else  { // Reset blink to a random number between 1-200 to make the blinking natural
  blink = random(1,200);
}


fill (232,154,242); // Coloured the nose pink
ellipse (mouseX,mouseY,5,5); // Drawing cats nose

line (mouseX-10,mouseY+20,mouseX+10,mouseY+20); // Drawing mouth

//When any key is pressed tongue sticks out
if(keyPressed == true) {
  triangle(mouseX-5,mouseY+20,mouseX+5,mouseY+20,mouseX,mouseY+30);
}  


// When mouse is pressed the whiskers will move
if (mousePressed){
  line (mouseX-10,mouseY,mouseX-75,mouseY); // Draw left center whisker 
  line (mouseX-8,mouseY-5,mouseX-70,mouseY-15); // Draw upper left whisker 
  line (mouseX-8,mouseY+5,mouseX-70,mouseY+15); // Draw lower left whisker

  line (mouseX+10,mouseY,mouseX+75,mouseY); // Draw right center whisker
  line (mouseX+8,mouseY-5,mouseX+73,mouseY-15); // Draw upper right whisker 
  line (mouseX+8,mouseY+5,mouseX+73,mouseY+15);// Draw lower right whisker 
}

else
{
  line (mouseX-10,mouseY,mouseX-75,mouseY); // Draw left center whisker 
  line (mouseX-8,mouseY-5,mouseX-70,mouseY-20); // Draw upper left whisker 
  line (mouseX-8,mouseY+5,mouseX-70,mouseY+20); // Draw lower left whisker

  line (mouseX+10,mouseY,mouseX+75,mouseY); // Draw right center whisker
  line (mouseX+8,mouseY-5,mouseX+73,mouseY-20); // Draw upper right whisker 
  line (mouseX+8,mouseY+5,mouseX+73,mouseY+20);// Draw lower right whisker 
}


fill(180); //Set colour to dark grey
ellipseMode (CORNER); //Setting the eliipse mode to Corner
ellipse (mouseX-33,mouseY+60,25,80); //Drawing the left arm
ellipse (mouseX+15,mouseY+60,25,80); //Drawing the right arm

line (mouseX-21,mouseY+130,mouseX-21,mouseY+140); //Drawing the left middle claw
line (mouseX-25,mouseY+129,mouseX-27,mouseY+136); //Drawing the left left claw
line (mouseX-17,mouseY+128,mouseX-16,mouseY+136); //Drawing the left right claw

line (mouseX+27,mouseY+130,mouseX+27,mouseY+140); //Drawing the right middle claw
line (mouseX+23,mouseY+129,mouseX+21,mouseY+136); //Drawing the right left claw
line (mouseX+31,mouseY+128,mouseX+32,mouseY+136); //Drawing the right right claw

fill (240); // Changing fill colour to light grey 
ellipse (mouseX-28,mouseY+230,20,25); // Drawing left foot
ellipse (mouseX+10,mouseY+230,20,25); // Drawing right foot

fill (180); // Changing fill colour to dark grey
ellipse (mouseX-28,mouseY+180,20,65); // Drawing the left leg
ellipse (mouseX+10,mouseY+180,20,65); // Drawing the right leg

line (mouseX-18,mouseY+249,mouseX-18,mouseY+255);// Drawing the left middle foot claw
line (mouseX-22,mouseY+248,mouseX-24,mouseY+251);// Drawing the left left foot claw
line (mouseX-14,mouseY+247,mouseX-12,mouseY+251); // Drawing the left right foot claw


line (mouseX+20,mouseY+249,mouseX+20,mouseY+255);// Drawing the right middle foot claw
line (mouseX+16,mouseY+248,mouseX+14,mouseY+251); // Drawing the right left foot claw
line (mouseX+24,mouseY+247,mouseX+26,mouseY+251); // Drawing the right right foot claw


}

