
float x = 120; // x coordinate of body
float y = 230; // y-co ordinate of body
int neckHeight = 110;  //body height
int bodyHeight = 220; // neck height
int radius = 50; // head radius
int direction = 1;
int offset = 10;
float speed = 1;
PImage landscape;

float easing = 0.04;

// Background
void setup() {
size(700, 394);
smooth();
strokeWeight(1);
ellipseMode(RADIUS);
  landscape = loadImage ("underwater.jpg");
}


void draw () {
background (landscape) ;
  x += speed * direction;
if ((x > width-radius) || (x < radius)) {
direction = -direction;
}

  int targetX = mouseX;
 x += (targetX - x)* easing;
   if (mouseX < x) {
  x += 0.5;
    offset = 2;  
  }
    if (mouseX < x) {
   x -= 0.5;
    offset = 2; 
}

  
  if (mousePressed) {
    neckHeight = 140; 
    bodyHeight = 260;
} else { 
  neckHeight = 110; 
  bodyHeight = 220;
}
 
 float ny = y - bodyHeight - neckHeight - radius;
if (direction ==1);



  background (landscape);
  
 //antennas
strokeWeight (2) ;
background (landscape) ;
if (keyPressed) {
line (x-8, neckHeight-10, x-100, 40) ;
line (x+9, 120, x+100, 40 ) ;
}


// neck 
fill (185, 156, 96) ;
noStroke () ;
// rect (
beginShape () ;
vertex  (x-20, neckHeight) ;
vertex (x+40, neckHeight) ;
vertex (x+40, neckHeight+120) ;
vertex (x-20, neckHeight+120) ;
endShape ( ) ;

// ears
noStroke () ;
fill (147, 127, 123) ;
triangle (x+20, neckHeight-20, x+80, neckHeight+10, x+60, neckHeight-90) ;   // right
triangle (x - 55, neckHeight-90, x- 10, neckHeight-20, x - 65, neckHeight+10);      //left

// Head
noStroke () ;
fill (239, 252, 143);
ellipse  (x+10, neckHeight-20, radius, radius) ;

// eyes
 fill (191, 124, 79) ;
 noStroke () ;
 ellipse (x, 80, 10, 10) ;
 noStroke () ;
 ellipse (x+25, 80, 10, 10) ;
 // pupils 
 stroke (2) ;
 fill (0) ;
 ellipse (x+25, 80, 2, 2) ;
 ellipse (x, 80, 2, 2 ) ;
 
// Body Spots
fill (124, 115, 99) ;
strokeWeight (1) ;
if (mousePressed ==true) {
  fill (219, 141, 38);
} 
ellipse (x, neckHeight+70, 5, 7) ;
ellipse (x+20, neckHeight+70, 5, 7) ;
ellipse (x, neckHeight+100, 5, 7) ;
ellipse (x+20, neckHeight+100, 5, 7) ;
ellipse (x, neckHeight+40, 5, 7) ;
ellipse (x+20, neckHeight+40, 5, 7) ;


// Body base 
fill (142, 138, 57) ;
rect (x-40, bodyHeight, 100, 30) ;

//buttons
fill (118, 33, 16) ;
strokeWeight ( 0.5) ;
if (mousePressed ==true) {
  fill (35, 112, 20);
}
rect (x-35, bodyHeight+10, 10, 10) ;
if (mousePressed ==true) {
  fill (29, 62, 30);
} 
rect (x-8, bodyHeight+10, 10, 10) ;
rect (x+19, bodyHeight+10, 10, 10) ;
if (mousePressed ==true) {
  fill (35, 112, 20);
}
rect (x+46, bodyHeight+10, 10, 10) ;

}




