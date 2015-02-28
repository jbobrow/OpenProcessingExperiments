

// Functions

// parameters

size (300, 300);
point(150,150); //(x, y) axis
smooth(); // anti-aliasing for all strokes, administrative

//function for coloring background
background(0);
stroke (255);
fill(82, 140, 236, 200); // giving 3 values automates RGB values // 4th value denotes a opacity value

// line function (x1,y1,  x2,y2)

quad(20,20, 280,20, 280,280, 20,280); //leave white space to differentiate x, y coordinates
line(20, 20,  280, 280);
line(280, 20,  20, 280); // drawing order matters! runs lines of code sequentially and layers on top
triangle(10,200, 10,290, 100,290);

fill(216, 24, 2, 180);
rect(150, 150, 100, 100); // (x,y (top left point) width, height)
fill(0);
ellipse(150,150, 50, 50); // (x,y, (centerpoint) width, height)



