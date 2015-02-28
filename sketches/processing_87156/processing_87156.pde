
void setup() {
  size(480, 480);
  noStroke();
  ellipseMode(RADIUS);
  background(191,40,6);
  smooth();
  
   for (int y = 0; y <= height; y += 10) {
    for (int x = -width; x <= width; x += 10) {
        noStroke();
        fill(63, 64, 54);
        ellipse((x*2)+(y*2), y, 20 - y/10.0, 20 - y/10.0);
    }
  }
  
noStroke();
  fill(84,191,172, 15);
  for (int i = 50; i < 380; i += 10) {
    ellipse(i-50, 205, i/2, i/2);
  }
  noStroke();
  fill(242,229,48, 15);
  for (int i = 50; i < 380; i += 10) {
    ellipse(i-50, 210, i/2, i/2);
  }
  noStroke();
  fill(191,40,6, 15);
  for (int i = 50; i < width; i += 10) {
    ellipse(i-50, 215, i/2, i/2);
  }
 
    for (int y = 0; y <= height; y += 10) {
    for (int x = -width; x <= width; x += 15) {
        noStroke();
        fill(63, 64, 54, 50);
        ellipse((x*2)+(y*2), y, 20 - y/10.0, 20 - y/10.0);
    }
  }
  
  // Neck
  fill(141,166,129);
  quad(139, 90, 190, 180, 163, 230, 128, 130);

  // Head
  fill(141,166,129);
  ellipse(117, 112, 25, 21); // Snout
  ellipse(122, 108, 25, 25); // Face
  fill(206, 242, 188);
  ellipse(113, 105, 8, 8);
  fill(140,29,4);
  ellipse(110, 107, 5, 5); // Droop
  fill(242, 255, 194);
  ellipse(110, 105, 5, 5); // Eye
  fill(0, 0, 0);
  ellipse(107, 105, 2, 2); // Pupil
  fill(191,40,6);
  arc(100, 125, 8, 8, radians(320), radians(359));
  fill(93,94,80);
  arc(111, 103, 5 , 5, radians(225), radians(405)); 
  
  // Legs
  fill(93,94,80);
  rect(190, 250, 40, 80);
  rect(270, 250, 40, 80);
  fill(210,180,140);
  arc(194, 330,  10, 10, radians(180), radians(300));
  arc(275, 330,  10, 10, radians(180), radians(300));
  fill(141,166,129);
  rect(200, 250, 40, 80);
  rect(280, 250, 40, 80);
  fill(242, 255, 194);
  arc(205, 330,  10, 10, radians(180), radians(300));
  arc(216, 330,  8, 8, radians(180), radians(300));
  arc(286, 330,  10, 10, radians(180), radians(300));
  arc(297, 330,  8, 8, radians(180), radians(300));
  
  
  // Body
  fill(141,166,129);
  ellipse(210, 220, 50, 40); // Body
  ellipse(238, 220, 65, 65); // Shoulder
  ellipse(260, 220, 80, 75); // Stomach
  
  // Tail
  fill(141,166,129);
  quad(311, 270, 337, 210, 399, 300, 364, 315);
  ellipse(382, 312, 20, 24);
  quad(400, 300, 390, 335, 350, 345, 300, 355);
  quad(311, 270, 337, 210, 399, 300, 364, 315);
  
  // Party Hat
  fill(228,97,158);
  arc(98, 59, 35, 35, radians(45), radians(75));
  fill(217, 43, 58);
  ellipse(99, 60, 5, 5);
  stroke(1);
  noFill();
  arc(98, 114,  30, 31, radians(305), radians(397));
  
  // Skin
  noStroke();
  fill(206, 242, 188);
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
  fill(141,166,129);
  stroke(93,94,80);
  strokeWeight(2);
  arc(259, 217,  40, 20, radians(0), radians(180)); // Bottom lid
  stroke(140,29,4);
  fill(242, 255, 194);
  ellipse(259, 210, 35, 20); // Cornea
  fill(63, 64, 54);
  noStroke();
  ellipse(259, 210, 20, 20); // Iris
  fill(0,0,0);
  ellipse(259, 210, 10, 10); // Pupil
  fill(255, 255, 255);
  ellipse(247, 215, 4, 4); // Shine
  stroke(93,94,80);
  fill(141,166,129); // Top lid
  arc(259, 210,  40, 20, radians(180), radians(360)); // Top lid
  
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


