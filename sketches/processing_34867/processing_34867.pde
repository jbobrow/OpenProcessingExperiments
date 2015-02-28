
size(200,200);
background(5,232,226);
smooth();

//The Rectangle
rectMode(CORNER);
fill(255,188,0);
rect(25,100,100,75);

//The Circle
noStroke();
fill(255,247,0);
ellipseMode(CENTER);
ellipse(165,100,50,50);

//Middle Line
stroke(0);
strokeWeight(4);
line(165,25,165,175);

//Left Line
strokeWeight(6);
line(150,25,150,175);

//Right Line
strokeWeight(2);
line(180,25,180,175);

//The Triangle
strokeWeight(2);
stroke(225,34,0);
fill(255,255,255);
triangle(75,25,25,80,125,80);




