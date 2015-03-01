
void setup(){
  //setup- runs one time
  
  size(600, 600);
  //the size of the stage is 600x300
  
  smooth();
  
}

void draw (){
 
   if (key == 'q' || key == 'Q') {
     yo();
   }
   if (key == 'w' || key == 'W') {
   grouptwo();
   } 
  if (key == 'e' || key == 'E') {
   groupthres();
   } 
}



void yo() {
  
  
 //draw- runs once a frame
  
  background (255, 0, 0);
  //background is re
  fill (0);
  //fill is set to 0
  
  ellipse (width/2, height/2, 100, 100);
  // draw ellipse divided by the width and height of stage size
  
  fill (255, 0, 0);
  //fill is the same as the background color
  
  stroke (255, 0, 0); 
  //the stroke is set the same as the background color
  
  rect (width/2, height/2, 50, 50);
  //the rectancle is drawn half the width and height of the stage
}

void grouptwo() {
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

void groupthres (){
   fill(0,0,0,10);
// fill all shapes with a solid black color with a very low opacity
  
  rect(0,0,width,height);
//a rectangle will be shown that is the size of the whole screen
  

  fill(random(0,255), random(0,255), random(0,255));
//fill the shapes w/ a random color from 

  ellipse(random(0,width), random(0,height), 10, 10);
//draws a small ellipse size 10X10 at random areas   
}
  


