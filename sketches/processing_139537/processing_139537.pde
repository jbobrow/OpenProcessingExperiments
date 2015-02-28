

size(800, 800);
noStroke();
smooth();
background(255);

color from = color(225, 155, 0);
color to = color(225, 110, 0);
color x = lerpColor(from, to, .33);
color y = lerpColor(from, to, .66);
fill(from);
rect(400, 400, 100, 100);
fill(x);
rect(300, 300, 100, 100);
fill(y);
rect(200, 200, 100, 100);
fill(to);
rect(100, 100, 100, 100);
rect(700, 700, 100, 100);
fill(x);
rect(600, 600, 100, 100);
fill(y);
rect(500, 500, 100, 100);

rect(400, 300, 100, 100);
fill(x);
rect(300, 200, 100, 100);
fill(y);
rect(200, 100, 100, 100);
fill(to);
rect(100, 90, 100, 100);
rect(700, 80, 100, 100);
fill(x);
rect(600, 70, 100, 100);
fill(y);
rect(500, 60, 100, 100);

fill(to);
rect(90, 100, 100, 100);
rect(80, 700, 100, 100);
fill(x);
rect(70, 600, 100, 100);
fill(y);
rect(60, 500, 100, 100);



