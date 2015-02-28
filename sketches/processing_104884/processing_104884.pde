
//Duck Variable Assignment
//by Julie Huynh / Make 2013

int x = 30;            // X-coordinate
int y = 400;            // Y-coordinate
int bodyHeight = 400;    // Body Height
int neckHeight = 100;    // Neck Height
int radius = 200;
int ny = y - bodyHeight - neckHeight - radius;  // Neck Y
int displayWidth = 1680;
int displayHeight = 1050;

size(displayWidth - 600,displayHeight - 100);
smooth();
strokeWeight(10);
background(26,232,216);
ellipseMode(RADIUS);
println(displayHeight);
println(displayWidth);

// Feet
fill(255,203,10);
strokeWeight(10);
ellipse(x+450,displayHeight-155, radius-100,radius-175);

// Feet
fill(255,203,10);
strokeWeight(10);
ellipse(x+650,displayHeight-155, radius-100,radius-175);

// Body
fill(255);
ellipse(x+550, displayHeight-400, displayWidth/8, (bodyHeight-displayHeight/8));


// Neckline
strokeWeight(10);
strokeCap(SQUARE);
line(x+499, displayHeight-650, x+499, displayHeight-750);
strokeWeight(10);
strokeCap(SQUARE);
line(x+610, displayHeight-650, x+610, displayHeight-750);


// Head
fill(255);
strokeWeight(10);
ellipse(x+550,displayHeight/5, radius-50,radius-30);

//Eyes
fill(0);
strokeWeight(10);
ellipse(x+600,displayHeight/6, radius-197,radius-187);

fill(0);
strokeWeight(10);
ellipse(x+500,displayHeight/6, radius-195,radius-175);

// Bill
fill(255,203,10);
strokeWeight(10);
ellipse(x+550,displayHeight/4, radius-75,radius-250);

// Neck
noStroke();
fill(255);
rect(displayWidth-1145, displayHeight-700, 400+ny, displayHeight/8);
println(ny);

print("quack");
