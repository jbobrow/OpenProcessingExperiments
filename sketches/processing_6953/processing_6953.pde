
size(600, 450);
background(227,217,208);

smooth();

//White background-----------------------------------------------

fill(255);
noStroke();
quad( 305, 29, 413, 203, 551, 204, 418, -30);

fill(255);
quad( 436, -3, 603, 306, 603, 161, 515, -3);

//White background---------------------------------------------END



// cross hatch filling ------------------------------------------

noStroke();
fill(222, 179, 167);
quad(140, 315, 190, 316, 187, 366, 137, 365);

fill(189, 86, 83);
quad(188, 368, 237, 368, 238, 417, 187, 417);

fill(232, 231, 241);
quad(189, 315, 237, 315, 236, 364, 188, 363);

quad(135, 363, 187, 364, 185, 414, 132, 414);

// cross hatch filling --------------------------------------END

//stroke back on to black
stroke(0);

// cross hatch virtical------------------------------------------

strokeWeight(4);
strokeCap(SQUARE);
line(130, 450, 142, 228);
line(185, 450, 194, 226);
line(236, 450, 241, 234);

// cross hatch horizontal----------------------------------------

line(58, 311, 309, 318);
line(55, 363, 308, 369);
line(51, 418, 311, 418);

// cross hatch horizontal-------------------------------------END

//YELLOW AND BLUE CIRCLES WITH BOX-------------------------------

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

//YELLOW AND BLUE CIRCLES WITH BOX----------------------------END


//TEXTURED BLACK SQUARE WITH RED AND PURPLE CIRCLES---------------
//textured black square part 1

fill(0);
quad( 384, 153, 335, 181, 365, 227, 414, 200);



//Offset Circles

//red one
noStroke();
fill(196, 74, 48);
ellipse( 411, 230, 95, 95);


//purple one
noStroke();
fill(170, 155, 176);
ellipse( 416, 227, 85, 85);

//line that goes over the circle
//turn stroke on

stroke(0);
strokeWeight(3);
line( 413, 200, 365, 226);

//black square over the other one
noStroke();
fill(0, 110);
quad( 384, 153, 335, 181, 365, 227, 414, 200);

//white triangles

fill(255);
triangle( 356, 181, 362, 180, 363, 176);

triangle( 382, 175, 384, 178, 391, 176);
triangle( 370, 173, 378, 173, 378, 168);
triangle( 357, 196, 361, 204, 363, 198);
triangle( 357, 192, 362, 195, 366, 192);
triangle( 363, 186, 369, 189, 376, 185);
triangle( 383, 186, 379, 191, 383, 190);
triangle( 378, 178, 379, 174, 373, 178);
triangle( 382, 167, 392, 170, 387, 171);
triangle( 392, 162, 387, 163, 386, 159);
triangle( 383, 182, 388, 182, 385, 184);
triangle( 347, 192, 350, 193, 349, 196);
triangle( 350, 200, 352, 203, 355, 201);
triangle( 371, 198, 374, 198, 370, 194);

//TEXTURED BLACK SQUARE WITH RED AND PURPLE CIRCLES-------------END



//turn on stroke
stroke(0);

//CIRCLES AND CLUSTERFUDGE UP IN TOP RIGHT CORNER-------------------

//orange circle on the bottom
strokeWeight(1);
fill(223, 146, 63);
ellipse( 489, 7, 110, 110);

//bluish circle ontop

strokeWeight(5);
fill(219, 229, 212);
ellipse( 489, -20, 125, 125);

//blue quad

noStroke();
fill(61, 76, 78);
quad( 478, 6, 499, 48, 524, 18, 508, -11);

//green quad

fill(170, 170, 118);
quad(440, -2, 451, 24, 475, 5, 471, -2);

//triangle fill

fill(0);
triangle( 472, -1, 478, 5, 482, -1);

//CIRCLES AND CLUSTERFUDGE UP IN TOP RIGHT CORNER---------------END

//turn stroke on
stroke(0);

//TEXTURED BOXES WITH DOTS----------------------------------------

//lines to make box from top to bottom

strokeWeight(3);
line( 589, 140, 560, 162);

line( 580, 198, 603, 183);

//dots

strokeWeight(1);

