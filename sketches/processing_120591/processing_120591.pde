
int x = 0; // Global variable for location 
int speed = 2; // Variable for pirate speed. 

//oso attacks
void setup() {
size(600,550);// Set the size of the window
smooth(); //Smooths out all the lines
frameRate(60);//set framerate to 60

}

void draw() {
  background(mouseX,mouseY,100); // Background changes color depending on where mouse is.
  
 x = x + speed; // Add the current speed to the x location 
 
if ((x > 200) || (x < -200)) { //How far left or right the pirate will move before reversing direction
  speed = speed  * -1 ; 
} 


//Draw Pirate 
stroke(0); // To make the outline of every object black
  fill(255, 255, 153); // Light yellow fill for the ellipses listed below
  
  
 ellipse(x+300, 100, 100, 100); //Light yellow circle for the head
 if (mousePressed) {
  stroke(0); // To make the outline of every object black
   fill(255,0, 0); // Changes the light yellow ellipse fill to red
  ellipse(x+300, 100, 100, 100);
 }
    
 ellipse(x+90, 185, 25, 25); //Light yellow circle for the left hand
 ellipse(x+510, 185, 25, 25); //Light yellow circle for the right hand
   fill(255, 255, 255); // White fill for the ellipses listed below
 ellipse(x+280, 100, 20, 20);//White circle for left eye
 fill(0, 0, 0); // Black fill for the ellipses, lines and rectangles listed below
 ellipse(x+280, 100, 5, 5);  //  Black circle for pupil
 ellipse(x+320, 100, 20, 20); // Black circle for eye patch
 line(x+290, 50, x+340, 130); // Black line for eye patch over right eye
 line(x+280, 130, x+320, 130); //Black line for mouth
 rect(x+315, 425, 40, 75); //Black vertical rectangle for top o boot
 rect(x+330, 480, 50, 20);//Black horizontal rectangle for bottom of boot
     fill(50, 50, 100); // Navy fill for the rectangles listed below that create the pirates shirt
  rect(x+250, 150, 100, 200); //Red rectangle for chest 
  rect(x+350, 175, 150, 20); //Red rectangle for left arm
  rect(x+100, 175, 150, 20); //Red rectangle for right arm
    fill(0, 100, 200); // Blue fill for the rectangles listed below
  rect (x+250, 350, 30, 75); //Blue rectangle for left leg
  rect (x+320, 350, 30, 75); //Blue rectangle for right leg
  fill(100, 70, 30); // Brown fill for the rectangles listed below
   rect(x+245, 425, 40, 10); //Brown rectangle for top of peg leg
   rect(x+255, 435, 20, 65);// Brown rectangle for bottom of peg leg
  stroke(0, 0, 0); //A stroke telling the outer line on every shape to be black 
  
  //Draw OSO
   stroke(255) ; // This white stroke allows the white indevidual shapes to appear as one shape.
  fill(255) ; // Fill for the ellipse, rectangle and triangle listed below.
  ellipse(mouseX, mouseY, 100, 100) ; // White ellipse which creates the shape of OSO's head & location from mouse
   rect(mouseX-10, mouseY+40, 20, 100) ; // White rectangle which forms OSO's neck & location from mouse
   triangle(mouseX, mouseY+100, mouseX-50, mouseY+170, mouseX+50, mouseY+170) ; // Triangle shape created to form the body of OSO & location from mouse
   fill(150) ; // This fill makes the following ellipses appear a mild grey colour.
  ellipse(mouseX-30, mouseY+170, 45, 30) ; // This grey ellipse is OSO's left foot with a white stroke & location from mouse
  ellipse(mouseX+30, mouseY+170, 45, 30) ; // This grey ellipse is OSO's right foot with a white stroke & location from mouse.
  ellipse(mouseX-15, mouseY+130, 25, 18) ; // This grey ellipse is OSO's left hand with a white stroke & location from mouse
  ellipse(mouseX+15, mouseY+130, 25, 18) ; // This grey ellipse is OSO's right hand with a white stroke & location from mouse
  fill(0, 200, 250) ; // This aqua colour fills the following ellipses for OSO's eyes 
  ellipse(mouseX-20, mouseY, 30, 50) ; // This ellipse creates OSO's left iris for the left eye & location from mouse
  ellipse(mouseX+20, mouseY, 30, 50) ; // This ellipse creates OSO's right iris for the right eye & location from mouse
  fill(0) ; // This black fill is the colour used for OSO's pupils within his eyes.
  ellipse(mouseX-20, mouseY, 18, 38) ; // This black ellipse is for the pupil of OSO's left eye & location from mouse
  ellipse(mouseX+20, mouseY, 18, 38) ; // This black ellipse is for the pupil of OSO's right eye & location from mouse
  fill(255) ; // White fill for the glimmer effect on OSO's eyes.  
  ellipse(mouseX-25, mouseY-10, 10, 10) ; // White ellipse for the inside of the eye & location from mouse
  ellipse(mouseX+15, mouseY-10, 10, 10) ; // White ellipse for the inside of the eye & location from mouse
  ellipse(mouseX-13, mouseY+11, 5, 5) ; // White ellipse for the inside of the eye & location from mouse
  ellipse(mouseX+27, mouseY+11, 5, 5) ; // White ellipse for the inside of the eye & location from mouse
  fill(0);// Black fill for the mouth
   ellipse(mouseX, mouseY+30, 15, 15); // Black ellipse for mouth & location from mouse

  
}

  
 







