
//written by Rachel Ciavarella
//CMU computing for the arts with Processing homework II
//may be late turnign in due to old machine


//doc setup
size( 400, 400);
pushMatrix();
translate(200,200);
background( #27F270 );
strokeWeight( 2 );
float x = 0;
float y = 0;
float wd = 400;
float ht = wd;

//nose
stroke(#C68148);
fill(#CB9E79);
triangle( x + wd * .125 , y - 30, x + 45 , y + 50 , x + 80, y + 50);


//head circle
stroke(#C68148);
fill(#CB9E79);
ellipse( x - 150, y, x + wd, x + ht);


//eye fill
fill(255);
noStroke();
ellipse( x , y + ht * -.125, x + wd * .25, x + ht * .25 );

//pupil
fill(0);
noStroke();
ellipse( x + wd * .05 , y + ht * -.15, x + wd * .1, x + ht * .1 );

//mustache
noStroke( );
fill( 70 );
triangle( x + wd * 0 , y + ht * .2 , x + wd * .125 , y + ht * .25 , x + wd * .125 , y + ht * .125);


//R initial curve
noFill ( );
stroke (#312114);
strokeWeight ( 5 ); 
beginShape( ) ;
curveVertex( x + wd * 0, y + ht * 0 );
curveVertex( x + wd * -.125 , y + ht *-.125);
curveVertex( x + wd * -.004 , y + ht * -.001);
curveVertex( x + wd * .125, y + ht * -.125 );
curveVertex( x + wd * -.125, y + ht *-.5 );
endShape( );


//R initial top leg
stroke(#312114);
strokeWeight( 5 );
line( x + wd * -.125, y + ht * -.125, x + wd * .25 , y + ht * -.25 );

//R initial lower leg
stroke(#312114);
strokeWeight( 5 );
line( x + wd * .125, y + ht * -.125, x + wd * .2 , y + ht * -.125 );

//C initial curve (ear)
noFill ( );
stroke (#C68148);
beginShape( ) ;
curveVertex( x + wd * -.1 , y + ht * -.125);
curveVertex( x + wd * -.36 , y + ht * -.1 );
curveVertex( x + wd * -.4 , y + ht * .001);
curveVertex( x + wd * -.36, y + ht * .1 );
curveVertex( x + wd * -.1, y + ht *.125 );
endShape( );


//center reference point
//stroke( 25, 50, 26 );
//strokeWeight( 10 );
//point( x, y );




