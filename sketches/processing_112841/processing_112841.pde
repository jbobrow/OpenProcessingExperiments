
//miro
//chiming lu
//background setup 

void setup( )
{
  size(400, 500);
  background(255);
  smooth();
 //line right down
 stroke(0);
 strokeWeight(2);
 line(340,296,342,385);
 line(377,298,290,383);
 line(305,290,387,395);
 line(290,340,381,333);
  
//curve 1
  stroke(0);
  strokeWeight(2);
 beginShape();
  vertex(20,70);
  bezierVertex(2,40,43,15,75,55);
 endShape();
//curve 2
  stroke(0);
  strokeWeight(2);
 beginShape();
  vertex(31,107);
  bezierVertex(18,74,47,47,67,64);
 endShape();
//curve 3 
  stroke(0);
  strokeWeight(2);
 beginShape();
  vertex(59,119);
  bezierVertex(38,95,40,65,64,71);
 endShape();
//long curve
 stroke(0);
strokeWeight(2);
beginShape();
vertex(156,134);
bezierVertex(232,66,246,43,251,0);
endShape();
//
line(156,134,120,167);

//curve u
 stroke(0);
strokeWeight(2);
beginShape();
vertex(120,167);
bezierVertex(-40,380,42,491,148,396);
endShape();

//circle shape
  noStroke();
 beginShape();
  fill(210,70,0);
  ellipse(91,75,52,50); 
 endShape();
 
//moon shape
 noStroke();
 beginShape();
 fill(25,70,11);
 vertex(170,194);
 bezierVertex(70,170,45,56,225,7);
 bezierVertex(150,100,160,140,170,194);
 endShape();
 // black
  beginShape();
 fill(0);
 vertex(90,100);
 bezierVertex(110,105,127,80,113,62);
 bezierVertex(120,69,102,69,94,100);
 endShape();
 
  beginShape();
 fill(0);
 vertex(120,167);
 bezierVertex(125,179,152,195,170,194);
 bezierVertex(166,186,158,145,164,130);
 bezierVertex(141,147,127,162,120,167);
 endShape();
 
 beginShape();
  fill(0);
 vertex(67,381);
 bezierVertex(85,402,119,375,109,354);
 bezierVertex(88,337,57,364,67,381);
 endShape();
 
  beginShape(); 
  fill(0);
 vertex(309,426);
 bezierVertex(337,430,342,403,321,401);
 bezierVertex(288,403,284,423,309,426);
 endShape();
 

//line  color part
stroke(0);
strokeWeight(2);
line(142,312,250,312);
line(195,339,270,339);
line(227,279,227,486);
line(200,298,195,339);
line(195,339,180,475);
line(373,171,400,147);
//line-
beginShape();
noFill();
vertex(197,474);
 bezierVertex(242,498,279,498,301,471);
 line(301,471,309,426);
 endShape();

//curve u ^
 stroke(0);
strokeWeight(2);
beginShape();
vertex(109,354);
bezierVertex(152,298,200,337,148,396);
endShape();

////curve u
//  stroke(0);
//strokeWeight(2);
//beginShape();
//vertex(153,312);
//bezierVertex(100,470,290,486,265,339);
//endShape();

//curve /
  stroke(0);
strokeWeight(2);
beginShape();
vertex(153,312);
bezierVertex(158,296,165,274,221,198);
endShape();

  stroke(0);
strokeWeight(2);
beginShape();
vertex(221,198);
bezierVertex(229,190,227,190,247,180);
endShape();
  stroke(0);
strokeWeight(2);
beginShape();
vertex(247,180);
bezierVertex(268,167,308,157,365,151);
endShape();

   stroke(0);
strokeWeight(2);
beginShape();
vertex(265,339);
bezierVertex(249,284,249,242,268,212);
endShape();

   stroke(0);
strokeWeight(2);
beginShape();
vertex(268,212);
bezierVertex(272,200,281,190,296,185);
endShape();

   stroke(0);
strokeWeight(2);
beginShape();
vertex(296,185);
bezierVertex(306,177,315,174,365,161);
endShape();

   stroke(0);
strokeWeight(2);
beginShape();
vertex(294,120);
bezierVertex(273,120,279,85,338,88);
endShape();

   stroke(0);
strokeWeight(2);
beginShape();
vertex(294,120);
bezierVertex(371,125,377,183,323,248);
endShape();

   stroke(0);
strokeWeight(2);
beginShape();
vertex(323,248);
bezierVertex(305,276,319,289,347,282);
endShape();

   stroke(0);
strokeWeight(2);
beginShape();
vertex(395,150);
bezierVertex(401,189,398,214,390,235);
endShape();

   //color

     fill(210,70,0);
     noStroke();
     beginShape();
     vertex(247,180);
     bezierVertex(244,197,233,206,221,198);
     bezierVertex(229,190,227,190,247,180);
     endShape();

     fill(0);
     noStroke();
     beginShape();
     vertex(247,180);
     bezierVertex(248,131,211,123,191,174);
     bezierVertex(191,186,205,189,211,179);
     bezierVertex(221,150,236,153,221,198);
     bezierVertex(229,190,227,190,247,180);
     endShape();
     
     fill(33,61,161);
     noStroke();
     beginShape();
     vertex(268,212);
     bezierVertex(261,197,275,182,296,186);
     bezierVertex(281,190,271,200,268,212);
     endShape();

     fill(0);
     noStroke();
     beginShape();
     vertex(268,212);
     bezierVertex(271,200,281,190,296,186);
     bezierVertex(317,196,328,224,295,265);
     bezierVertex(303,241,293,224,268,212);
     endShape();

     fill(0);
     noStroke();
     beginShape();
     vertex(338,88);
     bezierVertex(357,60,378,81,363,102);
     bezierVertex(358,93,350,89,338,88);
     endShape();

     fill(210,70,0);
     noStroke();
     beginShape();
     vertex(338,88);
     bezierVertex(335,100,346,117,363,102);
     bezierVertex(358,93,350,89,338,88);
     endShape();

  fill(0);
     noStroke();
     beginShape();
     vertex(363,102);
     bezierVertex(374,105,379,110,387,127);
     bezierVertex(371,120,365,112,350,107);
     bezierVertex(359,107,363,104,363,102);
     endShape();
 
     fill(0);
  noStroke();
  beginShape();
  vertex(387, 127); 
  vertex(400, 135); 
  vertex(400, 147);
  vertex(395, 150);
  endShape(CLOSE);
  
   fill(33,61,161);
     noStroke();
     beginShape();
     vertex(347,282);
     bezierVertex(336,248,361,221,390,235);
     bezierVertex(378,263,364,278,347,282);
     endShape();
  fill(0);
     noStroke();
     beginShape();
     vertex(347,282);
     bezierVertex(378,323,418,271,390,235);
     bezierVertex(378,263,364,278,347,282);
     endShape();

  fill(0);
     noStroke();
     beginShape();
     vertex(361,275);
     bezierVertex(354,254,362,246,380,254);
     bezierVertex(377,261,369,271,361,275);
     endShape();
     
  fill(210,70,0);
     noStroke();
     beginShape();
     vertex(361,275);
     bezierVertex(376,292,393,256,380,254);
     bezierVertex(377,261,369,271,361,275);
     endShape();
//curve u color
fill(0);
stroke(0);
strokeWeight(2);
beginShape();
vertex(153,312);
bezierVertex(100,470,290,486,265,339);
vertex(265,339);
vertex(228,340);
vertex(227,313);
vertex(153,312);
endShape();
     
     
     //color bule
     
  fill(33,61,161);
  noStroke();
  beginShape();
  vertex(199, 313); 
  vertex(212, 313); 
  vertex(212, 327);
  vertex(197, 327);
  endShape(CLOSE);
  
    fill(33,61,161);
  noStroke();
  beginShape();
  vertex(229, 340); 
  vertex(244, 340); 
  vertex(243, 352);
  vertex(228, 352);
  endShape(CLOSE);
     
    fill(33,61,161);
  noStroke();
  beginShape();
  vertex(191, 367); 
  vertex(226, 367); 
  vertex(227, 390);
  vertex(190, 383);
  endShape(CLOSE);
     
    fill(33,61,161);
  noStroke();
  beginShape();
  vertex(147, 347); 
  vertex(166, 350); 
  vertex(161, 374);
  vertex(145, 371);
  bezierVertex(142,362,143,353,147,347);
  endShape(CLOSE);  
  
  //color green
         
    fill(25,70,11);
  noStroke();
  beginShape();
  vertex(194, 340); 
  vertex(211, 340); 
  vertex(211, 352);
  vertex(192, 352);
  endShape(CLOSE);  
         
    fill(25,70,11);
  noStroke();
  beginShape();
  vertex(167, 350); 
  vertex(192, 352); 
  vertex(191, 367);
  vertex(164, 365);
  endShape(CLOSE);   
          
    fill(25,70,11);
  noStroke();
  beginShape();
  vertex(228, 352); 
  vertex(244, 352); 
  vertex(243, 394);
  vertex(228, 393);
  endShape(CLOSE);   
  
  //color orange         
    fill(210,70,0);
  noStroke();
  beginShape();
  vertex(212, 327); 
  vertex(227, 328); 
  vertex(228, 340);
  vertex(212, 340);
  endShape(CLOSE);  
  
     fill(210,70,0);
  noStroke();
  beginShape();
  vertex(245, 340); 
  vertex(264, 340); 
  vertex(267, 352);
  vertex(244, 352);
  endShape(CLOSE);  
  
      fill(210,70,0);
  noStroke();
  beginShape();
  vertex(228, 393); 
  vertex(263, 399); 
  vertex(255, 416);
  vertex(227, 411);
  endShape(CLOSE);   
  
      fill(210,70,0);
  noStroke();
  beginShape();
  vertex(186, 409); 
  vertex(227, 411); 
  vertex(227,437);
  bezierVertex(215,443,200,443,183,436);
  endShape(CLOSE);    
  
        fill(210,70,0);
  noStroke();
  beginShape();
  vertex(190, 383); 
  vertex(186, 409); 
  vertex(153,410);
  bezierVertex(152,406,152,403,148,395);
  bezierVertex(155,390,159,381,161,374); 
  endShape(CLOSE); 

//color yellow
        fill(255,240,5);
  noStroke();
  beginShape();
  vertex(212, 341); 
  vertex(227, 341); 
  vertex(226,352);
  vertex(212,352);
  endShape(CLOSE); 
  
//color orange+yellow
 fill(242,135,0);
  noStroke();
  beginShape();
  vertex(153, 313); 
  vertex(198, 313); 
  vertex(191,351);
  vertex(167,349);
  bezierVertex(167,339,158,329,149,327);
  endShape(CLOSE); 
  
  
}


