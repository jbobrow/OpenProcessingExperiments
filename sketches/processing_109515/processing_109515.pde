
/**
 * Shape Primitives. 
 * 
 * The basic shape primitive functions are triangle(),
 * rect(), quad(), ellipse(), and arc(). Squares are made
 * with rect() and circles are made with ellipse(). Each 
 * of these functions requires a number of parameters to 
 * determine the shape's position and size. 
 */

size(1000, 1000);
background(255);
noStroke();



//body//

fill(#1B898E);
ellipse(350, 450, 400, 400);

fill(#6FCFD3);
ellipse(350, 450, 200, 200);


//head//

fill(#1B898E);
ellipse(350, 200, 300, 300);


//mouth//

fill(255, 0, 0);
rect(270, 200, 160, 85, 15);


//teeth//

fill(255);
triangle(275, 205, 325, 205, 300, 230);
triangle(325, 205, 375, 205, 350, 230);
triangle(375, 205, 425, 205, 400, 230);
triangle(275, 280, 325, 280, 300, 255);
triangle(325, 280, 375, 280, 350, 255);
triangle(375, 280, 425, 280, 400, 255);

//eyes//

fill(255);
ellipse(260, 160, 50, 50);

fill(0);
ellipse(260, 160, 20, 20);

fill(255);
ellipse(315, 100, 50, 50);

fill(0);
ellipse(315, 100, 20, 20);

fill(255);
ellipse(350, 160, 50, 50);

fill(0);
ellipse(350, 160, 20, 20);

fill(255);
ellipse(395, 100, 50, 50);

fill(0);
ellipse(395, 100, 20, 20);

fill(255);
ellipse(440, 160, 50, 50);

fill(0);
ellipse(440, 160, 20, 20);

//legs//

fill(#1B898E);
rect(250, 600, 50, 150);
rect(410, 600, 50, 150);

//arms//

fill(#1B898E);
quad(110, 190, 150, 190, 220, 320, 180, 380);
quad(550, 190, 590, 190, 520, 380, 480, 320);


//feet//

fill(#1B898E);
ellipse(275, 740, 80, 65);
ellipse(435, 740, 80, 65);

//toes//

fill(0);
triangle(240, 750, 260, 750, 250, 775);
triangle(265, 750, 285, 750, 275, 775);
triangle(290, 750, 310, 750, 300, 775);
triangle(400, 750, 420, 750, 410, 775);
triangle(425, 750, 445, 750, 435, 775);
triangle(450, 750, 470, 750, 460, 775);

//hands//

fill(#1B898E);
ellipse(135, 190, 80, 65);
ellipse(565, 190, 80, 65);

//fingers//

fill(0);
triangle(100, 180, 120, 180, 110, 150);
triangle(125, 180, 145, 180, 135, 150);
triangle(150, 180, 170, 180, 160, 150);
triangle(530, 180, 550, 180, 540, 150);
triangle(555, 180, 575, 180, 565, 150);
triangle(580, 180, 600, 180, 590, 150);














