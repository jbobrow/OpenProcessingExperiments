
/* Joseph Kotay. Computational Methods. Professor Nick Senske.
Homework 2.1.1. Variables.  Birthday Variable with Parametric Shapes.
My birthday is April, 23*/

size(300,300);
smooth();

int my_birthday = 23;
my_birthday *= 3;  //Sets the radius of circle to 3 times my birthdate.

fill(255,0,0);
ellipse(width/2,height/2, my_birthday, my_birthday);

int x_radius = width/2 +100;
int y_radius = height/2 ;
    
fill(255,255,0);
ellipse(x_radius, y_radius, 60, 60);

//my_birthday = 23;
my_birthday *= 1;
rectMode(CENTER);
fill(0,255,0);
rect(width/my_birthday, y_radius, 80, 80);

my_birthday = 23;
my_birthday *= 3;
int y1= height/2 - my_birthday;
int y2= height/2 + my_birthday;
stroke(255,125,0);
strokeWeight(2);
line(2*width/3, y1, 2*width/3, y2); 
//println(y1);
//println(y2);

my_birthday = 23;
my_birthday *= 2;  // I use 4/2 since there isn't a center mode for triangles.
int x_center = width/3;
int y_center = height/2;

stroke(1);
strokeWeight(1);
fill(0,125,255);
triangle(x_center, y_center - my_birthday, x_center- my_birthday, y_center + my_birthday, x_center + my_birthday, y_center + my_birthday); 

/* My variables and math should correlate exactly with the directions given.  I ran
several tests.  I'm sure that there are many ways to write these same parameters, maybe with 
even more clarity.*/




