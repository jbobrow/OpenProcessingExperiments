
size(500, 500);
background(255);

//Hat
fill(0);
triangle(0, 0, 190, 0, 0, 170);

//Eyes

//leftlight
fill(255,255,255);
ellipse(120, 165, 35, 33);
//leftdark
fill(0,0,0);
ellipse(135, 165, 35, 35);

//rightlight
fill(255,255,255);
ellipse(215, 165, 35, 33);
//rightdark
fill(0,0,0);
ellipse(230, 165, 35, 35);

//nose
strokeWeight(2);
line(180, 190, 190, 240);
line(190, 240, 210, 270);
line(210, 270, 200, 300);


//mouth
strokeWeight(2);
ellipse(160, 340, 68, 44);


