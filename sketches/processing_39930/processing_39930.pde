
//Spaghetti code

size(500,600);
background(240);

//Arduino Board
noStroke();
fill(0,146,159);
rect(100,100, 325, 380);
quad(120, 480, 348, 480, 332, 498, 140, 498);

//ac/dc connector
stroke(0);
fill(0);
rect(128, 90, 49, 90); //cap
rect(125, 85, 55, 20); //large rect

//grey usb connector
noStroke();
fill(110);
rect(300, 60, 70, 100);

//shapes on the board
fill(0, 102, 102);
rect(195, 130, 35, 40);
rect(243, 135, 17, 6); //barrita up
rect(264, 123, 22, 30);

rect(215, 220, 32, 25);
rect(245, 265, 22, 10);

//more shapes
rect(177, 200, 14, 27);
rect(179, 243, 12, 20);


// cutted line
rect(273, 168, 6, 10);
rect(273, 186, 6, 10);
rect(273, 208, 6, 10);
rect(273, 230, 6, 10);
rect(273, 253, 6, 10);

rect(200, 230, 6, 10);
rect(200, 253, 6, 10);


rect(273, 340, 6, 10);
rect(310, 203, 6, 10); // besides ellipse
rect(295, 265, 6, 10); // under ellipse

rect(323, 216, 20, 20); // cuadrado sobre luces
rect(255, 335, 6, 18);

rect(301, 441, 20, 9); // rect besides light (down)



//Ellipse
ellipse(296, 208, 15, 50);
fill(255);
ellipse(115, 195, 18, 18);
ellipse(408, 195, 18, 18);
ellipse(148, 480, 18, 18);
ellipse(320, 480, 18, 18);

//more lines (up - right)
fill(0, 102, 102);
rect(320, 186, 6, 10);
rect(329, 186, 18, 10);
rect(350, 186, 6, 10);
rect(372, 186, 6, 10);
rect(375, 145, 6, 10);

//more rects, middle left
rect(180, 280, 58, 185);

//more ellipses - green cirrcles
ellipse(135, 233, 35, 35);
ellipse(135, 275, 35, 35);

//inputs/outputs
fill(50);
rect(109, 298, 15, 80);
rect(109, 392, 15, 80);
rect(400, 365, 15, 107);
rect(400, 256, 15, 100);
fill(0);
rect(113, 302, 7, 7);
rect(113, 314, 7, 7);
rect(113, 327, 7, 7);
rect(113, 341, 7, 7);
rect(113, 355, 7, 7);
rect(113, 367, 7, 7);
// next line
rect(113, 396, 7, 7);
rect(113, 408, 7, 7);
rect(113, 422, 7, 7);
rect(113, 436, 7, 7);
rect(113, 448, 7, 7);
rect(113, 461, 7, 7);
// next line - right
rect(404, 370, 7, 7);
rect(404, 385, 7, 7);
rect(404, 400, 7, 7);
rect(404, 415, 7, 7);
rect(404, 432, 7, 7);
rect(404, 446, 7, 7);
rect(404, 461, 7, 7);
// next line - right - up
rect(404, 258, 7, 7);
rect(404, 270, 7, 7);
rect(404, 280, 7, 7);
rect(404, 295, 7, 7);
rect(404, 310, 7, 7);
rect(404, 332, 7, 7);
rect(404, 345, 7, 7);

//Push Button
fill(120);
rect(255, 400, 33, 33);
fill(55);
ellipse(271, 416, 18, 18);

//LED's - up
fill(90);
ellipse(315, 265, 6, 20);
ellipse(327, 265, 6, 20);
ellipse(350, 265, 6, 20);
ellipse(327, 445, 6, 20);
fill(255, 204, 0);
rect(313, 262, 6, 6);
rect(325, 262, 6, 6);
rect(347, 262, 6, 6);
rect(325, 442, 6, 6);

// Black connectors (down)
fill(50);
rect(254, 459, 13, 30);
rect(268, 459, 13, 30);
rect(282, 459, 13, 30);

fill(120);
rect(257, 462, 7, 7);//left pair
rect(257, 477, 7, 7);

rect(271, 462, 7, 7);//middle pair
rect(271, 477, 7, 7);

rect(285, 462, 7, 7);//right pair
rect(285, 477, 7, 7);

