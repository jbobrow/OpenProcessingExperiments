
/*****************************************
 * Assignment 02
 * Name:         Jordan Schwartz
 * E-mail:       jrschwartz@brynmawr.edu
 * Course:       CS 110 - Section 01
 * Submitted:    The date your submitted the assignment
 * 
 * This code creates a target. The target is generated using a for loop. If one
 clicks around the image, dots representing hit marks will appear. An if
 statement was used to localize the hit marks on the target.
***********************************************/

void setup() {
  size(600, 600);
  smooth();
  stroke(255);
  drawBackground();
}

void drawBackground() {

  background(0,150,255);
  
  //draw horizon  
  noStroke();
  fill(0,255,0);
  rect(0,500,600,600);
  
  //draw target stand
  stroke(0);
  strokeWeight(10);
  line(150,525,300,300);
  line(300,300,450,525);
  line(300,500,300,300);
  
  //draw target
  
  noStroke();
  for (int i=350; i >= 50; i=i-50) {
     
    if (i0 == 0) {
      fill(255);
    }
    else { 
      fill(255,0,0);
    }
    
    ellipse(300,300,i,i);
    
  }
}
   
void draw () {
  
  //draw sun
  stroke(250,150,0);
  strokeWeight(5);
  fill(250,200,0);
  ellipseMode(CENTER);
  ellipse(575,60,200,200);
  
  //draw clouds
  noStroke();
  fill(255);
  ellipseMode(CENTER);
  ellipse(75,80,50,15);
  ellipse(80,75,25,15);
  ellipse(175,90,150,25);
  ellipse(180,85,125,25);
  ellipse(400,110,50,20);
  ellipse(300,10,75,50);
  ellipse(310,15,70,20);
  ellipse(290,30,60,20);
  ellipse(50,200,80,25);
  ellipse(550,250,90,20);
  
}
  
void mousePressed() {
  
    float d= dist(300,300,mouseX,mouseY);
    float r= random(15,d);
    if (d+r < 400/2) { //localizes hits
      println(d);
    fill(0);
    ellipse(mouseX-15,mouseY-20,r,r); 
    //subtracted minor values to make it more fun than a direct x/y click
    }
}

void keyPressed() {
  
  drawBackground();
  
}
