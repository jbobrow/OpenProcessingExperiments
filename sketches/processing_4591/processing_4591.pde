
void setup() {
  // Set the size of the window
  
  size (200,200);
  smooth();
  frameRate(30);
}

void draw() {
  // Draw a black background
  background(0);
  
  if(mouseX < width/3) {
    background(255);
  }else if (mouseX < 2*width/3) {
    background(127);
  }else{
    background(0);
  }
  
  // Set ellipses and rects to CENTER mode
 ellipseMode(CENTER);
 rectMode(CENTER);
 
 //Draw Zoog's body
 stroke(255);
 fill(175);
 rect(mouseX,mouseY,20,100);
 
 //Draw Zoog's head
 stroke(0);
 fill(255);
 ellipse(mouseX,mouseY-30,60,60);
 
 //Draw Zoog's eyes
 fill(mouseX,0,mouseY);
 ellipse(mouseX-19,mouseY-30,16,32);
 ellipse(mouseX+19,mouseY-30,16,32);
 
 //Draw Zoog's legs
 stroke(255);
 line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+60); 
 line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+60); 
}

void mousePressed() {
  println("Take me to your leader!");
}

