
/*****************************************
 * Assignment 02
 * Name:         Chloe Patton
 * E-mail:       cfpatton@brynmawr.edu
 * Course:       CS 110 - Section 001
 * Submitted:    09/19/2012
 * 
 * A red background with randomly colored stripes should appear until a key is tapped to redraw the stripes.
 A skull appears whenever the mouse is clicked, 
 however the skull will either smile, frown, or show no emotion depending on the location of the mouse.
***********************************************/
int x = 0;

void setup() {
  size(750, 400) ;
  smooth();
  background(255, 0, 0); 
  while (x < 750) {
    stroke (random(255));
    line(x, 0, x, 750);
    x = x +10;
    // continue;
  } 
}

void draw() {
}

void mousePressed() {
  noStroke();
  fill(255);
  ellipseMode(CENTER);
    ellipse(mouseX, mouseY, 105, 110);
  
  stroke(0);
  fill(0);
  ellipseMode(CENTER);
    ellipse(mouseX-23, mouseY+10, 28, 30);
    ellipse(mouseX+23, mouseY+10, 28, 30);
    
  stroke(255);
  fill(255);
  rectMode(CENTER);
    rect(mouseX, mouseY+50, 70, 40);
    
  stroke(0);
  fill(0);
  beginShape();
    vertex(mouseX, mouseY+25);
    vertex(mouseX-5, mouseY+45);
    vertex(mouseX, mouseY+40);
    vertex(mouseX+5, mouseY+45);
    vertex(mouseX, mouseY+25);
    endShape(CLOSE);
  
  if (mouseX < 250) {
     bezier(mouseX-35, mouseY+65, mouseX-5, mouseY+50, mouseX+5, mouseY+50, mouseX+35,  mouseY+65);
  }
  
  if (mouseX>=250 && mouseX<=500) {
    ellipseMode(CENTER);
    ellipse(mouseX, mouseY+55, 70, 3);
  }
  
  if (mouseX>500) {
    bezier(mouseX-35, mouseY+50, mouseX-5, mouseY+70, mouseX+5, mouseY+70, mouseX+35, mouseY+50);
  }

}


void keyPressed() {
 background(255, 0, 0);

 x = 0;
 while (x < 750) {
    stroke (random(255), random(255), random(255));
    line(x, 0, x, 750);
    x = x + 10;
   }
  
}



