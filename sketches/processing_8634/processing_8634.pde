
color quad1b = color(150);  //(75,0,100)PURPLE COLOR
color quad1t = color(200);  // (0,0,225)BLUE COLOR

color quad2b = color(0,0,0);
color quad2t = color(0,125,0);

color quad3b = color(150);
color quad3t = color(200);

color quad4b = color(0,0,0);
color quad4t = color(255,0,0);



/*
// SMALLER ARROWS
float x = 100;  // x location of square
float y = 0;  // y location of square
float speed = 0; // speed of square
float gravity = 0.1;
// Boolean variable starts as false
boolean going = false;
// Location of Little SquareSsint littlesquareX = 600;
int littlesquareX = 600;
int littlesquareY = 200;
int littlesquarebotX = 620;
int littlesquarebotY = 220;
int littlesquaretopX = 620;
int littlesquaretopY = 180;
*/







void setup(){
size (800,800,P3D);
}



void draw() {
  background(255);
  

  
 drawPyramid(0, 0, width, 0, width/2, height/2, quad1t, width/2, height/2, 270);
 drawPyramid(0, 0, width, 0, width/2, height/2, quad1b, width/2, height/2, 315);

 // SMALLER TRIANGLES ALONG CENTRAL NORTH EAST AXIS
 // ORIGINAL SMALL TRIANGLE
 //drawPyramid(0, 200, 200, 200, 100, 100, color(255,255,100), 800, 0, 90);
//drawPyramid(100, 200, 200, 100, 75, 75, color(0,0,0), 800, 0, 90);
//drawPyramid(90, 270, 210, 90, 35, 75, color(0,0,0), 800, 40, 90);




//drawPyramid(100, 200, 200, 100, 75, 75, color(255,0,0), 700, 430, 210);
//drawPyramid(100, 200, 200, 100, 75, 75, color(0,0,0), 575, 300, 210);


drawPyramid(0, 0, width, 0, width/2, height/2, quad2t, width/2, height/2, 0);
drawPyramid(0, 0, width, 0, width/2, height/2, quad2b, width/2, height/2, 45);


drawPyramid(0, 0, width, 0, width/2, height/2, quad3t, width/2, height/2, 135);
drawPyramid(0, 0, width, 0, width/2, height/2, quad3b, width/2, height/2, 90);


drawPyramid(0, 0, width, 0, width/2, height/2, quad4t, width/2, height/2, 225);
drawPyramid(0, 0, width, 0, width/2, height/2, quad4b, width/2, height/2, 180);


if (mouseX/2 < 100 && mouseY/2 < 100) {
  quad4t=color(255,0,0);
  quad4b=color(0,0,0);

} 

else if (mouseX/2 > 100 && mouseY/2 < 100) {
  quad4b=color(255,0,0);
  quad4t=color(0,0,0);

 // triangle(vert1, vert2, vert3, vert4, vert5, vert6);

}

// CHANGING TRIANGLES FROM BLACK TO RED and RED TO BLACK
if (mouseX/2 < 100 && mouseY/2 < 100) {
  //quad2t=color(255,0,0);
  //quad2b=color(0,0,0);

  quad2t=color(0,0,0);
  quad2b=color(255,0,0);

} 

else if (mouseX/2 > 100 && mouseY/2 < 100) {
  //quad2b=color(255,0,0);
  //quad2t=color(0,0,0);

  quad2b=color(0,0,0);
  quad2t=color(255,0,0);
 
}


// CHANGING TRIANGLES FROM GREY TO RED and RED TO GREY
if (mouseX/2 < 100 && mouseY/2 < 100) {
  //quad2t=color(255,0,0);
  //quad2b=color(0,0,0);

  quad3t=color(200);
  quad3b=color(150);

} 

else if (mouseX/2 > 100 && mouseY/2 < 100) {
  //quad2b=color(255,0,0);
  //quad2t=color(0,0,0);

  quad3b=color(0,0,0);
  quad3t=color(255,0,0);
 
}


// CHANGING TRIANGLES FROM GREY TO RED and RED TO GREY
if (mouseX/2 < 100 && mouseY/2 < 100) {
  //quad2t=color(255,0,0);
  //quad2b=color(0,0,0);

  quad1t=color(200);
  quad1b=color(150);

} 

else if (mouseX/2 > 100 && mouseY/2 < 100) {
  //quad2b=color(255,0,0);
  //quad2t=color(0,0,0);

  quad1b=color(0,0,0);
  quad1t=color(255,0,0);
 
}



rectMode(CENTER);
fill(0);
rect(600,200,150,150);

fill(255,0,0);
rect(600,200,75,75);


/*
// FLOATING Black Squares
 // floating black middle square no.1
 fill (0);
 rectMode(CORNER);
 //rect(600,200,20,20);
 rect(littlesquareX,littlesquareY,20,20);
 // Only move the littlesquare when "going" is true
 if (going) {
   littlesquareX = littlesquareX -1;
 }
rect(littlesquarebotX,littlesquarebotY,20,20);
 // Only move the littlesquare when "going" is true
 if (going) {
   littlesquarebotY = littlesquarebotY +1;
 }
 
 rect(littlesquaretopX,littlesquaretopY,20,20);
 // Only move the littlesquare when "going" is true
 if (going) {
   littlesquaretopY = littlesquaretopY -1;
 }
*/






}
void drawPyramid(int vert1, int vert2, int vert3, int vert4, int vert5, int vert6, color fill1, int translateX, int translateY, float rotation)


