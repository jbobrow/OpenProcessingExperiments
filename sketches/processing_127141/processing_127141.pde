
/**
RGB example with variables

This is a basic example to show how the RGB color system works.

The example produces a grid of small color boxes that demonstrate
how the RG and B componens interact. The first three rows show shades
of each color components. The next three rows demonstrate mixtures
of two colors. The final row shows five shades of gray.

In this example, I have replaced the hard coded positions and 
dimensions with variables, which gives me control over the
final presentation.

C. Andrews
2014-01-06
**/



int border = 10;
int cellSize = 20;
int x = border;
int y = border;




size(border + (cellSize+border)* 5,border + (cellSize+border)* 7);
background(255);



// five shades of red
fill(0,0,0);
rect(x,y,cellSize,cellSize);

fill(64, 0,0);
rect(x + cellSize + border,y,cellSize,cellSize);

fill(128,0,0);
rect(x + (2 *(cellSize+ border)),y,cellSize,cellSize);


fill(192,0,0);
rect(x + (3 *(cellSize+ border)),y,cellSize,cellSize);

fill(255,0,0);
rect(x + (4 *(cellSize+ border)),y,cellSize,cellSize);


y = y + cellSize + border;


// five shades of green
fill(0,0,0);
rect(x,y,cellSize,cellSize);

fill(0, 64, 0);
rect(x + cellSize + border,y,cellSize,cellSize);

fill(0, 128,0);
rect(x + (2 *(cellSize+ border)),y,cellSize,cellSize);


fill(0,192,0);
rect(x + (3 *(cellSize+ border)),y,cellSize,cellSize);

fill(0,255,0);
rect(x + (4 *(cellSize+ border)),y,cellSize,cellSize);

y = y + cellSize  +x;


// five shades of blue
fill(0,0,0);
rect(x,y,cellSize,cellSize);

fill(0, 0, 64);
rect(x + cellSize + border,y,cellSize,cellSize);

fill(0,0, 128);
rect(x + (2 *(cellSize+ border)),y,cellSize,cellSize);


fill(0,0,192);
rect(x + (3 *(cellSize+ border)),y,cellSize,cellSize);

fill(0,0,255);
rect(x + (4 *(cellSize+ border)),y,cellSize,cellSize);

y = y + cellSize + border;


// Mixing colors: red to green
fill(255,0,0);
rect(x,y,cellSize,cellSize);

fill(255, 128, 0);
rect(x + cellSize + border,y,cellSize,cellSize);

fill(255,255, 0);
rect(x + (2 *(cellSize+ border)),y,cellSize,cellSize);


fill(128,255,0);
rect(x + (3 *(cellSize+ border)),y,cellSize,cellSize);

fill(0,255,0);
rect(x + (4 *(cellSize+ border)),y,cellSize,cellSize);

y = y + cellSize + border;


// Mixing colors: red to blue
fill(255,0,0);
rect(x,y,cellSize,cellSize);

fill(255, 0,128);
rect(x + cellSize + border,y,cellSize,cellSize);

fill(255,0,255);
rect(x + (2 *(cellSize+ border)),y,cellSize,cellSize);


fill(128,0,255);
rect(x + (3 *(cellSize+ border)),y,cellSize,cellSize);

fill(0,0,255);
rect(x + (4 *(cellSize+ border)),y,cellSize,cellSize);


y = y + cellSize + border;


// Mixing colors: green to blue
fill(0,255,0);
rect(x,y,cellSize,cellSize);

fill(0,255,128);
rect(x + cellSize + border,y,cellSize,cellSize);

fill(0,255,255);
rect(x + (2 *(cellSize+ border)),y,cellSize,cellSize);


fill(0,128,255);
rect(x + (3 *(cellSize+ border)),y,cellSize,cellSize);

fill(0,0,255);
rect(x + (4 *(cellSize+ border)),y,cellSize,cellSize);


y = y+cellSize+x;


// five shades of grey
fill(0,0,0);
rect(x,y,cellSize,cellSize);

fill(64, 64,64);
rect(x + cellSize + border,y,cellSize,cellSize);

fill(128,128,128);
rect(x + (2 *(cellSize+ border)),y,cellSize,cellSize);


fill(192,192,192);
rect(x + (3 *(cellSize+ border)),y,cellSize,cellSize);

fill(255,255,255);
rect(x + (4 *(cellSize+ border)),y,cellSize,cellSize);



