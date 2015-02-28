


//My first zoorgette
//3 March 2011

void setup() {
  size(200,200);
  background(0);
  smooth();
}
// draw() loops continuously until you close the sketch window.
void draw() {
  // Draw a black background
  background(150);   
  
  // Set CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER); 

  // Draw Zoog's body
  
  fill(155,23,89);
  rect(100,100,20,100);
  
  //ellipse helmet
  fill(10);
  ellipse(100,70,70,90);

  // Draw Zoog's head
  stroke(0);
  fill(255,12,37,155);
  ellipse(100,70,78,98); 

  // Draw Zoog's eyes
  fill(0); 
  ellipse(81,70,16,32); 
  ellipse(119,70,16,32);

  // Draw Zoog's legs
  stroke(0);
  line(90,150,80,160);
  line(110,150,120,160);


  stroke(0);
  //int x = abs(mouseX - mouseY);
  strokeWeight(abs(mouseX - mouseY));
  // Draw a line from previous mouse location to current mouse location.
  rotate(pmouseX, pmouseY,200,200);

}




