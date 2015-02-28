
float x;
float y;
float z;
float w;
float targetX;
float easing = 0.05;
float easing2= 0.04;
float easing3 = 0.06;
float easing4 = 0.03;

void setup()
{
  size(640, 480);
  smooth();
}

void draw()
{
  background (135, 206, 250);
noStroke();

targetX = mouseX;
float dx = targetX - x;
if (abs(dx)>1){
  x+=dx*easing;
}

targetX = mouseX;
float dx2 = targetX - x;
if (abs(dx2)>1){
  y+=dx2*easing2;
}

targetX = mouseX;
float dx3 = targetX - x;
if (abs(dx3)>1){
  z+=dx3*easing3;
}

targetX = mouseX;
float dx4 = targetX - x;
if (abs(dx4)>1){
  w+=dx4*easing4;
}

//sand
fill (223, 188, 151);
beginShape();
quad(0, 120,   0, 480,   640, 480,   640, 120);

//back wave  
  fill(0, 255, 255);
  beginShape();
  quad(0, 340,   (x), 340,     (mouseX-200), 120,   0, 120);
    fill(255);  
  quad(  x-(x/2), 340,   (x), 340,     (mouseX-200), 120,    (mouseX-330), 120);  
  endShape();
  
  beginShape();
  //  ellipse((x-270), 120, 10, 10);
    ellipse((x-68), 310, 30, 30);
   ellipse((x-70), 280, 60, 60);
    ellipse((x-80), 260, 80, 80);
       ellipse((y-60), 230, 60, 60);
            ellipse((x-70), 270, 40, 40);
     ellipse((y-88), 200, 30, 30);
      ellipse((x-70), 320, 80, 80);
            ellipse((x-20), 320, 60, 60);
      ellipse((x), 320, 50, 50);
      ellipse((x-60), 280, 30, 30);
     ellipse((x-80), 250, 40, 40);
       ellipse((y-50), 220, 60, 60);
 //   quad(x, 340,   (x-175), 340,     (w-105), 480,    w, 480);
  ellipse((y), 290, 40, 40);
    ellipse((y), 250, 30, 30);
     ellipse((x-30), 280, 50, 50);
 /*    ellipse((x), 480, 80, 80);
       ellipse((y), 380, 60, 60);
            ellipse((z), 430, 70, 70);
     ellipse((z), 440, 70, 70);
       ellipse((z), 390, 80, 80);
            ellipse((w), 460, 80, 80);
       ellipse((w), 400, 30, 30);
            ellipse((w+10), 350, 40, 40);
     ellipse((w), 420, 40, 40);
       ellipse((w), 380, 60, 60);
       
         ellipse((y-70), 400, 50, 50);
    ellipse((y-68), 470, 50, 50);
     ellipse((x-70), 420, 60, 60);
     ellipse((x-80), 460, 80, 80);
       ellipse((y-60), 430, 60, 60);
            ellipse((z-70), 370, 80, 80);
     ellipse((z-68), 500, 70, 70);
       ellipse((z-70), 400, 80, 80);
            ellipse((w-70), 490, 60, 60);
       ellipse((w-80), 390, 30, 30);
            ellipse((w-60), 380, 70, 70);
     ellipse((w-80), 450, 40, 40);
       ellipse((w-50), 420, 30, 30);
       
              ellipse((y-110), 380, 50, 50);
    ellipse((y-108), 450, 50, 50);
     ellipse((x-110), 400, 60, 60);
     ellipse((x-120), 460, 80, 80);
       ellipse((y-100), 360, 60, 60);
            ellipse((z-130), 340, 50, 50);
     ellipse((z-108), 500, 70, 70);
       ellipse((z-130), 400, 40, 40);
            ellipse((w-110), 490, 60, 60);
       ellipse((w-140), 390, 30, 30);
            ellipse((w-100), 380, 70, 70);
     ellipse((w-120), 450, 40, 40);
       ellipse((w-90), 420, 30, 30);
  endShape ();
  */
  
  
  
//mermaid rect
//  fill(150, 90, 110);
 //beginShape();
 // quad(120, 320,  240, 320,  240, 240,  120, 240);
  //endShape();
  
  
  //hair back
      fill(66, 43, 19);
  beginShape();
  quad(60, 100,   130, 120,  130, (180+(mouseX/5)),    60, (180+mouseX/5));
  endShape();
  
  
  
  //mermaid arms and shoulders
//  stroke(66, 43, 19);
 // strokeWeight(1);
  fill(255, 160, 127);
  beginShape();
  vertex(80, 185);
  vertex(76, 195);
  vertex(70, 202);
  vertex(50, 215);
  vertex(40, 220);
  vertex(35, 230);
  vertex(35, 320);
  vertex(102, 360);
  vertex(112, 368);
  vertex(118, 380);
  vertex(124, 382);
  vertex(154, 383);
  vertex(155, 382);
  vertex(154, 381);
  vertex(145, 381);
  vertex(120, 376);
  vertex(145, 380);
  vertex(120, 376);
  vertex(145, 380);
  vertex(161, 380);
  vertex(162, 378);
  vertex(160, 376);
  vertex(144, 375);
  vertex(122, 370);
  vertex(144, 375);
  vertex(160, 376);
  vertex(159, 370);
  vertex(157, 369);
  vertex(135, 370);
  vertex(124, 365);
  vertex(135, 370);
  vertex(155, 365);
  vertex(155, 363);
  vertex(150, 363);
  vertex(135, 362);
  vertex(133, 361);
  vertex(125, 354);
  vertex(129, 357);
  vertex(139 ,360);
  vertex(151, 359);
  vertex(140, 354);
  vertex(130, 350);
vertex(112, 345);
vertex(59, 309);
vertex(59, 223);
vertex(59, 255);
vertex(68, 275);
vertex(155, 250);
vertex(145, 234);
vertex(195, 256);
vertex(205, 254);
vertex(225, 253);
vertex(260, 256);
vertex(260, 243);
vertex(207, 242);
vertex(166, 207);
vertex(157, 203);
vertex(141, 204);
vertex(117, 202);
vertex(117, 203);
vertex(107, 196);
vertex(103, 180);

endShape();


//legs
  fill(255, 160, 122);
beginShape();
vertex(220, 253);
vertex(220, 350);
vertex(282, 348);
vertex(367, 344);
vertex(430, 330);
vertex(477, 325);
vertex(498, 321);
vertex(501, 320);
vertex(520, 302);
vertex(501, 285);
vertex(485, 279);
vertex(475, 275);
vertex(327, 262);
vertex(285, 260);
vertex(270, 256);
endShape();


//bathing suit
fill(150, 90, 110);
beginShape();
vertex(65, 270);
vertex(82, 294);
vertex(86, 296);
vertex(112, 321);
vertex(140, 333);
vertex(178, 344);
vertex(198, 350);
vertex(220, 350);
vertex(225, 335);
vertex(231, 325);
vertex(240, 315);
vertex(250, 305);
vertex(236, 289);
vertex(227, 278);
vertex(222, 265);
vertex(220, 253);
vertex(205, 254);
vertex(180, 263);
vertex(160, 257);
vertex(145, 234);
vertex(135, 225);
vertex(125, 215);
vertex(115, 210);
vertex(110, 220);
vertex(108, 233);
vertex(106, 252);
vertex(96, 243);
vertex(85, 230);
vertex(73, 225);
vertex(70, 239);
vertex(69, 254);
vertex(68, 275);
endShape();


  //face shape
    fill(255, 160, 115);
  beginShape();
  vertex(60, 140);
   vertex(70, 178);
    vertex(89, 189);
     vertex(98, 202);
      vertex(103, 189);
       vertex(117, 170);
        vertex(125, 140);
         vertex(117, 110);
          vertex(70, 110);
          endShape();
          
          
//hair top
fill(139, 69, 19);
beginShape();
vertex(90, 98);
vertex(80, 92);
vertex(60, 98);
vertex(57, 103);
vertex(53, 113);
vertex(46, 122);
vertex(43, 134);
vertex(44, 141);
vertex(63, 141);
vertex(68, 134);
vertex(82, 122);
vertex(90, 117);
vertex(97, 122);
vertex(116, 141);
vertex(135, 141);
vertex(129, 117);
vertex(119, 103);
vertex(97, 92);
endShape();


//feet
fill(255, 160, 127);
beginShape();
vertex(520, 302);
vertex(501, 286);
vertex(485, 280);
vertex(475, 275);
vertex(500, 272);
vertex(518, 275);
vertex(523, 275);
vertex(535, 280);
vertex(542, 283);
vertex(544, 284);
vertex(545, 286);
vertex(547, 287);
vertex(545, 316);
vertex(543, 315);
vertex(539, 314);
vertex(532, 318);
vertex(520, 302);
vertex(529, 315);
vertex(540, 318);
vertex(542, 318);
vertex(545, 330);
vertex(543, 332);
vertex(541, 338);
vertex(539, 341);
vertex(537, 340);
vertex(535, 338);
vertex(531, 335);
vertex(510, 325);
vertex(490, 323);
endShape();



//feetgreen
beginShape();
 fill(85, 107,  45, (0+(mouseX-275)));
vertex(520, 302);
vertex(501, 286);
vertex(485, 280);
vertex(475, 275);
vertex(500, 272);
vertex(518, 275);
vertex(523, 275);
vertex(535, 280);
vertex(592, 283);
vertex(594, 284);
vertex(595, 286);
vertex(597, 287);
vertex(595, 316);
vertex(593, 315);
vertex(592, 314);
vertex(572, 318);
vertex(520, 302);
vertex(555, 307);
vertex(570, 323);
vertex(578, 327);
vertex(545, 330);
vertex(553, 332);
vertex(558, 338);
vertex(549, 341);
vertex(547, 340);
vertex(570, 338);
vertex(571, 355);
vertex(570, 355);
vertex(490, 323);
endShape();


//scales attempt
//if (mouseX>110);
//{
  beginShape();
  
  
  //23
     fill(90, 127,  50, (0+(mouseX-275)));
  ellipse(510, 300, 20, 20);
  
  
      //straight layer 22
        fill(85, 127,  50, (0+(mouseX-270)));
  ellipse(497, 314, 20, 20);
    fill(85, 107,  50, (0+(mouseX-270)));
  ellipse(500, 310, 20, 20);
         fill(90, 125,  50, (0+(mouseX-270)));
  ellipse(500, 295, 20, 20);
    fill(85, 107,  50, (0+(mouseX-270)));
  ellipse(497, 281, 20, 20);
  
  
             // straight layer21

      fill(90, 107,  50, (0+(mouseX-265)));
  ellipse(486, 316, 20, 20);
    fill(90, 127,  50, (0+(mouseX-265)));
  ellipse(485, 310, 20, 20);
         fill(90, 105,  50, (0+(mouseX-265)));
  ellipse(487, 295, 20, 20);
    fill(85, 127,  50, (0+(mouseX-265)));
  ellipse(485, 280, 20, 20);
  
    //straight layer 22
        fill(85, 127,  50, (0+(mouseX-260)));
  ellipse(475, 316, 20, 20);
    fill(85, 107,  50, (0+(mouseX-260)));
  ellipse(473, 310, 20, 20);
         fill(90, 125,  50, (0+(mouseX-260)));
  ellipse(475, 295, 20, 20);
    fill(85, 107,  50, (0+(mouseX-260)));
  ellipse(472, 281, 20, 20);
  
  
            // straight layer21

      fill(90, 107,  50, (0+(mouseX-255)));
  ellipse(461, 318, 20, 20);
    fill(90, 127,  50, (0+(mouseX-255)));
  ellipse(460, 310, 20, 20);
         fill(90, 105,  50, (0+(mouseX-255)));
  ellipse(460, 295, 20, 20);
    fill(85, 127,  50, (0+(mouseX-255)));
  ellipse(460, 280, 20, 20);
  
  //straight layer 20
        fill(85, 127,  50, (0+(mouseX-250)));
  ellipse(450, 318, 20, 20);
    fill(85, 107,  50, (0+(mouseX-250)));
  ellipse(447, 310, 20, 20);
         fill(90, 125,  50, (0+(mouseX-250)));
  ellipse(450, 295, 20, 20);
    fill(85, 107,  50, (0+(mouseX-250)));
  ellipse(447, 280, 20, 20);
  
  
          // straight layer19

      fill(90, 107,  50, (0+(mouseX-245)));
  ellipse(436, 320, 20, 20);
    fill(90, 127,  50, (0+(mouseX-245)));
  ellipse(435, 310, 20, 20);
         fill(90, 105,  50, (0+(mouseX-245)));
  ellipse(435, 295, 20, 20);
    fill(85, 127,  50, (0+(mouseX-235)));
  ellipse(435, 280, 20, 20);

  
    
       // straight layer18
 

      fill(85, 127,  50, (0+(mouseX-240)));
  ellipse(425, 322, 20, 20);
    fill(85, 107,  50, (0+(mouseX-240)));
  ellipse(422, 310, 20, 20);
         fill(90, 125,  50, (0+(mouseX-240)));
  ellipse(425, 295, 20, 20);
    fill(85, 107,  50, (0+(mouseX-240)));
  ellipse(422, 280, 20, 20);

  
  
         // straight layer17

      fill(90, 107,  50, (0+(mouseX-235)));
  ellipse(411, 325, 20, 20);
    fill(90, 127,  50, (0+(mouseX-235)));
  ellipse(410, 310, 20, 20);
         fill(90, 105,  50, (0+(mouseX-235)));
  ellipse(410, 295, 20, 20);
    fill(85, 127,  50, (0+(mouseX-235)));
  ellipse(410, 277, 20, 20);
           fill(90, 105,  50, (0+(mouseX-235)));
  ellipse(402, 277, 20, 20);
  
  
       // straight layer16
 
       fill(90, 105,  50, (0+(mouseX-230)));
  ellipse(397, 330, 20, 20);
      fill(85, 127,  50, (0+(mouseX-230)));
  ellipse(400, 325, 20, 20);
    fill(85, 107,  50, (0+(mouseX-230)));
  ellipse(397, 310, 20, 20);
         fill(90, 125,  50, (0+(mouseX-230)));
  ellipse(400, 295, 20, 20);
    fill(85, 107,  50, (0+(mouseX-230)));
  ellipse(397, 280, 20, 20);
           fill(90, 125,  50, (0+(mouseX-230)));
  ellipse(395, 274, 20, 20);
  
       // straight layer15
       fill(95, 105,  50, (0+(mouseX-225)));
  ellipse(385, 333, 20, 20);
      fill(90, 107,  50, (0+(mouseX-225)));
  ellipse(385, 325, 20, 20);
    fill(90, 127,  50, (0+(mouseX-225)));
  ellipse(385, 310, 20, 20);
         fill(90, 105,  50, (0+(mouseX-225)));
  ellipse(385, 295, 20, 20);
    fill(85, 127,  50, (0+(mouseX-225)));
  ellipse(385, 280, 20, 20);
           fill(90, 105,  50, (0+(mouseX-225)));
  ellipse(382, 273, 20, 20);
  
  
      // straight layer14
 
       fill(90, 105,  50, (0+(mouseX-220)));
  ellipse(373, 335, 20, 20);
      fill(85, 127,  50, (0+(mouseX-220)));
  ellipse(375, 325, 20, 20);
    fill(85, 107,  50, (0+(mouseX-210)));
  ellipse(372, 310, 20, 20);
         fill(90, 125,  50, (0+(mouseX-220)));
  ellipse(375, 295, 20, 20);
    fill(85, 107,  50, (0+(mouseX-220)));
  ellipse(372, 280, 20, 20);
           fill(90, 125,  50, (0+(mouseX-220)));
  ellipse(370, 273, 20, 20);
  
  
    
      // straight layer13
       fill(95, 105,  50, (0+(mouseX-215)));
  ellipse(360, 337, 20, 20);
      fill(90, 107,  50, (0+(mouseX-215)));
  ellipse(360, 325, 20, 20);
    fill(90, 127,  50, (0+(mouseX-215)));
  ellipse(360, 310, 20, 20);
         fill(90, 105,  50, (0+(mouseX-215)));
  ellipse(360, 295, 20, 20);
    fill(85, 127,  50, (0+(mouseX-215)));
  ellipse(360, 280, 20, 20);
           fill(90, 105,  50, (0+(mouseX-215)));
  ellipse(357, 272, 20, 20);
  
  
     // straight layer12
 
       fill(90, 105,  50, (0+(mouseX-210)));
  ellipse(348, 337, 20, 20);
      fill(85, 127,  50, (0+(mouseX-210)));
  ellipse(350, 325, 20, 20);
    fill(85, 107,  50, (0+(mouseX-210)));
  ellipse(347, 310, 20, 20);
         fill(90, 125,  50, (0+(mouseX-210)));
  ellipse(350, 295, 20, 20);
    fill(85, 107,  50, (0+(mouseX-210)));
  ellipse(347, 280, 20, 20);
           fill(90, 125,  50, (0+(mouseX-210)));
  ellipse(345, 272, 20, 20);
  
  
  
      // straight layer11
       fill(95, 105,  50, (0+(mouseX-205)));
  ellipse(335, 337, 20, 20);
      fill(90, 107,  50, (0+(mouseX-205)));
  ellipse(335, 325, 20, 20);
    fill(90, 127,  50, (0+(mouseX-205)));
  ellipse(335, 310, 20, 20);
         fill(90, 105,  50, (0+(mouseX-205)));
  ellipse(335, 295, 20, 20);
    fill(85, 127,  50, (0+(mouseX-205)));
  ellipse(335, 280, 20, 20);
           fill(90, 105,  50, (0+(mouseX-205)));
  ellipse(332, 271, 20, 20);
  
      // straight layer10
 
       fill(90, 105,  50, (0+(mouseX-200)));
  ellipse(323, 337, 20, 20);
      fill(85, 127,  50, (0+(mouseX-200)));
  ellipse(325, 325, 20, 20);
    fill(85, 107,  50, (0+(mouseX-200)));
  ellipse(322, 310, 20, 20);
         fill(90, 125,  50, (0+(mouseX-200)));
  ellipse(325, 295, 20, 20);
    fill(85, 107,  50, (0+(mouseX-200)));
  ellipse(322, 280, 20, 20);
           fill(90, 125,  50, (0+(mouseX-200)));
  ellipse(320, 270, 20, 20);

 
    // straight layer9
       fill(95, 105,  50, (0+(mouseX-195)));
  ellipse(310, 337, 20, 20);
      fill(90, 107,  50, (0+(mouseX-195)));
  ellipse(310, 325, 20, 20);
    fill(90, 127,  50, (0+(mouseX-195)));
  ellipse(310, 310, 20, 20);
         fill(90, 105,  50, (0+(mouseX-195)));
  ellipse(310, 295, 20, 20);
    fill(85, 127,  50, (0+(mouseX-195)));
  ellipse(310, 280, 20, 20);
           fill(90, 105,  50, (0+(mouseX-195)));
  ellipse(307, 269, 20, 20);
 
 
 
    // straight layer8
 
       fill(90, 105,  50, (0+(mouseX-190)));
  ellipse(298, 337, 20, 20);
      fill(85, 127,  50, (0+(mouseX-190)));
  ellipse(300, 325, 20, 20);
    fill(85, 107,  50, (0+(mouseX-190)));
  ellipse(297, 310, 20, 20);
         fill(90, 125,  50, (0+(mouseX-190)));
  ellipse(300, 295, 20, 20);
    fill(85, 107,  50, (0+(mouseX-190)));
  ellipse(297, 280, 20, 20);
           fill(90, 125,  50, (0+(mouseX-190)));
  ellipse(297, 267, 20, 20);
          fill(90, 105,  50, (0+(mouseX-190)));
  ellipse(295, 264, 20, 20);
  
   // straight layer7
       fill(95, 105,  50, (0+(mouseX-185)));
  ellipse(285, 337, 20, 20);
      fill(90, 107,  50, (0+(mouseX-185)));
  ellipse(285, 325, 20, 20);
    fill(90, 127,  50, (0+(mouseX-185)));
  ellipse(285, 310, 20, 20);
         fill(90, 105,  50, (0+(mouseX-185)));
  ellipse(285, 295, 20, 20);
    fill(85, 127,  50, (0+(mouseX-185)));
  ellipse(285, 280, 20, 20);
           fill(90, 105,  50, (0+(mouseX-185)));
  ellipse(282, 263, 20, 20);
 
   // straight layer6
 
       fill(90, 105,  50, (0+(mouseX-180)));
  ellipse(273, 339, 20, 20);
      fill(85, 127,  50, (0+(mouseX-180)));
  ellipse(275, 325, 20, 20);
    fill(85, 107,  50, (0+(mouseX-180)));
  ellipse(272, 310, 20, 20);
         fill(90, 125,  50, (0+(mouseX-180)));
  ellipse(275, 295, 20, 20);
    fill(85, 107,  50, (0+(mouseX-180)));
  ellipse(272, 280, 20, 20);
           fill(90, 125,  50, (0+(mouseX-180)));
  ellipse(272, 267, 20, 20);
          fill(90, 105,  50, (0+(mouseX-180)));
  ellipse(270, 264, 20, 20);
 
 
   // straight layer5
       fill(95, 105,  50, (0+(mouseX-175)));
  ellipse(260, 340, 20, 20);
      fill(90, 107,  50, (0+(mouseX-175)));
  ellipse(260, 325, 20, 20);
    fill(90, 127,  50, (0+(mouseX-175)));
  ellipse(260, 310, 20, 20);
         fill(90, 105,  50, (0+(mouseX-175)));
  ellipse(260, 295, 20, 20);
    fill(85, 127,  50, (0+(mouseX-175)));
  ellipse(260, 280, 20, 20);
           fill(90, 105,  50, (0+(mouseX-175)));
  ellipse(257, 263, 20, 20);
 
  // straight layer4
 
       fill(90, 105,  50, (0+(mouseX-170)));
  ellipse(248, 339, 20, 20);
      fill(85, 127,  50, (0+(mouseX-170)));
  ellipse(250, 325, 20, 20);
    fill(85, 107,  50, (0+(mouseX-170)));
  ellipse(247, 310, 20, 20);
         fill(90, 125,  50, (0+(mouseX-170)));
  ellipse(250, 295, 20, 20);
    fill(85, 107,  50, (0+(mouseX-170)));
  ellipse(247, 280, 20, 20);
           fill(90, 125,  50, (0+(mouseX-170)));
  ellipse(247, 267, 20, 20);
          fill(90, 105,  50, (0+(mouseX-170)));
  ellipse(245, 264, 20, 20);
 
 
  // straight layer3
       fill(95, 105,  50, (0+(mouseX-165)));
  ellipse(235, 342, 20, 20);
      fill(90, 107,  50, (0+(mouseX-165)));
  ellipse(235, 325, 20, 20);
    fill(90, 127,  50, (0+(mouseX-165)));
  ellipse(235, 310, 20, 20);
         fill(90, 105,  50, (0+(mouseX-165)));
  ellipse(235, 295, 20, 20);
    fill(85, 127,  50, (0+(mouseX-165)));
  ellipse(235, 280, 20, 20);
           fill(90, 105,  50, (0+(mouseX-165)));
  ellipse(232, 262, 20, 20);
 
  
 // straight layer2
 
       fill(90, 105,  50, (0+(mouseX-160)));
  ellipse(223, 339, 20, 20);
      fill(85, 127,  50, (0+(mouseX-160)));
  ellipse(225, 325, 20, 20);
    fill(85, 107,  50, (0+(mouseX-160)));
  ellipse(225, 310, 20, 20);
         fill(90, 125,  50, (0+(mouseX-160)));
  ellipse(225, 295, 20, 20);
    fill(85, 107,  50, (0+(mouseX-160)));
  ellipse(225, 280, 20, 20);
           fill(90, 125,  50, (0+(mouseX-160)));
  ellipse(225, 265, 20, 20);
          fill(90, 105,  50, (0+(mouseX-160)));
  ellipse(222, 262, 20, 20);
 
 
 // straight layer1
       fill(90, 105,  50, (0+(mouseX-155)));
  ellipse(210, 342, 20, 20);
      fill(85, 127,  50, (0+(mouseX-155)));
  ellipse(210, 325, 20, 20);
    fill(85, 127,  50, (0+(mouseX-155)));
  ellipse(210, 310, 20, 20);
         fill(90, 105,  50, (0+(mouseX-155)));
  ellipse(210, 295, 20, 20);
    fill(85, 127,  50, (0+(mouseX-155)));
  ellipse(210, 280, 20, 20);
           fill(90, 105,  50, (0+(mouseX-155)));
  ellipse(210, 265, 20, 20);
  
  //missing
        fill(85, 107,  50, (0+(mouseX-155)));
  ellipse(180, 340, 10, 10);
           fill(90, 125,  50, (0+(mouseX-155)));
  ellipse(180, 330, 10, 10);
      fill(85, 107,  50, (0+(mouseX-155)));
  ellipse(180, 320, 10, 10);
    fill(85, 127,  50, (0+(mouseX-155)));
  ellipse(180, 305, 10, 10);
  
         fill(90, 105,  50, (0+(mouseX-155)));
  ellipse(190, 337, 20, 20);
      fill(85, 127,  50, (0+(mouseX-155)));
  ellipse(190, 325, 20, 20);
    fill(85, 127,  50, (0+(mouseX-155)));
  ellipse(190, 310, 20, 20);
  
          fill(85, 127,  50, (0+(mouseX-155)));
  ellipse(200, 340, 10, 10);
           fill(90, 125,  50, (0+(mouseX-155)));
  ellipse(200, 330, 10, 10);
      fill(85, 127,  50, (0+(mouseX-155)));
  ellipse(200, 320, 10, 10);
    fill(85, 127,  50, (0+(mouseX-155)));
  ellipse(193, 305, 20, 20);
     fill(85, 127,  50, (0+(mouseX-155)));
  ellipse(203, 262, 15, 15);
 
 
      //layer 9
      fill(90, 105,  50, (0+(mouseX-150)));
  ellipse(167, 334, 10, 10);
   fill(85, 127,  50, (0+(mouseX-150)));
  ellipse(172, 328, 10, 10);
  fill(90, 105,  50, (0+(mouseX-150)));
  ellipse(175, 325, 10, 10);
  fill(85, 127,  45, (0+(mouseX-150)));
  ellipse(177, 322, 10, 10);
    fill(90, 103,  50, (0+(mouseX-150)));
  ellipse(182, 314, 10, 10);
      fill(85, 120,  40, (0+(mouseX-150)));
  ellipse(181, 317, 10, 10);
      fill(95, 100,  50, (0+(mouseX-150)));
  ellipse(185, 309, 10, 10);
 
 
       //layer8 

      fill(85, 100,  40, (0+(mouseX-145)));
  ellipse(167, 313, 10, 10);
      fill(95, 120,  50, (0+(mouseX-145)));
  ellipse(176, 303, 10, 10);
        fill(85, 105,  45, (0+(mouseX-145)));
  ellipse(181, 297, 10, 10);
          fill(90, 120,  50, (0+(mouseX-145)));
  ellipse(176, 290, 10, 10);
            fill(80, 105,  45, (0+(mouseX-145)));
  ellipse(191, 283, 10, 10);
              fill(85, 120,  50, (0+(mouseX-145)));
  ellipse(196, 276, 10, 10);
                fill(90, 105,  45, (0+(mouseX-145)));
  ellipse(201, 269, 10, 10);
    fill(90, 125,  45, (0+(mouseX-145)));
  ellipse(205, 268, 10, 10);
  
       //layer 7-2
 //     fill(90, 125,  50, (0+(mouseX-140)));
 // ellipse(152, 334, 20, 20);
   fill(85, 107,  50, (0+(mouseX-140)));
  ellipse(167, 332, 20, 20);
  fill(90, 125,  50, (0+(mouseX-140)));
  ellipse(160, 330, 20, 20);
  fill(85, 107,  45, (0+(mouseX-140)));
  ellipse(162, 328, 20, 20);
    fill(90, 123,  50, (0+(mouseX-140)));
  ellipse(157, 318, 20, 20);
      fill(85, 100,  40, (0+(mouseX-140)));
  ellipse(166, 323, 20, 20);
      fill(95, 120,  50, (0+(mouseX-140)));
  ellipse(175, 323, 20, 20);
        fill(85, 105,  45, (0+(mouseX-140)));
  ellipse(178, 307, 20, 20);
          fill(90, 120,  50, (0+(mouseX-140)));
  ellipse(183, 300, 20, 20);
            fill(80, 105,  45, (0+(mouseX-140)));
  ellipse(187, 293, 20, 20);
              fill(85, 120,  50, (0+(mouseX-140)));
  ellipse(193, 286, 20, 20);
                fill(90, 105,  45, (0+(mouseX-140)));
  ellipse(197, 279, 20, 20);
    fill(90, 125,  45, (0+(mouseX-140)));
  ellipse(191, 278, 20, 20); 
 //     fill(80, 105,  45, (0+(mouseX-140)));
  //ellipse(184, 247, 20, 20); 
 
 
     //layer 7
      fill(90, 105,  50, (0+(mouseX-140)));
  ellipse(152, 324, 10, 10);
   fill(85, 127,  50, (0+(mouseX-140)));
  ellipse(157, 322, 10, 10);
  fill(90, 105,  50, (0+(mouseX-140)));
  ellipse(150, 320, 10, 10);
  fill(85, 127,  45, (0+(mouseX-140)));
  ellipse(152, 318, 10, 10);
    fill(90, 103,  50, (0+(mouseX-140)));
  ellipse(157, 308, 10, 10);
      fill(85, 120,  40, (0+(mouseX-140)));
  ellipse(156, 313, 10, 10);
      fill(95, 100,  50, (0+(mouseX-140)));
  ellipse(165, 303, 40, 40);
        fill(85, 125,  45, (0+(mouseX-140)));
  ellipse(198, 327, 10, 10);
          fill(90, 100,  50, (0+(mouseX-140)));
 ellipse(193, 320, 10, 10);
            fill(80, 125,  45, (0+(mouseX-140)));
  ellipse(197, 313, 10, 10);
              fill(85, 100,  50, (0+(mouseX-140)));
  ellipse(203, 306, 10, 10);
                fill(90, 125,  45, (0+(mouseX-140)));
  ellipse(207, 299, 10, 10);
    fill(90, 105,  45, (0+(mouseX-140)));
  ellipse(201, 298, 10, 10); 
      fill(80, 125,  45, (0+(mouseX-140)));
  ellipse(194, 267, 20, 20); 
  
      //layer6 
        fill(90, 125,  50, (0+(mouseX-135)));
  ellipse(145, 325, 20, 20);
   fill(85, 107,  50, (0+(mouseX-135)));
  ellipse(147, 322, 10, 10);
  fill(90, 125,  50, (0+(mouseX-135)));
  ellipse(149, 320, 10, 10);
  fill(85, 107,  45, (0+(mouseX-135)));
  ellipse(150, 318, 10, 10);
    fill(90, 123,  50, (0+(mouseX-135)));
  ellipse(155, 308, 10, 10);
      fill(85, 100,  40, (0+(mouseX-135)));
  ellipse(153, 313, 10, 10);
      fill(95, 120,  50, (0+(mouseX-135)));
  ellipse(162, 303, 10, 10);
        fill(85, 105,  45, (0+(mouseX-135)));
  ellipse(167, 297, 10, 10);
          fill(90, 120,  50, (0+(mouseX-135)));
  ellipse(162, 290, 10, 10);
            fill(80, 105,  45, (0+(mouseX-135)));
  ellipse(177, 283, 10, 10);
              fill(85, 120,  50, (0+(mouseX-135)));
  ellipse(182, 276, 10, 10);
                fill(90, 105,  45, (0+(mouseX-135)));
  ellipse(187, 269, 10, 10);
    fill(90, 125,  45, (0+(mouseX-135)));
  ellipse(191, 268, 10, 10);
  
  
    //layer 5
      fill(90, 105,  50, (0+(mouseX-130)));
  ellipse(132, 324, 10, 10);
   fill(85, 127,  50, (0+(mouseX-130)));
  ellipse(137, 322, 10, 10);
  fill(90, 105,  50, (0+(mouseX-130)));
  ellipse(140, 320, 10, 10);
  fill(85, 127,  45, (0+(mouseX-130)));
  ellipse(142, 318, 10, 10);
    fill(90, 103,  50, (0+(mouseX-130)));
  ellipse(148, 308, 10, 10);
      fill(85, 120,  40, (0+(mouseX-130)));
  ellipse(147, 313, 10, 10);
      fill(95, 100,  50, (0+(mouseX-130)));
  ellipse(157, 303, 10, 10);
        fill(85, 125,  45, (0+(mouseX-130)));
  ellipse(162, 297, 10, 10);
          fill(90, 100,  50, (0+(mouseX-130)));
  ellipse(167, 290, 10, 10);
            fill(80, 125,  45, (0+(mouseX-130)));
  ellipse(172, 283, 10, 10);
              fill(85, 100,  50, (0+(mouseX-130)));
  ellipse(177, 276, 10, 10);
                fill(90, 125,  45, (0+(mouseX-130)));
  ellipse(182, 269, 10, 10);
    fill(90, 105,  45, (0+(mouseX-130)));
  ellipse(186, 268, 10, 10);
  
    //layer4 
   fill(85, 107,  50, (0+(mouseX-125)));
  ellipse(132, 322, 10, 10);
  fill(90, 125,  50, (0+(mouseX-125)));
  ellipse(135, 320, 10, 10);
  fill(85, 107,  45, (0+(mouseX-125)));
  ellipse(137, 318, 10, 10);
    fill(90, 123,  50, (0+(mouseX-125)));
  ellipse(143, 308, 10, 10);
      fill(85, 100,  40, (0+(mouseX-125)));
  ellipse(142, 313, 10, 10);
      fill(95, 120,  50, (0+(mouseX-125)));
  ellipse(152, 303, 10, 10);
        fill(85, 105,  45, (0+(mouseX-125)));
  ellipse(157, 297, 10, 10);
          fill(90, 120,  50, (0+(mouseX-125)));
  ellipse(162, 290, 10, 10);
            fill(80, 105,  45, (0+(mouseX-125)));
  ellipse(167, 283, 10, 10);
              fill(85, 120,  50, (0+(mouseX-125)));
  ellipse(172, 276, 10, 10);
                fill(90, 105,  45, (0+(mouseX-125)));
  ellipse(177, 269, 10, 10);
    fill(90, 125,  45, (0+(mouseX-125)));
  ellipse(181, 268, 10, 10);
  
  //layer 3 
   fill(85, 127,  50, (0+(mouseX-120)));
  ellipse(127, 322, 10, 10);
  fill(90, 105,  50, (0+(mouseX-120)));
  ellipse(130, 320, 10, 10);
  fill(85, 127,  45, (0+(mouseX-120)));
  ellipse(132, 318, 10, 10);
    fill(90, 103,  50, (0+(mouseX-120)));
  ellipse(138, 308, 10, 10);
      fill(85, 120,  40, (0+(mouseX-120)));
  ellipse(137, 313, 10, 10);
      fill(95, 100,  50, (0+(mouseX-120)));
  ellipse(147, 303, 10, 10);
        fill(85, 125,  45, (0+(mouseX-120)));
  ellipse(152, 297, 10, 10);
          fill(90, 100,  50, (0+(mouseX-120)));
  ellipse(157, 290, 10, 10);
            fill(80, 125,  45, (0+(mouseX-120)));
  ellipse(162, 283, 10, 10);
              fill(85, 100,  50, (0+(mouseX-120)));
  ellipse(167, 276, 10, 10);
                fill(90, 125,  45, (0+(mouseX-120)));
  ellipse(172, 269, 10, 10);
    fill(90, 105,  45, (0+(mouseX-120)));
  ellipse(176, 268, 10, 10);
    
//layer 2 
  fill(90, 115,  50, (0+(mouseX-115)));
  ellipse(124, 320, 10, 10);
  fill(85, 107,  45, (0+(mouseX-115)));
  ellipse(126, 318, 10, 10);
    fill(90, 103,  50, (0+(mouseX-115)));
  ellipse(136, 308, 10, 10);
      fill(85, 100,  40, (0+(mouseX-115)));
  ellipse(131, 313, 10, 10);
      fill(95, 110,  50, (0+(mouseX-115)));
  ellipse(141, 303, 10, 10);
        fill(85, 105,  45, (0+(mouseX-115)));
  ellipse(146, 297, 10, 10);
          fill(90, 110,  50, (0+(mouseX-115)));
  ellipse(151, 290, 10, 10);
            fill(80, 105,  45, (0+(mouseX-115)));
  ellipse(156, 283, 10, 10);
              fill(85, 110,  50, (0+(mouseX-115)));
  ellipse(161, 276, 10, 10);
                fill(90, 105,  45, (0+(mouseX-115)));
  ellipse(166, 269, 10, 10);
    fill(90, 105,  45, (0+(mouseX-115)));
  ellipse(170, 265, 10, 10);
  
//layer 1  
  fill(85, 107,  47, (0+(mouseX-110)));
  ellipse(120, 318, 10, 10);
    fill(85, 107,  45, (0+(mouseX-110)));
  ellipse(130, 308, 10, 10);
      fill(85, 100,  40, (0+(mouseX-110)));
  ellipse(125, 313, 10, 10);
      fill(85, 110,  50, (0+(mouseX-110)));
  ellipse(135, 303, 10, 10);
        fill(85, 105,  45, (0+(mouseX-110)));
  ellipse(140, 297, 10, 10);
          fill(85, 110,  50, (0+(mouseX-110)));
  ellipse(145, 290, 10, 10);
            fill(90, 105,  45, (0+(mouseX-110)));
  ellipse(150, 283, 10, 10);
              fill(85, 110,  50, (0+(mouseX-110)));
  ellipse(155, 276, 10, 10);
                fill(90, 105,  45, (0+(mouseX-110)));
  ellipse(160, 269, 10, 10);
    fill(90, 105,  45, (0+(mouseX-110)));
  ellipse(164, 263, 10, 10);
  endShape();




//left hand
 fill(255, 160, 122);
beginShape();
vertex(260, 254);
vertex(280, 260);
vertex(284, 262);
vertex(286, 264);
vertex(290, 273);
vertex(292, 275);
vertex(294, 272);
vertex(296, 276);
vertex(298, 272);
vertex(301, 273);
vertex(303, 271);
vertex(302, 269);
vertex(305, 267);
vertex(302, 254);
vertex(299, 247);
vertex(280, 240);
vertex(260, 243);
endShape();


//hair sides
fill(139, 69, 19);
beginShape();
quad(44, 141,   63, 141,   63, 141+(mouseX/5),   44, 141+(mouseX/5));
quad(116, 141,   135, 141,   135, 141+(mouseX/5),    116, 141+(mouseX/5));
endShape();

//hair tips
beginShape();
vertex(44, 141+(mouseX/5));
vertex(63, 141+(mouseX/5));
vertex(63, 170+(mouseX/5));
vertex(60, 179+(mouseX/5));
vertex(60, 190+(mouseX/5));
vertex(62, 192+(mouseX/5));
vertex(64, 192+(mouseX/5));
vertex(60, 200+(mouseX/5));
vertex(50, 207+(mouseX/5));
vertex(40, 189+(mouseX/5));
vertex(41, 179+(mouseX/5));
vertex(46, 157+(mouseX/5));
vertex(46, 149+(mouseX/5));
endShape();
//
beginShape();
vertex(116, 141+(mouseX/5));
vertex(135, 141+(mouseX/5));
vertex(134, 158+(mouseX/5));
vertex(135, 167+(mouseX/5));
vertex(129, 179+(mouseX/5));
vertex(132, 189+(mouseX/5));
vertex(122, 200+(mouseX/5));
vertex(112, 196+(mouseX/5));
vertex(107, 191+(mouseX/5));
vertex(109, 189+(mouseX/5));
vertex(111, 191+(mouseX/5));
vertex(116, 190+(mouseX/5));
vertex(116, 185+(mouseX/5));
vertex(116, 157+(mouseX/5));
vertex(116, 152+(mouseX/5));
vertex(116, 152+(mouseX/5));
vertex(116, 145+(mouseX/5));

endShape();


noStroke();
  
  //front wave
    fill(0, 255, 255);
  beginShape();
  quad(0, 340,   (x), 340,     (w), 480,    0, 480);
  fill(255);  
  quad(x-(x/3), 340,   (x), 340,     (w+30), 480,    (w-x/3), 480);  
  ellipse((y-70), 400, 50, 50);
    ellipse((y-68), 470, 50, 50);
     ellipse((x-70), 420, 60, 60);
     ellipse((x-80), 460, 80, 80);
       ellipse((y-60), 430, 60, 60);
            ellipse((z-70), 370, 80, 80);
     ellipse((z-68), 500, 70, 70);
       ellipse((z-70), 400, 80, 80);
            ellipse((w-70), 490, 60, 60);
       ellipse((w-80), 390, 30, 30);
            ellipse((w-60), 380, 70, 70);
     ellipse((w-80), 450, 40, 40);
       ellipse((w-50), 420, 30, 30);
    quad(x, 340,   (x-175), 340,     (w-105), 480,    w, 480);
  ellipse((y), 390, 50, 50);
    ellipse((y), 450, 70, 70);
     ellipse((x-30), 380, 90, 90);
     ellipse((x), 480, 80, 80);
       ellipse((y), 380, 60, 60);
            ellipse((z), 430, 70, 70);
     ellipse((z), 440, 70, 70);
       ellipse((z), 390, 80, 80);
            ellipse((w), 460, 80, 80);
       ellipse((w), 400, 30, 30);
            ellipse((w+10), 350, 40, 40);
     ellipse((w), 420, 40, 40);
       ellipse((w), 380, 60, 60);
       
         ellipse((y-70), 400, 50, 50);
    ellipse((y-68), 470, 50, 50);
     ellipse((x-70), 420, 60, 60);
     ellipse((x-80), 460, 80, 80);
       ellipse((y-60), 430, 60, 60);
            ellipse((z-70), 370, 80, 80);
     ellipse((z-68), 500, 70, 70);
       ellipse((z-70), 400, 80, 80);
            ellipse((w-70), 490, 60, 60);
       ellipse((w-80), 390, 30, 30);
            ellipse((w-60), 380, 70, 70);
     ellipse((w-80), 450, 40, 40);
       ellipse((w-50), 420, 30, 30);
       
              ellipse((y-110), 380, 50, 50);
    ellipse((y-108), 450, 50, 50);
     ellipse((x-110), 400, 60, 60);
     ellipse((x-120), 460, 80, 80);
       ellipse((y-100), 360, 60, 60);
            ellipse((z-130), 340, 50, 50);
     ellipse((z-108), 500, 70, 70);
       ellipse((z-130), 400, 40, 40);
            ellipse((w-110), 490, 60, 60);
       ellipse((w-140), 390, 30, 30);
            ellipse((w-100), 380, 70, 70);
     ellipse((w-120), 450, 40, 40);
       ellipse((w-90), 420, 30, 30);
       ellipse(x, 350, 40, 40);
  endShape ();
  
  
  
}

