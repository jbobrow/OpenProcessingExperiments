
//Eun Elaine Na
//YSDN Interactivity Design Winter2012

float r = 0.0;

void setup() {
  //setting the screen size
  size(250, 250); 

}

void draw() {
  background(255,134,149);
  // Translate to third of the window
  translate(width/3,height/3);
  
  
  scale(r); 
  
  // Display a rectangle in the left uppercorner of the screen
  stroke(0);
  fill(53,255,149);
  rectMode(CENTER);
  rect(0,0,10,10);
  //second rectangle
  stroke(0);
  fill(106,48,255);
  rectMode(CENTER);
  rect(125,125,50,50);
  
  // Increase the scale variable
  r += 0.2;
  
  // Retstart r
  if (r > 20) {
    r = 0;
  }
  
  
}
