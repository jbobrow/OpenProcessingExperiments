

size(500, 500);

/* PImage b;
b = loadImage("/Library/Application Support/Apple/iChat Icons/IMG_3297.JPG");
b.resize(500, 500);
background(b);*/
noFill();

/*I started out by doing it on a (100, 100) sized sketch to make numbers
simpler. Then I made the triangle on a (50, 50, 40, 60, 60, 60); scale,
then I adjusted the sketch to the size I wanted (a multiple of 100) and
multiplied the other values by that same value.
*/

stroke(67, 71, 170); //stroke is the color of the border of the next shape
fill(67, 71, 170); //fill colors it on the inside

triangle(250, 270, 200, 350, 300, 350);

noFill();
stroke(255); //white is 255 and black is 0. It's on a gradient of gray.

//head

ellipse(250, 245, 10, 15);
ellipse(250, 245, 20, 25);
ellipse(250, 245, 30, 35);
ellipse(250, 245, 40, 45);
ellipse(250, 245, 50, 55);
ellipse(250, 245, 60, 65);
ellipse(250, 245, 70, 75);


//curls
stroke(170, 107, 61);
strokeWeight(0.5);

ellipse(220, 240, 5, 5);
ellipse(220, 240, 10, 10);
ellipse(220, 240, 15, 15);
ellipse(220, 240, 20, 20);
ellipse(220, 240, 25, 25);
ellipse(220, 240, 30, 30);

ellipse(235, 220, 5, 5);
ellipse(235, 220, 10, 10);
ellipse(235, 220, 15, 15);
ellipse(235, 220, 20, 20);
ellipse(235, 220, 25, 25);
ellipse(235, 220, 30, 30);

ellipse(260, 220, 5, 5);
ellipse(260, 220, 10, 10);
ellipse(260, 220, 15, 15);
ellipse(260, 220, 20, 20);
ellipse(260, 220, 25, 25);
ellipse(260, 220, 30, 30);

ellipse(275, 240, 5, 5);
ellipse(275, 240, 10, 10);
ellipse(275, 240, 15, 15);
ellipse(275, 240, 20, 20);
ellipse(275, 240, 25, 25);
ellipse(275, 240, 30, 30);

stroke(0);
strokeWeight(0.5);
//legs
line(220, 350, 200, 390);
line(280, 350, 300, 390);

//left arm
line(230, 300, 195, 300);
line(195, 300, 195, 270);
line(195, 270, 180, 270);

//right arm
line(270, 300, 305, 300);
line(305, 300, 305, 270);
line(305, 270, 320, 270);

