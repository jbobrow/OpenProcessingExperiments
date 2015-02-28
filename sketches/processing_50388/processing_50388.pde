

size(500, 500);
smooth();
background(228, 220, 197);

// bottom right
fill(222, 68, 57);
noStroke();
quad(254,385, 500,350, 500,387, 318,500);

// upper right

fill(53, 48, 42);
noStroke();
quad(314,54, 346,44, 345,48, 313,58);

fill(162,123,60);
noStroke();
quad(346,44, 500,166, 500,170, 345,48);

fill(223, 204, 155);
noStroke();
quad(313,58, 345,48, 500,170, 500,214);

// upper left

fill(45, 45, 42);
noStroke();
quad(0,27, 122,0, 132,41, 0,68);

// brown shape

fill(184, 157, 146);
stroke(153);
quad(40,334, 192,286, 250,328, 100,380);

fill(45, 45, 42);
stroke(153);
quad(40,334, 100,380, 100,395, 30,343);

noFill();
stroke(153);
quad(208,353 , 220,412, 212,414, 201,356);

fill(73,63,58);
stroke(153);
triangle(201,356, 212,414, 152,370);


fill(223, 204, 155);
stroke(153);
quad(100,380,  250,328,  250,343, 100,395);








// big blue square
noStroke();
fill(120, 160, 200);
stroke(153);
quad(0,50, 104,28, 180, 325, 0,370);

//lines
fill(52,44,42);
noStroke();
quad(34,262, 500,157, 500,166, 37,272);

fill(225, 68, 53);
stroke(153);
quad(276,163, 500,130, 500,137, 276,172);

fill(52,44,42);
stroke(153);
quad(270,160, 276,163, 276,172, 270,169);

noFill();
stroke(153);
quad(270,160, 500,124,500,137,276,172);


//arches

stroke(222, 68, 57);
strokeWeight(55);
strokeCap(SQUARE);
arc(-160,-180, 800,800, radians(30), radians(75));

