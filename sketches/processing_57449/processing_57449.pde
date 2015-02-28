
float x = 180; // X-coordinate
float y = 400; // Y-coordinate
float bodyHeight = 153; // Body height
float neckHeight = 56; // Neck height
float radius = 45; // Head radius
float angle = 0.0; // Angle for motion
void setup() {
size(360, 480);
smooth();
ellipseMode(RADIUS);
background(204);
}void draw() {
// Change position by a small random amount
x += random(-4, 4);
y += random(-1, 1);
// Change height of neck
neckHeight = 80 + sin(angle) * 30;
angle += 0.05;
// Adjust the height of the head
float ny = y - bodyHeight - neckHeight - radius;


// Neck
stroke(102);
line(x+2, y-bodyHeight, x+2, ny);
line(x+12, y-bodyHeight, x+12, ny);
line(x+22, y-bodyHeight, x+22, ny);


//antennae
strokeWeight(4);
stroke(255, 255, 0);
line(x +12, ny, x-18, ny-99); //left antennae
line(x +12, ny, x + 46, ny-99); //right antennae


//body
noStroke(); //disable stroke
fill(240, 0, 0); //set fill to red
ellipse(x, y-33, 33, 33); //orb
fill(0); //set fill to black
rect(x-45, y-bodyHeight, 90, bodyHeight-33); //main rectangle
fill(102); //set fill to grey
rect(x-45, y-bodyHeight+20, 90, 6); //grey stripe


// Head
fill(0);
ellipse(x+12, ny, radius, radius);
fill(255);
ellipse(x+24, ny-6, 14, 14);
fill(0);
ellipse(x+24, ny-6, 3, 9);

}

