
/*
Jenny Hsu
Week 01
 
Creative Computing Section B
Benjamin Bacon
6 February
*/

size(700, 480);
background(255, 255, 255);
smooth();
strokeWeight(2);

stroke(0, 0, 0, 0);
strokeWeight(5);
fill(80, 80, 80, 30);
ellipse(350, 230, 200, 200);

stroke(0, 0, 0, 10);
strokeWeight(0);
fill(120, 30, 40, 90);
arc(350, 230, 80, 80, 0, HALF_PI);
fill(120, 30, 40, 40);
arc(350, 230, 200, 200, 0, QUARTER_PI-HALF_PI);
fill(255, 255, 255, 255);
arc(350, 230, 200, 200, HALF_PI, QUARTER_PI+HALF_PI);
fill(255, 255, 255);
arc(350, 230, 200, 200, radians(0), QUARTER_PI);

fill(120, 30, 40);
arc(350, 230, 200, 200, PI-QUARTER_PI, QUARTER_PI+HALF_PI+HALF_PI);
//fill(120, 30, 40, 40);
//arc(350, 230, 200, 200, 0, HALF_PI);

stroke(255, 255, 255);
fill(80, 80, 80);
ellipse(350, 230, 50, 50);

//arc(350, 200, 300, 70, 0, HALF_PI+HALF_PI);

stroke(0, 0, 0, 30);
strokeWeight(5);
noFill();
ellipse(350, 230, 200, 200);

// Stem
strokeWeight(2);
stroke (20, 20, 20, 30);
line(350, 330, 350, 480);



