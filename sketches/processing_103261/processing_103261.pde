
// Cosmo van Hoff
// 7/8/2013
// basic drawing app 

void setup () {
  //frameRate(12); change frame rate to demo update speed 
  background(255); // set background color to white
  size (1400, 1400); // set background size to 400 by 400 pixels
stroke(255);
}

  void draw() {
if(mousePressed == true){
fill(0,0,255); //color: blue
ellipse(pmouseX, pmouseY,20, 20); fill(0,0,255); //color: blue
}
if(keyPressed == true) {
fill (13, 185, 14);
ellipse(mouseX,mouseY, 21,21);
}
}
  // code that prints out the values of mouseX and mouseY to the console.
