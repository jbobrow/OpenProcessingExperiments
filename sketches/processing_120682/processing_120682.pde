
// Slenderman 2.0 
void setup() {
  // Sets the size of the window
  size(600,600);  
  // The frame rate for this sketch is set to 30 frames per second.
  frameRate(30);
}

void draw() {
  // creates the background the slender man will appear on and change colour according to the mouse postion on the screen 
  background(mouseX,0,mouseY);
  
  // Set ellipse and rect shapes to CENTER mode              This code will set all the rectangle and ellipse shape to centre
  ellipseMode(CENTER);
  rectMode(CENTER); 
  
  // slenders body                                            This is the code for the slender mans Body 
  stroke(0);
  fill(0);
  ellipse(mouseX,mouseY,80,200);

  // Draw slenders head                                         This is the code for the slender mans head 
  stroke(0);
   fill(255); 
  ellipse(mouseX,mouseY-130,50,100); 

  // slenders chest                                          This is the code for the slender mans chest 
  fill(255); 
  ellipse(mouseX,mouseY-30,40,90); 
  
    
   // slenders Tie part one.                                      This is the code for the first part of the slender mans tie
  // The colour of the Tie is decided by the mouse location.
  fill(255,0,0); 
  rect(mouseX,mouseY-60,10,10);
  
  // slenders Tie part two.                 This is the code for the other part of the slender mans tie 
  fill(255,0,0); 
  rect(mouseX,mouseY-20,10,60); 
  
  //slenders legs                           This is the code for the slender mans legs
    fill(0,0,0); 
  rect(mouseX-10,mouseY +160,18,150,0); 
  
      fill(0,0,0); 
  rect(mouseX+12,mouseY +160,18,150,0); 

  // Slenders Tentacles
  stroke(0);
  // The Tentacles are created and follow the mouse location and track the previous mouse location.
  //right Tentacles
   line(mouseX+26,mouseY+70,pmouseX+80,pmouseY+80);
  line(mouseX+26,mouseY+50,pmouseX+80,pmouseY+60);
  line(mouseX+26,mouseY+30,pmouseX+80,pmouseY+40);
  line(mouseX+28,mouseY+10,pmouseX+80,pmouseY+20);
  
  
  //Left Tentacles
  line(mouseX-26,mouseY-70,pmouseX-80,pmouseY-80);
  line(mouseX-36,mouseY-50,pmouseX-80,pmouseY-60);
  line(mouseX-36,mouseY-30,pmouseX-80,pmouseY-40);
  line(mouseX-38,mouseY-10,pmouseX-80,pmouseY-20);
}
// This part of the code will prnit the message in the black text box below when the mouse is clicked
void mousePressed() {
  println("He will always find you no matter where you hide!"); 
}

