
 size(500,500);
  background(155,96,2);
  
  translate(250,250);
  noStroke();
  fill(255,206,120);
  ellipse(0,0,200,300);
  
  // Right Eye
  fill(255,255,255);
  ellipse(40,-40,20,20);
  
  // Nose
  pushMatrix();
  translate(0,20);
  fill(255,225,173);
  triangle(0,-20,-18,18,18,18);
  popMatrix();
  
  // Left Eye
  fill(255,255,255);
  ellipse(-40,-40,20,20);
  
  // Mouth
  fill(255,183,173);
  arc(0, 80, 60, 50, 0, PI/1.5+QUARTER_PI, CHORD);
  
  // Right Ear
  fill(255,206,120);
  ellipse(110,-10,40,60);
  
  // Left Ear
  fill(255,206,120);
  ellipse(-110,-10,40,60);
 
  // Bottom Hat Section
  fill(104,69,0);
  rect(-100,-160,200,70,55);
  
  // Top Hat Section
  fill(105,69,0);
  rect(-75,-200,150,100,90);
  
  // Teeth
  fill(255,255,255);
  translate(-20,82);
  rect(3,3,5,5,1,6,50,18);
  
  // Right Earring
  fill(255,154,23);
  ellipse(130,-70,15,15);
  
  // Left Earring
  fill(255,154,23);
  ellipse(-90,-70,15,15);
  
  //Cheeks
  translate(-60,-55);
  fill(255,223,216);
  ellipse(140,0,40,40);
  
  translate(-120,0);
  fill(255,223,216);
  ellipse(140,0,40,40);


