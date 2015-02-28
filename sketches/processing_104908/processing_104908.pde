
// chractor 
// referenced from Reas & Fry. O'Reilly / Make 2010 Robot2_Variables

int x = width*2;            
int y = 420;           
int bodyHeight = 110;  
int neckHeight = 140;  
int radius = 45;
int ny = y - bodyHeight - neckHeight - radius;  // Neck Y

size(500, 500);
strokeWeight(5);
colorMode(HSB,255);
background(random(0,255),55,255);
ellipseMode(RADIUS);



// Antennae
line(x-32, ny+19, x-5, ny-43);
line(x+12, ny, x+58, ny+15);

// Body
noStroke();
fill(random(0,255),255,255);
ellipse(x+5, y-143, 33, 33);
fill(random(0,255),255,255);
ellipse(x+5, y-214, 33, 33);
fill(random(0,255),255,55,50);
rect(x-45, y-bodyHeight, 90, bodyHeight-33);
fill(102,255,255);
rect(x-45, y-bodyHeight+17, 90, bodyHeight-50);

// Head
fill(25,255,255);
ellipse(x+12, ny, radius, radius); 
fill(0);
ellipse(x, ny-8, 3, 3);
ellipse(x+11, ny+16, 15, 3);
ellipse(x+24, ny-6, 3, 3);










