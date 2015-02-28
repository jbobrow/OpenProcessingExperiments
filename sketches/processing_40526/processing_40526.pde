
size(300, 300);
smooth();

background(255);

// shadow
noStroke();
fill(230);
ellipse(150, 280, 170, 30);

// face shape
strokeWeight(1);
stroke(149, 93, 50);
fill(232, 122, 227);
ellipse(width/2, height/2, 200, 210);

// eyes
fill(255);
ellipse(150, 60, 30, 30);
ellipse(235, 150, 30, 30);

fill(232, 122, 227);
ellipse(150, 50, 5, 5);
ellipse(235, 145, 5, 5);

// mouth
fill(155, 62, 150);
ellipse(120, 180, 60, 80);

noStroke();
fill(133, 50, 130);
ellipse(122, 200, 30, 30);

// nose
fill(255);
ellipse(160, 100, 3, 3);
ellipse(170, 110, 3, 3);
