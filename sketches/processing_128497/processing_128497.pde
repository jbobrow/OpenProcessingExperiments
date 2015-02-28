
// Copyright Shannon Impellicceiri 2014
// ICE #1
// 1/14/14

// Background
size(400,400);
background(100,150,255);

// Sun
noStroke();
fill(255,255,0);
ellipse(0,0,75,75);

// Clouds
fill(255);
ellipse(100,50,100,30);
ellipse(160,60,70,20);
ellipse(310,100,100,30);
ellipse(260,110,70,20);

// Ground
fill(50,200,50);
triangle(0,200,400,300,0,300);
triangle(400,300,400,200,100,300);
rect(0,300,400,100);

// Path
fill(205,175,149);
triangle(75,400,120,400,290,240);

// House
fill(255,0,0);
rect(190,215,100,60);

// Roof
fill(0);
triangle(180,215,300,215,240,175);

// Door
fill(100,100,100);
rect(240,240,20,35);

// Window
fill(255);
rect(205,240,15,15);

// Tree trunk
fill(100,75,75);
rect(75,190,10,50);

// Tree leaves
fill(0,100,0);
ellipse(80,190,60,30);


