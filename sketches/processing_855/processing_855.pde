
// Learning Processing
// Simon Costello

// Set the size of the window
size(200,200);
// Set the colour of the background
background(255);
// Anti-alias the shapes
smooth();

// Left foot of dog
stroke(0);
strokeWeight(3);
fill(255);
ellipse(85,120,10,10);

// Right foot of dog
stroke(0);
strokeWeight(3);
fill(255);
ellipse(115,120,10,10);

// Body of dog
stroke(0);
strokeWeight(3);
fill(200);
rectMode(CENTER);
rect(100,100,60,40);

// Head of dog
stroke(0);
strokeWeight(3);
fill(200);
rectMode(CORNER);
rect(50,60,30,30);

// Nose of dog
stroke(0);
strokeWeight(3);
fill(0);
rectMode(CORNER);
rect(50,60,5,5);

// Ear of dog
stroke(0);
strokeWeight(3);
fill(255);
ellipse(80,60,10,20);

// Tail of dog
line(130,80,140,70);

// Eye of dog
noStroke(); 
fill(255,0,0);
rectMode(CORNER);
rect(65,65,5,5);

println("doctor, doctor");






