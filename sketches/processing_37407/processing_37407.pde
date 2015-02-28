
//Bryan Williams
//Assignment 4.1
//September 14,2011
//Computational Methods

void setup() {
  size(400,600);
  background(20,22,72);
  smooth();
}

void draw() {
  //This is for the loop
  for (int a=16;a<width;a+=16) {
    for (int b=12;b<height;b+=12) {
      
      //This is for the grid of squares
      noStroke();
      fill(198,239,255);
      rect(a,b,6,6);
  
      //This is for the lines across the composition
      noFill();
      stroke (HSB,mouseX,mouseY); //this allows the line color to change when mouse moves around composition
      strokeWeight (.02);
      quad (a, b, a, b, 200, 500, 200, 100);
    }
  }
}

//Please Note: Move the mouse aound to change the line colors!
 

