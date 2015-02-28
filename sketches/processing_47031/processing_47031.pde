

//Face and mouths
PShape face;
PShape frown;
PShape oface;
PShape linemouth;
PShape smile;
PShape hrmouth;

//Hair Values

//circle values
float radius = 50; //it is half the 100 squares

//vertex a
float a1;
float a2;
float a3;
float a4;
float a5;
float a6;

//vertex b
float b1;
float b2;
float b3;
float b4;
float b5;
float b6;

//vertex c
float c1;
float c2;
float c3;
float c4;
float c5;
float c6;

//vertex d
float d1;
float d2;
float d3;
float d4;




void setup() {
  size(400,400);
  face = loadShape("face.svg");
  frown = loadShape("frownmouth.svg");
  oface = loadShape("omouth.svg");
  linemouth = loadShape("linemouth.svg");
  smile = loadShape("smile.svg");
  hrmouth = loadShape("hrmouth.svg");
  smooth();
  strokeWeight(2);
  noFill();
}


void draw() {
  background(255); //call in draw to create no overlaps
  //Face and different mouths
  shape(face, 100, 200, 200, 200);
  //shape(frown, 200, 320, 25, 16);
  //shape(oface, 195, 325, 25, 16);
  //shape(linemouth, 200, 320, 25, 16);
  //shape(smile, 200, 320, 25, 16);
  //shape(hrmouth, 200, 320, 25, 16);
  
  
//Hair Variables
//vertex a
if(mouseX<400 && mouseY<400){
  a1 = 231 + cos(radians(mouseX))*(radius/2); 
  a2 = 192 - sin(radians(mouseY))*(radius/2);
  a3 = 320 - cos(radians(mouseX))*(radius/2); 
  a4 = 164 + sin(radians(mouseY))*(radius/2);
  a5 = 300 + cos(radians(mouseX))*(radius/2); 
  a6 = 119 - sin(radians(mouseY))*(radius/2);

//vertex b
  b1 = 281 + cos(radians(mouseX))*(radius/2); 
  b2 = 74 + sin(radians(mouseY))*(radius/2);
  b3 = 118 + cos(radians(mouseX))*(radius/2); 
  b4 = 17 - sin(radians(mouseY))*(radius/2);
  b5 = 118 + cos(radians(mouseX))*(radius/2); 
  b6 = 61 - sin(radians(mouseY))*(radius/2);

//vertex c
  c1 = 118 + cos(radians(mouseX))*(radius/2); 
  c2 = 104 + sin(radians(mouseY))*(radius/2);
  c3 = 151 - cos(radians(mouseX))*(radius/2); 
  c4 = 37 + sin(radians(mouseY))*(radius/2);
  c5 = 102 - cos(radians(mouseX))*(radius/2); 
  c6 = 51 + sin(radians(mouseY))*(radius/2);

//vertex d
  d1 = 53 + cos(radians(mouseX))*(radius/2); 
  d2 = 64 + sin(radians(mouseY))*(radius/2);
  d3 = 110 + cos(radians(mouseX))*(radius/2); 
  d4 = 191 - sin(radians(mouseY))*(radius/2);
}

//mouth
if(mouseX<100 && mouseY<100){
  shape(smile, 200, 320, 25, 16);
}
else if(mouseX<200 && mouseY<200){
  shape(hrmouth, 200, 320, 25, 16);
}
else if(mouseX<300 && mouseY<300){
  shape(linemouth, 200, 320, 25, 16);
}
else if(mouseX<400 && mouseY<400){
     shape(hrmouth, 200, 320, 25, 16);
}



//Hair
beginShape();
vertex(217, 212);
bezierVertex(a1, a2, a3, a4, a5, a6); //vertex a
bezierVertex(b1, b2, b3, b4, b5, b6); //vertex b
bezierVertex(c1, c2, c3, c4, c5, c6); //vertex c
bezierVertex(d1, d2, d3, d4, 163, 241); //vertex d
endShape();






/*
large curvy one
beginShape();
vertex(217, 212);
bezierVertex(230.95743, 192.28079, 319.56015, 163.55219, 300.2606, 118.97333);
bezierVertex(280.961, 74.394516, 117.791626, 16.937317, 117.791626, 60.52556);
bezierVertex(117.791626, 104.11369, 151.12729, 36.750153, 102.00105, 50.61911);
bezierVertex(52.87481, 64.48811, 109.89635, 191.29015, 163, 241);
endShape();


first flat one
beginShape();
vertex(217, 212);
bezierVertex(312.0, 298.0, 349.0, 236.0, 327.0, 191.0);
bezierVertex(305.0, 146.0, 183.0, 121.0, 183.0, 165.0);
bezierVertex(183.0, 209.0, 221.0, 141.0, 165.0, 155.0);
bezierVertex(109.0, 169.0, 134.0, 306.0, 163, 241);
endShape();

*/

  
  
}

