
/*
 Konkuk University
 SOS iDesign
Name: KIM Youngji
 ID: 201420069

*/
//PImage img;

void setup(){
size (600, 600);
 // noLoop();
smooth();
colorMode (RGB, 255);
//img = loadImage ("HI.jpg");
 }

void draw(){
println(mouseX + " : " + mouseY);
//image (img, 0, 0);
if(mousePressed){
  fill(random(249),random(210),random(93));
  ellipse(mouseX, mouseY, 100, 100);
}

fill(255,255,255);
quad(427, 103, 431, 124, 408, 163, 390, 115);
quad(165, 158, 145, 126, 155, 111, 185, 125);

fill(76, 156, 243);
noStroke();
quad(392, 125, 178, 136, 189, 312, 396, 311);
quad(397, 309, 331, 332, 241, 307, 397, 292);
quad(190, 306, 211, 328, 329, 332, 313, 300);
stroke(76,156,243);
strokeWeight(5);
line(396, 310, 336, 329);
line(327, 331, 225, 328);
line(205, 324, 188, 307);
line(246, 333, 315, 335);
line(344, 330, 401, 307);
line(319, 333, 262, 333);

stroke(0);
fill(76, 156, 243);
bezier(391, 126, 416, 124, 423, 309, 396, 312);
bezier(397, 127, 363, 80, 196, 75, 179, 139);
bezier(179, 133, 150, 170, 155, 263, 192, 315);

strokeWeight(10);
fill(0);
line(303, 145, 343, 145);
line(240, 147, 284, 147);
bezier(240, 148, 238, 132, 280, 131, 285, 146);
bezier(302, 146, 304, 133, 341, 134, 344, 143);

strokeWeight(5);
line(215, 199, 208, 211);
line(228, 200, 218, 211);
line(240, 201, 234, 210);
line(347, 206, 340, 213);
line(357, 208, 351, 214);
line(372, 207, 366, 213);

noStroke();
fill(246, 95, 98);
quad(237, 233, 244, 265, 339, 266, 345, 239);

stroke(241, 255, 4);
line(363, 235, 350, 262);
line(346, 271, 323, 286);
line(320, 285, 282, 290);
line(262, 285, 233, 265);
line(331, 237, 258, 235);

noStroke();
fill(241, 255, 4);
quad(342, 249, 318, 265, 317, 287, 353, 263);
quad(317, 262, 279, 266, 268, 291, 319, 285);
line(322, 284, 287, 291);
line(322, 284, 352, 263);
quad(255, 258, 279, 265, 272, 290, 232, 266);
quad(222, 243, 230, 267, 254, 259, 242, 242);
quad(251, 235, 344, 236, 343, 223, 249, 222);
quad(252, 234, 241, 243, 221, 243, 257, 220);
quad(334, 223, 343, 272, 362, 230, 340, 221);

noFill();
stroke(0);
bezier(224, 249, 240, 315, 357, 301, 363, 239);
bezier(224, 249, 218, 242, 240, 213, 278, 225);
bezier(363, 239, 368, 225, 339, 217, 311, 225);

strokeWeight(5);
stroke(0);
noFill();
bezier(344, 236, 344, 242, 247, 239, 251, 236);
bezier(344, 237, 341, 275, 245, 275, 242, 244);
line(252, 236, 242, 243);
line(313, 225, 278, 224);
noStroke();
fill(75, 155, 242);
quad(86, 326, 67, 304, 45, 310, 69, 366);
quad(45, 310, 41, 360, 76, 361, 86, 328);
quad(76, 363, 44, 363, 44, 347, 82, 342);
quad(497, 349, 484, 313, 503, 295, 539, 314);
quad(518, 292, 505, 295, 528, 310, 537, 303);
stroke(0);

line(81, 325, 87, 326);
fill(75, 155, 242);

bezier(42, 335, 23, 338, 25, 360, 44, 362);
bezier(44, 362, 44, 369, 77, 371, 77, 363);
bezier(47, 312, 20, 307, 17, 339, 42, 335);
bezier(67, 305, 44, 278, 24, 300, 48, 312);
bezier(67, 305, 68, 277, 93, 280, 81, 326);
bezier(485, 317, 475, 276, 498, 271, 505, 297);
bezier(505, 297, 527, 262, 544, 277, 526, 299);
bezier(527, 300, 549, 290, 559, 311, 535, 318);
bezier(535, 318, 556, 321, 561, 345, 494, 350);

strokeWeight(3);
stroke(240, 249, 228);
line(159, 387, 87, 369);
line(383, 479, 224, 480);
line(413, 380, 494, 352);
line(462, 371, 491, 355);
line(455, 373, 421, 380);

noStroke();
fill(240, 249, 228);

quad(80, 366, 173, 390, 177, 375, 86, 348);
quad(85, 336, 117, 379, 132, 371, 83, 359);
quad(199, 323, 407, 378, 385, 480, 182, 387);
quad(183, 385, 117, 378, 151, 346, 219, 346);
quad(397, 319, 345, 330, 345, 394, 418, 358);
quad(350, 332, 252, 334, 258, 367, 370, 367);
quad(383, 480, 203, 480, 182, 388, 408, 377);
quad(87, 325, 79, 364, 182, 388, 96, 331);
quad(107, 333, 182, 330, 207, 354, 115, 372);
quad(202, 324, 190, 315, 176, 325, 196, 343);
quad(403, 320, 392, 316, 387, 375, 408, 382);
quad(434, 328, 397, 315, 409, 378, 453, 376);
quad(486, 319, 430, 326, 451, 376, 493, 352);
quad(211, 481, 247, 523, 264, 524, 272, 487);
quad(268, 487, 269, 500, 333, 501, 335, 486); 
quad(327, 487, 330, 526, 350, 529, 379, 483);
strokeWeight(3);
stroke(194, 48, 32);
line(245, 523, 210, 481);
strokeWeight(3);
line(350, 526, 378, 482);

stroke(194, 48, 32);
noFill();
strokeWeight(6);
bezier(485, 323, 484, 334, 393, 334, 395, 314);
bezier(190, 314, 195, 338, 94, 348, 87, 329);

stroke(0);
strokeWeight(6);
line(293, 356, 293, 482);
strokeWeight(3);
line(271, 501, 329, 501);
line(271, 501, 265, 523);
line(329, 501, 329, 526);
line(265, 523, 247, 525);
line(247, 525, 207, 480);
line(329, 526, 350, 528);
line(350, 528, 383, 480);
line(87, 326, 78, 362);
line(486, 317, 495, 350);
line(291, 335, 293, 356);
noFill();
bezier(384, 480, 385, 486, 203, 486, 203, 479);

stroke(0);
strokeWeight(4);
bezier(407, 375, 413, 379, 389, 484, 383, 481);
bezier(203, 480, 200, 479, 179, 378, 183, 380);
bezier(183, 386, 182, 400, 79, 374, 78, 362);
bezier(190, 311, 200, 336, 83, 338, 87, 326);
bezier(486, 317, 483, 332, 391, 328, 397, 311);
bezier(495, 350, 500, 365, 411, 395, 407, 377);
bezier(397, 310, 396, 340, 193, 349, 190, 311);
bezier(348, 342, 349, 355, 230, 370, 230, 348);

fill(250, 0, 0);
bezier(264, 523, 265, 535, 248, 536, 246, 524);
bezier(329, 524, 327, 537, 347, 539, 349, 528);
stroke(255,0,0);
strokeWeight(15);
line(366, 379, 351, 380);
strokeWeight(10);
line(342, 363, 346, 367);
line(353, 360, 357, 364);
line(364, 361, 368, 365);

strokeWeight(5);
stroke(0);
fill(250,250,250);
ellipse(261, 177, 40, 50);
ellipse(323, 177, 40, 50);

float mx1= constrain(mouseX,251,270);
float mx2= constrain(mouseX,321,330);
float my= constrain(mouseY,161,185);
 
fill(0);
ellipse(mx1, my, 10, 20);
ellipse(mx2, my, 10, 20);
 }
 
void keyPressed(){
 }

