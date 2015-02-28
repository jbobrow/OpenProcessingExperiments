
//copyright Yasha Mushtaq Mir, Aug 2013, Pittsburgh
 
size( 400, 400 );
background(205, 247, 40);
 
// Circles in the Background
fill (204, 237, 60);
noStroke();
ellipse( 50, 100, 50, 50);
ellipse( 100, 50, 50, 50);
ellipse( 50, 10, 25, 25);
ellipse( 30, 20, 15, 15);
noFill();
stroke(204, 237, 60);
ellipse( 30, 75, 40, 40);
ellipse( 80, 80, 20, 20);
ellipse( 20, 30, 30, 30);
ellipse( 60, 30, 15, 15);
 
// Initial 'Y'
fill(255);
noStroke();
quad (50, 100, 140, 200, 100, 200, 50, 150);
noFill();
stroke (150);
strokeWeight(2);
arc( 0, 150, 300, 450, radians(-3), radians(90));
arc( 0, 150, 310, 450, radians(-3), radians(90));
arc( 0, 150, 320, 450, radians(-3), radians(90));
arc( 0, 150, 330, 450, radians(-3), radians(90));
 
// Initial 'M'
stroke (255);
strokeWeight(4);
line (200, 100, 250, 150);
line (250, 150, 275, 100);
stroke (204, 237, 60);
line (275, 100, 275, 175);
fill (155);   // rectangle in initial 'M'
stroke (150); 
rect (185, 100, 15, 75);
 
// Initial 'M'
fill (255);
noStroke();
triangle (200, 200, 350, 200, 350, 350);
triangle (300, 150, 350, 200, 300, 200);



