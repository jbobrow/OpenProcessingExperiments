
size(400, 600);
smooth();

// Hair
noStroke();
fill(57, 34, 5);
// right side
arc(250,387,150,500,radians(270), radians(450));
arc(250, 280, 150, 300, radians(230), radians(405));
// top
arc(200, 200, 200, 150, radians(180), radians(360));
//left side
arc(150, 387, 150, 500, radians(90), radians(270));

// Face
fill(252, 197, 125);
ellipse(200, 300, 215, 300);

//Hair
fill(57,34,5);
arc(310,260,40,200,radians(45),radians(230));
arc(150,635,40,400,radians(230),radians(405));

// Eyes
stroke(1);
fill(255);
//left eye
arc(150, 270, 40, 20, radians(180), radians(360));
arc(150, 270, 40, 20, radians(0), radians(180));
//right eye
arc(250, 270, 40, 20, radians(180), radians(360));
arc(250, 270, 40, 20, radians(0), radians(180));

fill(0);
//left pupil
ellipse(149, 269, 20, 20);  
//right pupil
ellipse(249, 269, 20, 20); 

// Nose
line(190, 280, 180, 335);
fill(252, 197, 125);
arc(192, 335, 25, 10, radians(0), radians(180));
//line(180,320,200,320);

// Mouth
fill(219, 66, 66);
strokeWeight(1);
arc(194, 375, 55, 35, radians(0), radians(180));
line(170, 375, 188, 360);
line(200, 360, 218, 375);
line(170, 375, 188, 375);
line(200, 375, 218, 375);
line(188, 375, 195, 379);
line(200, 375, 195, 379);
line(188, 360, 195, 365);
line(200, 360, 195, 365);
triangle(188, 360, 205, 375, 170, 375);
triangle(200, 360, 218, 375, 188, 375);

//Eyebrows
stroke(67, 52, 52);
noFill();
strokeWeight(5);
arc(150, 250, 50, 20, radians(180), radians(360));
arc(250, 250, 50, 20, radians(180), radians(360));

//Eyeshadow
arc(150, 267, 40, 20, radians(180), radians(360));
arc(250, 267, 40, 20, radians(180), radians(360));





