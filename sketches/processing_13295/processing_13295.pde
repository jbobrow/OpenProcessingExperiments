


size ( 200, 200 );
background( #dc143c );

//ear
stroke( #FFE146 );
fill( #FFE146 );
beginShape();
vertex( 80, 80 );
bezierVertex( 140, 115, 5, 85, 40, 10 );
endShape();
//
beginShape();
vertex( 150, -10 );
bezierVertex( 75, 120, 155, 120, 155, -20 );
endShape();
//
stroke( 0 );
fill( 0 );
beginShape();
vertex( 80, 80 );
bezierVertex ( 120, 85, 5, 75, 40, 10 );
endShape();
//
stroke( 0 );
fill( 0 );
beginShape();
vertex( 150, -10 );
bezierVertex ( 75, 120, 155, 120, 155, -20 );
endShape();

//face
stroke( #FFE146 );
fill( #FFE146 );
int[] f={ 100 }; 
for ( int i=0; i<f. length; i=i+1 )
{
 ellipse( 100, 110, f[i], f[i] );
}
//
ellipse( 110, 130, 90, 60 );
ellipse( 90, 130, 90, 60 );
//
fill ( #dc143c  );
noStroke();
ellipse( 50, 135, 35, 35 );
ellipse( 150, 135, 35, 35 );

//eye-l
fill ( 0 );
int[] a={ 20 }; 
for ( int i=0; i<a. length; i=i+1 )
{
 ellipse( 75, 100, a[i], a[i] );
}
//r
int[] c={ 20 };
for ( int i=0; i<c. length; i=i+1 )
{
  ellipse( 125, 100, c[i], c[i] );
}
//small-l
fill ( 255 );
int[] x={ 7 };
for ( int i=0; i<x. length; i=i+1 )
{
  ellipse ( 74, 97, x[i], x[i] );
}
//r
int[] y={ 7 };
for ( int i=0; i<y. length; i=i+1 )
{
ellipse ( 124, 97, y[i], y[i] );
}

//nose
fill( 0 );
int[][] l = { {97, 110}, {103, 110}, {100, 115} };
beginShape();
for( int i=0; i<l. length; i=i+1 ){
  vertex( l[i][0], l[i][1] );
}
endShape( CLOSE );

//mouth
stroke( 0 );
line( 90, 140, 110, 140 );
                
                
