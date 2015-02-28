
//this is not a pipe 

size(500,350);

smooth();
background(185,137,118);

// bowl

fill(90,28,13);
rect(50,120,120,147); 

fill(170,129,118);
ellipse(110,120,130,25); //brim of bowl

fill(57,19,9);
ellipse(110,120,100,10); //inside of bowl




//pipe 

noFill();
line(210,210,350,120); //top line
line(290,250,350,180); //bottom line

line(350,120,450,120); 
line(350,180,450,180);


fill(90,28,13);
arc(160,150,350,300,0,PI/1.4); //bottom arc


fill(185,137,118);
arc(170,170,150,100,TWO_PI,TWO_PI); //top arc



