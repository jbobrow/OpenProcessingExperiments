
/**
 * Shape Primitives. 
 * 
 * The basic shape primitive functions are triangle(),
 * rect(), quad(), ellipse(), and arc(). Squares are made
 * with rect() and circles are made with ellipse(). Each 
 * of these functions requires a number of parameters to 
 * determine the shape's position and size. 
 */
 

size(740, 740);
background(#050505);
noStroke();

translate(210, -150);
rotate(PI/6.0);

//Head
fill(#862D1F);
rect(275, 80, 200, 180, 10);

//Body
fill(#862D1F);
rect(250, 310, 250, 130, 20);

//fill(204);
//quad(189, 18, 216, 18, 216, 360, 144, 360);

//eyeball L
fill(255);
ellipse(332, 164, 40, 62);

//eyeball R
fill(255);
ellipse(415, 164, 40, 62);

//Pupil L
fill(#210404);
ellipse(336, 169, 20, 32);

//Pupil R
fill(#210404);
ellipse(411, 169, 20, 32);

//Eye lid L
fill(#862D1F);
arc(332, 165, 44, 65, PI, TWO_PI);

// Eye lid R
fill(#862D1F);
arc(415, 165, 44, 55, PI, TWO_PI);

// Eye lid R
fill(#862D1F);
arc(415, 150, 40, 35, PI, TWO_PI);

// mouth
fill(#341202);
arc(375, 250, 140, 65, PI, TWO_PI);

//eye brow L
fill(#341202);
rect(380, 152, 75, 13, 2);

//eye brow R
fill(#341202);
rect(285, 153, 75, 13, 2);

//arm L
fill(#862D1F);
triangle (250, 380, 368, 320, 96, 175);

//arm R
fill(#862D1F);
triangle (435, 455, 435, 295, 655, 175);

//leg Right
fill(#862D1F);
triangle (500, 380, 600, 665, 396, 420);

//leg L
fill(#862D1F);
triangle (380, 400, 150, 650, 256, 370);





