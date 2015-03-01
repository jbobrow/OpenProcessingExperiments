
/*@pjs preload="emda1.png";*/

size( 400, 400 );
background( #464141);
 
strokeWeight( 6 );
stroke( #88FAEC );
fill(#9AB7C6 );
 
beginShape();
vertex( 50, 50 );
bezierVertex( 50, 450, 150, 450, 450, 450 );
bezierVertex( 450, 50, 75, 350, 50, 50 );
endShape();

PImage img_emda1;
img_emda1 = loadImage("emda1.png");
image(img_emda1,300,300,100,100);



