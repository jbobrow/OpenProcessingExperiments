
size(800,800);

// read the image from the file
// must be in the data subdirectory
PImage newWHS;
newWHS=loadImage("newWHS.jpg");

PImage oldWHS;
oldWHS=loadImage("oldWHS.jpg");

//put the image in the upper-left corner
image(newWHS,0,0);

//change the size of the image
image(newWHS,100,100,600,800);

//tile the sketch window
image(newWHS,0,0,400,400);
image(oldWHS,0,400,400,400);
image(oldWHS,400,0,400,400);
image(newWHS,400,400,400,400);

// add transparent rectangles
noStroke();              // no outline of the circle
fill(255,100,100,100);
rect(100,0,700,800);
fill(100,255,100,100);
rect(300,0,500,800);
fill(100,100,255,100);
rect(500,0,300,800);
fill(100,100,100,100);
rect(700,0,100,800);

strokeWeight(10);
stroke(0);
line(400,0,400,800);
line(0,400,800,400);



