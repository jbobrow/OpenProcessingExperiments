
size (200,200);
background (255);
ellipseMode(CENTER);
rectMode(CENTER);
stroke(0);
fill(255,247,100);
//Draw the middle rectangle
rect(100,70,70,15);


fill(255,150,250);
//Draw the circular body
ellipse(100,110,65,65);

//Drawing the two large eyes
fill(0, 5, 150);
stroke(25,150,255);
strokeWeight(4);
ellipse(50,70,35,65);
ellipse(150, 70, 35,65);
//Drawing the small eyes and pupils
fill(255, 150, 255);
noStroke();
ellipse(50,90, 10,10);
ellipse(150,90, 10, 10);
stroke(255);
point(50,70);
point(150,70);

//Drawing the legs
stroke(0);
line(50,175,75,125);
line(125, 125, 150, 175);
//Drawing the feets
stroke(25,150,255);
strokeWeight(2);
fill(255,100,25);
rect(50,175, 30,5);
rect(150,175,30,5);
smooth();

//Drawing the braces for the body
stroke(100);
strokeWeight(4);
line (40,125, 160, 125);
strokeWeight(2);
line(95, 25,95,125);
line(105, 25, 105, 125);