ellipse( 444, 34, 2, 2);
ellipse( 449, 36, 2, 2);
ellipse( 449, 42, 2, 2);
ellipse( 444, 43, 2, 2);
ellipse( 441, 38, 2, 2);
ellipse( 442, 45, 2, 2);
ellipse( 437, 43, 2, 2);
ellipse( 432, 43, 2, 2);
ellipse( 433, 48, 2, 2);
ellipse( 428, 48, 2, 2);
ellipse( 430, 53, 2, 2);
ellipse( 437, 51, 2, 2);
ellipse( 441, 48, 2, 2);
ellipse( 444, 44, 2, 2);
ellipse( 448, 41, 2, 2);
ellipse( 455, 43, 2, 2);
ellipse( 451, 45, 2, 2);
ellipse( 448, 49, 2, 2);
ellipse( 444, 52, 2, 2);
ellipse( 438, 55, 2, 2);
ellipse( 434, 59, 2, 2);
ellipse( 437, 65, 2, 2);
ellipse( 444, 59, 2, 2);
ellipse( 448, 55, 2, 2);
ellipse( 451, 51, 2, 2);
ellipse( 458, 52, 2, 2);
ellipse( 455, 54, 2, 2);
ellipse( 453, 58, 2, 2);
ellipse( 448, 62, 2, 2);
ellipse( 444, 66, 2, 2);
ellipse( 438, 66, 2, 2);
ellipse( 438, 70, 2, 2);
ellipse( 444, 67, 2, 2);
ellipse( 443, 71, 2, 2);
ellipse( 449, 70, 2, 2);
ellipse( 446, 84, 2, 2);
ellipse( 451, 86, 2, 2);
ellipse( 450, 93, 2, 2);
ellipse( 449, 70, 2, 2);
ellipse( 442, 76, 2, 2);
ellipse( 445, 81, 2, 2);
ellipse( 449, 81, 2, 2);
ellipse( 447, 62, 2, 2);
ellipse( 443, 66, 2, 2);
ellipse( 449, 71, 2, 2);
ellipse( 449, 77, 2, 2);
ellipse( 454, 81, 2, 2);
ellipse( 456, 87, 2, 2);
ellipse( 453, 57, 2, 2);
ellipse( 448, 63, 2, 2);
ellipse( 453, 65, 2, 2);
ellipse( 458, 67, 2, 2);
ellipse( 455, 72, 2, 2);
ellipse( 453, 75, 2, 2);
ellipse( 459, 81, 2, 2);
ellipse( 448, 89, 2, 2);
ellipse( 455, 54, 2, 2);
ellipse( 458, 49, 2, 2);
ellipse( 460, 57, 2, 2);
ellipse( 453, 59, 2, 2);
ellipse( 457, 61, 2, 2);
ellipse( 461, 63, 2, 2);
ellipse( 466, 64, 2, 2);
ellipse( 463, 72, 2, 2);
ellipse( 465, 76, 2, 2);
ellipse( 462, 79, 2, 2);
ellipse( 456, 77, 2, 2);
ellipse( 470, 70, 2, 2);
ellipse( 469, 65, 2, 2);
ellipse( 465, 61, 2, 2);
ellipse( 463, 55, 2, 2);
ellipse( 461, 51, 2, 2);
ellipse( 458, 48, 2, 2);
ellipse( 454, 40, 2, 2);

//dots for smaller square

