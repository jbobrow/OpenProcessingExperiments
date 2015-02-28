
size(600, 450);
background(227,217,208);

smooth();

// cross hatch filling

noStroke();
fill(222, 179, 167);
quad(140, 315, 190, 316, 187, 366, 137, 365);

fill(189, 86, 83);
quad(188, 368, 237, 368, 238, 417, 187, 417);

fill(232, 231, 241);
quad(189, 315, 237, 315, 236, 364, 188, 363);

quad(135, 363, 187, 364, 185, 414, 132, 414);

//stroke back on to black
stroke(0);

// cross hatch virtical

strokeWeight(4);
strokeCap(SQUARE);
line(130, 450, 142, 228);
line(185, 450, 194, 226);
line(236, 450, 241, 234);

// cross hatch horizontal

line(58, 311, 309, 318);
line(55, 363, 308, 369);
line(51, 418, 311, 418);

//black box under the yellow and blue circles

noStroke();
fill(0);
quad( 491, 245, 466, 200, 495, 186, 518, 228);

//turn on stroke
stroke(0);
//yellow circle

strokeWeight(3);
fill( 230, 195, 68);
ellipse( 537, 226, 95, 95);

//little blue circle

noStroke();
fill(62, 141, 190);
ellipse( 537, 226, 75, 75);


//black box OVER the yellow and blue circles

noStroke();
fill(0, 110);
quad( 491, 245, 466, 200, 495, 186, 518, 228);

//Offset Circles


//turn on stroke
stroke(0);

// smaller black lines from left to right

strokeWeight(4);
line( -3, 73, 115, -3);

strokeWeight(3);
line( 303, 39, 385, 151);

line( 397, -3, 517, 228);

// line connected to the one previous

line( 517, 228, 492, 246);

line( 439, -3, 585, 280);

strokeWeight(4);
line( 473, -3, 602, 241);

line( 514, -3, 602, 159);

//black lines that go opposite direction to previous ones

line( 524, 19, 450, 100);

line( 488, -3, 423, 46);


//black boxes

noStroke();
fill(0);
quad( 283, 212, 318, 193, 347, 238, 314, 257);

quad( 427, 312, 456, 296, 472, 323, 443, 340);

quad( 475, 291, 498, 277, 514, 301, 488, 316);

quad( 553, 296, 587, 280, 605, 311, 570, 330);


//stroke back on
stroke(0);

// Orange triangles/quads from left to right

strokeWeight(2);
fill(213, 136, 45);
quad( 175, -3, 219, -3, -3, 125, -3, 114);

strokeWeight(3);
quad( 230, -3, 278, -3, -3, 162, -3, 152);

quad( 304, 30, -3, 214, -3, 221, 316, 47);

triangle( 342, 33, 562, 383, 371, 18);


//white box background

//details under the circle

noStroke();
fill( 4, 19, 31);
quad( 215, 9, 228, 28, 239, 22, 227, 2);

//white box

stroke(0);
strokeWeight(3);
fill(225);
quad( 227, 0, 240, 19, 277, -2, 242, -5);

//black line over white box detail

line( 247, -2, 255, 13);

strokeWeight(1);
line( 253, 8, 270, -2);

line( 252, 5, 264, -2);

line( 250, 2, 258, -3);

// main black lines
stroke(0);
strokeWeight(14);
line( 77, -3, -7, 246);
strokeWeight(16);
line( 111, -6, 373, 352);

//White Circle

strokeWeight(5);
fill(224);
ellipse( 498, 374, 75, 75);

//textured black square part 1

fill(0);
quad( 384, 153, 335, 181, 365, 227, 414, 200);


// blue circle

strokeWeight(1);
stroke(62, 75, 103);
fill(13, 87, 169, 210);
ellipse(174, 46, 140, 140);

// tiny line over circle

strokeWeight(2);
stroke(0);
line( 208, -2, 237, 44);



