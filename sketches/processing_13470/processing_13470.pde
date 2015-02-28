
//VARIABLES/////////////////////////////////////////
float pupilX = map(mouseX, 0, width, 215, 265);
float pupilY = map(mouseY, 0, height, 230, 240);
float pupilA = map(mouseX, 0, width, 375, 425);


//SETUP/////////////////////////////////////////////
void setup()
{
  size(640,480);
  strokeWeight(1.5);
  smooth();
  background(247,240,120);
  
  for(int i=0; i<=width; i+=20){
    stroke(182,197,249,60);
    line(0,i,640,i);
  }
  stroke(187,83,46,110);
  line(25,0, 25,480);
  line(27,0,27,480);
  
  stroke(0);
  
  
  
  //hair//
  noFill();
  beginShape();
  vertex(414,240);
  bezierVertex(411,241, 354,95, 597,153);
  endShape();
  
  line(597,153, 640,159);
  line(431,184, 441,261);
  
  beginShape();
  vertex(441,261);
  bezierVertex(468,177, 567,194, 562,197);
  endShape();
  
  beginShape();
  vertex(562,197);
  bezierVertex(562,202, 580,203, 584,243);
  endShape();
  
  line(584,243, 598,229);
  
  beginShape();
  vertex(598,229);
  bezierVertex(597,227, 648,309, 640,372);
  endShape();
  
  //side of face//
  beginShape();
  vertex(371,367);
  bezierVertex(368,367, 398,240, 435,217);
  endShape();
  
  line(364,402, 341,480);
  
  //ear//
  beginShape();
  vertex(364,402);
  bezierVertex(366,403, 298,383, 343,473);
  endShape();
  
  beginShape();
  vertex(348,454);
  bezierVertex(349,454, 317,408, 360,415);
  endShape();
  
  //facial line//
  line(366,480, 380,463);
  
  //nose lines//
  line(414,480, 439,434);
  
  beginShape();
  vertex(439,434);
  bezierVertex(431,431, 442,310, 443,310);
  endShape();
  
  //facial line on right//
  beginShape();
  vertex(613,480);
  bezierVertex(632,483, 633,385, 637,397);
  endShape();
}


