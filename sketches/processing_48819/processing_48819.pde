

void setup () {
size(400,400);
smooth ();
}

void draw () {
background (105,105,105);

rectMode(CENTER);
fill (219,112,147);
rect(200,200,90,200);

fill (255,218,185);
ellipse(200,140,120,120);

fill (65,105,225);
ellipse(162,140,32,64); 
ellipse(238,140,32,64); 

line(180,300,160,320);
line(220,300,240,320);

//moving eyes
  fill (011);
  float ax = map(mouseX, 100, width, 180, 250);
  float ay = map(mouseY, 100, height, 160, 190);
 
  ellipse(ax,ay,10,10);
   
  float bx = map(mouseX, 0, width, 235, 315);
  float by = map(mouseY, 0, width, 140, 190);
   
  ellipse(bx,by,10,10);
}

void mousePressed () {
  if (mousePressed = true);
  fill (255,218,185);
  ellipse(162,140,32,64); 
  ellipse(238,140,32,64);
}

