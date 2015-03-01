
void setup(){
  //setup- runs one time
  
  size(600, 300);
  //the size of the stage is 600x300
  
  background(#ffffff);
  //background is white
  
  smooth();
  //smooth all drawing
  
}
void draw(){
  //draw runs once a frame
  
  background(#ffffff);
  //background is white
  
  float lineLength = dist(width/2, height/2, mouseX, mouseY);
  // line is drawn and moves where the mouse moves 
  int lengthInt = int(lineLength);
  //as the line moves with the mouse it gets longer or shorter depending on the placement of the mouse
  line(width/2, height/2, mouseX, mouseY);
  //line is drawn moving where the mouse moves x and y
  
 
  noFill();
  //the ellipse has no fill
  ellipse(width/2, height/2, lineLength *2, lineLength *2);
  //the ellipse moves with the length of the line
}


