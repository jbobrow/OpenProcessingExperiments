
void setup () {

  size(600, 400);
  background(255);

  int interval;
  int gradientWidth; 
  int gradientHeight;
  float xpos=42;
  float ypos=165;



  noStroke();
  fill(255-xpos, 255-xpos, 255-xpos, 190);
  ellipse(321, 214, xpos*7, xpos*7);
  fill(0+ypos, 0+ypos, 0+ypos, 40);
  ellipse(height/2, ypos, 146, 146);

  noStroke();
  fill(0, 0, 0, 110);
  rect(200, -104, 329, 230);
  fill(0, 0, 0, 80);
  rect(501, 304, 100, 100);
  fill(0, 0, 0, 54);
  rect(531, 334, 78, 95);
  fill(0, 0, 0, 70);
  rect(345, -40, 293, 298);

  fill(0, 0, 0, 30);
  ellipse(4, 80, 300, 300);
  fill(0, 0, 0, 56);
  ellipse(501, 352, 96, 96);
  fill(0, 0, 0, 38);
  ellipse(600, 168, 220, 220);


  fill(0, 0, 0, 60);
  beginShape();
  vertex(76, 264);
  vertex(88, 321);
  vertex(85, 75);
  vertex(30, 75);
  endShape();

  fill(0, 0, 0, 170);
  beginShape();
  vertex(102, 345);
  vertex(304, 380);
  vertex(385, 365);

  endShape();

  fill(0, 0, 0, 53);
  beginShape();
  vertex(469, 321);
  vertex(487, 121);
  vertex(505, 327);
  vertex(531, 368);

  endShape();



  stroke(0, 0, 0, 200);
  strokeWeight(2);
  bezier(42, 23, 31, 378, 498, 60, 476, 346);
  stroke(0, 0, 0, 300);
  strokeWeight(1);
  bezier(531, 372, 502, 380, 512, 340, 431, 320);

  stroke(0, 0, 0, 37);
  noFill(); 
  arc(304, 174, 452, 274, 0, PI/2);


  interval=255/10;

  gradientWidth = width;
  // radial height
  gradientHeight = height;

  //radial center pt
  // we divide the constant variable by 2 in order to get the center point of the sketch

  //turn off stroke rendering
  noStroke();
  //create ellipses
  //set fill color and render ellipse
  fill(interval*5,interval*5,interval*5,2);
  ellipse(xpos/6, ypos/54, gradientWidth/2, gradientHeight/2);


  println();
  println("I'm tired as hell");
  println();
  println("That's my poem.");
  
}


