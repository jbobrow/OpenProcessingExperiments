
// Background
size(600,600);
background(255,255,255);
fill(0,150,255);

// Head
stroke(0,255,255);
strokeWeight(5);
ellipse(300,150,100,100);

// Shine for the Bubble
stroke(255,255,255);
strokeWeight(5);
noFill();
arc(295, 150, 70, 70, PI, PI+QUARTER_PI);

// Ear Connection Left
stroke(0,255,255);
strokeWeight(5);
arc(295, 120, 70, 70, PI, PI+QUARTER_PI);

// Ear Connection Right
arc(330, 85, 50, 50, 0, HALF_PI);

//Body
fill(0,150,255);
rect(270, 200, 70, 100);

//Right Leg
rect(278, 300, 20, 90, 7);

//Left Leg
rect(313, 300, 20, 90, 7);

//Ear Left
triangle(245, 100, 260, 70, 280, 90);

//Ear Right
triangle(335, 80, 350, 60, 370, 90);

//Arm Left
ellipse(260, 250, 20, 90);

//Arm Right
ellipse(350, 250, 20, 90);

//Eyes
stroke(255,255,255);
strokeWeight(5);
fill(121,131,144);
ellipse(320, 150, 15, 15);
ellipse(285, 150, 15, 15);

//Mouth
fill(255,255,255);
rect(292, 170, 20, 10, 7);

//mount lines
stroke(0,0,0);
strokeWeight(2);
line(295,169,295,181);
line(302,169,302,181);
line(309,169,309,181);
line(290,175,313,175);


