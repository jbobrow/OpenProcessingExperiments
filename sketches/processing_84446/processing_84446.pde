
// header
/*
This is my first processing project.
*/

// global variables

// setup
void setup(){
  // the setup function gets executed first thing
  // when the sketch loads and only is executed once
  size(500, 500); //size(width, height); in pixels
  smooth(); //this turns on anti-aliasing, makes things look pretty
}

// draw
void draw(){
  
  // 1. Background
  noStroke();
  background(#FFFFFF);
  
  //2. Horns (Does it round decimal points?)
  fill(#FF6A00);
  triangle(151.265, 108, 184.617, 50.232, 217.969, 108);
  triangle(281.266, 108, 314.617, 50.232, 347.969, 108);
  
  // 3. Head
  fill(#49D6E3);// white
  rect(135, 84, 230, 252);
  
  //4. Eyes
  fill(#FFFFFF);
  ellipse(201.865, 155.503, 69.5, 69.5);
  ellipse(297.865, 155.503, 69.5, 69.5);
  fill(#FF6A00);
  ellipse(201.865, 155.503, 48.25, 48.25);
  ellipse(297.865, 155.503, 48.25, 48.25);
  fill(#000000);
  ellipse(201.865, 155.503, 30.5, 30.5);
  ellipse(297.865, 155.503, 30.5, 30.5);
  fill(#49D6E3);
  rect(153, 118, 193, 38);
  
  //5. Nose
  fill(#FF6A00);
  ellipse(250, 210, 89, 89);
  
  //6. Mouth
  fill(#000000);
  rect(190,272,119,22);
  fill(#FFFFFF);
  rect(200,272,12,6);
  rect(221,272,12,6);
  rect(253,272,12,6);
  rect(237,289,12,6);
  rect(282,289,12,6);
  
  //7. Legs
  fill(#FF6A00);
  rect(212,336,30,9);
  rect(259,336,30,9);
  rect(212,354,30,9);
  rect(259,354,30,9);
  rect(212,372,30,9);
  rect(259,372,30,9);
  rect(165,390,77,23);
  rect(259,390,77,23);
  ellipse(165,413,46,46);
  ellipse(336,413,46,46);
  fill(#49D6E3);
  rect(212,345,30,9);
  rect(259,345,30,9);
  rect(212,363,30,9);
  rect(259,363,30,9);
  rect(212,381,30,9);
  rect(259,381,30,9);
  fill(#FFFFFF);
  rect(134,413,232,40);
 
  //7. Trees
  fill(#FF6A00);
  rect(57,386,14,22);
  rect(429,386,14,22);
  rect(98,428,11,17);
  fill(#49A829);
  triangle(38.164, 360, 64, 315.251, 89.836, 360);
  triangle(29.825, 397, 64 ,337.807, 98.175, 397);
  triangle(410.164, 360, 436, 315.251, 461.836, 360);
  triangle(401.825, 397, 436 ,337.807, 470.175, 397);
  triangle(83.325, 408, 103.463, 373.12, 123.601, 408);
  triangle(76.825, 436, 103.463, 389.861, 130.101, 436);
 
  
  
  
  
}



