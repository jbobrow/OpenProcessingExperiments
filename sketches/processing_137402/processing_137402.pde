
size(600,600);
/*//1. Use one variable to set the position and size for three ellipses.
int a = 20;
ellipse( a, a, a,a);
ellipse(a*a,a,a,a);
ellipse(a+20,a*a, a,a);
ellipse(a+(a*a),a*a+a,a,a);
//2. Use multiplication to create a series of lines with increasing space between each.
/*int a= 40;

line(10,a,width,a);
a=a+20;
line(0,a,width,a);
a=a=40;
line(0,a,width,a);
a=a+80;
line(0,a,width,a);
a=a+160;
line(0,a,width,a);*/

//3. Explore the functions for constraining numbers. Use min() and max() to draw a 

//regular pattern of lines from a sequence of irregular numbers.

int x = min (3,21);
int y = min (2,28);
int a = max (3,18,21);
int b = max (2,26,28);

line(x,y,a,b);
line(x+200,y+200,a+200,b+200);
line(x+400,y+400,a+400,b+400);
noFill();
rect(x,y,a,b);
rect(x+200,y+200,a+200,b+200);
rect(x+400,y+400,a+400,b+400);



