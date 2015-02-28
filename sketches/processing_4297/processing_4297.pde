
  void setup(){
  size(512,512); //Set the size of the window
  smooth();
  frameRate(30);
  }
  
  void draw(){
    
  // Draw a background color  
  background(255); 
   
  ellipseMode(CENTER); //Set ellipse to CENTER mode
  
  //Draw Goog's head
  stroke(0);
  fill(255);
  ellipse(mouseX,mouseY,60,60); 

  //Draw Goog's eyes
  fill(mouseX,0,mouseY);
  ellipse(mouseX-18,mouseY,15,35);
  ellipse(mouseX+18,mouseY,15,35);
  
  //Draw Goog's body
  stroke(0);
  fill(180);
  ellipse(mouseX,mouseY+80,40,100);
  
  //Draw Goog's legs
  stroke(0);
  line(mouseX-13,mouseY+120,pmouseX-30,pmouseY+160);
  line(mouseX+13,mouseY+120,pmouseX+30,pmouseY+160);
}

void mousePressed() {
  println("Take me to your leader");
}  
  
  
  
  



