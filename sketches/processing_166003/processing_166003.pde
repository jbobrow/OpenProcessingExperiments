
 int value = 0;
PFont nasraFont;
// Variables for drop location
float x,y; 

 
void setup(){
  //setup- runs one time
  background(0); 
  size(750,750);
  //the size of the stage is 600x300
   
  smooth();
//loadFont = load the font that I created in the data file



nasraFont = loadFont ("IowanOldStyle-Italic-48.vlw");

//telling processing to use the text in a sketch
text ("Security Questions: What is the name of the first pet you had?", 200, 200);
}
void draw() {
 
  // Display the drop
  fill(255);
  noStroke();
  ellipse(x,y,16,16);
  frameRate(200);
  // Move the drop
  y++ ;
// Display the drop
  fill(255);
  noStroke();
  ellipse(x,y,16,16);
  frameRate(200);
  // Move the drop
  x++ ;

}







