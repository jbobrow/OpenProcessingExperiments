
// My MONSTER
size (500, 500);
background(0);
noStroke();

//Body
ellipse(width/2, width/2, 100, 100);
ellipse(width/2, width/2 - 60, 50, 50);
fill(0);
noStroke();

//Stripes
fill(0);
rect(width/2 -50, width/2, 110, 5); 
rect(width/2 -50, width/2 + 20, 110, 5); 
rect(width/2 -50, width/2 + 10, 110, 5); 
stroke(255);
strokeWeight(3);

//legs
line(width/2 - 20, width/2 - 20, width/2 - 100, width/2 - 100);
line(width/2 - 100, width/2 - 100, width/2 - 100, width/2); 

line(width/2 + 20, width/2 - 20, width/2 + 100, width/2 - 100);
line(width/2 + 100, width/2 - 100, width/2 + 100, width/2);

//EYES
fill(0);
strokeWeight(2);
ellipse(width/2 - 20, width/2 - 70, 30, 30);
ellipse(width/2 + 20, width/2 - 70, 30, 30);
fill(255);
noStroke();
ellipse(width/2 - 15, width/2 - 72, 10, 10);
ellipse(width/2 + 15, width/2 - 72, 10, 10);
