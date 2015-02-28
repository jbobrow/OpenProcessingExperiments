
//Miro in Processing
//By TIEN chungyuan
// tweaked by schien@mail.ncku.edu.tw
// move the star-like shape into a function


void setup()
{
  size(520,195);

  smooth();
  strokeWeight(1.2);
}
float xoff = 0.0;
  
void draw()
{
xoff = xoff + .01;
  float n = noise(xoff) * width;
  background(n,208, 196);
  //這段是我亂寫的，想要試試看background變色，還不太會用
  
  //ballA
  fill(15);
  noStroke();
  beginShape();
  curveVertex(83.3,35.8);
  curveVertex(83.3,35.8);
  curveVertex(67.4,40);
  curveVertex(50.8,57.5);
  curveVertex(49.3,74);
  curveVertex(58.4,88);
  curveVertex(67.8,93.3);
  curveVertex(78.9,66);
  curveVertex(78.9,66);
  endShape();
  //ballA
  fill(47,0,150);
  noStroke();
  beginShape();
  curveVertex(83.3,35.8);
  curveVertex(83.3,35.8);
  curveVertex(94.6,38);
  curveVertex(107,51.4);
  curveVertex(113.2,72);
  curveVertex(102.4,86.4);
  curveVertex(87.1,95.2);
  curveVertex(67.8,93.3);
  curveVertex(78.9,66);
  curveVertex(78.9,66);
  endShape(); 
  //ballB
  fill(15);
  noStroke();
  beginShape();
  curveVertex(107,51.4);
  curveVertex(107,51.4);
  curveVertex(113.2,72);
  curveVertex(102.4,86.4);
  curveVertex(100,68.5);
  curveVertex(100,68.5);
  endShape(); 
  
  //ballB
  fill(139,198,67);//green
  noStroke();
  beginShape();
  curveVertex(107,51.4);
  curveVertex(107,51.4);
  curveVertex(113.2,72);
  curveVertex(102.4,86.4);
  curveVertex(112,99.6);
  curveVertex(130,109.2);
  curveVertex(148,106.7);
  curveVertex(162.4,97.3);
  curveVertex(169,84);
  curveVertex(171,72);
  curveVertex(169.7,59.2);
  curveVertex(165.6,48.5);
  curveVertex(154.4,34.9);
  curveVertex(136,32.8);
  curveVertex(116.7,40.1);
  curveVertex(116.7,40.1);
  endShape(); 
  
  
  beginShape();
  vertex(254.3,41);
  bezierVertex(266.9,40.5,260,55.3,254,55.6);
  endShape();
  
  beginShape();
  vertex(283.3,128.3);
  bezierVertex(292.1,122.7,302.7,135,293.4,141.7);
  endShape();
  
  //curve
  noStroke();
  fill(15);
  beginShape();
  vertex(165.6,48.5);
  bezierVertex(161.2,48.8,155,60,160.2,65);
  bezierVertex(161,66,167,72,171,72);
  bezierVertex(169.42,56.6,172,65,170,60.3);
  endShape();
  //curve
  stroke(15);
  noFill();
  beginShape();
  vertex(180.6,41);
  bezierVertex(182.6,38,161.2,48.8,165.6,48.5);
  bezierVertex(161.2,48.8,155,60,160.2,65);
  bezierVertex(161,66,167,72,171,72);
  bezierVertex(188.3,71,195,66.3,191.7,68.6);
  endShape();
  
  //Ball blue
  noStroke();
  fill(47,0,150);
  beginShape();
  vertex(169,84);
  bezierVertex(201,86.7,212.9,102,212.2,122.7);
  bezierVertex(211.5,144.2,202,154.2,188.3,162.4);
  bezierVertex(183.6,165.1,177.3,166.2,173,166.2);
  bezierVertex(154.5,166.4,145.9,162.5,135.3,150);
  bezierVertex(124.7,137.6,123.1,122.7,130,109.2);
  bezierVertex(137.2,93.6,151.9,82.63,164,84);
  endShape();
  noStroke();
  fill(15);
  beginShape();
  vertex(169,84);
  bezierVertex(167.7,93.6,142,111.9,130,109.2);
  bezierVertex(134.4,96.8,155.45,82.9,169,84);
  endShape();
  
  //littleballY&B
  noStroke();
  fill(255,241,0);
  beginShape();
  vertex(188.3,162.4);
  bezierVertex(183.6,165.1,177.3,166.2,173,166.2);
  bezierVertex(173.7,152,183.6,150,188.3,162.4);
  endShape();
  noStroke();
  fill(15);
  beginShape();
  vertex(188.3,162.4);
  bezierVertex(187.2,175.2,181.5,176.9,173,166.2);
  bezierVertex(177.3,166.2,183.6,165.2,188.3,162.4);
  endShape();
  stroke(15);
  line(183.6,170,188.3,200);
  
  //down_ball_on_line
  stroke(15);
  fill(139,198,67);
  beginShape();
  vertex(58.4,145.7);
  bezierVertex(63.6,134.9,82.9,128.3,89.7,140.5);
  bezierVertex(97.3,154.2,85,172.5,67.7,173.7);
  endShape();
  stroke(15);
  fill(47,0,150);
  beginShape();
  vertex(58.4,145.7);
  bezierVertex(53.5,156,54.3,175,69.7,173.7);
  endShape();
  
  //left long curve
  noFill();
  beginShape();
  curveVertex(87,0);
  curveVertex(87,0);
  curveVertex(83.3,35.8);
  curveVertex(78.9,66);
  curveVertex(67.8,93.3);
  curveVertex(60.5,113);
  curveVertex(58.4,145.7);
  curveVertex(69.7,173.7);
  curveVertex(80,194.5);
  curveVertex(80,194.5);
  endShape();
  //curves
  stroke(15);
  beginShape();
  vertex(255,0);
  bezierVertex(255,0,241.7,72.6,283.3,128.3);
  bezierVertex(324.9,184,350,195,350,195);
  endShape();
  beginShape();
  vertex(255,0);
  bezierVertex(255,0,332.9,20,357.8,23.2);
  bezierVertex(382.6,26.4,483.7,8.7,470,195);
  endShape();
  beginShape();
  vertex(247,91.1);
  bezierVertex(254.5,91.4,277.5,93.6,285.4,81.5);
  bezierVertex(293.4,69,296,60.6,307,60.4);
  endShape();
  
  
  arc(481.3,76.6,42.5,6,1.2*PI,2*PI);
  arc(488.1,105.5,44,6,1.2*PI,2*PI);
  
  beginShape();
  vertex(176,0);
  bezierVertex(176,0,176.7,41,211.1,35.7);
  bezierVertex(244.5,30.4,229.5,-15.8,209.9,-12.3);
  bezierVertex(190.3,9,185.9,17,204.4,20.4);
  bezierVertex(223.1,23.5,219.3,3.8,209.4,5.6);
  endShape();
  
  beginShape();
  vertex(438.3,195);
  bezierVertex(438.3,195,440.4,163.8,417.1,154.4);
  bezierVertex(417.1,154.4,416.9,138,405.8,133.5);
  bezierVertex(405.8,133.5,422.1,136,425.1,149);
  endShape();
  
  beginShape();
  vertex(406,80.5);
  bezierVertex(406,80.5,375.5,104.6,388.6,119.1);
  bezierVertex(401.8,133.7,416.1,103.6,402.9,103);
  bezierVertex(386.4,102.3,393.5,123.6,401.3,112);
  endShape();

  beginShape();
  vertex(476.6,159.4);
  bezierVertex(487.5,160.8,504.8,181,505.2,187.8);
  endShape();  
  beginShape();
  vertex(473.8,130.8);
  bezierVertex(485.4,128.7,508,143,510.1,147.8);
  endShape(); 
  
  /*
  line(100.2,9,122,11.9);
  line(354.8,150.9,373.6,144);
  line(497.5,57.8,486.7,75.9);
  line(212.2,122.7,256.5,121.8);
  line(233.1,93.6,235.3,150);
  line(220.5,113.7,247,136.3);
  line(247,109.3,220.5,136.3);
  
  line(211.5,51.2,238.8,50.9);
  line(227.3,36.2,225.2,65);
  line(235.3,41,215.6,60.4);
  line(215.6,41,235.3,60.4);
  
  line(116.5,176.9,107.8,195);
  
  line(454.3,0,440,17);
  line(454.3,0,456,26);
  line(454.3,0,473,15);
  */
  drawStars();
  
  //triangles
  fill(47,0,150);//BLUE
  noStroke();
  beginShape();
  curveVertex(255,0);
  curveVertex(255,0);
  curveVertex(303.2,11.9);
  curveVertex(357.8,23.2);
  curveVertex(357.8,23.2);
  vertex(345.8,59);
  vertex(254.3,5.6);
  endShape();
  beginShape();
  vertex(345.8,59);
  vertex(383.5,84.6);
  vertex(324.9,175.8);
  vertex(312.5,163.5);
  endShape();
  
  beginShape();
  vertex(256.5,69);
  bezierVertex(263.3,66.3,267.6,79.1,260.3,81.3);
  endShape();
  
  beginShape();
  vertex(283.3,128.3);
  bezierVertex(273.6,134.5,284.1,148.4,293.4,141.7);
  endShape();
  
  beginShape();
  vertex(296,79.1);
  vertex(279.4,79.1);
  vertex(288.7,90.7);
  endShape();
  
  fill(255,241,0);//yellow
  beginShape();
  vertex(303.3,195);
  vertex(312.2,195);
  vertex(324.9,175.8);
  vertex(312.5,163.5);
  endShape();
  beginShape();
  vertex(247,0);
  vertex(255,0);
  vertex(254.3,5.6);
  endShape();
  
  beginShape();
  vertex(256.5,69);
  bezierVertex(245.9,73.3,252.9,83.5,260.3,81.3);
  endShape();

  //circles
  fill(15);
  ellipse(209.4,5.6,9.45,8);
  ellipse(307,60,9.45,8);
  ellipse(247,91,9.45,8);
  ellipse(316,81.3,20.7,20.4);
  ellipse(100.2,113.3,9.45,8);
  ellipse(100.2,9,9.45,8);
  ellipse(122,11.9,9.45,8);
  ellipse(241.1,187.8,9.45,8);
  
  ellipse(354.8,150.9,9.45,8);
  ellipse(373.6,144,9.45,8);
  ellipse(316,119.8,9.45,8);
  
  ellipse(369.9,182.4,11,9);
  ellipse(445,170.9,9.45,8);
  ellipse(423.5,63.4,9,7);
  ellipse(415.7,11.9,11,8);
  ellipse(497.5,57.8,9.45,7.6);
  ellipse(486.7,75.9,9.45,8);
  
  ellipse(116.5,176.9,9.45,8);
  ellipse(107.8,195,11,9);
  
  ellipse(264,170,27.7,26.3);
  ellipse(148.3,195,27.7,26.3);
  ellipse(445.6,128.3,36.6,41.6);

  ellipse(401.3,112,7,8);  
  
  //sands
  fill(15);
  beginShape();
  curveVertex(10.6,21.9);
  curveVertex(10.6,21.9);
  curveVertex(25.3,21.9);
  curveVertex(19.6,36.2);
  curveVertex(10,51.2);
  curveVertex(28.7,50);
  curveVertex(19.6,36.2);
  curveVertex(19.6,36.2);
  endShape();
  
  beginShape();
  curveVertex(26.1,103.3);
  curveVertex(26.1,103.3);
  curveVertex(40.2,98.7);
  curveVertex(33.2,114.8);
  curveVertex(26,130);
  curveVertex(43,126.6);
  curveVertex(33.2,114.8);
  curveVertex(33.2,114.8);
  endShape();
  
  beginShape();
  curveVertex(27.7,162.9);
  curveVertex(27.7,162.9);
  curveVertex(39,162.9);
  curveVertex(32,173.8);
  curveVertex(24.3,188.1);
  curveVertex(40,185.6);
  curveVertex(32,173.8);
  curveVertex(32,173.8);
  endShape();
  
  beginShape();
  curveVertex(209,65);
  curveVertex(209,65);
  curveVertex(197,70.2);
  curveVertex(210,76);
  curveVertex(228,88.1);
  curveVertex(210.6,98.7);
  curveVertex(210,76);
  curveVertex(210,76);
  endShape();

  beginShape();
  curveVertex(392.6,33.3);
  curveVertex(392.6,33.3);
  curveVertex(377.3,34.5);
  curveVertex(383.5,51.6);
  curveVertex(396.7,73);
  curveVertex(375.2,75) ;
  curveVertex(383.5,51.6);
  curveVertex(383.5,51.6);
  endShape();
  
  beginShape();
  curveVertex(287,35.7);
  curveVertex(287,35.7);
  curveVertex(279,36);
  curveVertex(283,41);
  curveVertex(288.7,48);
  curveVertex(277.5,49) ;
  curveVertex(283,41);
  curveVertex(283,41);
  endShape();  
  
  beginShape();
  curveVertex(441.6,76);
  curveVertex(441.6,76);
  curveVertex(433.8,74.7);
  curveVertex(437.7,83.6);
  curveVertex(441.6,91);
  curveVertex(431,91) ;
  curveVertex(437.7,83.6);
  curveVertex(437.7,83.6);
  endShape();  
  
  beginShape();
  vertex(254.3,41);
  bezierVertex(244.5,41.4,249,56.6,254,55.6);
  endShape();

  beginShape();
  vertex(286.9,79.1);
  vertex(279.4,79.1);
  vertex(283.5,84.2);
  endShape();
  
  beginShape();
  curveVertex(288.7,90.7);
  curveVertex(288.7,90.7);
  curveVertex(300.2,106.4);
  curveVertex(277.5,110.6);
  curveVertex(288.7,90.7);
  curveVertex(288.7,90.7);
  endShape();
  
  
  fill(196,0,24);
  beginShape();
  vertex(417.1,154.4);
  bezierVertex(413.8,147.5,391.7,141.7,379.9,169);
  bezierVertex(379.9,169,401.3,147.8,414.3,167.8);
  bezierVertex(414.3,167.8,419.5,159.4,417.1,154.4);
  endShape();
}

