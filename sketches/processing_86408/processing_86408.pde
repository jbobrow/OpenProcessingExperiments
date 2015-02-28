
// © Julia Shen 
// yuans @ andrew.cmu.edu

size(400, 400 );
background(218, 233, 231);
smooth();

// big triangle
noStroke();
fill(251, 206, 207);
triangle(200, 340, 75, 137, 325, 137);

// circles
noFill();
strokeWeight(1);
stroke(255);
ellipse(200, 200, 250, 250);
ellipse(200, 200, 240, 240);
ellipse(200, 200, 230, 230);

// small triangle
noStroke();
fill(251, 206, 207);
triangle(200, 75, 175, 117, 225, 117);

// j
noFill();
strokeWeight(3);
stroke(255);
line(180, 175, 180, 220);
arc(170, 220, 20, 20, 0, PI); 

// s
noFill();
strokeWeight(3);
stroke(255);
arc(220, 185, 20, 20, PI, PI+HALF_PI+QUARTER_PI);
line(210, 186, 230, 219);
arc(220, 220, 20, 20, 0, PI);

//saveFrame("hw1.jpg");






