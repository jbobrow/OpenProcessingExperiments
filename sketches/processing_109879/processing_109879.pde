
//part 1
size (300, 300);
background(#60B1D8);

//part 2 orange
float diameter = 50;

float x = 50;

float y = 40;

float dline = 15;


fill(#F7B550);
stroke(0);
ellipse(x, y, diameter, y);

x = x + 100;
y = y + 100;
diameter = diameter +100;


fill(#F7B550);
stroke(0);
ellipse(x, y, diameter, y);

//part 3 red, white, green,
rectMode(CENTER);
fill(#F0140C);
stroke(0);
ellipse(width/ 3, height/ 3, width / 3, height / 3);
fill(#17E809);
stroke(0);
triangle(width / 3, height / 3, width/ 1.5, height / 4.5, width / 4.5, height / 1.5);
fill(#FFFDFC);
stroke(0);
rect(width/ 1.6, height / 2.8, width / 5, height /5);

// part 4 purple
strokeWeight(3);
stroke(#8A09E8);
line(dline, 180, dline, 290);
dline = dline * 2;
line(dline, 180 +20, dline, 290);
dline = dline * 2;
line(dline, 180 + 40, dline, 290);
dline = dline * 2;
line(dline, 180 + 60, dline, 290);
dline = dline * 2;
line(dline, 180 + 80, dline, 290);


