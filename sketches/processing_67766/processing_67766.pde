

void setup() {

  size(250,250);  
  smooth();
  frameRate(30);
}

void draw() {
  background(255);  
  

  ellipseMode(CENTER);
  rectMode(CENTER); 
  
  // Draw Zoog's body
  stroke(0);
  fill(175);
  rect(mouseX,mouseY,20,100);

  // Draw Zoog's head
  stroke(0);
  fill(255);
  ellipse(mouseX,mouseY-30,60,60); 
  
//Eyes
  fill(mouseX,100,mouseY); 
  ellipse(mouseX-20,mouseY-30,16,32); 
  ellipse(mouseX+20,mouseY-30,16,32); 

  // Draw Zoog's legs
  stroke(100
 );
  
  line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+60);
  line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+60);
  
  
  //LOL
  
   // Draw Zoog's body
  stroke(0);
  fill(175);
  rect(mouseX,mouseY,20,100);

  // Draw Zoog's head
  stroke(0);
  fill(255);
  ellipse(mouseX,mouseY-30,60,60); 
  
//Eyes
  fill(mouseX,100,mouseY); 
  ellipse(mouseX-20,mouseY-30,16,32); 
  ellipse(mouseX+20,mouseY-30,16,32); 

  // Draw Zoog's legs
  stroke(0);
  
  line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+60);
  line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+60);

}


