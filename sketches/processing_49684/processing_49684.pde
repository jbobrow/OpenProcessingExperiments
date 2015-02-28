
// 48-257, bumyeolk_HW1
// Bumyeol Kim, copyright 2012

size ( 400, 400);
background(255, 255, 255);
smooth ( );

fill (0, 0,0);
rect(0, 0, 133, 50);
rect(133, 0, 266, 80);
rect(267, 0, 400, 110);
rect(0, 290, 133, 110);
rect(133, 320, 134, 80);
rect(267, 350, 400, 50);

line (133, 80, 133, 320);
line (267, 80, 267, 320);

fill(#DCC9FF);
rect(0, 50, 133, 240);

stroke(#FBFF21);
strokeWeight(7);
line(45, 120, 25, 230);

noFill( );
strokeWeight(5);
stroke(#F74B6B);
arc(75, 130, 35, 35, PI+PI/3, TWO_PI+PI/2);
stroke(#00F512);
arc(75, 172.5, 50, 50, PI/2, TWO_PI-PI/2);
stroke(#1405FF);
arc(75, 222.5, 50, 50, TWO_PI-PI/2, TWO_PI+PI-PI/6);

fill(#FFCD6A);
stroke(#FFCD6A);
ellipse(70, 130, 10, 10);
ellipse(70, 222.5, 20, 15);

//second letter

noStroke( );
fill(#A0FFBB);
rect(133, 80, 134, 240);

stroke(#6A1C76);
strokeWeight(3);
ellipse(200, 280, 70, 40);

stroke(#B20E21);
strokeWeight(10);
line(200, 198, 200, 280);

stroke(#309B88);
strokeWeight(10);
ellipse(200, 160, 90, 70);

stroke(#FF7484);
fill(#B20E21);
ellipse(200, 160, 75, 55);

noStroke( );
fill(#A0FFBB);
rect(133, 80, 134, 70);
triangle(200, 170, 133, 80, 267, 80);

//third letter
noStroke( );
fill(#A2F3FA);
rect(267, 110, 133, 240);

stroke(#8E5B1D);
strokeWeight(4);
fill(#FF8E03);
quad(300, 180, 300, 330, 380, 320, 305, 180);

strokeWeight(8);
point(320, 250);
point(330, 240);
point(340, 230);
point(350, 220);
point(360, 210);
point(370, 200);
point(380, 190);

strokeWeight(6);
line(377, 318, 301, 252);

// saveFrame("hw1.jpg");                
