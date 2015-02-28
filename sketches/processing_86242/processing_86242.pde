
void setup() {
  size(480, 480);
  noStroke();
  ellipseMode(RADIUS);
  background(127,255,212);
  smooth();
  
  // Neck
  fill(154,205,50);
  quad(139, 90, 190, 180, 163, 230, 128, 130);

  // Head
  fill(154,205,50);
  ellipse(117, 112, 25, 21); // Snout
  ellipse(122, 108, 25, 25); // Face
  fill(0, 255, 0);
  ellipse(113, 105, 8, 8);
  fill(240,128,128);
  ellipse(110, 107, 5, 5); // Droop
  fill(255, 255, 255);
  ellipse(110, 105, 5, 5); // Eye
  fill(0, 0, 0);
  ellipse(107, 105, 2, 2); // Pupil
  fill(102, 0, 51);
  arc(100, 125, 8, 8, radians(320), radians(359));
  fill(107,142,35);
  arc(111, 103, 5 , 5, radians(225), radians(405), CHORD); 
  
  // Legs
  noStroke();
  fill(107,142,35);
  rect(190, 250, 40, 80);
  rect(270, 250, 40, 80);
  fill(210,180,140);
  arc(194, 330,  10, 10, radians(180), radians(300));
  arc(275, 330,  10, 10, radians(180), radians(300));
  fill(154,205,50);
  rect(200, 250, 40, 80);
  rect(280, 250, 40, 80);
  fill(255, 255, 255);
  arc(205, 330,  10, 10, radians(180), radians(300));
  arc(216, 330,  8, 8, radians(180), radians(300));
  arc(286, 330,  10, 10, radians(180), radians(300));
  arc(297, 330,  8, 8, radians(180), radians(300));
  
  
  // Body
  fill(154,205,50);
  ellipse(210, 220, 50, 40); // Body
  ellipse(238, 220, 65, 65); // Shoulder
  ellipse(260, 220, 80, 75); // Stomach
  
  // Tail
  fill(154,205,50);
  quad(311, 270, 337, 210, 399, 300, 364, 315);
  ellipse(382, 312, 20, 24);
  quad(400, 300, 390, 335, 350, 345, 300, 355);
  quad(311, 270, 337, 210, 399, 300, 364, 315);
  
  // Party Hat
  
  fill(247, 105, 255);
  arc(98, 59, 35, 35, radians(45), radians(75));
  fill(217, 43, 58);
  ellipse(99, 60, 5, 5);
  stroke(1);
  noFill();
  arc(98, 114,  30, 31, radians(305), radians(397));
  
  // Skin
  noStroke();
  fill(0, 255, 0);
  ellipse(259, 170, 20, 20);
  ellipse(275, 182, 10, 10);
  ellipse(285, 169, 2, 2);
  ellipse(230, 177, 6, 6);
  ellipse(265, 210, 2, 2);
  ellipse(290, 240, 10, 10);
  ellipse(280, 260, 6, 6);
  ellipse(282, 250, 2, 2);
  ellipse(360, 300, 2, 2);
  fill(255, 255, 255);
  ellipse(259, 210, 35, 20);
  fill(154,205,50);
  stroke(107,142,35);
  strokeWeight(2);
  arc(259, 217,  40, 20, radians(0), radians(180)); // Bottom lid
  stroke(240,128,128);
  fill(255, 255, 255);
  ellipse(259, 210, 35, 20); // Cornea
  fill(0,128,0);
  noStroke();
  ellipse(259, 210, 20, 20); // Iris
  fill(0,0,0);
  ellipse(259, 210, 10, 10); // Pupil
  fill(255, 255, 255);
  ellipse(247, 215, 4, 4); // Shine
  stroke(107,142,35);
  fill(154,205,50); // Top lid
  arc(259, 210,  40, 20, radians(180), radians(360), CHORD); // Top lid
  
  // Tear
  noStroke();
  fill(255, 255, 255); 
  arc(261, 217,  8, 8, radians(45), radians(75));
  fill(0, 255, 255); 
  arc(230, 217,  20, 20, radians(70), radians(110));
  ellipse(230, 235, 7, 7);
  fill(255, 255, 255); 
  ellipse(227, 237, 2, 2);  
}


