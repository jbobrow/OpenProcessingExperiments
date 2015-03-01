
size(800, 900);
smooth();
background(0, 120, 0);

beginShape(); // Leonardo
fill(0,200,0); // green
noStroke();
ellipse(175, 270, 300, 200);  // cheeks
arc(175, 300, 275, 400, PI, TWO_PI); // top of head
arc(175, 300, 200, 155, 0, PI); // jaw

// right mouth
fill(255,255,255); //white
stroke(0,0,0);
arc(225, 280, 80,40, radians(-50), radians(180));

fill(0,200,0); // green
stroke(0,0,0);
arc(175, 265, 150, 75, 0, PI); // nose

// mask
fill(0,0,200); // blue
stroke(0,0,0);
quad(75,155, 275, 160, 310, 220, 50, 210);

// eyes
fill(255,255,255);
stroke(0,0,0);
ellipse(120, 185, 60, 42); // left eye
ellipse(225, 190, 60, 42); // right eye

// top of nose
fill(0,200,0); // green
stroke(0,0,0);
arc(165, 225, 125, 35, PI,TWO_PI );


endShape();

beginShape(); // Raphael
fill(0,200,0); // green
noStroke();
ellipse(575, 270, 300, 200);  // cheeks
arc(575, 300, 275, 400, PI, TWO_PI); // top of head
arc(575, 300, 200, 155, 0, PI); // jaw

// right mouth
fill(255,255,255); //white
stroke(0,0,0);
arc(625, 280, 80,40, radians(-50), radians(180));

fill(0,200,0); // green
stroke(0,0,0);
arc(575, 265, 150, 75, 0, PI); // nose

// mask
fill(230,0,0); // red
stroke(0,0,0);
quad(475,155, 675, 160, 710, 220, 450, 210);

// eyes
fill(255,255,255);
stroke(0,0,0);
ellipse(520, 185, 60, 42); // left eye
ellipse(625, 190, 60, 42); // right eye

// top of nose
fill(0,200,0); // green
stroke(0,0,0);
arc(565, 225, 125, 35, PI,TWO_PI );


endShape();

beginShape(); // Donatello
fill(0,200,0); // green
noStroke();
ellipse(175, 670, 300, 200);  // cheeks
arc(175, 700, 275, 400, PI, TWO_PI); // top of head
arc(175, 700, 200, 155, 0, PI); // jaw

// right mouth
fill(255,255,255); //white
stroke(0,0,0);
arc(225, 680, 80,40, radians(-50), radians(180));

fill(0,200,0); // green
stroke(0,0,0);
arc(175, 665, 150, 75, 0, PI); // nose

// mask
fill(127,0,255); // purple
stroke(0,0,0);
quad(75,555, 275, 560, 310, 620, 50, 610);

// eyes
fill(255,255,255);
stroke(0,0,0);
ellipse(120, 585, 60, 42); // left eye
ellipse(225, 590, 60, 42); // right eye

// top of nose
fill(0,200,0); // green
stroke(0,0,0);
arc(165, 625, 125, 35, PI,TWO_PI );


endShape();



beginShape(); // Michaelangelo
fill(0,200,0); // green
noStroke();
ellipse(575, 670, 300, 200);  // cheeks
arc(575, 700, 275, 400, PI, TWO_PI); // top of head
arc(575, 700, 200, 155, 0, PI); // jaw

// right mouth
fill(255,255,255); //white
stroke(0,0,0);
arc(625, 680, 80,40, radians(-50), radians(180));

fill(0,200,0); // green
stroke(0,0,0);
arc(575, 665, 150, 75, 0, PI); // nose

// mask
fill(255,151, 50); // orange
stroke(0,0,0);
quad(475,555, 675, 560, 710, 620, 450, 610);

// eyes
fill(255,255,255);
stroke(0,0,0);
ellipse(520, 585, 60, 42); // left eye
ellipse(625, 590, 60, 42); // right eye

// top of nose
fill(0,200,0); // green
stroke(0,0,0);
arc(565, 625, 125, 35, PI,TWO_PI );


endShape();




