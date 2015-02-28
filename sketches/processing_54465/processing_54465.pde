
// Robot - gilebot.

// Background
size(400, 400);
smooth();
strokeWeight(1);
background(245);

//antennas
strokeWeight (2) ;
line (102, 100, 20, 40) ;
line ( 139, 100, 220, 40 ) ;

// body
fill (185, 156, 96) ;
noStroke () ;
beginShape () ;
vertex  (90, 110) ;
vertex (150, 110) ;
vertex (150, 230) ;
vertex (90, 230) ;
endShape ( ) ;

// ears
noStroke () ;
fill (147, 127, 123) ;
triangle (140, 90, 200, 120, 180, 40) ;   // right
triangle (55, 40, 100, 90, 45, 120);      //left

// Head
noStroke () ;
fill (239, 252, 143);
ellipse  (120, 90, 100, 100) ;

// eyes
 fill (191, 124, 79) ;
 noStroke () ;
 ellipse (110, 80, 15, 15) ;
 noStroke () ;
 ellipse (135, 80, 15, 15) ;
 // pupils
 stroke (2) ;
 fill (0) ;
 ellipse (135, 80, 3, 3) ;
 ellipse (110, 80, 3, 3) ;
 
// Body Spots
fill (124, 115, 99) ;
strokeWeight (1) ;
ellipse (110, 180, 10, 15) ;
ellipse (130, 180, 10, 15) ;
ellipse (110, 210, 10, 15) ;
ellipse (130, 210, 10, 15) ;
ellipse (110, 150, 10, 15) ;
ellipse (130, 150, 10, 15) ;

// Body base
fill (142, 138, 57) ;
rect (70, 220, 100, 30) ;

//buttons
fill (118, 33, 16) ;
strokeWeight ( 0.5) ;
rect (75, 230, 10, 10) ;
rect (102, 230, 10, 10) ;
rect (129, 230, 10, 10) ;
rect (156, 230, 10, 10) ;

