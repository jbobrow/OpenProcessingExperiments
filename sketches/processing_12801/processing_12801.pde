
int x = 150; // x-coordinate
int y = 420; // y-coordinate
int bodyHeight = 110; // Body Height
int neckHeight = 190; // Neck Height
int radius = 45; // Head Radius
int ny = y - bodyHeight - neckHeight - radius; // Neck Y
size(340,400);
smooth();
strokeWeight(2);
background(0);
ellipseMode(RADIUS);

// orejas
noStroke();
fill(133,102,255);
ellipse(x+12, ny, x-18, ny-43);
fill(64,0,128);
ellipse(x+12, ny, x+42, ny-99);

//legs
noStroke();
fill(78,78,78);
rect(x-10, y-bodyHeight, 20, bodyHeight-33);
fill(78,78,78);
rect(x+30, y-bodyHeight, 30, bodyHeight-33);
fill(78,78,78);
rect(x-60, y-bodyHeight, 30, bodyHeight-33);

// Body&arms
fill(142,145,240);
ellipse(x+10, ny+135, x-20, ny-77);
fill(128,255,128);
ellipse(x+12, ny+145, x-18, ny-77);
fill(225,157,215);
ellipse(x+14, ny+165, x-16, ny-77);
fill(0,128,192);
triangle(x-90, 320, 159, 100, 250, 320); // triangulo grande
fill (166,240,238);
triangle(x-45, 225, 159, 110, 207, 225);// triangulo chico



// Head
fill(192,192,192);
ellipse(x+12, ny, radius+12, radius+12);
fill(0,255,0);
ellipse(x+36, ny-6, 14, 14);
fill(0);
ellipse(x+30, ny-6, 3, 3);
fill(0,255,0);
ellipse(x-10, ny-6, 14, 14);
fill(0);
ellipse(x-4, ny-6, 3, 3);
fill(204,51,200);
rect(x-4, bodyHeight-18, 30, bodyHeight-80);


