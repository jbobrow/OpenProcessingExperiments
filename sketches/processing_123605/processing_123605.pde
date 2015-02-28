
size(1000, 300);
background(0);



int d = 150;

stroke(255);
arc(200, height/2, d, d, PI*-.5, PI*1.4);
arc(400, height/2, d, d, PI*-.5, HALF_PI * 0.1);
arc(600, height/2, d, d, PI*-.5, HALF_PI * 1.1);
arc(800, height/2, d, d, PI*-.5, HALF_PI * -0.3);

stroke(#0039D1);
strokeWeight(3);
noFill();
ellipse(200, height/2, d, d);
ellipse(400, height/2, d, d);
ellipse(600, height/2, d, d);
ellipse(800, height/2, d, d);

stroke(#7C9FFF);
strokeWeight(12);
strokeCap(SQUARE);
arc(200, height/2, d, d, PI*-.5, PI*1.3);
arc(400, height/2, d, d, PI*-.5, HALF_PI *-0.3);
arc(600, height/2, d, d, PI*-.5, HALF_PI * 0.8);
arc(800, height/2, d, d, PI*-.5, HALF_PI * 0.4);





