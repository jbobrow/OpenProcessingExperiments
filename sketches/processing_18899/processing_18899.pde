
/* Project 1: Draw for DMA 28 Winter 11 by Faustine Chia */

size(640,480);
background(#E7F3EF);
smooth();


/* blue circular bg */
fill(#15296E);
// ellipse(640, 0,  1510, 962.5);
quad(0, 263,  640, 480,  640, 0,  0, 0);
bezier(0, 262,  135, 362,  476, 502,  666, 478);


/* white line */
stroke(165); 
strokeWeight(2);
fill(#E7F3EF);
beginShape();
vertex(241, 0);
vertex(310, 0);
vertex(49, 480);
vertex(0, 480);
vertex(0, 449);
endShape(CLOSE);


/* white tube-looking thing */
strokeWeight(0.5);
stroke(100);
quad(386, 0,  294, 171,  347, 200,  461, 0); // longest rect
quad(279, 157,  365, 203,  351, 227,  265, 180); // longer rect
quad(337, 140,  325, 161,  368, 185,  380, 164); // smaller rect 
line(350, 147,  338, 168); // stripe 1
line(356, 150,  344, 172); // stripe 2
line(362, 155,  355, 169); // square side 1
line(355, 169,  372, 179); // square side 2


/* top rectangular prism */
noStroke();
fill(#6A89A8); // blue-top face
beginShape();
vertex(225, 0);
vertex(154, 127);
vertex(211, 159);
vertex(299, 0);
endShape(CLOSE);

fill(#12051A); // black face
quad(154, 127,
     212, 160,
     209, 245,
     152, 215);

fill(#1D405B); // dark blue face
quad(299, 0,
     350, 0,
     209, 245,
     211, 159);
  
  
/* Red Weird Shape */
stroke(#353B43);
fill(#CB0117);
beginShape();
vertex(56, 427);
vertex(50, 480); // bottom
vertex(545, 480);
vertex(550, 411); // 1st ridge 
vertex(503, 409); 
vertex(503, 428);
vertex(502, 429); // 2nd ridge
vertex(476, 428);
vertex(476, 410);
vertex(417, 408);
vertex(416, 409); // 3rd ridge
vertex(416, 419);
vertex(406, 419);
vertex(408, 419);
vertex(407, 416);
vertex(407.5, 405);
vertex(395, 404);
vertex(394, 415);
vertex(380, 414); // step 1 edge
vertex(377, 442);
vertex(321, 435); // step 2 edge
vertex(320, 448);
vertex(258, 442); // step 3 edge
vertex(255, 470);
vertex(84, 450); // left-most ridge
vertex(85, 429);
endShape(CLOSE);

 
/* front-red 3D box */
fill(#D5969E); // white faces
// fill(#B18083);
beginShape();
vertex(129, 171);
vertex(132, 178);
vertex(216, 226);
vertex(226, 211); //
vertex(226, 204);
endShape(CLOSE);

fill(#CB0117); // red face
quad(216, 221,  226, 204,  138, 154,  129, 171); 


/* top-3rd 3D box */
fill(#697E99); // blue face
quad(200, 120,  199, 136,  211, 116,  211, 99);
fill(#12051A); // black face
quad(200, 120,  211, 99,  168, 75,  152, 92);
fill(#CB0117); // red face
quad(153, 110,  199, 136,   200, 119,  153, 93); 


/* top-2nd 3D box */
fill(#446085); // darker blue face
// quad(153, 91,  183, 105,  182, 90,  152, 77); 
quad(153, 90,  182, 105,  183, 91,  153, 77); 
fill(#273744); // darkest blue face
quad(182, 105,  182, 91,  194, 75,  194, 90);
fill(#7C92AA); // lightest blue face
quad(153, 77,  183, 91,  194, 75,  164, 63);
//quad(151, 91,  200, 188,  212, 99,  162, 78); 212, 126


/* top-1st 3D box */
fill(#0B1320); // black face 
quad(155, 59,  165, 64,  172, 55,  161, 49);
fill(#526E84); // blue face
quad(155, 59,  154, 73,  165, 77,  165, 64);
fill(#C9E2E6); // light blue face
quad(165, 64,  165, 77,  171, 71,  172, 55);


/* side-3D multi-color box */
fill(#CB0117); // red face
quad(297, 67,  316, 76,   341, 29,  322, 18); 
fill(#D0F0EF); // light blue
quad(316, 76,  317, 105,  296, 93,  296, 67); 
fill(#12051A); // black face
quad(316, 76,  341, 29,  346, 54,  317, 105);


/* cut-off boxes */
noStroke();
fill(#12051A); // dark blue face
quad(340, 0,  340, 11,  357, 19,  356, 0);
fill(#566385); // blue face 
quad(357, 19,  356, 0,   367, 0,  367, 4);

fill(#CB0117); // red face
quad(367, 0,  367, 4,  397, 19,  397, 0);
fill(#625863); // blue face
quad(397, 0,  397, 19,  405, 8,  405, 0); 

fill(#2D4358); // blue face
quad(405, 0,  405, 8,  411, 8,  411, 0);
fill(#06091C); // dark blue face
quad(411, 0,  411, 8,  416, 3,  416, 0);


