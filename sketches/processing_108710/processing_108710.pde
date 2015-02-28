
/**
 * Shape Primitives. 
 * 
 * The basic shape primitive functions are triangle(),
 * rect(), quad(), ellipse(), and arc(). Squares are made
 * with rect() and circles are made with ellipse(). Each 
 * of these functions requires a number of parameters to 
 * determine the shape's position and size. Dave K. ATK302
 */

size(640, 360);
background(#05BFF5);
noStroke();

fill(#24B907); //grass
rect(0, 305, 640, 63);

noFill(); //back tire
stroke(0);
strokeWeight(10);
ellipse(225, 264, 72, 72);

noFill(); //front tire
stroke(0);
strokeWeight(10);
ellipse(375, 264, 72, 72);

fill(0); //back axle
strokeWeight(0);
ellipse(226, 264, 15, 15);

fill(0); //front axle
strokeWeight(0);
ellipse(376, 264, 15, 15);

stroke(0); //back spokes
strokeWeight(1);
line(249, 290, 200, 235);
line(251, 235, 200, 290);
line(225, 230, 225, 300);
line(190, 263, 260, 263);

line(399, 290, 350, 235); //front spokes
line(401, 235, 350, 290);
line(375, 230, 375, 300);
line(340, 263, 410, 263);

stroke(255, 0, 0);
strokeWeight(3);
line(270, 220, 275, 230); //seat post

noFill(); //bike frame
stroke(255, 0, 0);
strokeWeight(5);
quad(250, 230, 350, 230, 320, 270, 275, 270);

triangle(255, 240, 272, 265, 220, 265);

fill(255,0,0);
line(330, 200, 378, 266); // handlebars
line(330, 200, 320, 220);

stroke(0); //grips
line(325, 210, 320, 220);

stroke(0); //seat
line(260, 220, 280, 220);

stroke(0); //seat
line(262, 220, 258, 218);

fill(0); //pedal
stroke(0);
ellipse(300, 270, 20, 20);

stroke(0); //pedal
strokeWeight(2);
line(310, 250, 295, 280);

stroke(0); //pedal
strokeWeight(2);
line(305, 250, 315, 250);

noFill(); //bike chain
stroke(0);
strokeWeight(1);
rect(220, 258, 90, 24, 10, 10, 10, 10);

stroke(0); //gear
strokeWeight(2);
line(225, 265, 225, 280);

fill(0); //gear
strokeWeight(0);
ellipse(225, 278, 8, 8);

fill(#fff000); //sun
noStroke();
ellipse(100, 60, 72, 72);

fill(255); //clouds
noStroke();
ellipse(150, 60, 50, 40);

fill(255); //clouds
ellipse(170, 60, 50, 30);

fill(255); //clouds
ellipse(40, 60, 50, 30);

fill(255); //clouds
noStroke();
ellipse(60, 60, 50, 40);

fill(255); //clouds
noStroke();
ellipse(450, 50, 50, 20);

fill(255); //clouds
noStroke();
ellipse(480, 45, 60, 30);

fill(255); //clouds
noStroke();
ellipse(510, 55, 50, 20);

fill(#643205); //tree trunk rt
rect(550, 265, 20, 40);

fill(#05641e); //tree bottom rt
triangle(560, 150, 620, 265, 500, 265);

fill(#05641e); //tree top rt
triangle(560, 110, 600, 210, 520, 210);

fill(#643205); //tree trunk lt
rect(10, 280, 15, 25);

fill(#05641e); //tree top lt
triangle(15, 180, 45, 280,-10, 280);

fill(#643205); //tree trunk mid
rect(50, 285, 10, 20);

fill(#05641e); //tree top mid
triangle(50, 200, 85, 290, 20, 290);


