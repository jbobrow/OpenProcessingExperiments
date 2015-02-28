
size(500, 500);
background(226, 224, 210);
smooth();
textFont(createFont("SansSerif",10));
  
  
           //COLOR FILLS//
  
  
      noStroke();
      fill(120, 110, 100);
          ellipse(88, 88, 45, 30);                 //left pupil fill
          ellipse(240, 99, 30, 60);               //right pupil fill
      
      fill(0, 0, 0);                              //hair, left to right
          quad(0, 0, 25, 0, 20, 34, 0, 30);   
          quad(28, 0, 43, 0, 46, 36, 28, 30);   
          quad(47, 0, 67, 0, 63, 38, 46, 35);   
          quad(70, 0, 95, 0, 97, 39, 65, 34);   
          quad(99, 0, 109, 0, 107, 37, 98, 35); 
          quad(114, 0, 129, 0, 125, 36, 116, 35);   
          quad(150, 0, 170, 0, 174, 38, 155, 36);   
          quad(185, 0, 210, 0, 213, 36, 190, 37);   
          quad(220, 0, 237, 0, 240, 38, 221, 39);  
          quad(240, 0, 270, 0, 275, 39, 245, 40);      
      
      fill(191, 158, 92);
              beginShape();                        //nose fill
              line(297, 0, 291, 158);
              curveVertex(291, 158);
              curveVertex(291, 158);
              curveVertex(285, 220);
              curveVertex(272, 235);
              curveVertex(254, 242);
              curveVertex(208, 239);
              curveVertex(184, 226);
              curveVertex(172, 210);
              curveVertex(170, 176);
              curveVertex(150, 150);
              curveVertex(130, 145);
              curveVertex(113, 145);
              curveVertex(113, 145);
              line(113, 145, 94, 145);
              line(94, 145, 64, 152);
              line(64, 152, 24, 187);
              endShape();
              
              fill(65, 65, 65);                        //nostril fill
              ellipse(240, 200, 14, 19);
              ellipse(260, 190, 13, 19);
              
              fill(191, 158, 92);
              quad(472, 145, 479, 300, 379, 291, 401, 122);      //ear fill
              
              fill(65, 65, 65);             //ear holes fill
              beginShape();
              curveVertex(420, 170);
              curveVertex(420, 170);
              curveVertex(425, 230);
              curveVertex(440, 190);
              curveVertex(450, 195);
              curveVertex(470, 265);
              curveVertex(420, 285);
              curveVertex(440, 200);
              curveVertex(420, 170);
              curveVertex(420, 170);
              endShape();
              
              
  
              fill(222, 115, 98);
                                      
              beginShape();                          //upper lips fill
              line(297, 0, 291, 158);
              curveVertex(291, 158);
              curveVertex(291, 158);
              curveVertex(285, 220);
              curveVertex(272, 235);
              curveVertex(254, 242);
              curveVertex(208, 239);
              curveVertex(184, 226);
              curveVertex(172, 210);
              curveVertex(170, 176);
              curveVertex(150, 150);
              curveVertex(130, 145);
              curveVertex(113, 145);
              curveVertex(113, 145);
              curveVertex(94, 145);
              curveVertex(64, 192);
              curveVertex(24, 187);
              curveVertex(40, 250);
              curveVertex(70, 260);
              curveVertex(100, 260);
              curveVertex(140, 270);
              curveVertex(180, 285);
              curveVertex(250, 300);
              curveVertex(270, 283);
              curveVertex(280, 295);
              curveVertex(300, 270);
              curveVertex(330, 280);
              curveVertex(330, 280);
              endShape();
              
              
               beginShape();              //lower lips fill
               vertex(26, 393);
                vertex(97, 383);
                vertex(99, 367);
                vertex(151, 381);
                vertex(156, 401);
                vertex(230, 417);
                vertex(279, 445);
                vertex(240, 464);
                
                endShape(CLOSE);            
              
              
              
              
              //ROADS BEGIN NOW//
              
              
              
  strokeWeight(14);          //left eye
  noFill();
  stroke(255, 255, 255);
  strokeJoin(ROUND);
  quad(52, 64, 131, 67, 130, 108, 52, 103);
  line(55, 84, 72, 85);
  line(109, 86, 131, 87);
  line(102, 110, 105, 145);
  line(42, 128, 62, 153);
  
  quad(208, 66, 266, 71, 262, 140, 207, 136);  //right eye
  line(210, 112, 264, 115);
  line(210, 90, 291, 95);
  
  beginShape();                  //mouth (serangoon north ave 4, sgn4)
  line(297, 0, 291, 158);
  curveVertex(291, 158);
  curveVertex(291, 158);
  curveVertex(285, 220);
  curveVertex(272, 235);
  curveVertex(254, 242);
  curveVertex(208, 239);
  curveVertex(184, 226);
  curveVertex(172, 210);
  curveVertex(170, 176);
  curveVertex(150, 150);
  curveVertex(130, 145);
  curveVertex(113, 145);
  curveVertex(113, 145);
  line(113, 145, 94, 145);
  line(94, 145, 64, 152);
  line(64, 152, 24, 187);
  endShape();
  
  line(292, 157, 350, 159);       //cheek bones connected to sgn4
  line(328, 70, 352, 71);
  line(338, 157, 336, 215);
  line(288, 199, 330, 197);
  line(328, 157, 328, 60); 
  
  
                    pushMatrix();            //street name for sgn4
                    translate(501, -275);
                    rotate(radians(94.5));
                    fill(0, 0, 0);
                    text("Serangoon North Ave 4", 393, 178);
                    popMatrix();
                    
                                  
  
  beginShape();                //left cheek
  line(0, 163, 46, 217);
  line(46, 217, 28, 318);
  line(28, 318, 25, 355);
  curveVertex(25, 355);
  curveVertex(25, 355);
  curveVertex(43, 439);
  curveVertex(135, 451);
  curveVertex(143, 451);
  curveVertex(167, 455);
  curveVertex(184, 481);
  curveVertex(189, 500);
  curveVertex(189, 500);
  endShape();
  
  
  
  
  
 strokeCap(SQUARE);  //serangoon north ave 5
 line(0, 27, 390, 47);
 line(404, 53, 500, 52);
 
                    
                    
                    pushMatrix();            //street name
                    translate(0, 0);
                    rotate(radians(3));
                    
                    fill(0, 0, 0);
                    text("Serangoon North Ave 5", 125, 30);
          
                    popMatrix();
 
 strokeCap(ROUND);
 
 
 strokeWeight(8);              //lip creak on the left
 noFill();
  line(112, 146, 113, 172);
  line(131, 173, 80, 175);
  line(78, 184, 75, 248);
  line(80, 175, 78, 184);
  line(144, 221, 78, 219);
  line(81, 197, 119, 198);
  arc(117, 221, 25, 25, 0, PI);
  line(142, 186, 144, 221);
  line(75, 248, 63, 280);
  line(63, 280, 89, 292);
  line(89, 292, 93, 280);
  line(93, 280, 136, 293);
  line(136, 293, 143, 257);
  line(143, 257, 127, 251);
  line(127, 251, 119, 262);
  line(119, 262, 73, 251);
  
  line(211, 241, 210, 271);    //lip creak in the middle
  line(136, 293, 199, 295);
  line(159, 272, 159, 310);
  line(223, 316, 159, 310);
  line(159, 272, 230, 277);
  
  
  line(255, 244, 253, 315);      //lip creaks on the right
  line(253, 315, 243, 317);
  line(254, 300, 299, 303);
  line(303, 254, 299, 303);
  line(265, 266, 299, 266);
  line(340, 254, 336, 298);
  line(336, 298, 330, 336);
  line(330, 336, 298, 330);
  line(299, 295, 334, 298);
  
                                    //lower lip creaks
    
  line(26, 393, 80, 392);
  line(80, 392, 97, 383);
  line(97, 383, 99, 367);
  line(99, 367, 151, 381);
  line(151, 381, 156, 401);
  line(230, 417, 156, 401);
  line(80, 392, 90, 427);
  line(116, 429, 90, 427);
  line(197, 411, 190, 433);
  quad(190, 433, 206, 434, 214, 458, 202, 455);
  line(221, 479, 214, 458);
  line(186, 489, 277, 479);
  line(277, 479, 343, 484);
  line(230, 417, 250, 418);
  line(250, 418, 257, 418);
  line(279, 445, 257, 418);
  line(240, 464, 279, 445);
  line(384, 292, 481, 298);
  line(472, 146, 400, 124);
  line(382, 320, 430, 306);
  
  
  strokeWeight(30);          //yiochukang rd (yck)
  stroke(255, 254, 119);
  noFill();
  beginShape();
  curveVertex(400, 0);
  curveVertex(400, 0);
  curveVertex(390, 200);
  curveVertex(374, 316);
  curveVertex(350, 451);
  curveVertex(320, 500);
  curveVertex(320, 500);
  endShape();
                    pushMatrix();              //yck street name
                    translate(600, -180);
                    rotate(radians(95));
                    fill(0, 0, 0);
                    text("Yio Chu Kang Rd", 393, 178);
                    popMatrix();
                    
                    
                    
              pushMatrix();
              noStroke();
              rotate(radians(20));
              fill(118, 22, 7);                        //tongue fill
              ellipse(290, 310, 50, 80);
              fill(142, 37, 21);
              ellipse(290, 310, 25, 70);
              popMatrix();
              
              
              
  
  noFill();                  //angmokio ave 3/hougang ave 2 (houg)
  strokeWeight(30);
  stroke(255, 254, 119);
  beginShape();
  curveVertex(0, 309);
  curveVertex(0, 309);
  curveVertex(191, 359);
  curveVertex(212, 365);
  curveVertex(236, 378);
  curveVertex(280, 400);
  curveVertex(295, 404);
  curveVertex(355, 424);
  curveVertex(373, 427);
  curveVertex(436, 434);
  curveVertex(462, 435);
  curveVertex(499, 432);
  curveVertex(499, 432);
  endShape();
  
                                                    //road names for amk3
                                    
                  fill(0);
                   pushMatrix();
                    translate(0, -53); 
                    rotate(radians(15));
                    text("Ang Mo Kio Ave 3", 170, 354);
                    popMatrix();
                    text("Hougang Ave 2", 387, 436);
  
  
  
   strokeWeight(8);              //highway off-ramps
  line(214, 381, 335, 450);
  line(208, 358, 513, 420);
  line(355, 455, 482, 445);
  
 
 
                
