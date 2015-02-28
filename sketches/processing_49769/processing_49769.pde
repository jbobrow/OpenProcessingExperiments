
// 2012-01-20
// Week1 – Class Demo
// Arc

size(600,600);
smooth();

strokeWeight(15);
strokeCap(SQUARE);

noFill();

//arc(300,300, 100,100, 0,HALF_PI); // degree is measure in radians

// PI -- 3.14 -- 180deg -- radians(180)

arc(300,300, 100,100, radians(30),radians(80)); // degree is measure in radians
arc(300,300, 150,150, radians(70),radians(105));
arc(300,300, 200,200, radians(60),radians(175));
arc(300,300, 250,250, radians(270),radians(350));
arc(300,300, 300,300, radians(180),radians(210));

