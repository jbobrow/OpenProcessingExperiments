
float eyeR;
float eyeG;
float eyeB;

int x = 0;
int y = 0;
int speed = 1;

void setup () {
size (500, 500) ;
background (0) ; 
smooth () ;
}

void draw () {

x = x + speed;
if ((x > width) || (x < 0 )) {
  speed = speed * -1; }
  
y = y + speed;   
  
if ((y > height) || (y < 0 )) {
  speed = speed * -1;
}

// Display circle at x location
stroke (255) ; 
fill (0) ;
ellipse (x, 100, 50, 50) ;

// Display circle at x location
stroke (255) ; 
fill (0) ;
ellipse (x, 400, 50, 50) ;

// Display circle at x location
stroke (255) ; 
fill (0) ;
ellipse (x, 250, 25, 25) ;

// Display circle at y location

stroke (255) ; 
fill (0) ;
ellipse (100, y, 50, 50) ;

stroke (255) ; 
fill (0) ;
ellipse (400, y, 50, 50) ;

stroke (255) ; 
fill (0) ;
ellipse (250, y, 25, 25) ;

fill (255) ; 
stroke (236,255,100) ; 
rectMode (CENTER) ;
rect (250,250,150,150) ;

// Draw Rect's eyes

fill (0) ; 
stroke (0) ;
ellipse (220, 220, 20, 20) ; 
ellipse (280, 220, 20, 20) ; 

// Smile

stroke (255,14,5) ; 
noFill();
arc(250, 270, 50, 50, 0, HALF_PI);
arc(250, 270, 50, 50, HALF_PI, PI);

}

void mousePressed () {

// Smile

stroke (10,80,252) ; 
strokeWeight (50) ; 
noFill();
arc(250, 270, 50, 50, 0, HALF_PI);
arc(250, 270, 50, 50, HALF_PI, PI);

}

void keyPressed () {

stroke (21,160,36) ; 
strokeWeight (20) ; 
noFill();
arc(250, 270, 50, 50, 0, HALF_PI);
arc(250, 270, 50, 50, HALF_PI, PI);

}



