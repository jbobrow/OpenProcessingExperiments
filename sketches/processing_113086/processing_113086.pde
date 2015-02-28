
// Miro The Melancholic
// Su Hsiu Pai


void setup() {
  //set window size
  size(800, 1000);
  //styling
  smooth();
  background(245, 246, 241);
}


void draw() {
  
  //draw lines (Right star)
  stroke(0);
  strokeWeight(3);
  line(579,677,764,666);
  line(679,591,684,769);
  line(608,576,775,789);
  line(755,596,580,761);
  
  //draw left curves
  smooth();
  noFill();
  strokeWeight(3);
  beginShape();
  vertex(503, 0);
  bezierVertex(477, 93, 397, 189, 315, 263);
  bezierVertex(297, 281, 265, 311, 227, 357);
  bezierVertex(165,447,85,615,61,705);
  bezierVertex(65,753,69,793,99,833);
  bezierVertex(133,857,169,859,201,853);
  bezierVertex(229,841,267,817,295,793);
  bezierVertex(317,763,321,749,329,727);
  bezierVertex(335,691,331,675,309,659);
  bezierVertex(286,657,253,665,229,685);
  bezierVertex(221,695,213,713,213,713);
 
  endShape();
  
  //left up 3 curves
  smooth();
  noFill();
  stroke(0);
  strokeWeight(3);
  bezier(41,141,15,95,55,40,102,68);
  bezier(102,68,92,58,160,115,153,115);
  
  smooth();
  noFill();
  strokeWeight(3);
  beginShape();
  vertex(61,213);
  bezierVertex(54,169,90,115,137,126);
  endShape();
  
  beginShape();
  vertex(120,232);
  bezierVertex(92,204,92,148,132,144);
  endShape();
  
   

  //draw shapes
  
  //moon left above
  noStroke();
  fill(0,60,0);
  beginShape();
  vertex(457,12);
  bezierVertex(354,44,272,89,226,120);
  bezierVertex(205,144,188,169,174,200);
  bezierVertex(173,245,186,292,207,340);
  bezierVertex(211,340,215,349,229,359);
  bezierVertex(263,373,290,382,340,388);
  bezierVertex(316,331,313,266,337,175);
  bezierVertex(369,107,383,79,410,44);
  bezierVertex(422,34,431,24,457,12);
  endShape();


  //sun left up
  noStroke();
  fill(220,0,0);
  ellipse(183,148,105,100);
  
  
  //intersection of sun & moon
  noStroke();
  fill(0);
  beginShape();
  vertex(226,120);
  bezierVertex(209,137,187,165,174,200);
  bezierVertex(229,201,255,155,226,120);
  endShape();
  
  //intersection of moon and line
  beginShape();
  vertex(321,259);
  bezierVertex(285,294,258,322,227,357);
  bezierVertex(227,357,277,381,340,388);
  bezierVertex(340,388,316,312,321,259);
  endShape();
  
  //left dot down
  noStroke();
  fill(0);
  beginShape();
  vertex(217,703);
  bezierVertex(197,693,177,699,147,715);
  bezierVertex(137,723,131,735,127,745);
  bezierVertex(133,757,137,765,144,771);
  bezierVertex(155,775,171,774,185,771);
  bezierVertex(198,764,206,755,216,745);
  bezierVertex(221,736,224,725,222,715);
  bezierVertex(221,709,219,707,219,707);
  endShape();
  
  //middle anchor_black
  noStroke();
  fill(0);
  beginShape();
  vertex(443,394);
  bezierVertex(442,381,449,369,453,356);
  bezierVertex(455,348,458,341,460,334);
  bezierVertex(458,325,451,323,442,324);
  bezierVertex(437,328,431,340,425,354);
  bezierVertex(419,364,413,368,395,373);
  bezierVertex(385,365,382,354,384,339);
  bezierVertex(388,327,393,316,399,304);
  bezierVertex(408,293,418,284,434,276);
  bezierVertex(451,274,466,278,477,285);
  bezierVertex(486,296,491,306,494,319);
  bezierVertex(496,336,496,348,495,359);
  bezierVertex(495,359,478,371,468,378);
  bezierVertex(461,383,449,392,443,394);
  endShape();
  
  //middle anchor_red
  noStroke();
  fill(200,0,0);
  beginShape();
  vertex(443,394);
  bezierVertex(452,386,462,380,475,372);
  bezierVertex(485,366,493,361,495,359);
  bezierVertex(495,359,494,376,491,385);
  bezierVertex(485,395,475,403,466,407);
  bezierVertex(457,407,450,405,443,394);
  endShape();
  
  // middle drop_blue
  noStroke();
  fill(0,0,150);
  beginShape();
  vertex(536,423);
  bezierVertex(542,412,550,400,559,394);//
  bezierVertex(566,387,574,382,594,372);//
  bezierVertex(594,372,585,369,577,368);
  bezierVertex(569,368,558,369,547,376);
  bezierVertex(540,382,532,393,529,403);
  bezierVertex(529,410,531,418,535,423);//
  endShape();
  
  // middle drop_black 
  noStroke();
  fill(0);
  beginShape();
  vertex(536,423);
  bezierVertex(542,412,550,400,559,394);//
  bezierVertex(566,387,574,382,594,372);//
  bezierVertex(594,372,602,376,611,382);
  bezierVertex(618,390,625,399,629,406);
  bezierVertex(632,417,635,432,635,454);
  bezierVertex(631,468,627,481,619,494);
  bezierVertex(612,502,605,515,590,531);//
  bezierVertex(590,531,592,523,596,516);
  bezierVertex(598,504,598,493,595,479);
  bezierVertex(591,468,587,463,580,453);
  bezierVertex(572,446,561,440,553,434);
  bezierVertex(545,430,540,427,536,423);
  endShape();
  
  
  
  
  
  
  //up part line_anchor
  
  smooth();
  noFill();
  stroke(0);
  strokeWeight(3);
  beginShape();
  vertex(725,302);
  bezierVertex(721,285,712,270,702,261);
  bezierVertex(695,254,677,247,657,246);
  bezierVertex(641,243,619,241,594,242);
  bezierVertex(576,230,571,219,576,202);
  bezierVertex(585,194,601,184,618,177);
  bezierVertex(632,174,650,172,681,175);//cross
  bezierVertex(681,175,691,178,699,183);
  bezierVertex(712,186,721,194,730,202);//crossend 
  bezierVertex(743,210,752,221,763,235);
  bezierVertex(775,251,787,281,789,301);//cross
  bezierVertex(795,331,795,353,796,385);
  bezierVertex(795,423,788,453,783,470);//cross start
  bezierVertex(774,485,764,500,759,505);
  bezierVertex(752,519,740,536,722,550);
  bezierVertex(706,558,696,558,681,560);
  bezierVertex(657,555,643,544,639,527);
  bezierVertex(641,508,649,489,661,469);
  bezierVertex(675,455,692,434,705,410);
  bezierVertex(716,391,723,368,729,348);
  bezierVertex(730,333,728,315,725,302);
  endShape();
  
  smooth();
  fill(0);
  stroke(0);
  strokeWeight(3);
  beginShape();
  vertex(730,200);
  bezierVertex(743,210,752,221,763,235);
  bezierVertex(761,233,764,233,775,251);//cross
   bezierVertex(775,251,736,233,708,213);
  endShape();
  
  
  smooth();
  fill(0);
  stroke(0);
  strokeWeight(3);
  beginShape();
  vertex(775,256);
  bezierVertex(800,269,800,294,790,300);
  bezierVertex(790,300,786,281,775,256);
  endShape();

  //draw right curves XX
  smooth();
  noFill();
  strokeWeight(3);
  beginShape();
  vertex(748,340);
  bezierVertex(770,319,790,300,800,291);
  endShape();
  
 
 
 
 
 
  //ellipse right up_black
  noStroke();
  fill(0);
  ellipse(705,187,56,56);
  //red part
  smooth();
  fill(200,0,0);
  beginShape();
  vertex(681,176);
  bezierVertex(681,175,691,178,699,183);
  bezierVertex(712,186,721,194,730,202);//crossend 
  bezierVertex(730,202,722,211,708,218);
  bezierVertex(695,216,685,209,680,200);
  bezierVertex(675,189,673,184,679,177);
  endShape();
  
  
  //ellipse right biger_black
  smooth();
  fill(0);
  beginShape();
  vertex(783,470);
  bezierVertex(774,485,764,500,759,505);
  bezierVertex(752,519,740,536,722,550);
  bezierVertex(706,558,696,558,696,558);
  bezierVertex(696,558,702,574,715,584);
  bezierVertex(725,587,742,589,761,587);
  bezierVertex(774,582,786,573,793,559);
  bezierVertex(799,541,799,510,797,498);
  bezierVertex(796,486,794,482,783,470);
  endShape();  
  //ellipse right biger_blue
  smooth();
  fill(0,0,200);
  beginShape();
  vertex(783,470);
  bezierVertex(774,485,764,500,759,505);
  bezierVertex(752,519,740,536,722,550);
  bezierVertex(706,558,696,558,696,558);
  bezierVertex(692,544,693,524,698,511);
  bezierVertex(698,500,710,483,714,474);
  bezierVertex(718,471,725,472,742,464);
  bezierVertex(755,462,765,463,770,463);
  endShape();  
  
  //ellipse right middle_black
  noStroke();
  fill(0);
  ellipse(745,531,52,54);
  //red part
  smooth();
  fill(200,0,0);
  beginShape();
  vertex(722,549);
  bezierVertex(730,555,741,559,754,559);
  bezierVertex(766,550,769,539,768,527);
  bezierVertex(765,516,762,509,759,506); 
  bezierVertex(752,519,740,536,722,550);
  endShape();  
  
  
  //Bag_clors_from up left to down right
  
  //orange
  smooth();
  fill(255,140,0);
  beginShape();
  vertex(305,624);
  bezierVertex(302,639,300,649,298,657);
  bezierVertex(309,659,313,660,325,670);
  bezierVertex(330,678,335,687,335,699);
  bezierVertex(335,699,358,700,386,703);
  bezierVertex(386,703,390,678,395,653);
  bezierVertex(398,622,398,622,397,624);
  bezierVertex(397,624,368,626,305,624);
  endShape();  
 
  fill(0,0,200); //blue
  quad(396,623,393,652,425,652,426,623);
  fill(0); //black
  quad(426,623,425,652,458,652,456,623);
  fill(0); //black
  quad(393,652,390,678,424,678,425,652);
  fill(200,0,0); //red
  quad(425,652,424,678,456,677,458,652);
  fill(0,60,0);//green
  quad(390,678,385,701,421,703,424,678);
  fill(255,255,0);//yellow
  quad(424,678,421,703,452,704,456,677);
  
  fill(0,0,200);//blue
  quad(456,677,452,704,490,702,492,677);
  fill(200,0,0);//red
  quad(492,677,490,702,538,701,532,676); 
  
  fill(0,60,0);//green
  quad(334,699,326,729,382,733,385,701);
  fill(0);//balck
  quad(385,701,382,733,453,731,453,701);
  fill(0);//black
  quad(326,729,321,749,378,764,382,733);
  fill(0,0,200);//blue
  quad(382,733,378,764,456,778,453,731);
  fill(0,60,0);//green
  quad(454,703,455,784,488,788,489,701);
  //black
  smooth();
  fill(0);
  beginShape();
  vertex(489,701);
  bezierVertex(487,746,487,765,489,790);
  bezierVertex(489,790,512,792,537,797);
  bezierVertex(537,797,543,782,544,765);
  bezierVertex(543,749,534,726,540,727);
  bezierVertex(539,714,537,706,536,701);
  bezierVertex(536,701,510,701,489,701);
  endShape();

  //black
  smooth();
  fill(0);
  beginShape();
  vertex(299,659);
  bezierVertex(294,676,293,685,293,690);
  bezierVertex(293,690,313,695,337,698);
  bezierVertex(337,698,333,684,324,668);
  bezierVertex(317,663,320,662,299,656);
  endShape();  
  //blue
  smooth();
  fill(0,0,200);
  beginShape();
  vertex(293,690);
  bezierVertex(292,717,290,727,291,744);
  bezierVertex(291,744,305,746,324,750);
   bezierVertex(324,750,329,728,331,716);
   bezierVertex(334,705,336,698,336,698);
   endShape();  
  //black
  smooth();
  fill(0);
  beginShape();
  vertex(291,742);
  bezierVertex(291,744,292,771,295,792);
  bezierVertex(295,792,305,780,311,773);
  bezierVertex(316,766,320,756,324,750);
  bezierVertex(324,750,307,745,291,744);
  endShape(); 
 
 //red 
  smooth();
  fill(200,0,0);
  beginShape();
  vertex(322,752);
  bezierVertex(318,765,310,776,298,788);
   bezierVertex(298,788,299,799,300,809);
    bezierVertex(303,812,303,815,307,819);
     bezierVertex(307,819,327,816,341,815);//
      bezierVertex(353,816,364,816,372,816);//
       bezierVertex(372,816,371,804,372,793);
        bezierVertex(374,779,376,771,378,764);
         bezierVertex(378,764,359,760,324,750);
         endShape();   
  //back
  smooth();
  fill(0);
  beginShape();
  vertex(377,765);
  bezierVertex(401,768,429,773,451,778);
  bezierVertex(451,778,457,797,517,828);
  bezierVertex(517,828,504,846,496,854);
  bezierVertex(486,863,470,871,454,874);
  bezierVertex(433,880,401,877,369,875);
  bezierVertex(357,870,342,864,328,857);
  bezierVertex(320,849,315,840,304,818);
  bezierVertex(304,818,319,816,340,815);
  bezierVertex(354,815,364,816,372,818);
  bezierVertex(372,818,372,805,373,786);
bezierVertex(374,776,375,770,377,765);
endShape();

 //red 
  smooth();
  fill(200,0,0);
  beginShape();
  vertex(371,817);
  bezierVertex(369,847,369,858,366,873);
  bezierVertex(366,873,381,875,397,877);
  bezierVertex(412,877,429,877,443,874);
  bezierVertex(450,874,455,874,456,874);
  bezierVertex(456,874,455,865,455,849);
  bezierVertex(454,836,454,829,454,820);//
  bezierVertex(454,820,437,821,422,820);
  bezierVertex(404,829,385,819,377,818);
  endShape();
  
  //red 
  smooth();
  fill(200,0,0);
  beginShape();
  vertex(454,820);
  bezierVertex(456,810,456,798,456,784);
  bezierVertex(456,784,488,788,508,792);
  bezierVertex(518,794,531,793,534,795);
  bezierVertex(534,795,530,808,516,830);
  bezierVertex(516,830,498,826,486,824);
  bezierVertex(472,822,461,821,454,820);
  endShape(); 
  
  
  //lines above
  //bag
  stroke(0);
  strokeWeight(3);
  line(284,625,499,622);  
  line(391,678,541,675);
  line(492,662,490,706);
  
  //bag whole line
  smooth();
  noFill();
  strokeWeight(3);
  beginShape();
  vertex(734,299);
 bezierVertex(710,305,684,310,650,317);
 bezierVertex(608,326,575,334,553,341);
 bezierVertex(530,346,509,353,494,361);
 bezierVertex(482,369,471,375,455,384);
 bezierVertex(444,393,435,401,422,421);
 bezierVertex(413,440,406,451,390,470);
 bezierVertex(380,487,368,505,354,523);
  bezierVertex(342,544,332,564,321,583);
   bezierVertex(316,596,311,609,307,623);
    bezierVertex(301,639,298,654,295,675);
     bezierVertex(292,690,289,712,289,734);
      bezierVertex(291,753,293,770,296,784);
      bezierVertex(299,789,302,805,306,820);
      bezierVertex(312,833,320,845,327,856);
      bezierVertex(340,863,350,869,361,873);
      bezierVertex(369,875,382,877,397,878);
      bezierVertex(410,879,427,879,412,879);
      bezierVertex(425,878,437,878,448,876);
      bezierVertex(462,873,473,869,483,863);
      bezierVertex(491,858,501,851,506,842);
      bezierVertex(516,833,523,818,530,806);
      bezierVertex(536,796,540,784,542,772);
      bezierVertex(542,762,544,756,539,744);
      bezierVertex(541,731,541,725,539,712);
      bezierVertex(534,700,534,691,533,677);//
      bezierVertex(530,655,527,645,522,620);
      bezierVertex(520,601,518,580,515,556);
      bezierVertex(515,533,512,511,513,487);
      bezierVertex(517,470,522,453,529,433);
      bezierVertex(537,422,540,415,540,413);
      bezierVertex(542,412,550,400,559,394);//
      bezierVertex(566,387,574,382,594,372);//
      bezierVertex(605,363,626,352,644,346);
      bezierVertex(669,340,684,334,701,330);
      bezierVertex(712,326,718,324,731,323);
      endShape();
      
      //draw lines in bag
  smooth();
  noFill();
  strokeWeight(3);
  beginShape();
  vertex(400,594);
  bezierVertex(398,625,390,670,388,693);
  bezierVertex(387,702,382,735,378,765);
   bezierVertex(371,817,368,857,367,868);
    bezierVertex(365,888,362,918,359,950);
    endShape();
    
    smooth();
  noFill();
  strokeWeight(3);
  beginShape();
  vertex(454,560);
  bezierVertex(458,606,457,637,455,679);
  bezierVertex(454,704,454,729,453,747);
  bezierVertex(453,757,455,780,456,841);
  bezierVertex(455,861,455,907,456,970);
  endShape();
  
  
  //sperm look)black
  
  smooth();
  noFill();
  strokeWeight(3);
  beginShape();
  vertex(392,946);
  bezierVertex(426,962,443,967,461,971);
   bezierVertex(491,978,518,982,550,979);
  bezierVertex(577,975,591,969,604,962);
 bezierVertex(604,962,610,937,613,910);
bezierVertex(617,894,619,875,619,849);
endShape();

 fill(0);
 ellipse(632,828,78,57);
 
  
  
    




}



