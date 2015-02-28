
float x = 120; // x coordinate of body
float y = 230; // y-co ordinate of body
int neckHeight = 110;  //body height
int bodyHeight = 220; // neck height
int radius = 50; // head radius
int offset = 10;
float angle = 0.1;
float speed = 0.1;
PImage landscape;

// float easing = 0.04;

// Background
void setup() {
size(700, 394);
smooth();
strokeWeight(1);
ellipseMode(RADIUS);
  landscape = loadImage ("underwater.bmp");
}


void draw () {
  
background (landscape);
// int targetX = mouseX;

// x += (targetX - x)* easing;
//   if (mouseX < x) {
//  x += 0.5;
//    offset = 2;
//  }
//    if (mouseX < x) {
//   x -= 0.5;
//    offset = 2; 
//}

x += random (-6, 6) ;
y += random (-6, 6) ;

angle += 0.4;
float ny = y - bodyHeight - neckHeight - radius;
//  
//  if (mousePressed) {
//    neckHeight = 140; 
//    bodyHeight = 260;
//} else { 
//  neckHeight = 110; 
//  bodyHeight = 220;
//}
// 
  
 //antennas
strokeWeight (2) ;
background (landscape) ;
if (keyPressed) {
line (x-8, y-130, x-100, y-190) ;
line (x+9, y-110, x+100,  y-190) ;
}


// neck 
fill (185, 156, 96) ;
noStroke () ;
// rect (
beginShape () ;
vertex  (x-20, y-120) ;
vertex (x+40, y-120) ;
vertex (x+40, y) ;
vertex (x-20, y) ;
endShape ( ) ;

// ears
noStroke () ;
fill (147, 127, 123) ;
triangle (x+20, y-140, x+80, y-100, x+60, y-210) ;   // right
triangle (x - 55, y-210, x- 10, y-140, x - 65, y-110);      //left

// Head
noStroke () ;
fill (239, 252, 143);
ellipse  (x+10, y-140, radius, radius) ;

// eyes
 fill (191, 124, 79) ;
 noStroke () ;
 ellipse (x, y-150, 10, 10) ;
 noStroke () ;
 ellipse (x+25, y-150, 10, 10) ;
 // pupils 
 stroke (2) ;
 fill (0) ;
 ellipse (x+25, y-150, 2, 2) ;
 ellipse (x, y-150, 2, 2 ) ;
 
// Body Spots
fill (124, 115, 99) ;
strokeWeight (1) ;
if (mousePressed ==true) {
  fill (219, 141, 38);
} 
ellipse (x, y-50, 5, 7) ;
ellipse (x+20, y-50, 5, 7) ;
ellipse (x, y-20, 5, 7) ;
ellipse (x+20, y-20, 5, 7) ;
ellipse (x, y-80, 5, 7) ;
ellipse (x+20, y-80, 5, 7) ;


// Body base 
fill (142, 138, 57) ;
rect (x-40, y, 100, 30) ;

//buttons
fill (118, 33, 16) ;
strokeWeight ( 0.5) ;
if (mousePressed ==true) {
  fill (35, 112, 20);
}
rect (x-35, y+10, 10, 10) ;
if (mousePressed ==true) {
  fill (29, 62, 30);
} 
rect (x-8, y+10, 10, 10) ;
rect (x+19, y+10, 10, 10) ;
if (mousePressed ==true) {
  fill (35, 112, 20);
}
rect (x+46, y+10, 10, 10) ;
angle+=speed;
}


