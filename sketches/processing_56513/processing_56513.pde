
float x = 180; 
float y = 400; 
float bodyHeight = 153; 
float neckHeight = 56; 
float radius = 45; 
float angle = 0.0;

void setup() { 
  size(360, 480); 
  smooth(); 
  ellipseMode(RADIUS); 
  background(204);
}

void draw() { 
  // Change position by a small random amount 
  x += random(-4, 4); 
  y += random(-4, 4);

// Change height of neck 
neckHeight = 80 + sin(angle) * 30; 
angle += 0.05;

// Adjust the height of the head 
float ny = y - bodyHeight - neckHeight - radius;

// Neck
stroke(0);         
line(x, y-bodyHeight, x+12, ny);


// Body
noStroke();
fill(500,200,100); 
rect (x+10, y-33, 20, bodyHeight-33);
rect (x-30, y-33, 20, bodyHeight-33);
fill(0,0,255); 
rect(x-45, y-bodyHeight, 90, bodyHeight-33);
fill(0);
rect(x-45, y-bodyHeight-200, 5, 200);
rect(x+45, y-bodyHeight+10, 150, 5);


// Head
fill(500,200,100);   
ellipse(x+12, ny, radius+5, radius+20);
fill(0);
ellipse(x+55, ny-20, 30, 30);
ellipse(x-30, ny-20, 30, 30);
rect(x, ny+30, 30, 3);
fill(255);
ellipse(x+45, ny-6, 7, 7);
ellipse(x-20, ny-6, 7, 7);

}

