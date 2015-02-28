
//copyright Laura Contero 2014
//ICE 2

size( 400, 400); 
background( 59, 0, 0, 29);
strokeWeight( 5); 

//magic numbers
float x = 100;
float y = 100;
float wd = 300;
float ht = 100;

stroke(255, 255, 255);
noFill();
beginShape( );
  curveVertex( wd, ht);
  curveVertex( wd, ht);
  curveVertex( x, y);
  
  curveVertex( x+.5*wd, y+.5*ht);
  curveVertex( x+.5*wd, y+1.5*ht);
  
  curveVertex( x, y+2.5*ht);
  curveVertex( x+.25*wd, y+ht);
  curveVertex( wd, ht);
endShape( CLOSE);