//DRAW///////////////////////////////////////////////
void draw(){

  
fill(0);  
          
float X = constrain(mouseX,541,567);
float Y = constrain(mouseY,394,405);
float P = constrain(mouseX,385,400);
float J = constrain(mouseY,390,409);
 
//left eye//
 fill(0);
  ellipse (P,J,10,10);
   
//right eye//
  ellipse (X,Y,10,10);

         
noFill();
//CLOSED FACE////
  if(mousePressed)
  {
    strokeWeight(0.5);
    noFill();
          beginShape();
          vertex(361,414);
          bezierVertex(363,414, 385,434, 412,422);
          endShape(); 
  
          beginShape();
          vertex(364,400);
          bezierVertex(363,399, 381,429, 436,407);
          endShape(); 

          beginShape();
          vertex(365,402);
          bezierVertex(366,402, 357,387, 372,368);
          endShape(); 

          beginShape();
          vertex(437,391);
          bezierVertex(439,392, 409,361, 372,368);
          endShape(); 

          line(432,381, 389,338);
          line(428,366, 393,325);
          line(431,351, 396,306);
          line(431,338, 413,312);

//other eye///////////////////////////////
          beginShape();
          vertex(483,390);
          bezierVertex(485,392, 486,288, 558,300);
          endShape(); 
  
          beginShape();
          vertex(497,416);
          bezierVertex(495,417, 624,433, 617,389);
          endShape(); 

          beginShape();
          vertex(486,406);
          bezierVertex(481,405, 593,426, 613,378);
          endShape(); 
  
          beginShape();
          vertex(617,373);
          bezierVertex(619,375, 556,328, 486,396);
          endShape(); 

          line(486,382, 576,324);
          line(582,312, 488,372);
          line(496,354, 589,300);
          line(592,290, 509,334);


//eyebrow lines////////////////
          beginShape();
          vertex(453,278);
          bezierVertex(454,279, 445,267, 434,268);
          endShape(); 
  
          beginShape();
          vertex(454,298);
          bezierVertex(455,299, 429,279, 408,285);
          endShape(); 

          beginShape();
          vertex(454,298);
          bezierVertex(452,299, 538,251, 564,265);
          endShape(); 

          beginShape();
          vertex(453,278);
          bezierVertex(451,280, 507,243, 531,248);
          endShape(); 
          //
          beginShape();
          vertex(453,278);
          bezierVertex(445,285, 500,247, 534,250);
          endShape(); 
          
          
          //LIGHTNING BOLTS/////////////////////////
          stroke(0);
          strokeWeight(2);
          fill(252,252,202);
          beginShape();
          vertex(30,372);
          vertex(26,232);
          vertex(52,126);
          vertex(140,283);
          vertex(218,190);
          vertex(353,320);
          vertex(219,240);
          vertex(144,355);
          vertex(79,286);
          endShape(CLOSE);
          
          beginShape();
          vertex(59,43);
          vertex(180,12);
          vertex(187,108);
          vertex(287,120);
          vertex(351,234);
          vertex(276,147);
          vertex(162,135);
          vertex(153,76);
          endShape(CLOSE);
          
          beginShape();
          vertex(243,25);
          vertex(358,21);
          vertex(327,80);
          vertex(381,88);
          vertex(367,123);
//          vertex(351,234);
          vertex(404,123);
          vertex(404,170);
          vertex(396,132);
          vertex(352,133);
          vertex(363,98);
          vertex(301,87);
          vertex(306,55);
          endShape(CLOSE);
          
          noFill();
          
          //HAIR/////////////////////
          line(443,240, 443,23);
          line(443,23, 458,214);
          line(458,214, 468,15);
          line(468,15, 482,180);
          line(482,180, 493,-14);
          line(493,-14, 514,167);
          line(514,167, 526,0);
          line(526,0, 540,157);
          line(540,159, 562,23);
          line(562,23, 565,158);
          line(565,158, 589,36);
          line(589,36, 597,166);
          line(597,166, 612,108);
          line(612,108, 612,165);
          line(612,165, 630,127);
          line(630,127, 630,159);

          strokeWeight(0.5);

  }
  else{
     beginShape();
          vertex(434,415);
          bezierVertex(367,446, 364,394, 364,398);
          endShape(); 
          
          line(368,384, 364,399);
          line(373,385, 371,400);
          
          beginShape();
          vertex(371,400);
          bezierVertex(370,400, 363,429, 433,408);
          endShape(); 
          
          beginShape();
          vertex(433,381);
          bezierVertex(433,380, 358,390, 360,380);
          endShape(); 
//          
          line(360,380, 372,367);
          line(425,370, 420,363);
          line(428,367, 416,354);
          line(430,365, 422,352);
          line(434,358, 414,341);
//          line(430,344, 411,366);
          line(430,337, 410,330);
          line(429,334, 408,325);
          line(433,326, 406,319);
          line(435,317, 408,313);
          
          //other eye///////
          beginShape();
          vertex(617,385);
          bezierVertex(617,382, 583,461, 507,412);
          endShape(); 
          
          line(486,406, 503,404);
          
          beginShape();
          vertex(502,404);
          bezierVertex(502,403, 535,414, 580,412);
          endShape(); 
          
          line(580,412, 613,389);
          line(486,406, 505,391);
          line(505,391, 613,389);
          
          beginShape();
          vertex(482,391);
          bezierVertex(483,393, 483,281, 555,294);
          endShape(); 
          
          beginShape();
          vertex(584,300);
          bezierVertex(582,300, 611,308, 617,366);
          endShape(); 
          
          line(488,382,539,356);
          line(490,372, 545,347);
          line(490,363, 541,343);
          line(493,349, 548,333);
          line(505,340, 555,326);
          line(507,333, 554,320);
          line(523,322, 563,314);
          
          //lines on forehead//
          line(414,274, 449,273);
          line(449,273, 513,248);
          
          beginShape();
          vertex(403,299);
          bezierVertex(403,300, 438,286, 459,291);
          endShape(); 
          
          beginShape();
          vertex(459,291);
          bezierVertex(459,292, 535,246, 566,250);
          endShape(); 
          
          //eyes/////////////////////////////////////////
          
          beginShape();
          vertex(510,390);
          bezierVertex(510,393, 515,408, 520,408);
          endShape(); 
          
          beginShape();
          vertex(414,413);
          bezierVertex(412,414, 425,390, 417,382);
          endShape(); 
  }
  
}

void mouseReleased(){
  setup();
}

