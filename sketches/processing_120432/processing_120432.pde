
int eSize = 3;
size(400, 565);
background(255,255,255);



//gurade
for(int x = 0; x <= width; x ++){
  stroke(x);
  line(-x,-80+x,400,-80+x);
  
  //underlines
  float ramdomNum = random(100);
  if (ramdomNum < 50) stroke(255);
  else stroke(0,x);
  line(0, 400+x, width,400+x);
  
/*
  if (x%7 == 0) stroke(0,x);
  else if (x%7 == 1) stroke(255,x);
  else stroke(255,20,0,x);
  line(0, 400+x, width, 400+x);
*/
}


//white
noStroke();
fill(255,180);
rectMode(CORNER);
rect(0,300,400,565);

//lines
stroke(255,20,0,100);
strokeWeight(2);
line(0,540,400,540);

stroke(255,20,0,100);
strokeWeight(1);
line(0,545,400,545);

//nami
strokeWeight( 250 );
stroke(230,50);
noFill();
bezier( -82, -10, 189, -104, 214, 205, 673, 16 );

strokeWeight( 250 );
stroke(180,100);
noFill();
bezier( -146, -19, 106, 138, 180, -167, 490, -10 );



//nuki

//E
noStroke();
fill(0,0,0);
rectMode(CORNER);
rect(100, 57, 100, 56);

noStroke();
fill(0,0,0);
rectMode(CORNER);
rect(100, 169, 100, 56);

//X
noStroke();
fill(0,0,0);
triangle(200,113,220,141,200,169);

noStroke();
fill(0,0,0);
triangle(400,113,380,141,400,169);

noStroke();
fill(0,0,0);
triangle(280,0,300,28,320,0);

noStroke();
fill(0,0,0);
triangle(280,282,300,254,320,282);

//P
noStroke();
fill(255,20,0);
rectMode(CORNER);
rect(80, 345, 40, 63);

noStroke();
fill(0,0,0);
rectMode(CORNER);
rect(80, 471, 120, 94);


//O
noStroke();
fill(0,0,0);
rectMode(CORNER);
rect(260, 383, 80, 94);






