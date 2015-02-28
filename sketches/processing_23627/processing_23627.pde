
size(640, 480);
background( 229, 248, 242 );
smooth();

//double lines
line( 0, 71, 21, 29 );
line( 0, 181, 38, 111 );

//large shape
beginShape();
fill(0);
noStroke();
vertex(  8,   0   );
vertex( 43,   77  );
vertex( 26,   84  );
vertex( 70,   177 );
vertex( 61,   181 );
vertex( 47,   149 );
vertex( 34,   155 );
vertex( 57,   207 );
vertex( 65,   203 );
vertex( 72,   221 );
vertex( 86,   215 );
vertex( 90,   225 );
vertex( 115,  215 );
vertex( 129,  247 );
vertex( 184,  221 );
vertex( 186,  231 );
vertex( 248,  202 );
vertex( 230,  160 );
vertex( 214,  167 );
vertex( 202,  142 );
vertex( 214,  138 );
vertex( 193,  88  );
vertex( 181,  93  );
vertex( 180,  86  );
vertex( 189,  83  );
vertex( 185,  70  );
vertex( 173,  74  );
vertex( 169,  62  );
vertex( 145,  73  );
vertex( 124,  25  ); 
vertex( 115,  28  );
vertex( 103,  0   );
endShape(CLOSE);

//left rectagle
beginShape();
vertex( 0, 347 );
vertex( 88, 319 );
vertex( 100, 359 );
vertex( 0, 391 );
endShape(CLOSE);

//right rectangle
beginShape();
vertex( 608, 190 );
vertex( 640, 128 );
vertex( 640, 191 );
vertex( 634, 203 );
endShape(CLOSE);

//top rectangle
beginShape();
vertex( 117, 336 );
vertex( 124, 324 );
vertex( 134, 330 );
vertex( 127, 342 );
endShape(CLOSE);

//middle rectangle
beginShape();
fill( 182, 27, 23 );
vertex( 101, 383 );
vertex( 153, 299 );
vertex( 168, 308 );
vertex( 117, 392 );
endShape(CLOSE);

//bottom rectangle
beginShape();
fill( 48, 70, 93 );
vertex( 102, 416 );
vertex( 180, 287 );
vertex( 215, 308 );
vertex( 137, 437 );
endShape(CLOSE);

