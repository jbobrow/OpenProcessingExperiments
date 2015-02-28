
/* @pjs preload= "yinYang.gif"; */

size(800, 800);
stroke(255, 0, 0, 150);
strokeWeight(1.5);


fill(0, 0, 0);
ellipse(400, 341, 335, 335);
ellipse(400, 341, 330, 330);
ellipse(400, 341, 320, 320);
ellipse(400, 341, 305, 305);


noFill( );
arc(400, 200, 50, 50, HALF_PI, TWO_PI);
arc(400, 250, 50, 50, PI+HALF_PI, TWO_PI+PI);
arc(350, 250, 50, 50, HALF_PI, TWO_PI);
arc(350, 300, 50, 50, PI+HALF_PI, TWO_PI+PI);
arc(450, 250, 50, 50, HALF_PI, TWO_PI);
arc(450, 300, 50, 50, PI+HALF_PI, TWO_PI+PI);
arc(400, 430, 50, 50, HALF_PI, TWO_PI);
arc(400, 480, 50, 50, PI+HALF_PI, TWO_PI+PI);
arc(460, 400, 50, 50, QUARTER_PI, PI+HALF_PI+QUARTER_PI);
arc(495, 435, 50, 50, PI+QUARTER_PI, TWO_PI+HALF_PI+QUARTER_PI);
arc(340, 400, 50, 50, HALF_PI+QUARTER_PI, TWO_PI+QUARTER_PI);
arc(305, 435, 50, 50, PI+HALF_PI+QUARTER_PI, TWO_PI+PI+QUARTER_PI);

fill(255, 0, 0, 130);
noStroke( );
ellipse(400, 355, 100, 100);

PImage img;
img = loadImage("yinYang.gif");
image(img, 363, 305, 75, 75);



