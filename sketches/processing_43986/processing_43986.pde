
//Verwenden Sie nur die folgenden Funktionen: size(), background(), stroke(), noStroke(), fill(), noFill(), ellipse()

size( 500, 500 );
background( 255, 255, 255 );

//gesicht grundform
noStroke();
fill( 232, 197, 101 );
ellipse( 250, 250, 200, 200 );

//mund
stroke( 0 );
noFill();
ellipse( 250, 280, 100, 60);

//mund verdeckung (wie macht man eine schöne kurve ganz einfach???)
noStroke();
fill( 232, 197, 101 );
rect( 190, 249, 120, 32 );

//augen
noStroke();
fill( 255, 255, 255 );
ellipse( 200, 220, 30, 40 );
ellipse( 300, 220, 30, 40 );

//pupillen
noStroke();
fill( 39, 80, 160 );
ellipse( 190, 220, 10, 10 );
ellipse( 290, 220, 10, 10 );                
