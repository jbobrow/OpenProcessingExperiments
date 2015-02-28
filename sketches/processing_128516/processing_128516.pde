
// Written by Miranda Jacoby
// majacoby@andrew.cmu.edu
// copyright Miranda Jacoby January 2014 Pittsburgh, PA 15289  All Rights reserved

//Sets window display size and 
size( 400, 400 );
smooth();

//background color
background(69, 14, 255);

//messing with bezier
//noFill();
//strokeWeight(10);
//stroke(255, 195, 14);
//line(30, 20, 80, 5);
//line(80, 75, 30, 75);
//stroke(255, 195, 14);
//bezier(30, 20,  80, 5,  80, 75,  30, 75);

//quadrange with overlap
//noStroke();
//fill(255, 195, 14);
//quad( 50, 100, 100, 100, 70, 200, 80, 200);

//quadrange without overlap
//noStroke();
//fill(255, 195, 14);
//quad( 50, 200, 65, 100, 85, 100, 100, 200);
//quad( 100, 200, 115, 100, 135, 100, 150, 200);

//base of M
noStroke();
fill(255, 195, 14);
//quad( 20, 325, 20, 75, 80, 75, 80, 325);
//quad( 120, 20, 170, 20, 235, 325, 285, 325);
//quad( 120, 40, 170, 40, 190, 345, 110, 345);
//quad(180, 40, 170, 40, 180, 225, 170, 225);
//full shape
//quad( 20, 300, 20, 50, 125, 50, 155, 300);
quad( 25, 300, 40, 50, 145, 50, 185, 300);
fill(69, 14, 255);
triangle( 70, 50, 100, 50, 85, 100);
quad( 70, 300, 80, 200, 110, 200, 130, 300);

//Base of A
fill(255, 195, 14);
//seperate
//quad( 155, 300, 185, 50, 220, 50, 195, 300);
//full shape
//quad( 155, 300, 185, 50, 220, 50, 265, 300);
quad( 165, 300, 205, 50, 240, 50, 285, 300);
fill(69, 14, 255);
triangle( 220, 155, 230, 155, 225, 125);
triangle( 210, 300, 240, 300, 225, 200);
//overlap
//quad( 130, 300, 185, 50, 220, 50, 170, 300);

//Base of J
fill(255, 195, 14);
rect(270, 50, 60, 35);
//quad(270, 50, , , , , , ):
quad( 265, 300, 300, 50, 370, 50, 355, 300 );
arc( 282, 300, 145, 100, 0, PI);

// Written by Miranda Jacoby
// majacoby@andrew.cmu.edu
// copyright Miranda Jacoby January 2014 Pittsburgh, PA 15289  All Rights reserved

//Sets window display size and 
size( 400, 400 );
smooth();

//Background Color
background(69, 14, 255);

//Background Lines
fill( 35, 151, 173);
stroke( 35, 151, 173);
strokeWeight(8);
line( -10, 10, 10, -10);
line( -10, 30, 30, -10);
line( -10, 50, 50, -10);
line( -10, 70, 70, -10);
line( -10, 90, 90, -10);
line( -10, 110, 110, -10);

line( 410, 390, 390, 410);
line( 410, 370, 370, 410);
line( 410, 350, 350, 410);
line( 410, 330, 330, 410);
line( 410, 310, 310, 410);
line( 410, 290, 290, 410);
line( 410, 270, 270, 410);

strokeWeight(50);
line( -10, 250, 250, -10);
line( 410, 190, 190, 410);

//Base of M
noStroke();
fill(255, 195, 14);
quad( 25, 300, 40, 50, 145, 50, 185, 300);
fill(69, 14, 255);
triangle( 80, 50, 110, 50, 95, 100);
quad( 70, 300, 80, 200, 110, 200, 130, 300);
fill(255, 195, 14);
triangle( 80, 200, 110, 200, 95, 250);

//Base of A
fill(255, 195, 14);
quad( 165, 300, 205, 50, 240, 50, 285, 300);
fill(69, 14, 255);
triangle( 220, 155, 230, 155, 225, 125);
triangle( 210, 300, 240, 300, 225, 200);

//Base of J
fill(255, 195, 14);
rect(270, 50, 60, 35);
quad( 265, 300, 300, 50, 360, 50, 375, 300 );
arc( 290, 300, 170, 135, 0, PI);

//saveFrame("hw_1.jpg");






