
/**
 * Shape Primitives. 
 * 
 * The basic shape primitive functions are triangle(),
 * rect(), quad(), ellipse(), and arc(). Squares are made
 * with rect() and circles are made with ellipse(). Each 
 * of these functions requires a number of parameters to 
 * determine the shape's position and size. 
 */

size(640, 400);
background(#C5F7F1);
noStroke();

fill(#84F24E);//GROUND
rect(0, 350, 640, 50);

fill(#8E7C5C);//TREE
quad(150, 18, 160, 18, 100, 360, 50, 360);

fill(#428934);//BACK SPIKES
triangle(525, 180, 525, 220, 580, 200);
triangle(525, 150, 525, 200, 580, 150);
triangle(500, 105, 525, 170, 560, 100);
triangle(430, 50, 405, 100, 440, 100);//head

fill(#F7740F);//ORANGE BODY
ellipse(480, 190, 150, 170);

fill(#428934);//GREEN BELLY
arc(500, 200, 200, 200, HALF_PI, PI);
triangle(455, 350, 500, 300, 540, 350); 

fill(#F7740F); //ORANGE LEG
ellipse(500, 265, 80, 130);
triangle(475, 300, 500, 375, 520, 300);

fill(#428934);//HEAD
ellipse(420, 120, 110, 70);

fill(#FFFFFF);//EYE
ellipse(390, 100, 20, 20);

fill(#000000);//PUPIL
ellipse(385, 96, 10, 10);

fill(#000000);//BROW
quad(403, 85, 406, 85, 403, 105, 400, 105);

fill(#428934);//ARM
ellipse(500, 165, 50, 130);

fill(#F0A0D9);//TREE LEAVES
ellipse(80, 30, 400, 400);

fill(#428934);//NIPPLE
ellipse(430, 175, 10, 10);

fill(#FFFFFF);//FINGERS
ellipse(490, 222, 10, 10);
ellipse(500, 229, 10, 10);
ellipse(510, 222, 10, 10);

fill(#FFFFFF); //teeth
triangle(366, 125, 376, 125, 371, 135);
triangle(376, 125, 386, 125, 381, 135);
triangle(386, 125, 396, 125, 391, 135);
triangle(396, 125, 406, 125, 401, 135);
triangle(406, 125, 416, 125, 411, 135);





