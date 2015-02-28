
/**
   ___________________________
  /   _________   _________   \
 /   /\_____   \  \   _____\   \
 \   \/ ___  \  \  \  \   ___   \
  \    /\  \__\  \  \  \__\  \   \
   \   \ \   _____\  \______  \   \
    \   \ \__\____/  /_____/\__\   \
     \   \/__/             \/__/   /
      \___________1989____________/                           
                               



/**
 * Shape Primitives. 
 * 
 * The basic shape primitive functions are triangle(),
 * rect(), quad(), ellipse(), and arc(). Squares are made
 * with rect() and circles are made with ellipse(). Each 
 * of these functions requires a number of parameters to 
 * determine the shape's position and size. 
 */

//sky
size(1024, 600);
background(#AB151C);
noStroke();

//ground
fill(#879096);
rect(0, 300, 1024, 350);

//skyline
fill(#879096);
rect(50, 200, 100, 350);

fill(#879096);
rect(100, 25, 100, 350);

fill(#879096);
rect(450, 200, 512, 250);

fill(#879096);
rect(500, 100, 256, 250);

//legs
fill(#9C7F0B);
triangle(256, 350, 300, 400, 250, 400);

fill(#9C7F0B);
triangle(316, 350, 360, 400, 310, 400);

//torso
fill(#9C7F0B);
rect(256, 256, 60, 100);

//backpack
fill(#2E2E2C);
rect(236, 256, 20, 80);
fill(#2E2E2C);
rect(226, 266, 20, 60);

//helmet
fill(#253452);
pushMatrix() ;
rotate(radians(90)) ;
arc(296, -306, 80, 60, PI, TWO_PI);
popMatrix() ;

fill(#798EB8);
triangle(315, 270, 328, 285, 315, 285);

//joints
fill(#2E2E2C);
rect(253, 349, 10, 10);

fill(#2E2E2C);
rect(311, 349, 10, 10);

//gun
fill(#5A5B5E);
rect(270, 326, 100, 10);

fill(#5A5B5E);
rect(270, 315, 20, 20);

//shoes
fill(#2E2E2C);
rect(250, 400, 50, 10);

fill(#2E2E2C);
rect(310, 400, 50, 10);


