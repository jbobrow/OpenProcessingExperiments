
void setup() {
  size(900, 900); // set the dimensions of the window
  background(0, 255, 0); // set background color to green
  background(246, 206, 227); // set background color to pink
  smooth(); // could help
  
//  PImage img; // load image: Tuxedo Sam is here!
//  img = loadImage("TuxedoSam.jpg");
//  image(img, 150, 150);
}

void draw() {
    // see tutorial-curves  
  
    fill(83, 178, 232); // tuxedo sam blue
    // noFill();
    stroke(0, 0, 0); // outline black
    strokeWeight(8);  // thick
  
    pushMatrix(); // to limit rotate to this object
    stroke(0, 0, 0);
    fill(169, 245, 208); // green
    rect(180, 270, 60, 25); // ribbon for hat
    rotate(PI/4);
    fill(191, 191, 185); // grey
    arc(380, 0, 120, 120, PI/2, 3*PI/2); // circle for hat
    triangle(380, -65, 380, 65, 620, -10); // triangle for hat
    fill(169, 245, 208); // green
    rect(360, -70, 25, 140); // rectangle for hat
    popMatrix();
    
    pushMatrix();
    rotate(-HALF_PI/4);
    fill(255, 255, 0); // yellow
    noStroke();
    rect(280, 740, 115, 70); // left foot middle
    stroke(0, 0, 0);
    arc(380, 810, 35, 50, 0, PI);  // left foot toe 1
    arc(340, 810, 35, 50, 0, PI);  // left foot toe 2
    arc(300, 810, 35, 50, 0, PI);  // left foot toe 3
    line(398, 780, 398, 807);
    popMatrix();
    
    pushMatrix(); 
    rotate(PI/4);
    fill(83, 178, 232); // tuxedo sam blue
    arc(710, -215, 95, 130, -PI, 0); // left paw
    noStroke();
    rect(663, -215, 90, 90);
    rotate(7*PI/4);
    stroke(0, 0, 0);
    line(685, 385, 635, 430);
    
    rotate(-PI/8);
    arc(260, 530, 380, 380, -PI, 0); // half circle for head
    line(70, 530, 70, 610);
    popMatrix();
    
    pushMatrix(); 
    rotate(-HALF_PI/4);
    noStroke();
    rect(75, 525, 370, 215, 0, 0, 100, 0); // blue rectangle for upperbody
    popMatrix();
    
    pushMatrix();
    rotate(-HALF_PI/4);
    fill(255, 255, 255); // white
    stroke(0, 0, 0); // black
    arc(273, 665, 270, 170, -PI, 0); // upper white body
    popMatrix();
    
    pushMatrix(); 
    rotate(-HALF_PI/4);
    noStroke();
    rect(75, 630, 350, 175, 300, 300, 600, 150); // white rectangle for lowerbody
    stroke(0, 0, 0); // black
    line(420, 750, 450, 630); // left side
    line(150, 805, 350, 805); // bottom
    arc(350, 755, 138, 100, 0, PI/2); // left bottom stroke
    arc(150, 755, 138, 100, PI/2, PI); // right bottom stroke
    noFill();
    arc(249, 740, 350, 410, 11*PI/6, 2*PI); // upper part right stroke
    
    strokeJoin(ROUND); // make rounded corners
    fill(255, 0, 0); // red
    triangle(255, 620, 300, 650, 305, 600); // red triangle for bowtie
    popMatrix();
    
    pushMatrix();
    rotate(-PI/3);
    fill(83, 178, 232); // tuxedo sam blue
    noStroke();
    rect(-255, 550, 95, 70);
    stroke(0, 0, 0); // black
    arc(-210, 600, 95, 130, 0, PI); // right paw
    popMatrix();
    
    pushMatrix();
    rotate(-HALF_PI/4);
    fill(0, 0, 0); // black
    ellipse(210, 500, 10, 20); // eye 1
    ellipse(325, 505, 10, 20); // eye 2
  
    fill(255, 255, 0); // yellow
    triangle(215, 545, 320, 545, 265, 510); // yellow triangle for beak
    
    noStroke();
    rect(50, 630, 105, 70); // right foot middle
    stroke(0, 0, 0); // black
    arc(100, 700, 110, 100, 0, PI);  // right foot bottom half
    arc(65, 635, 35, 50, -PI, 0);  // right foot toe 1
    arc(100, 635, 35, 50, -PI, 0);  // right foot toe 2
    arc(140, 635, 40, 50, -PI, 0);  // right foot toe 3
    line(160, 635, 155, 700);
    line(47, 635, 45, 700);
    popMatrix(); // made my own tuxedo sam, great!
  
}



