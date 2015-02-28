
/*
Nathan Stetter
Homework #1
ART 3001: Internet Art

This program will draw an abstract duck with the use of triangles ellipses
and rectangles only
*/


//begin BACKGROUND
size(650, 800);
background(255, 204, 0);

fill(221, 166, 0);
noStroke();
rect(0, 600, 650, 200);
//end BACKGROUND

//begin DUCK
stroke(193, 164, 0);
strokeWeight(2);

//legs
fill(242, 227, 128);
rect(200, 680, 100, 60);
rect(300, 680, 100, 60);

//feet
fill(244, 218, 44);
rect(200, 740, 110, 15);
rect(310, 740, 110, 15);

//main body
fill(255, 231, 79);
strokeWeight(10);
ellipse(325, 550, 350, 350);

strokeWeight(5);
fill(239, 226, 141);
rect(145, 520, 140, 50);
rect(345, 540, 170, 30);

//left wing bottom
strokeWeight(4);
fill(244, 218, 44);
triangle(80, 250, 285, 470, 300, 250);
//left wing top
fill(249, 239, 172);
strokeWeight(2);
triangle(100, 220, 285, 470, 300, 220);

//right wing bottom
fill(244, 218, 44);
strokeWeight(5);
triangle(440, 255, 300, 560, 300, 255);
//right wing top
fill(249, 239, 172);
strokeWeight(3);
triangle(400, 230, 325, 560, 300, 230);

//arms
fill(255, 247, 201);
strokeWeight(6);
triangle(25, 400, 320, 360, 320, 400);
triangle(625, 430, 320, 370, 330, 410);

//sternum triangle
strokeWeight(5);
triangle(300, 200, 275, 570, 375, 570);



//head
fill(255, 247, 201);
ellipse(355, 160, 120, 120);
fill(255, 240, 147);
strokeWeight(4);
rect(295, 140, 125, 40);

//neck
strokeWeight(3);
triangle(305, 230, 300, 180, 325, 180);

//crown
strokeWeight(4);
triangle(295, 140, 335, 140, 290, 100);
triangle(380, 140, 418, 140, 430, 85);
triangle(340, 140, 418, 140, 380, 65);
triangle(308, 140, 370, 140, 340, 60);

//nose
fill(255, 247, 201);
triangle(420, 150, 420, 180, 438, 180);

//eyes
triangle(390, 140, 400, 140, 395, 150);

//teeth
triangle(420, 180, 410, 180, 415, 190);
triangle(410, 180, 400, 180, 405, 190);
triangle(400, 180, 390, 180, 395, 190);
triangle(390, 180, 380, 180, 385, 190);



//end DUCK
