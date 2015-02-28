
// Cosmo van Hoff
// 7/8/2013
// basic drawing app 

void setup () {
  //frameRate(12); change frame rate to demo update speed 
  background(255); // set background color to white
  size (1400, 1400); // set background size to 400 by 400 pixels
  strokeWeight(0); // set stroke weight to 3
  
}

  void draw() {
if(mousePressed == true){
fill(0,0,255); //color: blue
rect(pmouseX, pmouseY, 5, 5); fill(0,0,255); //color: blue
}

  // code that prints out the values of mouseX and mouseY to the console.
  println("mouseX: " + mouseX + " , mouseY: " + mouseY);}
