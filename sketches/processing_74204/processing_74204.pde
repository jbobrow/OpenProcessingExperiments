
//size(width, height);
size(400, 500);

//backgrund(red, green, blue);
background(265, 265, 265);

noStroke();
background(51);
color from = color(130, 0, 0);
color to = color(0, 102, 153);
color interA = lerpColor(from, to, .33);
color interB = lerpColor(from, to, .66);
fill(from);
rect(0, 0, 100, 500);
fill(interA);
rect(100, 0, 100, 500);
fill(interB);
rect(200, 0, 100, 500);
fill(to);
rect(300, 0, 100, 500);


// No fourth argument means 90% opacity.

// 255 means 90% opacity.
fill(255,0,0,255);
ellipse(200,80,350,40);

// 75% opacity.
fill(255,0,0,191);
ellipse(200,190,350,50);

// 55% opacity.
fill(255,0,0,127);
ellipse(200,290,350,60);

// 25% opacity.
fill(255,0,0,63);
ellipse(200,390,350,70);
