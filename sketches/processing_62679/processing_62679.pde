
size (640, 480);
smooth();
background(200, 200, 170);
noStroke();
fill(160, 170, 160);

// top right triangle swatch
triangle(0, 0, 640, 400, 640, 0);

// light skin horizontal bar top
fill(222, 178, 149);
quad(66, 32,  438, 51,  437, 89,  109, 74);

// blue swatch
fill(40, 90, 116);
quad(212, 364,  309, 373,  306, 480,  235, 480);

// red swatch right
fill(190, 48, 50);
quad(410, 392,  500, 402,  504, 480,  411, 480);
quad(500, 402,  538, 401,  554, 430,  500, 428);

// grey swatch over red swatch bottom
fill(154, 156, 140);
quad(171, 416,  222, 417,  220, 480,  171, 480);
//grey swatch to right
rect(288, 433,  45, 47);
//grey swatch bottom left
rect(0, 447,  38, 32);

//lines
stroke(50);
strokeWeight(4);
line(0, 25,  73, 19);
noStroke();

stroke(50);
strokeWeight(4);
line(0, 86,  584, 50);
noStroke();

stroke(50);
strokeWeight(4);
line(0, 117,  640, 102);
noStroke();

stroke(50);
strokeWeight(4);
line(0, 163, 640, 199);
noStroke();

stroke(50);
strokeWeight(4);
line(0, 245, 531, 270);
noStroke();

stroke(50);
strokeWeight(4);
line(0, 261, 409,424);
noStroke();

stroke(50);
strokeWeight(4);
line(0, 363, 640, 382);
noStroke();

stroke(50);
strokeWeight(4);
line(0, 390, 640, 405);
noStroke();

stroke(50);
strokeWeight(4);
line(0, 390, 229, 480);
noStroke();

stroke(50);
strokeWeight(4);
line(12, 449,640, 476);
noStroke();

stroke(50);
strokeWeight(4);
line(12, 449,18, 480);
noStroke();

stroke(50);
strokeWeight(4);
line(410, 108,  412, 200);
noStroke();

stroke(50);
strokeWeight(4);
line(54, 466, 54, 480);
noStroke();

stroke(50);
strokeWeight(4);
line(221, 158, 236, 316);
noStroke();

stroke(50);
strokeWeight(4);
line(253, 164, 233, 453);
noStroke();

stroke(50);
strokeWeight(4);
line(446, 106,449, 201);
noStroke();

stroke(27, 54, 125);
strokeWeight(6);
line(105, 0,  237, 480);
noStroke();

stroke(27, 54, 125);
strokeWeight(6);
line(543, 85,  625, 480);
noStroke();

// purple swatch middle
fill(42, 62, 120);
quad(369, 200,  475, 204,  529, 353,  400, 347); 

// orange circles
fill(215, 115, 53);
ellipse(128, 232, 144, 144);
ellipse(362, 262, 147, 147);
ellipse(603, 282, 145, 145);


// green swatches left
fill(53, 97, 64);
quad(0, 0,  25, 0,  112, 57,  112, 70);
fill(55, 110, 70, 200);
quad(0, 0,  112, 70,  120, 444,  0, 393);

// pink swatch upper right
fill(185, 84, 115);
quad(528, 0,  640, 0,  640, 180,  522, 158);

//purple diagonal line on right
stroke(27, 54, 125);
strokeWeight(6);
line(543, 85,  625, 480);
noStroke();

// red rectangle hortizontal, top right
fill(190, 48, 50, 120);
rect(413, 5, 128, 23);

// brown bar left
fill(100, 67, 45);
quad(0, 53,  488, 151,  129, 98,  0, 71);

// brown bar lower left
fill(77, 43, 34);
quad(0, 345,  61, 355,  63, 368,  0, 357);

// white bar across
fill(210, 220, 212);
quad(126, 82,  635, 179,  635, 225,  126, 142);

// line over white bar
stroke(50);
strokeWeight(4);
line(628, 49,  637,225);
noStroke();

//steel blue bar thin top left
fill(77, 97, 106);
quad(55, 0,  252, 134,  246, 139,  44, 0);

//red swatch under orange bar
fill(192, 44, 48);
quad(162, 402,  233, 403,  248, 431,  164, 428);

// orange bars
fill(220, 115, 50);
quad(2, 140,  25, 135,  120, 480,  95, 480);
quad(80, 172,  100, 167,  186, 480,  160,  480);
quad(225, 390,  247, 400,  225, 480,  200, 480);
quad(297, 423,  323, 432,  308, 480,  280, 480);

//line over orange bars
stroke(50);
strokeWeight(4);
line(54, 466, 335, 470);
noStroke();

// small white bar below diamonds
fill(188, 210, 216);
rect(58, 273,  86, 32); 
//orange shape
fill(220, 115, 50);
quad(129, 273,  134, 285,  125, 300,  112, 300);
quad(112, 300, 110, 288,  121, 273,  129, 277);

// red swatch bottom left
fill(188, 44, 54);
quad(0, 410,  35, 413,  36, 450,  0, 448);

// purple cross on orange circle
fill(74, 44, 84);
rect(372, 251,  11, 93);
rect(332, 292,  127, 12);

// blue swatch and diamonds, left
fill(64, 152, 205);
rect(60, 178,  87, 32);
quad(94, 216,  110, 225,  94, 237,  79, 227);
quad(94, 243,  111, 255,  96, 265,  78, 254);
quad(103, 239, 117, 228,  134, 239,  117, 250);

// the following function control stroke thickness
strokeWeight(8);
noFill();
stroke(0);

// reference to processing website for
// details and explaination.
bezier(10, 500, -80, 400, 430, 0, 439, -5);

// line over orange bars

stroke(50);
strokeWeight(4);
line(335, 480, 335, 470);
noStroke();

stroke(50);
strokeWeight(4);
line(253, 164, 233, 453);
noStroke();

/* boldest line in foreground
noFill();
stroke(20);
ellipse(600, 400, 1200, 800);
*/




