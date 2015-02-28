
import de.bezier.utils.fieldmanager.*;
import de.bezier.utils.fieldmanager.test.*;

// FORMATTING
  size(600, 600);
  background(29, 42, 46);
  smooth();
  rectMode(CENTER);
  
// LEGS
  noStroke();
  fill(33, 71, 87);
  ellipse(300, 290, 215, 280);
  
// CHAIR
  noStroke();
  fill(30, 30, 32);
  ellipse(300, 148, 222, 60);
  
// DESK
  noStroke();
  fill(160, 155, 95);
  rect(300, 423, 600, 355);
  
  // Desk Hi-Light
    noStroke();
    fill(174, 170, 125);
    rect(300, 248, 600, 5);
    
  // --end DESK
  
 // COMPUTER

   // Base
     noStroke();
     fill(180, 190, 190);
     rect(294, 378, 210, 112);
     
   // Trackpad
     noStroke();
     fill(159, 168, 171);
     rect(294, 347, 53, 27);
     
   // Trackpad Line
     stroke(131, 142, 136);
     line(267, 341, 306, 341);
     
   // Keyboard
     noStroke();
     fill(159, 168, 171);
     rect(294, 397, 161, 60);
     
   // Screen Frame
     noStroke();
     fill(200, 207, 207);
     beginShape();
       vertex(189, 434);
       vertex(399, 434);
       vertex(435, 458);
       vertex(153, 458);
       endShape();
       
   // Screen
     noStroke();
     fill(232, 235, 235);
     beginShape();
       vertex(189, 437);
       vertex(397, 437);
       vertex(424, 455);
       vertex(162, 455);
       endShape();
       
   // Screen Depth
     noStroke();
     fill(180, 190, 190);
     rect(294, 460, 282, 4);
   
   // -- end COMPUTER --
     
 // TORSO
   noStroke();
   fill(106, 131, 142);
   ellipse(298, 184, 285, 70);
   
// HEADPHONE JACK
  noStroke();
  fill(1, 3, 5);
  rect(405, 394, 12, 3);
  
// HEADPHONE CORD
  stroke(1, 3, 5);
  noFill();
  beginShape();
    vertex(411, 393);
    bezierVertex(430, 393, 450, 380, 450, 364);
    bezierVertex(450, 330, 367, 330, 367, 287);
    bezierVertex(367, 270, 385, 240, 385, 215);
    bezierVertex(385, 200, 370, 181, 364, 181);
    endShape();
   
// PROCESSING BOOK
  noStroke();
  fill(219, 162, 0);
  beginShape();
    vertex(106, 229);
    vertex(191, 269);
    vertex(124, 389);
    vertex(49, 349);
    endShape();
    
    // Processing Book Shadow
      noStroke();
      fill(215, 143, 18);
      beginShape();
        vertex(120, 236);
        vertex(133, 242);
        vertex(123, 269);
        vertex(136, 295);
        vertex(114, 276);
        vertex(106, 255);
        endShape();
      
    // --end PROCESSING BOOK
    
// IPHONE
  noStroke();
  fill(1, 3, 5);
  beginShape();
    vertex(546, 287);
    vertex(571, 355);
    vertex(534, 369);
    vertex(509, 301);
    endShape();
    
// LEFT HAND
  noStroke();
  fill(230, 220, 175);
  beginShape();
    vertex(160, 326);
    vertex(187, 315);
    vertex(230, 352);
    vertex(250, 354);
    vertex(259, 395);
    vertex(242, 407);
    vertex(224, 401);
    vertex(210, 371);
    vertex(160, 326);
    endShape();

// RIGHT HAND
  noStroke();
  fill(230, 220, 175);
  beginShape();
    vertex(413, 302);
    vertex(355, 336);
    vertex(336, 363);
    vertex(317, 364);
    vertex(302, 349);
    vertex(302, 349);
    vertex(320, 311);
    vertex(339, 313);
    vertex(389, 286);
    endShape();
    
// LEFT SLEEVE
  noStroke();
  fill(106, 131, 142);
  beginShape();
    vertex(157, 180);
    vertex(218, 169);
    vertex(173, 260);
    vertex(192, 312);
    vertex(209, 317);
    vertex(156, 349);
    vertex(153, 326);
    vertex(123, 268);
    endShape();
    
// RIGHT SLEEVE
  noStroke();
  fill(106, 131, 142);
  beginShape();
    vertex(368, 174);
    vertex(440, 182);
    vertex(484, 256);
    vertex(413, 314);
    vertex(406, 331);
    vertex(368, 290);
    vertex(389, 286);
    vertex(429, 252);
    endShape();
    
// CANS
  noStroke();
  fill(1, 3, 5);
  ellipse(244, 184, 37, 54);
  ellipse(346, 184, 37, 54);
  
// HEAD
  noStroke();
  fill(230, 220, 175);
  beginShape();
    vertex(308, 198);
    vertex(346, 214);
    vertex(305, 225);
    vertex(299, 232);
    vertex(289, 232);
    vertex(283, 225);
    vertex(249, 220);
    endShape();
    
// HAIR
  noStroke();
  fill(165, 160, 110);
  beginShape();
    vertex(237, 225);
    bezierVertex(229, 185, 252, 124, 298, 124);
    bezierVertex(340, 124, 360, 182, 353, 220);
    vertex(320, 214);
    endShape();
  fill(255, 0, 0);
  
// HEADBAND
  noStroke();
  fill(1, 3, 5);
  rect(294, 182, 118, 17);
  
// GLOW
  noStroke();
  fill(255, 255, 255, 28);
  beginShape();
    vertex(0, 0);
    vertex(600, 0);
    vertex(600, 79);
    vertex(424, 455);
    vertex(162, 455);
    vertex(0, 79);
    endShape();
