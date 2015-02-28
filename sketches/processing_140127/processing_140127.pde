
void setup() {
  size(800, 800);
  //background(225);
  background(0,0,0);
  frameRate(10);
}
float x=50;
float y=50;


void draw() {
  //fill(255, 50);
  noStroke();
  fill(7,42,72,20);
  //stroke(225);
  rect(0, 0, 800, 800);


  //fill(232,random(0,20),random(100,140));
  //moveShapes();
  fill(232,random(0,20),random(100,140));
  moveShapes();
   fill(232,random(0,20),random(100,140));
  moveShapes();
   fill(232,random(0,20),random(100,140));
  moveShapes();
  fill(232,random(0,20),random(100,140));
  moveShapes();
   fill(232,random(0,20),random(100,140));
  moveShapes();
  fill(2,random(67,100),240,20);
  moveShapess();
  //fill(2,random(67,100),240,20);
  //moveShapess();
  fill(232,random(0,80),random(100,180));
  //fill(252,random(200,220),random(0,100));
  moveShapesss();
  translate(random(800),random(800));
  //fill(232,random(0,40),random(100,140));
  fill(255,255,255);
  moveTriangle();
  
 
}
/*
void moveShapes(){
 rect(random(300),random(500),200,10);
 }
 */

void moveShapes() {
  x=random(800); 
  y=random(800);
  ellipse(x,y,5,5);
}

void moveShapess() {
  x=random(800); 
  y=random(800);
  ellipse(x,y,20,20);
}

void moveShapesss() {
  x=random(800); 
  y=random(800);
  //ellipse(x,y,15,15);
  ellipse(x,y,30,30);
}

void moveTriangle() {
  //x=random(800); 
  //y=random(800);
 triangle(random(30),random(30),random(30),random(30),random(30),random(30));
}
