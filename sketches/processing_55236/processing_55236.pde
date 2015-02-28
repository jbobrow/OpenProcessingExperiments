
size(400,400);

background(0, 141, 53);

smooth();
noStroke();

fill(73, 49, 30);
rect(0, 320, 400, 80);


fill(193, 62, 24);
triangle(200, 140, 250, 50, 150, 50); //Head

fill(255, 73, 22);
triangle(190, 50, 200, 80, 210, 50); //head diamond colour

stroke(237, 95, 24, 160);
fill(65, 98, 149);
triangle(210, 70, 230, 70, 210, 90); //Right Eye
triangle(190, 70, 170, 70, 190, 90); //Left Eye

noStroke();
fill(237, 95, 24);
triangle(250, 50, 230, 10, 230, 50); //Right Ear

triangle(150, 50, 170, 10, 170, 50); // Left Ear

fill(0);
stroke(1);
triangle(200, 140, 210, 120, 190, 120); //nose

noStroke();

fill(237, 95, 24);

triangle(200, 140, 240, 200, 160, 200); //Shoulders
rect(160, 200, 80, 100); //body


fill(193, 62, 24);
rect(240, 260, 50, 20);
rect(290, 260, -20, -30);
quad(270, 230, 290, 240, 310, 210, 285, 210);
rect(285, 210, 50, 20);
rect(335, 210, -30, -30); 
triangle(335, 180, 320, 160, 305, 180); //tail shape

fill(237, 95, 24);
triangle(335, 230, 320, 210, 305, 230); 
fill(255, 73, 22);
triangle(313, 170, 320, 160, 327, 170); //tail details colour

fill(193, 62, 24);
triangle(240, 300, 200, 300, 220, 320);
triangle(160, 300, 200, 300, 180, 320); //Paws


//ellipseMode(CORNER);
//ellipse(130, 200, 60, 100);

arc(160, 200, 30, 100, PI, HALF_PI); //CAN'T GET THIS!



triangle(160, 200, 190, 220, 160, 240);
ellipseMode(CORNER);
ellipse(148, 200, 20, 40);
fill(255, 73, 22);
triangle(160, 240, 180, 260, 160, 280);

fill(193, 62, 24);
triangle(240, 200, 210, 220, 240, 240);
ellipse(229, 200, 20, 40);
fill(255, 73, 22);
triangle(240, 240, 220, 260, 240, 280);



















