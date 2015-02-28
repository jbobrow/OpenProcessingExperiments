
int counter;
void setup(){
size (600, 600);
}

void draw() {
background(0, 0, 0);
ellipseMode(RADIUS);
fill(100);
ellipse(300, 300, 200, 200);
ellipseMode(CENTER);
fill(255,0,45);
ellipse(300, 300, 350, 350); 
if (mousePressed)
background(0,150,0);
if (mousePressed)
fill(255,255,255);
ellipse(300, 300, 350, 350); 
fill(255,129,001);
ellipseMode(CENTER);
ellipse(mouseX, mouseY, 50, 50);
if (mousePressed)
fill(0,0,0);
ellipseMode(CENTER);
ellipse(mouseX, mouseY, 50, 50);

  
}


