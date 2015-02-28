
size(400,400);
smooth();
background(102);

// Circle

noStroke();
fill(0);
arc(200, 200, 400, 400, PI/2, PI);
arc(200, 200, 400,400, PI, TWO_PI-PI/2);
fill(255);
arc(200, 200, 400,400, TWO_PI-PI/2, TWO_PI);
arc(200, 200, 400,400, 0, PI/2);

// Ying

noStroke();
fill(255);
ellipse(200,100,200,200);

// Yang

noStroke();
fill(0);
ellipse(200,300,200,200);

// Inner Circles

noStroke();
fill(0);
ellipse(200,100,160,160);
fill(255);
ellipse(200,300,160,160);