void drawStars () {
  line(100.2,9,122,11.9);
  line(354.8,150.9,373.6,144);
  line(497.5,57.8,486.7,75.9);
  /*
  line(212.2,122.7,256.5,121.8);
  line(233.1,93.6,235.3,150);
  line(220.5,113.7,247,136.3);
  line(247,109.3,220.5,136.3);
  */
  drawOneStar(234.0, 121, 44, 57);
  /*
  line(211.5,51.2,238.8,50.9);
  line(227.3,36.2,225.2,65);
  line(235.3,41,215.6,60.4);
  line(215.6,41,235.3,60.4);
  */
  drawOneStar(225, 50.7 ,28, 29);
  
  line(116.5,176.9,107.8,195);
  /*
  line(454.3,0,440,17);
  line(454.3,0,456,26);
  line(454.3,0,473,15);
  */
  drawOneStar(456.5, 0, 33, 52);
  

}

void drawOneStar (int posx, float posy, float swidth, float sheight) {

float deltax = swidth/5;
//float deltay = sheight/5;
float deltay = deltax;

line(posx, posy-sheight/2,posx, posy+sheight/2);
line(posx-swidth/2, posy, posx+swidth/2, posy);

line(posx-swidth/2+deltax, posy-sheight/2+deltay, posx+swidth/2-deltax, posy+sheight/2-deltay);
line(posx-swidth/2+deltax, posy+sheight/2-deltay, posx+swidth/2-deltax, posy-sheight/2+deltay);


}
