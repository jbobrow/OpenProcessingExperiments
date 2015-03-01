
// firstly, set void setup and void draw to make object animade
void setup(){
  // create a 550x550px background and choose color
  size(550,550);
  // set background here in order to draw bacground once
  background(255,255,255);
}
//create void draw function, makeing a few rects that need to animade 
void draw(){
  //set the smooth opition to make these rectangles can represent the principle of closure 
  smooth();
  noStroke();
  //adjust the fill color to make the shape moves smoothly
  fill(0,12);
  //set the value of mouseX and mouseY to make one rect can cover the other
  rect(mouseX,mouseY,100,100);
  noStroke();
  fill(255,255,255);
  // add value to mouseX and mouseY
  rect(mouseX+25,mouseY+25,50,50);
  noStroke();
  //same thing. Finished and run 
  fill(0,90);
  rect(mouseX+38,mouseY+38,25,25);
  
}


