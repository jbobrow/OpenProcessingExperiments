
//COPYRIGHT FARYAL KHALID LOGO//
size(400, 400);
//Color
background(170, 255, 170);

// Rhombus
noStroke();
fill(111, 227, 255, 70);
quad(200, -50, 450, 200, 200, 450, -50, 200);
fill(100, 100, 100, 30);
quad(200, -15, 415, 200, 200, 415, -15, 200);
stroke(255);
quad(200, -90, 490, 200, 200, 490, -90, 200);

//K
fill(15,108,183,40);
noStroke();
triangle(100, 84, 190, -5, 320, 295);

fill(15,108,183,40);
noStroke();
triangle(150, 134, 400, 220, 320, 295);

stroke(255,90);
strokeWeight(25);
strokeCap(SQUARE);
line(100, 83, 318, 298);

//F
stroke(15,108,183,40);
strokeWeight(25);
strokeCap(SQUARE);
line(-15, 200,85, 100);

stroke(15,108,183,40);
strokeWeight(25);
strokeCap(SQUARE);
line(-15, 300,95, 190);
 

stroke(255,90);
strokeWeight(25);
strokeCap(SQUARE);
line(200, 415, 60, 275);

saveFrame("hw1.jpg");


 



