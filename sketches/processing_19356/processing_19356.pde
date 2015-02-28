
void setup() {
  size(screen.width, screen.height);
  background(0); // black
  smooth();
}


 
void draw() {
  
  // creates variable to tell speed between pmouse and current mouse position
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY); 
  
  println(mouseX + " " + mouseY + " " + pmouseX + " " + pmouseY);
  line(pmouseX, pmouseY, mouseX, mouseY); // draws line with mouse
  strokeWeight((speed)/1.5); //creates weight of stroke based on how fast you move mouse
  stroke(speed); //creates color based on speed darker for slow lighter for fast
  strokeCap(ROUND);
  strokeJoin(ROUND);
  
  
}

////// this section attempts to set up a function to blend the last color (pmouse)
// with the next color (defined by speed) so we can get a seamless color change.
// unfortunatley i don't think it is even close.


/*

 void blending(speed) {
  stroke(speed);
  blendColor(speed, speed, BLEND); 
}
*/


// this part clears the background back to black
  void mousePressed() {
  background(0);      // clears the background
  
}

// save the image press any key
void keyPressed() { 
  save("linedrawing.jpg");
}




