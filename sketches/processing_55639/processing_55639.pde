
float x = 60; 
float y = 440; 
int radius = 55; 
int bodyHeight = 70; 
int neckHeight = 180;
float easing = 0.02;
void setup() 
{ size(360, 480); 
smooth(); 
strokeWeight(2);

ellipseMode(RADIUS);
} void draw() {

int targetX = mouseX; x += (targetX - x) * easing;
if (mousePressed) { neckHeight = 16; bodyHeight = 90;
} else { neckHeight = 180; bodyHeight = 70;
} float ny = y - bodyHeight - neckHeight - radius; 
background(20, 50, 250, 90);
stroke (140, 120, 240);
strokeWeight (4);
line(x+6, y-bodyHeight, x+6, ny);
line(x+12, y-bodyHeight, x+12, ny);
line(x+22, y-bodyHeight, x+22, ny);
line(x+40, ny, x-40, ny-43);
line(x+40, ny, x+42, ny-99); 
line(x+40, ny, x+78, ny+50);

noStroke(); 
fill(200, 50, 140); 
ellipse(x, y-33, 33, 33); 
fill(0, 255, 0);
rect(x-45, y-bodyHeight, 90, bodyHeight-33);
fill(140, 120, 240); 
rect(x-45, y-bodyHeight+17, 90, 6);

fill(0, 255, 0); 
ellipse(x+40, ny, radius, radius);
fill(255); 
ellipse(x+15, ny-8, 14, 14);
fill(255); 
ellipse(x+50, ny-8, 14, 14); 
fill(0);
ellipse(x+40, ny-6, 3, 3);//eye
fill(0);
ellipse(x+24, ny-6, 3, 3); //eye
fill(255, 0, 0); 
ellipse(x, ny+20, 8, 8); 
ellipse(x+50, ny-26, 4, 4); 
ellipse(x+41, ny+6, 3, 3);

fill(255); 
ellipse(x+50, ny-8, 14, 14); 
fill(0);
ellipse(x+40, ny-6, 3, 3);
fill(153);
}

