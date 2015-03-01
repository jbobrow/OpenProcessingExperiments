
float a=10;

void setup () {
  size (600,600);
  background (0);
  noStroke();
  
  fill (255);
  rect (10,40, 25,25);
  rect (40, 40, 25, 25);
  rect (10, 75, 25, 25);
  rect (40, 75, 25, 25); 
  rect (10, 110, 25, 25);
  rect (40, 110, 25, 25);
  
  rect (530, 500, 25, 25);
  rect (560, 500, 25, 25);
  rect (530, 535, 25,25);
  rect (560, 535, 25, 25);
  rect (530, 465, 25, 25);
  rect(560, 465, 25, 25);
  
  rect (530, 40, 25, 25);
  rect (560, 40, 25, 25);
  rect (560, 75, 25, 25);
  rect (530, 75, 25, 25);
  rect (560, 110, 25, 25);
  rect (530, 110, 25, 25);
}


void draw () {
 
fill(255);
rect (10,500, 25, 25);
rect (40, 500, 25, 25);
rect (10, 535, 25, 25);
rect (40, 535, 25, 25);
rect (10, 465, 25, 25);
rect (40, 465, 25, 25);

a += 0.50; 
translate(300+30,200+30);
rotate (a);
 
fill(random(280),200,200);
rect(-200,30,50,50);
rect(-200,30,20,20);
rect(200,30,10,10);


fill(random(234),100,110);
translate (mouseX,mouseX);
rotate (a);
ellipse(-200,30,50,50);
ellipse(-200,30,20,20);
rect(200,30,10,10);



  
}
  


