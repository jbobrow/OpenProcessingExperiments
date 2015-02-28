
PImage img;
PFont font;
float x = 60; // X-coordinate
float y = 440; // Y-coordinate
int radius = 45; // Head Radius
int bodyHeight = 160; // Body Height
int neckHeight = 70; // Neck Height
float easing = 0.02;
float ny = y - bodyHeight - neckHeight - radius;


void setup() {
font = loadFont ("ForteMT-48.vlw");
textFont (font);
background(0);
size(360, 401);

img= loadImage ("c.jpg");
smooth();
strokeWeight(5);
ellipseMode(RADIUS);

println("Pinky Pop");
int d1=1 + int(random(20));
println("Pinky..."+d1);
int d2=1 + int(random(20));
println("Pinky..."+d2);
int d3=1 + int(random(6));
println("Pinky..."+d3);
println("End");

}


void draw() {
  background(0);
  text ("Pinky", 25, 60);



noStroke();
int targetX = mouseX;
x += (targetX - x) * easing;



if (mousePressed) {
neckHeight = 20;
bodyHeight = 100;
image(img,0,0);
} 
else {
neckHeight = 80;
bodyHeight = 170;
}
float ny = y - bodyHeight - neckHeight - radius;



// Neck
stroke(112);
line(x-10, y-bodyHeight, x-10, ny);

// Body
noStroke();
fill (190); // pelos locos
rect(x-100,ny+120,150,3);
fill (255);
rect (x-100, ny+100,150,3);
fill(183,47,193);
ellipse(x-40, y-50, 10, 10);
fill(183,47,193);
ellipse(x-7, y-50, 10, 10);
fill(243,154,250);
ellipse(x-25, y-bodyHeight, 30, bodyHeight-60);
fill(170,38,180);
rect(x-27, ny+150, 3, 3);


// Head
if (keyPressed) {

fill(0);
ellipse(x-30, ny-15, 10, 10);
ellipse(x-6, ny-15, 10, 10);
image(img,0,0);

} 






fill(243,154,250);
ellipse(x-20, ny, radius, radius);
fill(255);
ellipse(x-30, ny-15, 10, 10);
fill(183,47,193);
ellipse(x-30, ny-15, 6, 6);
fill(0);
ellipse(x-30, ny-15, 3, 3);

fill(255);
ellipse(x-6, ny-15, 10, 10);
fill(183,47,193);
ellipse(x-6, ny-15, 6, 6);
fill(0);
ellipse(x-6, ny-15, 3, 3);

fill(170,38,180);
rect(x-20, ny+1, 3, 3);
rect(x-30,ny+15,24,3);
rect(x-35,ny-35,9,2);
rect(x-8,ny-35,9,2);
}

