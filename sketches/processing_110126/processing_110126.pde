
size(640, 480);
background(228, 221, 202);
//circle

fill(0);
ellipse(230,270, 270, 270);

//quad
noStroke();
fill(163, 159, 147, 200);
quad(210,60, 420,270, 560, 270, 280,-15);

//line above circle
stroke(0);
strokeWeight(3);
line(100, 150, 440, 150);

//grey line downwards
stroke(100, 100);
line(420, 130, 420, 360);

//thin line across the circle
strokeWeight(1);
stroke(100, 100);
line(100, 150, 390, 440);

//thin line
line(390, 440, 240, 440);

//cross

strokeWeight(2);
stroke(200);
fill(80);
rect(270, 410, 12, 60);

fill(0);
rect(250,440, 50, 12);

//cube
noStroke();
fill(0);
rect(300,127, 23, 23);

fill(163, 159, 147);
quad(220, 70, 300,150, 300,127, 220, 50);

fill(228, 221, 202);
quad(220,50, 240, 50, 323, 127, 300, 127);



