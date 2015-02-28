
size(500, 500);
background(255);

/*head*/
stroke(0);
strokeWeight(20);
arc(250, 250, 443, 443, 0, PI+QUARTER_PI, OPEN);


/*left eye*/
strokeWeight(10);
noFill();
ellipse(146, 198, 50, 50);

/*left eye ball*/
fill(0);
ellipse(146, 198, 20, 20);


/*right eye*/
strokeWeight(10);
noFill();
ellipse(330, 198, 100, 100);

/*right eye ball*/
fill(0);
ellipse(330, 198, 50, 50);


/*nose*/
stroke(0);
line(246,331, 278,281);
line(278,281, 333,353);
line(246,331, 333,353);

/*left*/
strokeWeight(20);
line(63,165, 96,164);
line(63,165, 64,242);

/*right*/
strokeWeight(20);
line(426,177, 483, 240);
line(483, 240, 427, 249);










