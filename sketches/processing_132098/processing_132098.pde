
size(800, 500);
background(150, 85, 200);

//outer A
strokeWeight(15);
stroke(255);
line(100, 450, 185, 50);
line(185, 50, 250, 450);
line(135, 300, 225, 300);

//inner A
strokeWeight(9);
stroke(150, 85, 200);
line(100, 450, 185, 50);
line(185, 50, 250, 450);
line(135, 300, 225, 300);

//added flavor A
strokeWeight(3);
stroke(150, 0, 0);
line(100, 450, 185, 50);
line(185, 50, 250, 450);
line(135, 300, 225, 300);

//outer J
strokeWeight(15);
stroke(255);
line(475, 390, 475, 50);
fill(150, 85, 200); //fill to BG color
arc(393, 390, 165, 150, 0, PI);

//inner J
strokeWeight(8);
stroke(150, 85, 200);
line(475, 390, 475, 50);
noFill(); //allows outer arc stroke to show up
arc(393, 390, 165, 150, 0, PI);

//added flavor J
strokeWeight(3);
stroke(150, 0, 0);
line(475, 390, 475, 50);
noFill(); //allows outer arc stroke to show up
arc(393, 390, 165, 150, 0, PI);

//outer B
strokeWeight(15);
stroke(255);
line(575, 450, 575, 50);
arc(575, 150, 300, 199, PI+HALF_PI, TWO_PI+HALF_PI);
arc(575, 355, 300, 199, PI+HALF_PI, TWO_PI+HALF_PI);

//inner B
strokeWeight(8);
stroke(150, 85, 200);
line(575, 450, 575, 50);
noFill();
arc(575, 150, 300, 199, PI+HALF_PI, TWO_PI+HALF_PI);
arc(575, 355, 300, 199, PI+HALF_PI, TWO_PI+HALF_PI);

//added flavor B
strokeWeight(3);
stroke(150, 0, 0);
line(575, 450, 575, 50);
noFill();
arc(575, 150, 300, 199, PI+HALF_PI, TWO_PI+HALF_PI);
arc(575, 355, 300, 199, PI+HALF_PI, TWO_PI+HALF_PI);


