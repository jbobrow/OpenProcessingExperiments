
// homework assignment 2 
// chris henrick

// set x and y to random integers between 100 and 500
int x = (int) random(100, 500);
int y = (int) random(100, 500);

// set size of document
size(x, y);
// set background to white
background(255);

// variables for objects width and height from size of document
float objectW = width;
float objectH = height;

//set increment
float increment = 50;

int r = (int) random(255);
int r2 = (int) random(255);
int r3 = (int) random(255);

noStroke();

for (float i = 0; i < 10; i = i + .10) {
fill(r, r2, r3, 30);
ellipse(objectW/2, objectH/2, objectW - increment * i, objectH - increment * i);
}

fill(r3, r2, r);
rect(objectW/3, objectH/4, objectW / increment, objectH - increment);

fill(r2, r3, r, 127);
rect(objectW/4, objectH/3, objectW - increment, objectH / increment);


