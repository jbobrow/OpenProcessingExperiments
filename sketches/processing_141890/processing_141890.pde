
/*
 Konkuk University
 SOS iDesign

Name: JANG jin seon <<------ Write your full name here!
 ID: 201420105 <<--------- Write your ID here!

*/

PImage img;

void setup(){
size (600, 600);
 // noLoop();
smooth();
colorMode (RGB, 600);
 img = loadImage ("kandinski.jpg"); // put the image in the same folder as the processing file
 }

void draw(){
println(mouseX + " : " + mouseY);
image (img, 0, 0);
// here you add your code with all shapes and colors. 
point (130, 479);

line (247, 338, 486, 296);

stroke (0,0, 0);
strokeWeight (7);
strokeCap(ROUND);
fill(255, 198, 228);
bezier (330,274, 330, 275, 352, 280, 348, 268);

noStroke ();
fill(30, 30, 30);
ellipse (90, 98, 160, 160);

noStroke ();
fill (160, 93, 200);
ellipse (90, 98, 80, 80);


stroke(0,0,0);
strokeWeight (3); 
fill (230, 150, 90);
quad (169, 371, 195, 385, 212, 360, 185, 335);

stroke(0,0,0);
strokeWeight (2);
noFill();
rect(369, 482, 70, 30);

stroke(0,0,0);
strokeWeight (2);
fill (600, 600, 600);
quad (185, 332, 213, 358, 226, 342, 192, 316);

stroke(0,0,0);
strokeWeight (2);
fill (160, 202, 155);
quad (194, 314, 227, 341, 242, 317, 200, 297);

stroke(0,0,0);
strokeWeight (2);
fill (600, 600, 600);
quad (199, 296, 240, 319, 254, 303, 210, 276);

stroke (0,0,0);
strokeWeight (2);
fill (15, 15, 15);
quad (209, 275, 253, 303, 263, 286, 220, 246);

stroke (0,0,0);
strokeWeight (1);
fill ( 530, 500, 0);
ellipse ( 70, 387, 60, 60);


}
