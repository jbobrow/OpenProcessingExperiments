
void setup() {
  size(300, 300);
  smooth();
  frameRate(20);
}

void draw() {
  background(255);
  rectMode(CENTER);
  ellipseMode(CENTER);

  //head
  fill(0, 150, 0);
  rect(mouseX, mouseY-60, 50, 100);

  //hair
  fill(0);
  noStroke();
  triangle(mouseX-25, mouseY-110, pmouseX-30, pmouseY-100, mouseX-15, mouseY-110);
  triangle(mouseX-15, mouseY-110, pmouseX-20, pmouseY-100, mouseX-5, mouseY-110);
  triangle(mouseX-5, mouseY-110, pmouseX-10, pmouseY-100, mouseX+5, mouseY-110);
  triangle(mouseX+5, mouseY-110, pmouseX, pmouseY-100, mouseX+15, mouseY-110);
  triangle(mouseX+15, mouseY-110, pmouseX+10, pmouseY-100, mouseX+25, mouseY-110);
   
    /* FOR SOME REASON THIS HAIR DIDN'T WORK WITH JAVASCRIPT
    
    beginShape(TRIANGLES);
     
     vertex(mouseX-25, mouseY-110);
     vertex(pmouseX-30, pmouseY-100);
     vertex(mouseX-15, mouseY-110);
     
     vertex(mouseX-15, mouseY-110);
     vertex(pmouseX-20, pmouseY-100);
     vertex(mouseX-5, mouseY-110);
     
     vertex(mouseX-5, mouseY-110);
     vertex(pmouseX-10, pmouseY-100);
     vertex(mouseX+5, mouseY-110);
     
     vertex(mouseX+5, mouseY-110);
     vertex(pmouseX, pmouseY-100);
     vertex(mouseX+15, mouseY-110);
     
     vertex(mouseX+15, mouseY-110);
     vertex(pmouseX+10, pmouseY-100);
     vertex(mouseX+25, mouseY-110);
     */
    
    
    //mouth
    fill(255, 0, 0);
  stroke(0);
  ellipse(mouseX, mouseY-30, 10+(abs(mouseY-pmouseY)*3), 5+(abs(mouseX-pmouseX)*3));

  // bumbpy eyes
  fill(255);

  ellipse(mouseX-15, mouseY-50, 10+(abs(mouseX-pmouseX)*2), 10+(abs(mouseY-pmouseY)*2));
  ellipse(mouseX+15, mouseY-50, 10+(abs(mouseX-pmouseX)*2), 10+(abs(mouseY-pmouseY)*2));

  //eyes
  fill(mouseX, 0, mouseY);
  ellipse(mouseX-15, mouseY-50, 3, 3);
  ellipse(mouseX+15, mouseY-50, 3, 3);


  //torso
  fill(230, 168, 5);
  rect(mouseX, mouseY+5, 25, 30); 

  //tie
  fill(0);
  triangle(mouseX-3, mouseY-10, mouseX+3, mouseY-10, mouseX, mouseY-2);

  beginShape();

  vertex(mouseX, mouseY-2);
  vertex(pmouseX-3, pmouseY+5);
  vertex(pmouseX, pmouseY+12);
  vertex(pmouseX+3, pmouseY+5);
  endShape(CLOSE);

  //HANDS
  line(mouseX-12.5, mouseY-10, pmouseX-27, pmouseY+12);
  line(mouseX+12.5, mouseY-10, pmouseX+27, pmouseY+12);

  fill(0, 150, 0);
  ellipse(pmouseX-27, pmouseY+12, 4, 4);
  ellipse(pmouseX+27, pmouseY+12, 4, 4);

  //legs
  line(mouseX-5, mouseY+20, pmouseX-5, pmouseY+40);
  line(mouseX+5, mouseY+20, pmouseX+5, pmouseY+40);

  fill(200, 0, 0);
  ellipse(pmouseX-9, pmouseY+40, 12, 7);
  ellipse(pmouseX+9, pmouseY+40, 12, 7);
}



