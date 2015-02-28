


size(800, 800);
noStroke();
smooth();
background(255);

color from = color(225, 155, 0);
color to = color(225, 110, 0);
color x = lerpColor(from, to, .33);
color y = lerpColor(from, to, .66);
fill(from);
ellipse(400, 400, 100, 100);
fill(x);
ellipse(300, 300, 100, 100);
fill(y);
ellipse(200, 200, 100, 100);
fill(to);
ellipse(100, 100, 100, 100);
ellipse(700, 700, 100, 100);
fill(x);
ellipse(600, 600, 100, 100);
fill(y);
ellipse(500, 500, 100, 100);



