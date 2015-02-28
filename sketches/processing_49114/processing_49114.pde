
float bowR;
float bowG;
float bowB;

//mouse origin = width/2, height/2 - 30

float critterX;
float critterY;

void setup() {
  size(640,480);
  critterX = width/2;
  critterY = height/2 - 30;
  smooth();
  frameRate(30);
}

void draw() {

background(0);
/*
if (mouseX = width/2) {
  mouseX */
  
//100x100 frame (hidden now-black)
fill(0);
rectMode(CENTER);
rect(width/2,height/2,100,100);

//body
smooth();
fill(255,178,202);
smooth();
noStroke();
ellipse(mouseX,mouseY - 31,80,80);

//bow left side
fill(mouseX,50, mouseY);
strokeJoin(ROUND);
beginShape(TRIANGLES);
vertex(mouseX, mouseY - 60);
vertex(mouseX - 18,mouseY - 68);
vertex(mouseX - 18,mouseY - 52);
endShape();

//bow right side
fill(mouseX,50,mouseY);
strokeJoin(ROUND);
beginShape(TRIANGLES);
vertex(mouseX, mouseY - 60);
vertex(mouseX + 18,mouseY - 68);
vertex(mouseX + 18,mouseY - 52);
endShape();

//bow circle
smooth();
stroke(255,178,202);
strokeWeight(2);
fill(mouseX,50,mouseY);
ellipse(mouseX,mouseY - 60,9,9);

//feet
smooth();
noStroke();
fill(255,178,202);
arc(mouseX - 11, mouseY + 20, 15, 15, -PI, 0);  // left
smooth();
arc(mouseX + 11, mouseY + 20, 15, 15, -PI, 0);  // right

/* constant feet - use this if head bobs
arc(mouseX - 11, height/2 + 50, 15, 15, -PI, 0);  // left
smooth();
arc(mouseX + 11, height/2 + 50, 15, 15, -PI, 0);  // right
*/

//right
  fill(0);
  stroke(0);
  strokeWeight(1);
  beginShape(LINES);
  vertex(mouseX + 2,mouseY - 36);
  vertex(mouseX + 6,mouseY - 29);
  vertex(mouseX + 6,mouseY - 37);
  vertex(mouseX + 6,mouseY - 29);
  vertex(mouseX + 10,mouseY - 36);
  vertex(mouseX + 6,mouseY - 29);
  endShape();

//blink feature
if (!mousePressed) {
  //eyelashes

//left eyelashes

fill(0);
stroke(0);
strokeWeight(1);
beginShape(LINES);
vertex(mouseX - 10,mouseY - 36);
vertex(mouseX - 6,mouseY - 29);
vertex(mouseX - 6,mouseY - 37);
vertex(mouseX - 6,mouseY - 29);
vertex(mouseX - 2,mouseY - 36);
vertex(mouseX - 6,mouseY - 29);
endShape();

//left eye
fill(0);
stroke(255,178,202);
strokeWeight(2);
ellipse(mouseX - 6,mouseY - 30 + 2,8,8); 

} else { //eyes closed
 
  
  fill(0);
  stroke(0);
  strokeWeight(1);
  beginShape(LINES);
  vertex(mouseX - 10,mouseY - 23);
  vertex(mouseX - 6,mouseY - 29);
  vertex(mouseX - 6,mouseY - 22);
  vertex(mouseX - 6,mouseY - 29);
  vertex(mouseX - 2,mouseY - 23);
  vertex(mouseX - 6,mouseY - 29);
  endShape();
  
  //left eye closed
  fill(0);
  noStroke();
  ellipse(mouseX - 6,mouseY - 30 + 2,6,6); // left
  
  fill(255,178,202);
  noStroke();
  rect(mouseX - 6,mouseY - 33 + 2,8,6); // left
  
 
}

//eyes
fill(0);
stroke(255,178,202);
strokeWeight(2);
ellipse(mouseX + 6,mouseY - 30 + 2,8,8); // right

//lips
fill(255,51,41);
noStroke();
beginShape();
vertex(mouseX, mouseY - 11);
vertex(mouseX + 3, mouseY - 15);
vertex(mouseX + 7, mouseY - 11);
vertex(mouseX, mouseY -6);
vertex(mouseX - 7, mouseY - 11);
vertex(mouseX - 3, mouseY - 15);
endShape(CLOSE);

critterY = critterY + random(-.5,.5);

}




