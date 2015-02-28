
/*
// Changes Window Size
size(250,250);

// Doesn't create a line break after text.
print("this text");

// Creates a line break after text.
println("this only prints this text");

// Draws an ellipses
ellipse(50,50,25,25);

// Background color
background(255);

// Declares a new variable
int x;

// Defines variable;
x = 100;

// Using a defined variable
ellipse(50,x,25,25);

*/

/*
int y;
int x;
int i;
y = 0;
while(y<10){
y = y+1;
float r = random(5);
x = x + r;
i = i+random(5);
ellipse (a,b,25,25);
}
*/

/*
int r = random(5);
int x;
x = 100;
x = x+r;
println(r);
*/

size(275,150);
background(255,255,0);
// Letter Spaces
int x;
x = 75;
int y;
y = 0;
while(y<5){
  y = y+1;
  line(x,125,x+25,125);
  x = x+35;
}

// Wood
line(0,100,50,100);
line(10,100,10,10);
line(10,75,35,100);
line(10,10,75,10);
line(75,10,75,25);

// Man
ellipse(75,37.5,25,25);
line(75,50,75,85);
line(75,62.5,85,55);
line(75,62.5,65,55);
line(75,85,85,92.5);
line(75,85,65,92.5);

