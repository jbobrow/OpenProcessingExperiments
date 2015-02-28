
println("Hello!");
size(400,400);
background(#1176AA);

float headX = 200;
noStroke();
fill(#FFE0A5);
ellipse(headX, 200, 160, 240 );

stroke(#030303);
strokeWeight( 10);
noFill();
ellipse(headX-40, 200, 50, 50 );
ellipse(headX+40, 200, 50, 50 );
line( headX-90, 200, headX+90, 200);


line( headX+20, 200+85, headX, 200+80);
line( headX-20, 200+85, headX, 200+80);

rectMode( CENTER);
stroke( 0,0,0);
strokeWeight( 15);
noFill();
rect( headX,200+85, 90,60, 20, 20, 20,20 );



rectMode( CENTER);
fill(#030303);
rect( headX,200-90, 160,70, 50, 0, 50,0);






