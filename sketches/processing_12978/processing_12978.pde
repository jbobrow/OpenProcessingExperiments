
size (200, 200);

//background
background(0);
stroke( #FF82FF );
strokeWeight( 1 );
for( float a=0; a<PI*2; a=a+0.001 ) {
  point( 100+sin(a)*100, 10+cos(a*70)*200 );
}

//background_circle
noStroke();
fill( 255 );
for( int x=0; x<=20; x=x+2 )
{
  ellipse( x*10,190,15,15 );
  ellipse( x*10,10,15,15 );
}

//ear
stroke( #FF1493 );
fill( #FF1493 );
beginShape();
vertex(0,0);
bezierVertex( 260, 125, 15, 85, 0, 0 );
endShape();
//
beginShape();
vertex(160,-30);
bezierVertex( 85, 110, 155, 130, 165, -30 );
endShape();

//face
stroke( #FF1493 );
fill( #FF1493 );
ellipse( 100, 110, 100, 80 );
beginShape();
vertex( 149, 120 );
vertex( 150, 110 );
vertex( 146, 148 );
vertex( 80, 175 );
vertex( 85, 150 );
endShape(CLOSE);
ellipse( 85, 110, 80, 70 );
ellipse( 93, 155, 28, 28 );

//eye
fill(0);
ellipse( 75, 95, 13, 13 );

//ribbon
stroke( 0 );
strokeWeight( 5 );
fill( #FFD128 );
beginShape();
vertex( 68.5, 162 );
vertex( 70.5, 181.5 );
vertex( 81.5, 177.6 );
vertex( 100, 185 );
vertex( 98, 162 );
vertex( 83, 168.5 );
endShape( CLOSE );
stroke( #FFD128 );
line( 103.5, 174.5, 144, 157 );
