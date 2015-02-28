

float x = 70; // x-coordinate
float y = 400; // y-coordinate
int bodyHeight = 100; // Body Height
int neckHeight = 150; // Neck Height
int radius = 28; // Head Radius
float easing = 0.03;
void setup () {
size(500, 500);
smooth();
strokeWeight(2);
background(255);
ellipseMode(RADIUS);
}
// Neck
void draw () {
int targetX = mouseX;
x += (targetX - x) * easing;
if (mousePressed) {
neckHeight = 160;
bodyHeight = 160;
}
else {
neckHeight = 50;
bodyHeight = 160;
}


float ny = y - bodyHeight - neckHeight - radius;
background(255);
stroke(120);
line(x+6, y-bodyHeight, x+4, ny);
line(x+20, y-bodyHeight, x+20, ny);
line(x+36, y-bodyHeight, x+30, ny);


// Antennae
line(x+30, ny, x-20, ny-43);
line(x+12, ny, x+48, ny-99);
line(x+12, ny, x+82, ny+15);

// Body
noStroke();
fill(195, 192, 198);
ellipse(x, y-33, 33, 33);
fill(109, 23, 250);
ellipse(x-30, ny, radius, radius);
fill(137, 116, 122);
rect(x-45, y-bodyHeight+17, 90, 90);
fill(185, 181, 191);
rect(x-45, y-bodyHeight+17, 90, 6);
fill(98, 26, 216);
ellipse(x+70, ny, radius, radius);
{
PFont font;
font=loadFont("Blackout-2AM-48.vlw");
textFont(font);
textSize(36);
text("brocoli",25,60);
textSize(18);
text("alcachofa",27,90);
}

// Head
fill(221, 250,8);
ellipse(x+12, ny, radius, radius);
{ellipse (x, y-80, 10, 10);
fill(137, 116, 122);
ellipse(x+24, ny-6, 14, 14);
fill(227,250,247);
ellipse(x+24, ny-6, 3, 3);
fill(255,54,118);
ellipse(x, ny-8, 5, 5);
ellipse(x+30, ny-26, 4, 4);
ellipse(x+41, ny+6, 3, 3);
if (mousePressed) {
if(mouseButton == LEFT) {
ellipse(x-10, ny++, radius--, radius);
{
PFont font;
font=loadFont("Blackout-2AM-48.vlw");
textFont(font);
textSize(36);
text("circulos",200,350);
textSize(35);
text("triangulos",200,400);
}
}
}
}
} 