ellipse( 587, 148, 2, 2);
ellipse( 586, 152, 2, 2);
ellipse( 589, 155, 2, 2);
ellipse( 593, 159, 2, 2);
ellipse( 593, 163, 2, 2);
ellipse( 598, 164, 2, 2);
ellipse( 595, 166, 2, 2);
ellipse( 599, 169, 2, 2);
ellipse( 596, 172, 2, 2);
ellipse( 595, 176, 2, 2);
ellipse( 598, 177, 2, 2);
ellipse( 598, 180, 2, 2);
ellipse( 594, 183, 2, 2);
ellipse( 592, 175, 2, 2);
ellipse( 588, 172, 2, 2);
ellipse( 592, 175, 2, 2);
ellipse( 587, 166, 2, 2);
ellipse( 588, 162, 2, 2);
ellipse( 585, 157, 2, 2);
ellipse( 581, 153, 2, 2);
ellipse( 581, 158, 2, 2);
ellipse( 576, 154, 2, 2);
ellipse( 573, 157, 2, 2);
ellipse( 575, 165, 2, 2);
ellipse( 582, 166, 2, 2);
ellipse( 582, 166, 2, 2);
ellipse( 581, 158, 2, 2);
ellipse( 581, 161, 2, 2);
ellipse( 583, 164, 2, 2);
ellipse( 587, 166, 2, 2);
ellipse( 587, 173, 2, 2);
ellipse( 587, 177, 2, 2);
ellipse( 587, 183, 2, 2);
ellipse( 590, 187, 2, 2);
ellipse( 585, 187, 2, 2);
ellipse( 588, 190, 2, 2);
ellipse( 582, 192, 2, 2);
ellipse( 579, 188, 2, 2);
ellipse( 576, 183, 2, 2);
ellipse( 577, 178, 2, 2);
ellipse( 582, 176, 2, 2);
ellipse( 583, 172, 2, 2);
ellipse( 580, 170, 2, 2);
ellipse( 576, 164, 2, 2);
ellipse( 572, 168, 2, 2);
ellipse( 570, 172, 2, 2);
ellipse( 573, 177, 2, 2);
ellipse( 578, 177, 2, 2);
ellipse( 564, 162, 2, 2);
ellipse( 567, 167, 2, 2);
ellipse( 576, 168, 2, 2);
ellipse( 572, 158, 2, 2);


//TEXTURED BOXES WITH DOTS--------------------------------------END

// 2 QUADS WITH THE ORANGE QUAD THAT ARE DARKER GRAY--------------

noStroke();
fill( 224, 217, 217);
quad( 305, 32, 316, 47, 370, 18, 359, -4);

// 2 QUADS WITH THE ORANGE QUAD THAT ARE DARKER GRAY------------END

//stroke back on
stroke(0);

//BLACK LINES FROM LEFT TO RIGHT----------------------------------
// smaller black lines from left to right

strokeWeight(4);
line( -3, 73, 115, -3);

strokeWeight(3);
line( 316, 47, 414, 200);

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

//lines to finish the 3rd orange quad

strokeWeight(3);
line( 363, -3, 303, 31);

line( 315, 48, 406, -3);

//seperationlines 

line( 330, 15, 342, 32);

line( 371, 17, 360, -3);

//BLACK LINES FROM LEFT TO RIGHT--------------------------------END


//black boxes-----------------------------------------------------

noStroke();
fill(0);
quad( 283, 212, 318, 193, 347, 238, 314, 257);

quad( 427, 312, 456, 296, 472, 323, 443, 340);

quad( 475, 291, 498, 277, 514, 301, 488, 316);

quad( 553, 296, 587, 280, 605, 311, 570, 330);


//black boxes---------------------------------------------------END

//stroke back on
stroke(0);

// Orange triangles/quads from left to right-----------------------

strokeWeight(2);
fill(213, 136, 45);
quad( 175, -3, 219, -3, -3, 125, -3, 114);

strokeWeight(3);
quad( 230, -3, 278, -3, -3, 162, -3, 152);

quad( 304, 30, -3, 214, -3, 221, 316, 47);

triangle( 342, 33, 562, 383, 371, 18);

// Orange triangles/quads from left to right--------------------END

//white box background


//SAMURAI LOOKING HANDLE SWORD PART THING-------------------------
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

//SAMURAI LOOKING HANDLE SWORD PART THING-----------------------END

// main black lines-----------------------------------------------
stroke(0);
strokeWeight(14);
line( 77, -3, -7, 246);
strokeWeight(16);
line( 111, -6, 373, 352);

// main black lines--------------------------------------------END


//White Circle----------------------------------------------------

strokeWeight(5);
fill(224);
ellipse( 498, 374, 75, 75);
//White Circle-------------------------------------------------END

//BLUE CIRCLE AND DETAILS OVER IT---------------------------------
// blue circle

strokeWeight(1);
stroke(62, 75, 103);
fill(13, 87, 169, 210);
ellipse(174, 46, 140, 140);

// tiny line over circle

strokeWeight(2);
stroke(0);
line( 208, -2, 237, 44);
//BLUE CIRCLE AND DETAILS OVER IT-------------------------------END