{
 
  
  

  
  


 stroke(0);
 fill(fill1);
  pushMatrix();
 translate(translateX,translateY);
 rotate(radians(rotation));
//- Show quoted text -

  triangle(vert1, vert2, vert3, vert4, vert5, vert6);
  popMatrix();
 
 
/*

// QUADRANT I, UPPER RIGHT CORNER
fill(0,0,255); // BLUE TRIANGLE, upper right corner triangle 
  pushMatrix();
 translate(translateX,translateY);
 rotate(radians(270));
  triangle(vert1, vert2, vert3, vert4, vert5, vert6);
  popMatrix();

fill(75,0,100); // Purple Triangle, UPPER LOWER RIGHT CORNER TRIANGLE 
  pushMatrix();
 translate(translateX,translateY);
 rotate(radians(315));
  triangle(vert1, vert2, vert3, vert4, vert5, vert6);
  popMatrix();
 
   
 
  // QUADRANT II LOWER BOTTOM RIGHT CORNER
   fill(0);  // Black Color Triangle Lower/Bottom right side 
  pushMatrix();
 translate(translateX,translateY);
 rotate(radians(45));
  triangle(vert1, vert2, vert3, vert4, vert5, vert6);
  popMatrix();
 
  fill(0,125,0);  // GREEN Color Triangle UPPER/Bottom right side 
  pushMatrix();
 translate(translateX,translateY);
 rotate(radians(0));
  triangle(vert1, vert2, vert3, vert4, vert5, vert6);
  popMatrix();
 
 
 
 
  // QUADRANT III
   fill(150);  // DARK GREY COLOR TRIANGLE //quadrant III, lower left side
  pushMatrix();
 translate(translateX,translateY);
 rotate(radians(90));
  triangle(vert1, vert2, vert3, vert4, vert5, vert6);
  popMatrix();
 
   fill(200);  // Lighter grey color//quadrant III, lower upperleftside
  pushMatrix();
 translate(translateX,translateY);
 rotate(radians(135));
  triangle(vert1, vert2, vert3, vert4, vert5, vert6);
  popMatrix();
 
 
 
  // QUADRANT IV
   fill(quad4b);  // BLACK COLOR TRIANGLE UPPER/BOTTOM, LEFT SIDE

  pushMatrix();
 translate(translateX,translateY);
 rotate(radians(180));
  triangle(vert1, vert2, vert3, vert4, vert5, vert6);
  popMatrix();
fill(quad4t);  // RED COLOR TRIANGLE UPPER SIDE
- Show quoted text -

  pushMatrix();
 translate(translateX,translateY);
 rotate(radians(225));
  triangle(vert1, vert2, vert3, vert4, vert5, vert6);
  popMatrix();




// QUADRANT I, CENTER SMALL TRIANGLES
fill(255); // WHITE TRIANGLE, upper right corner triangle WHITE WHITE
  pushMatrix();
 translate(translateX,translateY);
 rotate(radians(270));
  triangle(vert1/2, vert2/2, vert3/2, vert4/2, vert5/2, vert6/2);
  popMatrix();

fill(0); // BLACK TRIANGLE, upper right corner triangle BLACKBLACK
  pushMatrix();
 translate(translateX,translateY);
 rotate(radians(270));
  triangle(vert1/4, vert2/4, vert3/4, vert4/4, vert5/4, vert6/4);
  popMatrix();

fill(0,255,0); // SECOND GREEN TRIANGLE, upper right corner triangle GREENGREEN
  pushMatrix();
 translate(translateX,translateY);
 rotate(radians(270));
  triangle(vert1/8, vert2/8, vert3/8, vert4/8, vert5/8, vert6/8);
  popMatrix();


// QUADRANT I, CENTER PURPLE SMALLER TRIANGLES
fill(255); // Purple Triangle, UPPER LOWER RIGHT CORNER TRIANGLE 
  pushMatrix();
 translate(translateX,translateY);
 rotate(radians(315));
  triangle(vert1/2, vert2/2, vert3/2, vert4/2, vert5/2, vert6/2);
  popMatrix();



// ALTERNATING WING COLORS QUADRANTS II AND IV
// FILL A RED COLOR
noStroke();
fill(255,0,0);

 translate(translateX,translateY);
 rotate(radians(180));
*/
}



