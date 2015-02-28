
/**
Yingying Yang
Creative Computing Section B
Wk 2 Assignment #4 - Adding Variance
*/

size(600, 600);
smooth();
background(147,147,147);

// Declare variables here

int x = int(random(0,255));
int y = int(random(0,x));
int z = int(random(y,255));

// Draw code below here

noStroke();

fill(x,y,z);
ellipse(100,100,150,150);

fill(x,z,y);
ellipse(100,300,150,150);

fill(y,x,z);
ellipse(100,500,150,150);

fill(y,z,x);
ellipse(300,100,150,150);

fill(z,x,y);
ellipse(300,300,150,150);

fill(z,y,x);
ellipse(300,500,150,150);

fill(x,x,y);
ellipse(500,100,150,150);

fill(y,y,x);
ellipse(500,300,150,150);

fill(z,z,y);
ellipse(500,500,150,150);



