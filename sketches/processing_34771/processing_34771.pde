
size(200,200);
colorMode(RGB,255);
background(62,252,235);
smooth();

//creating the rectangle
stroke(0);
strokeWeight(1);
fill(254,195,66);
rect(25,(height/2),100,75);

//creating the triangle
stroke(254,66,64);
strokeWeight(2);
fill(255);
triangle(25,(height/2)-20, 125,(height/2)-20,75,25);

//creating the circle
/*the use of variables in the drawing 
reduces the manual input of numbers for the circle,
and the thus the lines react and stay in the correct position on the circle*/
int CIRCLECENTER;
int x;
x = 165;
CIRCLECENTER = x;

noStroke();
fill(250,250,70);
ellipseMode(RADIUS);
ellipse(x,height/2,25,25);

//creating the lines
stroke(0);
strokeWeight(6);
line(x - 15,25,x - 15,(height/2)+75);

strokeWeight(4);
line(x,25,x,(height/2)+75);

strokeWeight(2);
line(x + 15,25,x + 15,(height/2)+75);


