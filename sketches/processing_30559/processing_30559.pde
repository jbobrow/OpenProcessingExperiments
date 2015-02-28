
size(1024,150);
background(0);
smooth();



 
ellipseMode(CENTER);
noStroke();
fill(255,234,0);
ellipse(35, 35, 50, 50);
 
fill(0);
noStroke();
triangle(35,35,65,10,65,70);
 
noStroke();
fill(255);
ellipse(80,35,10,10);
 
noStroke();
fill(255);
ellipse(125,35,10,10);
 
noStroke();
fill(255);
ellipse(170,35,10,10);
  
noStroke();
fill(255);
ellipse(170,95,10,10);
 
noStroke();
fill(255);
ellipse(215,95,10,10);

noStroke();
fill(255);
ellipse(260,95,10,10);

noStroke();
fill(255);
ellipse(305,95,10,10);

noStroke();
fill(255);
ellipse(350,95,10,10);

noStroke();
fill(255);
ellipse(395,95,10,10);

noStroke();
fill(255);
ellipse(440,95,10,10);

noStroke();
fill(255);
ellipse(485,95,10,10);

noStroke();
fill(255);
ellipse(530,95,10,10);

noStroke();
fill(255);
ellipse(530,35,10,10);

noStroke();
fill(255);
ellipse(575,35,10,10);

noStroke();
fill(255);
ellipse(620,35,10,10);

noStroke();
fill(255);
ellipse(665,35,10,10);

noStroke();
fill(255);
ellipse(710,35,10,10);
 
noStroke();
fill(255);
ellipse(755,35,10,10);
 
noStroke();
fill(255);
ellipse(800,35,10,10);

noStroke();
fill(255);
ellipse(800,95,10,10);

noStroke();
fill(255);
ellipse(845,95,10,10);

noStroke();
fill(255);
ellipse(890,95,10,10);

noStroke();
fill(255);
ellipse(935,95,10,10);

noStroke();
fill(255);
ellipse(980,95,10,10);

float x1, y1;
float x2, y2; 

float radius =  width +360;
float  degree = 90; 

x1 =-2;
y1 = height; 

for ( int i = 0 ; i <= 90; i++){

  degree = degree -1;
  println("anglulo = " + 0); 

  float rad = - radians(degree);
  float x = radius * cos(rad);
  float y = radius * sin (rad); 

  x2 =x;
  y2= y+y1;

  float c = map (i, 0,15, 0,25);
  stroke( c,1024-c,c-60); 

  float s = map (i, 0,180, 0,5);
  strokeWeight(1);
  line (x1, y1, x2, y2);

}

saveFrame("banner.jpg");

