
/*****************************************
 * Assignment 1
 * Name:    Mengnan Zhang
 * E-mail:       mzhang01@brynmawr.edu
 * Course:       CS 110 - Section 01
 * Submitted:    09/11/12
 * A description of the file contents.
   uprising rocket 
***********************************************/


void setup(){
  size(500,500);
  smooth();
}

void draw() {
  background(0,150,250);
  strokeWeight(5);
  stroke(255,0,100);
  
  //draw body
  fill(255);
  triangle(mouseX+50,mouseY+200, mouseX+250,mouseY+200, mouseX+150,mouseY+50);
  fill(50,150,0);
  triangle(mouseX+70,mouseY+200, mouseX+230,mouseY+200, mouseX+150,mouseY+80);
  fill(50,100,255);
  triangle(mouseX+90,mouseY+200, mouseX+210,mouseY+200, mouseX+150,mouseY+110);
  fill(200,150,10); 
  rect(mouseX+125,mouseY+150,48,50);
  fill(255);
  triangle(mouseX+130,mouseY+150, mouseX+170,mouseY+150, mouseX+150,mouseY+195);
  fill(0);
  line(mouseX+150, mouseY+150, mouseX+150,mouseY+195);
  
  //draw foot
  beginShape(TRIANGLES);
  frameRate(50);
  fill(random(0,255));
  vertex(mouseX+90,mouseY+200);
  vertex(mouseX+107,mouseY+250);
  vertex(mouseX+125,mouseY+200);
  vertex(mouseX+173,mouseY+200);
  vertex(mouseX+195,mouseY+250);
  vertex(mouseX+210,mouseY+200);
  endShape();

    
  //draw fire
  fill(255,0,0);
  noStroke();
  beginShape(TRIANGLES);
  vertex(mouseX+130,mouseY+400);
  vertex(mouseX+100,mouseY+300);
  vertex(mouseX+70,mouseY+400);
  vertex(mouseX+130,mouseY+400);
  vertex(mouseX+160,mouseY+300);
  vertex(mouseX+190,mouseY+400);
  vertex(mouseX+190,mouseY+400);
  vertex(mouseX+220,mouseY+300);
  vertex(mouseX+250,mouseY+400);
  endShape();
}
  
  void mouseMoved() {
     fill(random(255),random(255),0);
  noStroke();
  frameRate(50);
  beginShape(TRIANGLES);
  vertex(mouseX+130,mouseY+400);
  vertex(mouseX+100,mouseY+300);
  vertex(mouseX+70,mouseY+400);
  vertex(mouseX+130,mouseY+400);
  vertex(mouseX+160,mouseY+300);
  vertex(mouseX+190,mouseY+400);
  vertex(mouseX+190,mouseY+400);
  vertex(mouseX+220,mouseY+300);
  vertex(mouseX+250,mouseY+400);
  endShape();

}

