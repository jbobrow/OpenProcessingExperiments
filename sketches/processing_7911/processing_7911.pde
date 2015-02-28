
// import processing.pdf.*;
// get the code for exporting to PDF
float ypoint=0;
  // here's a variable called ypoint; right now it's 0.0; it is used to
  // determine the y-axis coordinate of each line segment – but we don't
  // know that yet.
int dotx;
  // here's an integer called dotx – for the starting point of each line
int doty; 
  // here's an integer called doty - for the starting point of each line
int spokes = 50; 
  // this is how many lines will radiate from each point
void setup(){
  // run once at the start
  size (800,600);
    // window size
  background(34,7,62);
    // midnight blue background
  stroke(255);
    // white lines
  smooth();
    //smooth lines
//  beginRecord(PDF, "spidery-lines-#.pdf");
  // start to record the screen for the PDF image
}

void draw(){
  // Draw, keep drawing
  if (keyPressed == true){
  background(34,7,62);
  }
}

void mousePressed(){
  // This function runs when the mouse is pressed and is as follows.
  dotx = mouseX; 
    // Set dotx according to the x-axis coordinate of the mouse-click.
  doty = mouseY; 
    // Set doty according to the y-axis coordinate of the mouse-click.
  translate(dotx,doty); 
    // move the whole screen by the value of the starting point 
    // (determined by the mouse-click)
  for (int i=0; i< spokes; i++){ 
    // if the number of spokes is less than the total number specified, 
    // then run this code   
    rotate(random(3.0)); 
      // rotate the whole screen by a random value within 360 degrees   
    notStraightLine(); 
      // run the function to draw a notStraightLine
  }
}

void notStraightLine(){ 
  // Here are the instructions for drawing a wiggly line - do it now.
  ypoint = 0; 
    // Set the y coordinate of the line-segment end-point to zero.
  noFill(); 
    // We don't want to fill the following shape with anything.
  beginShape(); 
    // Start to draw a 'shape' - in this case a wiggly line.
  for (int xStart=0; xStart<450; xStart++){ 
    // if the starting point of the line segment is less than 450, 
    // keep running this function
    float yVariation= random(0,xStart*0.01); 
      // determine how much the line's end point will vary; 
      // make it between zero and a growing number 
      // (the x position of the start of the line) 
    vertex(xStart*2,ypoint); 
      // make a point twice as far to the right as the previous point, 
      // and as far up or down as ypoint is calculated   
    ypoint = ypoint+yVariation;  
      // set the y-axis coordinate according to the previous y-axis coordinate 
      // plus the random variation
  }  
  endShape(); // that's the end of the shape (
}

/*void keyPressed() { // when a key is pressed, run this code
  if (key == 's') { // if the key is 's', then do this:
    endRecord(); // stop recording
  }
}*/

