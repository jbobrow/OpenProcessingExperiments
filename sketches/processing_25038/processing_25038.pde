
float y = 300;
// variables for speed of radius increase
float speed =5;
void setup () {
size (400, 400);
smooth();
}
void draw () {
//make a “white” background
background (0,0,0);
//color the circle
fill (y, 40, 50);
noStroke () ;
// y is now hooked to the radius
rectMode (CENTER);
for (int i =1; i <5; i++) {
rect (width/2, height/2, 200, y);
}

fill (y, 40, 50);
noStroke () ;
// y is now hooked to the radius
rectMode (CENTER);
for (int i =1; i <5; i++) {
rect (width/2, height/2, y, 200);
}

fill (y, 122, 255-y);
rectMode (CENTER);
for (int i =1; i <2; i++) {
ellipse (width-width/2, height-height/2, y, y);
}

//change the radius
y = y+speed;
;
//keep the circle from leaving the screen
if ((y>height) || (y<50)) {
speed = speed *-1;
}
}
                
                                
