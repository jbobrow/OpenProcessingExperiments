
size(500, 500);
background(255);

//Hat
fill(0);
triangle(0, 0, 180, 0, 0, 160);

//Eyes
//leftlight
fill(255, 255, 255);
ellipse(120, 165, 26, 24);

//leftdark
fill(0, 0, 0);
ellipse(135, 165, 24, 24);

//rightlight
fill(255, 255, 255);
ellipse(215, 165, 26, 24);
//rightdark
fill(0, 0, 0);
ellipse(230, 165, 24, 24);


//nose
strokeWeight(2);
line(180, 190, 190, 270);

//mouth
strokeWeight(1);
ellipse(165, 295, 28, 8);


