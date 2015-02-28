
size(640,360);
background(124,160,197);

noStroke();
//BIG RED QUAD
fill(246,45,39);
quad(0,263, 638,103, 639,0, 0,0);

fill(25,25,27);
//arc(345,309, 722,716, radians (180), radians (390)); 
//ellipse(345,309, 722,716);
//ellipse(345,309, 707,461);
ellipse(344,355, 707,461);

//bottom left red
fill(237,34,32);
quad(150,250, 198,275, 164,359, 106,359);

//top pale yellow quad
stroke(0);
fill(217,213,193);
quad(150,250, 198,275, 302, 236, 254, 211);

//bottom yellow quad
noStroke();
quad(198,275, 302,236, 254, 359, 164,359);

//blue quad
fill(200, 199, 194);
quad(638,103, 341,174, 350,208, 639,141 );

//skinny red quad
fill(213,26,27);
quad(638,141, 350,208, 357,219, 640,153);

//tiny yellow triangle
fill(217,213,193);
 triangle(0,263, 28, 256, 0,334);


