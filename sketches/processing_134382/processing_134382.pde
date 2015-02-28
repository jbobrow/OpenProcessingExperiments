
// Shape 1: Coordinates, Primitives
// Exercises

// option 1
// grey background, light stroke, white lines, black fill

size(400,300);
background(100);

strokeWeight(1);
stroke(255);
line(0,150,400,150);

smooth();
strokeWeight(1);
stroke(255);
fill(0,150);
ellipse(200,150,200,100);

/* option 2

black background, heavy stroke, white lines, white fill

background(0);

strokeWeight(5);
stroke(255);
line(0,150,400,150);

smooth();
strokeWeight(5);
fill(255,100);
ellipse(200,150,200,100);

*/

/* option 3

white background, medium/light stroke, grey lines, black fill

background(255);

strokeWeight(3);
stroke(100);
line(0,150,400,150);

smooth();
strokeWeight(1)
fill(0,200);
ellipse(200,150,200,100);

*/

noFill();
bezier(150,150,-25,40,425,40,250,150);
bezier(150,150,-25,260,425,260,250,150);
bezier(150,150,25,25,375,25,250,150);
bezier(150,150,25,275,375,275,250,150);
bezier(150,150,75,10,325,10,250,150);
bezier(150,150,75,290,325,290,250,150);
bezier(150,150,125,-5,275,-5,250,150);
bezier(150,150,125,305,275,305,250,150);


