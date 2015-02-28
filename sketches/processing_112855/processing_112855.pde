
//Lin,Lien-Ya
//Miro assigntment.
void setup(){
  size(600,750);
  background(230);
  smooth();

}

void draw(){
  
//fill color_curve

  fill(25,60,6);
  noStroke();
  beginShape();
  vertex(337,10);//a(337,10) start point
  bezierVertex(260,30,36,123,173,268);
  bezierVertex(200,299,227,297,255,290);
  bezierVertex(230, 276,237,187,234,200);
  bezierVertex(255,64,355,5,337,10);
  endShape();
  
  fill(0);
  noStroke();
  beginShape(); 
  vertex(234,200);
  bezierVertex(213,219,181,252,173,268);
  bezierVertex(200,299,227,297,255,290);
  bezierVertex(230, 276,237,187,234,200);
  endShape();
  //-------------------------------moon

  fill(195,59,21);
  noStroke();
  beginShape(); 
  vertex(170,92);
  bezierVertex(160,80,124,62,102,96);
  bezierVertex(82,127,114,143,131,148);
  bezierVertex(160,158,192,118,170,92);
  endShape();
  fill(0);
  noStroke();
  beginShape(); 
  vertex(174,93);
  bezierVertex(157,100,137,130,134,150);
  bezierVertex(138,153,166,150,177,129);
  bezierVertex(180,116,178,100,174,93);
  endShape();
  
  fill(0);
  noStroke();
  beginShape(); 
  vertex(534,164);
  vertex(548,150);
  bezierVertex(557,158,575,178,582,190);
  endShape();
  fill(0);
  noStroke();
  beginShape(); 
  vertex(582,190);
  bezierVertex(586,203,589,216,590,227);
  vertex(600,219);
  vertex(600,200);
  endShape();
  fill(0);
  noStroke();
  beginShape(); 
  vertex(548,150);
  bezierVertex(554,140,553,128,540,118);
  bezierVertex(525,109,515,121,511,131);
  bezierVertex(500,157,531,180,548,150);
  endShape();
  fill(195,59,21);
  stroke(195,59,21);
  beginShape(); 
  vertex(548,150);
  vertex(511,131);
  bezierVertex(500,157,531,180,548,150);
  endShape();
  
  fill(23,56,78);//blue
  stroke(23,56,78);
  beginShape();
  vertex(529,368);
  bezierVertex(519,384,516,414,520,420);
  bezierVertex(537,443,566,449,588,431);
  bezierVertex(598,422,600,355,586,352);
  bezierVertex(568,345,548,343,529,368);
  endShape();
  fill(0);
  noStroke();
  beginShape();
  vertex(520,420);
  bezierVertex(537,443,566,449,588,431);
  bezierVertex(598,422,600,355,586,352);
  vertex(539,412);//point
  vertex(571,378);//point
  endShape();
  fill(195,59,21);//red
  beginShape();
  vertex(543,381);
  bezierVertex(535,389,536,403,539,412);//point
  bezierVertex(545,420,561,425,571,418);
  bezierVertex(581,412,580,383,571,378);//point
  bezierVertex(563,370,549,376,543,381);
  endShape();
  fill(0);
  beginShape();
  vertex(543,381);
  bezierVertex(535,389,536,403,539,412);//point
  vertex(571,378);//point
  bezierVertex(563,370,549,376,543,381);
  endShape();
  
  fill(0);
  stroke(0);
  beginShape();
  vertex(162,529);
  bezierVertex(152,505,81,538,99,568);
  bezierVertex(110,584,135,582,150,570);
  bezierVertex(165,560,172,547,162,529);
  endShape();
 
  noFill();
  stroke(0);
  beginShape();
  vertex(294,711);
  bezierVertex(327,734,421,744,453,721);
  bezierVertex(460,715,467,644,464,639);
  endShape();
  fill(0);
  stroke(0);
  beginShape();
  vertex(488,602);
  bezierVertex(442,594,429,634,464,640);
  bezierVertex(480,640,501,640,503,625);
  bezierVertex(506,614,501,604,488,602);
  endShape();
  //-------------------------------sun
  fill(0);
  noStroke();
  beginShape();
  vertex(294,280);
  bezierVertex(301,287,317,277,320,255);
  bezierVertex(325,240,350,230,341,265);
  bezierVertex(338,273,332,286,331,298);//point
  bezierVertex(331,306,365,321,370,271);//point
  bezierVertex(379,199,329,193,300,227);
  bezierVertex(290,237,281,270,294,280);
  endShape(); //Line4_n
  
  fill(195,59,21);//red
  stroke(195,59,21);
  beginShape();
  vertex(370,270);
  bezierVertex(338,290,335,290,330,297);
  bezierVertex(331,306,365,321,370,271);//point
  endShape();
 //--------------------------------------Line4_n
  
  fill(0);
  noStroke();
  beginShape();
  vertex(400,320);
  bezierVertex(410,325,437,333,445,356);
  bezierVertex(451,380,447,390,440,400);
  bezierVertex(446,391,477,360,476,326);
  bezierVertex(475,294,460,284,444,279);
  bezierVertex(428,272,413,276,403,285);
  bezierVertex(393,293,396,309,400,320);
  endShape(); 
  
  fill(23,56,78);
  stroke(23,56,78);
  beginShape();
  vertex(400,320);
  bezierVertex(420,300,435,287,444,279);
  bezierVertex(428,272,413,276,403,285);
  bezierVertex(393,293,396,309,400,320);
  endShape(); 
  //---------------------------------------Line5_,
  
  fill(0);
  noStroke();
  beginShape();
  vertex(228,468);
  bezierVertex(217,535,217,570,221,593);
  bezierVertex(228,645,260,648,274,655);//point
  bezierVertex(285,660,330,662,342,656);//point
  bezierVertex(436,620,403,523,398,507);
  vertex(341,509);
  vertex(342,467);
  vertex(228,468);
  endShape(); 
  
  fill(195,59,21);//red
  noStroke();
  beginShape();
  vertex(219,557);
  vertex(228,614);
  vertex(279,614);
  vertex(275,654);
  bezierVertex(291,663,318,663,340,655);
  vertex(342,616);
  vertex(386,623);
  bezierVertex(395,613,398,605,402,595);
  vertex(342,587);
  vertex(342,616);
  vertex(279,614);
  vertex(282,574);
  vertex(219,557);
  endShape();
  fill(195,59,21);//red
  noStroke();
  beginShape();
  vertex(319,490);
  vertex(317,508);
  vertex(340,508);
  vertex(341,491);
  endShape(); 
  noStroke();
  beginShape();
  vertex(368,508);
  vertex(369,527);
  vertex(402,525);
  vertex(398,508);
  endShape();
  
  
  fill(249,142,4);//orange
  noStroke();
  beginShape();
  vertex(228,468);
  vertex(223,489);
  vertex(251,523);
  vertex(288,525);
  vertex(297,468);
  endShape(); 
  
  
  fill(0);
  noStroke();
  beginShape();
  vertex(221,593);
  bezierVertex(259,557,261,499,223,494);
  bezierVertex(217,535,217,570,221,593);
  endShape();
  fill(23,56,78);//blue
  noStroke();
  beginShape();
  vertex(222,519);
  vertex(251,524);
  bezierVertex(252,534,248,551,242,563);
  vertex(219,557);
  endShape();
  fill(23,56,78);//blue
  noStroke();
  beginShape();
  vertex(299,468);
  vertex(296,490);
  vertex(319,490);
  vertex(319,468);
  endShape();
  fill(23,56,78);//blue
  noStroke();
  beginShape();
  vertex(287,551);
  vertex(285,573);
  vertex(340,582);
  vertex(337,549);
  endShape();
  fill(23,56,78);//blue
  noStroke();
  beginShape();
  vertex(342,509);
  vertex(341,527);
  vertex(366,526);
  vertex(366,509);
  endShape();
  
  fill(25,60,6);//green
  noStroke();
  beginShape();
  vertex(251,522);
  vertex(250,546);
  vertex(285,549);
  vertex(289,522);
  endShape();
  fill(25,60,6);//green
  noStroke();
  beginShape();
  vertex(293,509);
  vertex(290,526);
  vertex(315,527);
  vertex(316,509);
  endShape();
  fill(25,60,6);//green
  noStroke();
  beginShape();
  vertex(341,528);
  vertex(342,587);
  vertex(366,590);
  vertex(366,528);
  endShape();
  
  fill(255,240,0);//yellow
  noStroke();
  beginShape();
  vertex(317,510);
  vertex(317,527);
  vertex(339,526);
  vertex(340,510);
  endShape();


  
//Line only
  noFill();
  noStroke();
  beginShape();
  vertex(337,10);//a(337,10) start point
  bezierVertex(260,30,36,123,173,268);
  bezierVertex(200,299,227,297,255,290);
  bezierVertex(230, 276,237,187,234,200);
  bezierVertex(255,64,355,5,337,10);
  endShape(); 
  //-------------------------------moon
  noFill();
  stroke(0);
  beginShape();
  vertex(377,0);
  bezierVertex(393,90,279,160,234,200);
  bezierVertex(213,219,181,252,173,268);
  bezierVertex(158,284,51,447,47,545);
  bezierVertex(39,676,141,662,221,593);//point
  bezierVertex(259,557,261,499,223,494);//point
  bezierVertex(193,487,156,539,162,530);
  endShape();
  //------------------------------Line1
  noFill();
  stroke(0);
  beginShape();
  vertex(543,225);
  bezierVertex(514,223,385,260,370,270);
  bezierVertex(338,290,335,290,330,297);
  bezierVertex(302,318,236,437,228,468);//
  bezierVertex(217,535,217,570,221,593);
  bezierVertex(228,645,260,648,274,655);//point
  bezierVertex(285,660,330,662,342,656);//point
  bezierVertex(436,620,403,523,398,507);
  bezierVertex(378,392,381,339,400,320);//point1
  bezierVertex(420,300,435,287,444,279);//point2
  bezierVertex(480,257,558,240,545,242);
  endShape(); 
  //------------------------------Line2
  noFill();
  stroke(0);
  beginShape();
  vertex(468,180);
  bezierVertex(482,180,542,178,543,225);
  bezierVertex(545,230,545,242,545,242);
  bezierVertex(546,254,543,298,515,330);
  bezierVertex(509,338,489,363,485,371);
  bezierVertex(479,386,455,428,520,420);
  vertex(540,412);
  vertex(569,379);
  vertex(588,351);
  bezierVertex(600,324,600,198,564,165);
  bezierVertex(525,120,488,127,470,133);
  bezierVertex(430,136,395,189,468,180);
  endShape(); 
  //------------------------------Line3_right
  noFill();
  noStroke();
  beginShape();
  vertex(294,280);
  bezierVertex(301,287,317,277,320,255);
  bezierVertex(325,240,350,230,341,265);
  bezierVertex(338,273,332,286,331,298);
  bezierVertex(331,306,365,321,370,271);
  bezierVertex(379,199,329,193,300,227);
  bezierVertex(290,237,281,270,294,280);
  endShape(); 
 //------------------------------Line4_n
  noFill();
  noStroke();
  beginShape();
  vertex(400,320);
  bezierVertex(410,325,437,333,445,356);
  bezierVertex(451,380,447,390,440,400);
  bezierVertex(446,391,477,360,476,326);
  bezierVertex(475,294,460,284,444,279);
  bezierVertex(428,272,413,276,403,285);
  bezierVertex(393,293,396,309,400,320);
  endShape();
 //------------------------------Line5_,
  noFill();
  stroke(0);
  beginShape();
  vertex(115,86);
  bezierVertex(72,20,3,56,30,105);
  endShape();
  noFill();
  stroke(0);
  beginShape();
  vertex(100,96);
  bezierVertex(78,57,17,106,46,160);
  endShape();
  noFill();
  stroke(0);
  beginShape();
  vertex(98,107);
  bezierVertex(64,72,42,147,90,180);
  endShape();
  //----------------------------------there lines
  noFill();
  stroke(0);
  beginShape(); 
  vertex(534,164);
  vertex(600,200);
  vertex(600,219);
  vertex(561,255);
  endShape();
  noFill();
  stroke(0);
  line(456,434,580,592);
  line(511,444,513,576);
  line(434,511,570,499);
  line(435,572,566,447);
  line(212,467,371,467);
  line(300,447,267,711);
  line(339,419,342,729);
  line(293,508,406,507);
  line(368,496,367,590);
  endShape();
  //----------------------------------*&lines;
   }


