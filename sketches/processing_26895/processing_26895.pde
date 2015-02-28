
void setup () {
  size (500,500);
  smooth ();
}

void draw () {
  // draw white bg
  background (255);
 // ellipse and rect to center 
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //Monster R Ear 
  ellipse(350,150,100,100);
  
  //Inside Monster R Ear
  ellipse(350,150,60,60);
  
  //Monster L Ear
  ellipse (150,150,100,100);
  
  //Inside Monster L Ear
  ellipse (150,150,60,60);
  
    // Right Arm
  rect (350,300,100,10);
  
  // Right Hand
  ellipse (400,300,30,30);
  
  
  // Left Arm
  rect (150, 300,100,10);
  
  // Left Hand
  ellipse (100,300,30,30);
  
  // Monster body
  stroke(0);
  ellipse(250,250,200,400);
  
  // Monster L eye
  ellipse(220,200,50,150);
 
   // L Pupil
  ellipse(220,200,30,120);
  
  //Monster R eye
  ellipse(280,200,50,150);
  
  // R Pupil
  ellipse(280,200,30,120);
  
  //Monster Mouth
  ellipse(250,350,100,70);
  

  
  
}

