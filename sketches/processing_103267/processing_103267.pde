
// Samwise Pollack
// July 8th 2013
// Drawing App: lets you draw with different colours

void setup () {
  //frameRate(12); change frame rate to demo update speed 
  background(0);// set background colour to black
  size (500, 500); // set background size to 500 by 500 pixels
  stroke(255); //makes the stroke white
}

//assigns values for x and for change in x
int x = 1;
int dx = 0;

void draw() {
 strokeWeight(x); // set stroke weight to x

   if(mousePressed == true) {
   line(pmouseX,pmouseY,mouseX,mouseY); //draws line when mouse pressed
  }
  
   if(mousePressed == true && key == 'r') {
    stroke(250, 5, 5);
    line(pmouseX,pmouseY,mouseX,mouseY); //draws in red
   } 
   
  if(mousePressed == true && key == 'g') {
    stroke(5, 250, 5);
    line(pmouseX,pmouseY,mouseX,mouseY); //draws in green
   } 
   
  if(mousePressed == true && key == 'b') {
    stroke(5, 5, 250);
    line(pmouseX,pmouseY,mouseX,mouseY); //draws in blue
   }
   
  if(mousePressed == true && key == 'w') {
    stroke(250);
    line(pmouseX,pmouseY,mouseX,mouseY); //draws in white
   }
  if(mousePressed == true && key == 'p') {
    stroke(250, 5, 250);
    line(pmouseX,pmouseY,mouseX,mouseY); //draws in pink
   }
   
  if(mousePressed == true && key == 'y') {
    stroke(250, 250, 0);
    line(pmouseX,pmouseY,mouseX,mouseY); //draws in yellow
   }
  
  if(mousePressed == true && key == 'o') {
    stroke(250, 140, 0);
    line(pmouseX,pmouseY,mouseX,mouseY); //draws in orange
   }
   
   if(key == ' ') {
   background(0); //clears the screen
  }
  
  x = x + dx;
  
  if(key == '2') {
   dx = 1; //makes line thicker
  }
  
  if(key == '1') {
   dx = -1; //makes line thinner
  }
  
  if(key == '3') {
   dx = 0; //makes line stop changing size
 }
}


  
