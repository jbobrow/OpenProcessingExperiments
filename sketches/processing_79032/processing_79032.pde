


void setup() {
  // 
  size(400,400);
  smooth();  
}
void draw() {
  float randomTri = mouseY+random(30,60); //set Y coordinates on bottom part of triangle to randomly switch  
  //Draw a black background
  background(0);
  
  //set shape mode to centre
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //Body
  stroke(0);
  fill(255);
  rect(mouseX,mouseY,20,30);
  
  //head
  stroke(150);
  fill(255);
  ellipse(mouseX,mouseY-30,60,60);
 
 //arms
 stroke(255);
 line(mouseX-10,mouseY,pmouseX-15,pmouseY);
 line(mouseX+10,mouseY,pmouseX+15,pmouseY);
 
 //head visor
 stroke(0);
 fill(170);
 ellipse(mouseX,mouseY-30,55,55);
 
 //visor reflection
 stroke(255);
 fill(255);
 ellipse(mouseX+13,mouseY-43,15,15);
 
 //jet flame (yellow)
stroke(255,255,0);
fill(255,255,0);
triangle(mouseX-10,mouseY+15,mouseX+10,mouseY+15,mouseX,randomTri);

 //jet flame (orange)
stroke(255,150,0);
fill(255,150,0);
triangle(mouseX-7,mouseY+17,mouseX+7,mouseY+17,mouseX,randomTri-2);
}


