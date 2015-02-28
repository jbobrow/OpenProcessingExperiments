
int x = 20;


void setup (){
  size (800, 500);
  smooth ();
  background (255);
}


void draw (){
  ellipseMode (CENTER);
  rectMode (CORNERS);
  
 
  
//Sun
noStroke ();
fill (220);
ellipse (400, 35, 100, 100);

//mountain
noStroke ();
fill (180);
rect (-20, 150, 820, 500);

 //hills
while (x <= 880) {
  triangle (x-40, 150, x, 100, x+40, 150);
  x = x + 80;
}

//planes rects
noStroke ();
fill (160);
rect (0, 500, 800, 280);
fill (140);
rect (0, 500, 800, 300);
fill (100);
rect (0, 500, 800, 340);
fill (60);
rect (0, 500, 800, 400);
  
//planes
strokeWeight(1);
stroke (130);
line (0, 400, 800, 400);

line (0, 340, 800, 340);

line (0, 300, 800, 300);

line (0, 280, 800, 280);


}
