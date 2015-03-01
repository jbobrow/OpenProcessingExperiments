

// Robot 2...

int x =105; 
int y = 420;
int bodyHeight = 200;  // Body Height 110
int neckHeight = 50;  // 140
int radius = 0;   // Head Radius
int ny = y - bodyHeight- neckHeight - radius;  // Neck Y
color blueColor = color(25,66,180);
color silverColor = color(175);

size(235, 480);
smooth();
strokeWeight(2);
background(200,131,12); // ground
//sky
fill(242,101,34);
rect(-100, -240, 500, 480); 
ellipseMode(RADIUS);

// sun 1
fill(247,204, 109);
noStroke();
ellipse(x+120, ny+30, 32,26);

// sun 2

fill(237,230, 155);
noStroke();
ellipse(x+55, ny-25, 28,25);

// Neck
//stroke(102);
//line(x+2, y-bodyHeight, x+2, ny);
//line(x+12, y-bodyHeight, x+12, ny);
//line(x+22, y-bodyHeight, x+22, ny);

//Antennae
//line(x+12, ny, x-18, ny-43);
//line(x+12, ny, x+42, ny-99);
//line(x+12, ny, x+78, ny+15);

// Body
noStroke();
fill(102);
//ellipse(x, y-33, 33, 33);
fill(240);
rect(x-45, y-bodyHeight, 120, bodyHeight-33);
fill(155);
rect(x-45, y-bodyHeight-5, 120, 10);

fill(blueColor);
rect(x-25, y-bodyHeight+5, 80, 15);
rect(x-25, y-bodyHeight+23, 80, 15);
rect(x-25, y-bodyHeight+40, 80, 15);

rect(x, y-bodyHeight+60, 40, 60);
fill(155); // silverish
rect(x+5, y-bodyHeight+65, 30,25);
rect(x+5, y-bodyHeight+95, 30,20);


// blue neck
fill(blueColor);
rect(x-45, ny+40, 120, 5);

// Head
fill(silverColor);
arc(x+15, ny+40, 60, 60, PI, TWO_PI);
fill(blueColor);
// very top blue markings
arc(x+15, ny-10, 30, 9, PI, TWO_PI);
// break up the arc

stroke(silverColor);
line(x+15, ny-20, x+15, ny+10);

noStroke();

rect(x-15, ny, 25, 25); // eyebackground
fill(0);
ellipse(x-5, ny+10,9, 9);  //black eye

fill(200);
ellipse(x+20, ny+25, 10,10); // focus outline
fill(10);
ellipse(x+20, ny+25, 6,6); // focus eye

fill(blueColor); // red dot background
rect(x-10, ny+28, 20, 10); 
fill(255,0,0);
ellipse(x+5, ny+32, 4,4); //red dot

fill(blueColor);
rect(x+35, ny+15, 10, 20); // right blue markings
rect(x+48, ny+15, 10, 20);

// Left Leg

fill(235);
rect(x-70, ny+55, 25, 190);

// Right Leg

fill(235);
rect(x+70, ny+55, 25, 190);

// Left Foot
fill(235);
//rect(x-80, ny+210, 40, 45);
quad(x -75, ny+210, x-45, ny+210, x-40, ny+255, x-85, ny+255);

//Right Foot
fill(235);
quad(x +70, ny+210, x+95, ny+210, x+105, ny+255, x+65, ny+255);

// make the legs stand out from the body...
stroke(10);
line(x-44, ny+90, x-44, ny+215); // left side

line(x+70, ny+90, x+70, ny+215);



//fill(0);
//ellipse(x+24, ny-6, 3, 3);
//fill(153);
//ellipse(x, ny-8, 5, 5);
//ellipse(x+30, ny-26, 4, 4);
//ellipse(x+41, ny+6, 3, 3);



