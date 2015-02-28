
//3) background behind the character changes color
void setup(){
  // Set the size of the window
  size(200,200);
  smooth();
}
void draw() {
  // yellow background
  background(255);
  // Set CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  // characters body
  stroke(0);
  fill(255, 43, 5);
  rect(100,100,20,100);
  // characters head
  stroke(0);
  fill(245, 218, 175);
  ellipse(100,70,60,60);
  // characters eyes
  fill(255);
  ellipse(81,70,16,32);
  ellipse(119,70,16,32);
  //characters pupils
  fill(8, 133, 255);
  ellipse(81, 70, 10, 20);
  ellipse(119, 70, 10, 20);
  //characters smile
  fill(255);
  ellipse(100,90, 16, 3);
  // characters hands 
  line (100, 100, 40, 100);
  line (110, 100, 40, 110);
  // character legs
  stroke(0);
  line(90,150,80,160);
  line(110,150,120,160);
}

//----------------------------------------------------------------------
void mousePressed () {
  
   background(254, 255, 5);
 
}
 
//--------------------------------------------------------------------
 
void mouseDragged () {
 fill(mouseX, 255, mouseY, 14);
}

