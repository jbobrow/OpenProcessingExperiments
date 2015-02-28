
void setup () {
size (400,400); // Set the size of the window

}

void draw () {
background (226, 163, 89) ; // Draws an Orange background
smooth (); //Anti-Alias


//set ellipses and rects to CENTER mode
ellipseMode (CENTER) ;
rectMode (CENTER) ;

// Draw Creatures body

stroke (0) ;
strokeWeight(8) ;
fill(23,216,68);
rect (mouseX, mouseY,100,70) ;



// Draw Creatures left head
ellipse (mouseX-70,mouseY-95,40,32);

// Draw Creatures right head
ellipse (mouseX-20,mouseY-95,40,32);

// Draw Creatures left Neck
strokeWeight(1);
line (mouseX-70,mouseY-75,mouseX-50,mouseY-25) ;


// Draw Creatures right Neck

line (mouseX-27,mouseY-75,mouseX-50,mouseY-25) ;


// Draw Creatures front leg
stroke (0) ;
strokeWeight(4) ;

rect (mouseX-37, mouseY+50,30,25) ;


// Draw Creatures back leg

stroke (0) ;

rect (mouseX+37, mouseY+50,30,25) ;

//Draw Creatures Tail
strokeWeight(2) ;

ellipse (mouseX+67,mouseY+3,30,12);

}

void mousePressed () {

  background (255) ;
}

  

