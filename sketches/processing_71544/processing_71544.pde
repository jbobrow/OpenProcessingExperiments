

void setup (){
  
  
  smooth();
  size(1000,800);
  background(250,250,232);
  
}

void draw (){
  
  // Draw top yellowish ellipse 
  noStroke();
  fill(175,149,51);
  ellipse(500,40,100,100);
  
  // Make all strokes with square ends
    strokeCap(SQUARE);
    
    
  // Draw vertical Green rectangle
  stroke(1,121,38);
  strokeWeight(25);
  line(800,0,800,400);
  
   // Draw diagonal brown line in upper corner
  stroke(121,1,1);
  strokeWeight(5);
  line(300,-10,-10,450);
  
  
    // Draw Red Rect
  stroke(240,7,7);
  strokeWeight(75);
  line(325,500,425,600);
  
   // Draw tob blue rect
  translate(525,500);
  rotate(radians(45));
  stroke(12,7,70);
  strokeWeight(35);
  line(0,0,0,350);
  

  
   // Draw 2nd blue rect
  translate(35,-80);
  stroke(12,7,70);
  strokeWeight(35);
  line(0,0,0,225);
  
    // Draw Bottom Black Box
  translate(15,-15);
  noStroke();
  strokeWeight(35);
  fill(0,0,0);
  rect(0,0,300,400);
    
  
  
  
}
