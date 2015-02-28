

//Constrain
float x;
float y;
float targetX, targetY;
float easing1 = 0.05;

//Easing
float mx;
float my;
float easing2 = 0.05;
int radius = 24;
int edge = 56;
int inner = edge + radius;



void setup() {
  size(500,500);
  noCursor();
  smooth();
  
  
  //constrain
  ellipseMode(RADIUS);
  rectMode(CORNERS);

 
  background(75);
}
 
void draw() {
  //easing
  targetX = mouseX;
  float dx = targetX -x;
  if(abs(dx) >1) {
    x += dx * easing2;
    
  //constrain  
  targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing1;
    if (abs(mouseX - mx) > 0.1) {
    mx = mx + (mouseX - mx) * easing1;
  }
  if (abs(mouseY - my) > 0.1) {
    my = my + (mouseY- my) * easing1;
  }
  
  //constrain
  mx = constrain(mx, inner, width - inner);
  my = constrain(my, inner, height - inner);
  fill(109, 21, 87, 50);
  rect(edge, edge, width-edge, height-edge);
  //triangle(edge, edge, width-edge, height-edge, edge, edge);
  fill(75, 150, 75, 50);  
  rect(mx, my, radius, radius);
  //triangle(mx, my, radius, radius, mx, my);

  }

//This is the fill & colors for the shapes which appear
//along with opacity so you can see overlapping.
  fill(random(75),random(150),random(75),75);
  noStroke();
  
  //click the mouse to see the cursor appear
  if (mousePressed == true) {
    cursor();
  }
  
  //generate Shapes!
  triangle(500,500,250,mouseX,mouseY,250);
  triangle(250,250,500,mouseX,mouseY,125);
  triangle(125,125,125,mouseX,mouseY,500);
  triangle(50,50,100,mouseX,mouseY,50);
  triangle(25,25,50,mouseX,mouseY,25);
  triangle(15,15,20,mouseX,mouseY,20); 
  rect(200,200,mouseX,mouseY);
  rect(100,100,mouseX,mouseY);
  rect(50,50,mouseX,mouseY);
  rect(25,25,mouseX,mouseY);
  rect(150,150,mouseX,mouseY);
  rect(250,250,mouseX,mouseY);
  triangle(15,15,20,mouseX,mouseY,20);
  triangle(25,25,50,mouseX,mouseY,25);
  triangle(50,50,100,mouseX,mouseY,50);
  triangle(125,125,125,mouseX,mouseY,500);
  triangle(250,250,500,mouseX,mouseY,125);
  triangle(500,500,250,mouseX,mouseY,250);
  }
}


