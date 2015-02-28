
size(200, 200);

background(255);

//draw creature's body
smooth();
strokeWeight(3);
stroke(50, 190, 40);
fill(70, 250, 55);
rect(25, 50, 150, 100);

//draw mouth
rect(25, 125, 150, 30);

//draw teeth
fill(255);
triangle(40, 125, 60, 125, 50, 145); 
triangle(140, 125, 160, 125, 150, 145); 

//drwaw eyes
fill(255);
ellipse(80, 95, 40, 40);
ellipse(130, 90, 50, 50);

//draw eyeballs
noStroke();
fill(0);
ellipse(84, 101, 25, 25);
ellipse(130, 85, 30, 30);

//draw legs
strokeWeight(5);
stroke(50, 190, 40);
//left leg
line(60, 156, 60, 180);
line(60, 180, 40, 180);

//right leg
line(140, 156, 140, 180);
line(140, 180, 160, 180);

//creature comment
println("Hello World!");


