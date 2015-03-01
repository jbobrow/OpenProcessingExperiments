
/*
Day01_homework01_By_StephanieMcNiel
*/


size(800, 600);

//Draw the puppy head
fill(158, 245, 234);
noStroke();
triangle(250, 60, 550, 100, 340, 350);

//Draw the puppy nose
fill(0);
triangle(310, 345, 338, 290, 366, 345);

//Draw the puppy left ear
fill(158, 245, 234);
stroke(0);
triangle(230, 75, 278, 20, 306, 75);

//Draw the puppy right ear
fill(158, 245, 234);
triangle(530, 175, 535, 80, 470, 75);

//Draw the puppy eyes
stroke(255);
strokeWeight(30);
point(325, 150);
point(415, 170);
stroke(0);
strokeWeight(20);
point(325, 150);
point(415, 170);

//Draw the puppy body
noStroke();
ellipse(490, 280, 250, 140);

//Draw the puppy legs
stroke(158, 245, 234);
strokeWeight(20);
line(500, 300, 500, 420);





