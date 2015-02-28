

  size(300, 300);
  background(27,247,200);
 

 

  noStroke();
  background(27,247,200);
  rectMode(CENTER); 
  translate(150,150);
  
  
 // head
  fill(224,156,112); 
  ellipse(-75, 0, 40, 40); 
  ellipse(75, 0, 40, 40);
  fill(244,176,132); 
  rect(0, 0, 150, 200, 40);
  ellipse(0, 100, 250, 200);   
  ellipse(-75, 0, 20, 20); 
  ellipse(75, 0, 20, 20);
  stroke(0);
  
  
// hair
  fill(120,74,30);
  rect(0, -75, 150, 50, 40, 40, 0, 0);
  
// eyes
  fill(255); 
  stroke(0);
  ellipse(-37.5, 0, 50, 50); //fourth place
  ellipse(37.5, 0, 50, 50);
  fill(201,11,222); 
  ellipse(-37.5, 0, 15, 15);
  ellipse(37.5, 0, 15, 15);
  rect(1, -5, 25.1, 2); 
  
 // nose
  noFill();
  stroke(0);
  arc(0, 30, 50, 50, 0, PI);
 
 //mouth
 fill(255);
 ellipse(0, 90, 80, 45);
 noStroke();
 fill(244,176,132);
 ellipse(0, 72, 60, 30);
 
 //chin
  noFill();
  stroke(0);
  arc(-20, 120, 50, 50, 0, PI);
  
  noFill();
  stroke(0);
  arc(30, 120, 50, 50, 0, PI);


