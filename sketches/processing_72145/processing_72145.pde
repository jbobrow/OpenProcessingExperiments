
float eyeR;
float eyeG;
float eyeB;

int x = 0;
int y = 0;
int speed = 1;

void setup () {
size (500, 500) ;
smooth () ;
}

void draw () {
  
background (0) ; 

fill (0, 50);
rect (0, 0, width, height) ;
fill (255) ;
ellipse (random(width), random(height), 3, 3);

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

//P
fill (128, 5, 252) ;
stroke (194, 134, 255) ;
ellipse (100, 70, 60, 60) ; 
line (100, 200, 50,50) ; 

// Rect's Face

stroke (236,255,100) ; 
fill (255) ; 
rectMode (CENTER) ; 
rect (mouseX,mouseY,150,150) ;

// Draw Rect's eyes
eyeR = random (255) ;
eyeG = random (255) ;
eyeB = random (255) ; 
fill (eyeR, eyeG, eyeB) ; 
stroke (46,157,22) ;
ellipse (mouseX-30, mouseY-30, 20, 20) ; 
ellipse (mouseX+30, mouseY-30, 20, 20) ; 

// Smile

stroke (255,14,5) ; 
noFill();
arc(mouseX, mouseY+30, 50, 50, 0, PI);
arc(mouseX, mouseY+30, 50, 50, PI,PI);

}

void mousePressed () {

// Smile

stroke (10,80,252) ; 
strokeWeight (50) ; 
noFill();
arc(mouseX, mouseY+30, 50, 50, 0, PI);
arc(mouseY, mouseY+30, 50, 50, PI, PI);

}

void keyPressed () {
  if(key=='s'){
    saveImage();}

stroke (21,160,36) ; 
strokeWeight (20) ; 
noFill();
arc(mouseX, mouseY+30, 50, 50, 0, PI);
arc(mouseY, mouseY+30, 50, 50, PI, PI);
}



