
//create float variables for x,y, and diameter
float x = 50;
float y = 50;
float diameter = 50;

//Draw an ellipse using the variables.
fill(222,16,195);
ellipse(x,y,diameter, diameter);

//Add 100 to each variable and assign “=" back to the variables.
x = x + 100;
y = y + 100;
diameter = diameter + 100;

//Draw another ellipse using the variables to see how it changed
fill(8,10,126);
ellipse(x,y,diameter, diameter);

//Divide each variable by 2 and assign back
x = x / 2;
y = y / 2;
diameter = diameter / 2;

//Draw the ellipse again with the changed variables
fill(178,255,100);
ellipse(x,y,diameter, diameter);

//In the same file, create three different colored shapes that scale 
//proportionately with different window sizes (hint: use divisions of 
//width and height). 
fill(183,17,31);
rect(width / 2 , height / 2, diameter , diameter );
fill(52,183,17);
rect(width / 2 + 5, height / 2 + 5, diameter - 10, diameter -10);
fill(255,120,15);
rect(width / 2 + 10, height / 2 + 10, diameter - 20, diameter - 20);

//Use multiplication to create five lines with increasing space between each
int x1 = 150;
int x2 = 15;
int y1 = 200;
int y2 = 15;

line(x1,x2,y1,y2);

x2 = x2 * 2;
y2 = y2 * 2;
line(x1,x2,y1,y2);

x2 = x2 * 2;
y2 = y2 * 2;
line(x1,x2,y1,y2);

x2 = x2 * 2;
y2 = y2 * 2;
line(x1,x2,y1,y2);

x2 = x2 * 2;
y2 = y2 * 2;
line(x1,x2,y1,y2);


