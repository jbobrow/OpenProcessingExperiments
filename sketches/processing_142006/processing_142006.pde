
/*
 Konkuk University
 SOS iDesign

Name: CHAE Seo Rin <<------ Write your full name here!
 ID: 201420110 <<--------- Write your ID here!

*/

PImage img;

void setup(){
size (600, 600);
 // noLoop();
smooth();
colorMode (RGB, 255);
//img = loadImage("totoro.jpg");
 }

void draw(){
  println(mouseX + " : " + mouseY);
  //image (img, 0, 0);
  
  noFill();
  bezier(229, 48, 215, 62, 211, 97, 213, 136);
  bezier(213, 136, 217, 147, 218, 150, 220, 157);
  bezier(220, 157, 195, 181, 181, 212, 175, 245);
  bezier(175, 245, 148, 279, 132, 312, 119, 353);
  bezier(119, 353, 111, 387, 111, 439, 128, 488);
  
  line(128, 488, 128, 512);
  line(128, 512, 131, 511);
  line(131, 511, 134, 507);
  line(134, 507, 136, 517);
  line(136, 517, 139, 517);
  line(139, 517, 140, 512);
  
  bezier(140, 512, 147, 535, 157, 563, 171, 577);
  bezier(171, 577, 175, 580, 178, 588, 185, 599);
  bezier(194, 596, 192, 590, 189, 580, 193, 573);
  
  line(193, 573, 187, 557);
  bezier(187, 557, 188, 552, 192, 551, 196, 555);
  line(196, 555, 200, 567);
  bezier(200, 567, 197, 572, 194, 573, 193, 573);
  bezier(200, 567, 204, 559, 212, 554, 219, 553);
  bezier(219, 553, 225, 548, 233, 557, 239, 566);
  bezier(239, 566, 242, 576, 245, 588, 243, 599);
  
  line(204, 559, 200, 544);
  bezier(200, 544, 201, 535, 205, 537, 207, 541);
  line(207, 541, 212, 554);
  line(219, 553, 218, 537);
  bezier(218, 537, 220, 532, 223, 534, 225, 538);
  line(225, 538, 225, 551);
  
  bezier(245, 590, 261, 585, 277, 581, 287, 581);
  bezier(287, 581, 300, 581, 308, 583, 317, 585);
  bezier(317, 585, 313, 588, 312, 593, 311, 599);
  bezier(317, 586, 320, 573, 325, 568, 336, 563);
  bezier(336, 563, 343, 561, 352, 564, 361, 569);
  bezier(361, 569, 368, 573, 374, 578, 375, 590);
  
  line(375, 590, 378, 599);
  line(328, 567, 328, 548);
  bezier(328, 548, 329, 545, 333, 543, 337, 544);
  line(337, 545, 337, 562);
  line(345, 562, 349, 545);
  bezier(349, 545, 352, 541, 355, 539, 357, 546);
  line(357, 546, 351, 565);
  line(359, 568, 363, 553);
  bezier(363, 553, 367, 552, 371, 551, 372, 557);
  line(372, 557, 366, 572);
  
  bezier(377, 594, 389, 569, 395, 545, 397, 525);
  bezier(397, 525, 395, 513, 388, 496, 379, 490);
  bezier(379, 491, 352, 494, 342, 500, 333, 512);
  bezier(333, 512, 326, 526, 319, 547, 318, 561);
  bezier(318, 561, 319, 567, 319, 571, 320, 575);
  
  bezier(171, 577, 165, 558, 163, 539, 163, 523);
  bezier(163, 523, 176, 500, 188, 496, 206, 497);
  bezier(206, 497, 217, 505, 228, 515, 236, 530);
  bezier(236, 530, 243, 546, 243, 559, 241, 574);
  bezier(140, 512, 140, 486, 140, 469, 141, 453);
  bezier(141, 453, 142, 437, 145, 417, 150, 392);
  
  bezier(150, 392, 157, 365, 162, 344, 175, 325);
  bezier(175, 325, 190, 306, 210, 291, 224, 281);
  bezier(224, 281, 243, 275, 269, 271, 293, 271);
  bezier(293, 271, 315, 273, 332, 275, 344, 283);
  bezier(344, 283, 359, 293, 372, 306, 390, 329);
  bezier(390, 329, 396, 338, 405, 354, 412, 375);
  bezier(412, 375, 416, 393, 408, 411, 415, 435);
  bezier(415, 435, 415, 468, 408, 501, 411, 512);
  bezier(411, 512, 406, 522, 401, 550, 381, 586);
  bezier(144, 413, 147, 382, 151, 358, 160, 332);
  bezier(410, 368, 403, 340, 401, 324, 402, 311);
  bezier(229, 48, 240, 59, 246, 76, 250, 93);
  bezier(250, 93, 250, 109, 249, 126, 250, 140);
  bezier(250, 140, 267, 133, 286, 132, 302, 133);
  bezier(302, 133, 313, 136, 320, 136, 325, 138);
  bezier(325, 138, 324, 118, 324, 103, 327, 93);
  bezier(327, 93, 334, 76, 340, 62, 350, 51);
  bezier(350, 51, 360, 57, 364, 73, 365, 93);
  bezier(365, 93, 361, 116, 353, 134, 352, 158);
  bezier(352, 158, 361, 170, 370, 200, 378, 218);
  bezier(378, 218, 382, 235, 389, 260, 400, 262);
  bezier(400, 262, 408, 275, 419, 297, 428, 315);
  bezier(428, 315, 435, 338, 441, 359, 444, 379);
  bezier(444, 379, 445, 405, 443, 435, 433, 480);
  line(433, 480, 433, 502);
  line(433, 502, 430, 502);
  line(430, 502, 425, 495);
  line(425, 495, 423, 503);
  line(423, 503, 422, 504);
  line(422, 504, 417, 493);
  line(417, 493, 411, 498);
  bezier(184, 344, 196, 329, 214, 317, 222, 316);
  bezier(222, 316, 232, 325, 230, 333, 217, 332);
  bezier(217, 332, 212, 332, 202, 340, 186, 350);
  line(186, 350, 184, 344);
  bezier(254, 323, 261, 313, 272, 305, 282, 300);
  bezier(282, 300, 289, 304, 296, 310, 302, 320);
  bezier(302, 320, 301, 325, 295, 323, 290, 319);
  bezier(290, 319, 279, 319, 271, 323, 261, 330);
  bezier(261, 330, 257, 330, 254, 327, 254, 323);
  bezier(322, 327, 328, 319, 337, 311, 344, 310);
  bezier(344, 310, 346, 310, 354, 316, 360, 323);
  bezier(360, 323, 364, 334, 365, 340, 361, 341);
  bezier(361, 341, 355, 337, 350, 328, 343, 327);
  bezier(343, 327, 336, 327, 331, 331, 325, 333);
  line(325, 333, 322, 327);
  bezier(168, 391, 172, 385, 179, 375, 184, 369);
  bezier(184, 369, 191, 363, 198, 366, 204, 371);
  bezier(204, 371, 207, 378, 196, 380, 190, 379);
  bezier(190, 379, 181, 386, 174, 391, 168, 391);
  bezier(227, 373, 230, 364, 239, 356, 247, 352);
  bezier(247, 352, 252, 351, 255, 352, 262, 359);
  bezier(262, 359, 267, 369, 262, 372, 254, 369);
  bezier(254, 369, 251, 366, 244, 368, 238, 371);
  bezier(238, 371, 235, 375, 230, 373, 227, 373);
  bezier(287, 366, 288, 357, 296, 349, 304, 345);
  bezier(304, 345, 312, 345, 318, 350, 325, 358);
  bezier(325, 358, 326, 364, 323, 368, 318, 368);
  bezier(318, 368, 311, 363, 305, 362, 299, 365);
  bezier(299, 365, 295, 367, 289, 368, 287, 366);
  bezier(350, 373, 351, 365, 359, 360, 366, 356);
  bezier(366, 356, 372, 355, 377, 362, 381, 367);
  bezier(381, 367, 382, 369, 387, 383, 385, 387);
  bezier(385, 387, 376, 378, 367, 372, 359, 373);
  bezier(359, 373, 359, 376, 354, 379, 350, 373);
  
 
  line(135, 200, 204, 211);
  stroke(0);
  strokeWeight(3);
  line(116, 220, 196, 226);
  line(119, 249, 190, 241);
  line(361, 210, 413, 190);
  line(364, 220, 429, 222);
  line(366, 232, 432, 243);
  
  fill(255);
  ellipseMode(CENTER);
  ellipse(230, 196, 30, 35);
  ellipseMode(CENTER);
  ellipse(340, 196, 30, 35);
  
  float mx1 = constrain (mouseX, 219, 241);
  float mx2 = constrain (mouseX, 330, 353);
 
  
  fill(0);
  ellipseMode(CENTER);
  ellipse(mx1, 196, 10, 10);
  ellipseMode(CENTER);
  ellipse(mx2, 196, 10, 10);
  
  
  ellipseMode(CENTER);
  ellipse(288, 200, 30, 10);
  
  if(mousePressed){
    fill(random(255), random(255), random(225));
    ellipse (mouseX, mouseY, 50, 50);
  }
  

   
    
  }

  
  

