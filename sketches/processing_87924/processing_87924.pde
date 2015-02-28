
color[] peach = {#FFDED3, #B28070, #FFCABA, #5EB29D, #BAFFED};

size(500, 500);
smooth();
background(peach[0]);

float x = (random(250, 500));
float y = (random(250, 500));
float a = (random(250, 500));
float b = (random(250, 500));
float d = (random(50, 275));
float r = (random(50, 275));

noStroke();
fill(peach[int(random(1, 5))], random(200, 255));
ellipse(random(a), random(b), r, r);

fill(peach[int(random(1, 5))], random(200, 255));
ellipse(random(x), random(y), r, r);

fill(peach[int(random(1, 5))], random(200, 255));
ellipse(random(a), random(b), d, d);

fill(peach[int(random(1, 5))], random(200, 255));
ellipse(random(x), random(y), d, d);

fill(peach[int(random(1, 5))], random(200, 255));
ellipse(random(x), random(y), d, d);

noFill();
strokeWeight(random(5, 20));
stroke(peach[int(random(1, 5))], random(200, 255));
ellipse(random(a), random(b), d, d);

strokeWeight(random(5, 20));
stroke(peach[int(random(1, 5))], random(200, 255));
ellipse(random(x), random(y), d, d);

strokeWeight(random(5, 20));
stroke(peach[int(random(1, 5))], random(200, 255));
ellipse(random(a), random(b), r, r);

strokeWeight(random(5, 20));
stroke(peach[int(random(1, 5))], random(200, 255));
ellipse(random(x), random(y), r, r);

strokeWeight(random(5, 20));
stroke(peach[int(random(1, 5))], random(200, 255));
ellipse(random(x), random(y), r, r);
