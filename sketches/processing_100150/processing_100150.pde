
/* Ejercicio 3 
Random y travelling */

float vampX;
float vampY;


void setup() {
// Set the size of the window
size(400,400);
frameRate(30);

vampX = width/2;
vampY = height-50;
}

void draw() {
background(80);
  // smooth();
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  strokeWeight(4);
  fill (255);
  rect (vampX,vampY,90, 100);
  
  strokeWeight(3);
  fill(vampX,0,0);
  ellipse(vampX-20,vampY-20, 10, 10);
  ellipse(vampX+20,vampY-20,10, 10); 
  line(vampX-20, vampY+20,vampX-15,vampY+30);
  line(vampX-15,vampY+30,vampX-10,vampY+20);
  line (vampX+20,vampY+20,vampX+15,vampY+30);
  line (vampX+15,vampY+30,vampX+10,vampY+20);
  
  vampY=vampY-1;
  vampX=random (190,210);
}


