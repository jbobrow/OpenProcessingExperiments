
int neckHeight = 110;  //body height
int bodyHeight = 220; // neck height

void setup() {
size(700, 394);
smooth();
strokeWeight(1);
ellipseMode(RADIUS);
frameRate (4);
}
void draw () {
 float r = random (0, 100);
//float g = random (0, 100);
float b = random (0, 100);
background (r, 15, b);
drawRobot(80, 230, 100, 140);
drawRobot (270, 350, 100, 80);
drawRobot(420, 300, 100, 100);
drawRobot(570, 240, 100, 80);

}
void drawRobot(int x, int y, int bodyHeight, int neckHeight) {
  
int radius =  50;

int ny = y - bodyHeight - neckHeight - radius;
 
 //antennas
strokeWeight (2) ;

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
rect (x-40, y+25, 100, bodyHeight-130) ;
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
//angle+=speed;
}


