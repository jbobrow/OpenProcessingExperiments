
size(200, 200);

//noStroke();
ellipse(100, 120, 50, 80); // torso


strokeWeight(20);
line(100, 90, 100, 150); // body stripe

strokeWeight(0);
ellipse(100, 110, 5, 15); // body dot


fill(150);
ellipse (110, 160, 20, 20); // feet
ellipse(90, 160, 20, 20);
fill(255);
ellipse(85, 165, 10, 10);
ellipse(115, 165, 10, 10);

strokeWeight(2);
line(75, 120, 70, 150); //arms
line(70, 150, 60, 160);
line(125, 120, 130, 150);
line(130, 150, 140, 160);

noFill();
arc(120, 50, 12, 50, HALF_PI, PI+HALF_PI);// eye stalks
arc(80, 50, 12, 50, PI+HALF_PI, TWO_PI+HALF_PI); 

fill(255);
ellipse(100, 80, 45, 55); // head

arc(100, 92, 40, 45, PI+QUARTER_PI, TWO_PI-QUARTER_PI); // mouth

ellipse(75, 30, 20, 20); // left eye
ellipse(77, 32, 5, 5);
ellipse(125, 30, 20, 20); // right eye
ellipse(123, 32, 5, 5);

noFill();
arc(75, 30, 30, 30, PI+QUARTER_PI, TWO_PI-QUARTER_PI);
arc(125, 30, 30, 30, PI+QUARTER_PI, TWO_PI-QUARTER_PI);
