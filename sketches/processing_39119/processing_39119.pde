
size(200,200);
smooth();
background(255);

rectMode(CENTER);
ellipseMode(CENTER);

stroke(0);
fill(255);
rect(50,50,25,35); //Body

fill(255);
ellipse(50,25,25,25); //Head

fill(0);
ellipse(45,20,5,5); //Left eye
ellipse(55,20,5,5); //Right eye
ellipse(35,50,4,4); //Left arm
ellipse(65,50,4,4); //Right arm
ellipse(45,75,4,4); //Left foot
ellipse(55,75,4,4); //Right foot

line(45,28,55,28); //Mouth
line(65,48,72,28); //Balloon string

//balloon
stroke(0);
fill(255);
ellipse(77,20,30,30);


