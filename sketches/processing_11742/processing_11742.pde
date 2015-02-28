

// Assignment #1
// Name: Allaina K. Propst
// E-mail: apropst@brynmawr.edu   
// Date: September 5th 2010 


// I went a bit retro with Pac man.  The graphics in video games have always intrigued me so I thought that I would try to replicate them myself.  I figured that the coding used to produce Pac man would be simple enough to try for this assignment.  This assignment made me wish I knew other commands, like how to create collisions or let objects float freely by themselves.  Hopefully, I can make this assignment more detailed as we learn other commands in class.



//background

void setup() { 
  size(600,300); 
  smooth();
  frameRate(9);
} 
 
void draw() {
  background(0);
  rectMode(CENTER);
  
  //Pacman 1
  fill(255,255,0);
  stroke(16,78,139);
  strokeWeight(2);
  noSmooth();
  arc(pmouseX-10,pmouseY-10,110,100,PI/8,9*PI/5);
  
  //ball
  fill(255,255,0);

  noStroke();
  ellipse(mouseX+10,mouseY+10,19,19);
  
}

