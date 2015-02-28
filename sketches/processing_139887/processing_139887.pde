
//this is the interval for the color black, which will
//be used on the eyes.
int c = color(0, 0, 0);
 
void setup() {
  // Set the size of the window
  size(400,400);  
  smooth();
  // The frame rate is set to 100 frames per second.
  frameRate(100);
}


void draw() {
  background(51);  //this will be the background color of the canvas
  
  // These will set the facial expressions as well as the
  //face of the monster in the center of the screen
  ellipseMode(CENTER);
  rectMode(CENTER); 


  //head and body
  //my monster is an simple ghost
  stroke(255);
  fill(255);
 rect(mouseX, mouseY-20, 80, 80, 20);
 fill(0);
 ellipse(mouseX, mouseY, 30, 5);
 
 //this bollean command tells the monster that when the
 //mouse is pressed, the mouth will open up
 //if the mouse is not clicked, the mouth will remain closed
if (mousePressed== true) { 
  
  fill(0);
ellipse(mouseX, mouseY, 30, 30);
}
 
//eyes
  fill(c); //the interval c is telling the monster to keep his eyes black
  ellipse(mouseX-19,mouseY-30,20,10); 
  ellipse(mouseX+19,mouseY-30,20,10); 
  
  //this boolean tells the monster that when the mouse is pressed
  //the eyes will flash with random color
  //when the mouse is not pressed, it will remain black
    if (mousePressed == true){
    c = color(random(255), random(255), random(255));
  }
  else c = color(0, 0, 0);

//legs of the ghost
  stroke(225);
  line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+20);
  line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+20);
  line(mouseX, mouseY+50, pmouseX, pmouseY+20);
  

}



