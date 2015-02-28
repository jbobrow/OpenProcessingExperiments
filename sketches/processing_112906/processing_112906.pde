
// Carnival:For me,this picture suggests the scene with mirth, enjoyment, brightness and thirst
// Chang, Kuo-Ping from department ID

void setup(){
  size(840,570);
  background(188,154,127); 
}

void draw(){
  
 fill(200,0,0); //draw the red part
 noStroke();
 beginShape();
 vertex(635,107.5);
 bezierVertex(689,172,689,236,603,275);
 bezierVertex(581,280,560,290,538,301);
 endShape();
 
 fill(0);   //draw the black part
 noStroke();
 beginShape();
 vertex(635,107.5);
 bezierVertex(614,122,592,133,570,140);
 bezierVertex(517,150,474,193,517,258);
 bezierVertex(523,269,532,286,538,301);
 endShape();
 
 noFill(); //draw the left line1
 stroke(0);
 beginShape();
 vertex(517,172);
 bezierVertex(474,160,430,189,398,215);
 bezierVertex(344.5,258,215,247,215,84);
 endShape();
 
 noFill(); //draw the left line2
 stroke(0);
 beginShape();
 vertex(502,211);
 bezierVertex(491,202,409,236.5,366,279);
 bezierVertex(215,408,21.5,279.5,103,168);
 endShape();
 
 noFill(); //draw the right line3
 stroke(0);
 beginShape();
 vertex(512,247);
 bezierVertex(452,258,409,301,355,365.5);
 bezierVertex(258,473,194,495,107.5,473);
 bezierVertex(58,465,21.5,408,43,344);
 endShape();
 
 noFill(); //draw the right line1
 stroke(0);
 //beginShape();
 bezier(672,189,732,161,807,157,840,172);
 //endShape();
 
 noFill(); //draw the right line2
 stroke(0);
 beginShape();
 vertex(660,232);
 bezierVertex(689,243,706,277,711,301);
 bezierVertex(728,354,758,398,805.5,417);
 endShape();
 
 noFill(); //draw the right line3
 stroke(0);
 beginShape();
 vertex(624,265);
 bezierVertex(633,288,633,318,624.5,344);
 bezierVertex(615,387,629,419,657,451);
 endShape();
 
 noFill();//draw middle curvee
 stroke(0);
 beginShape();
 vertex(570,423);
 bezierVertex(565,372,550,355,517,344);
 bezierVertex(482,338,439,365,430,387);
 bezierVertex(415,412,426,438,449,458);
 bezierVertex(495,482,514,460,532,442);
 bezierVertex(545,422,542,412,532,401);
 bezierVertex(530,395,505,389,495,402);
 endShape();
 
 fill(0);  // black circle
 ellipse(480,405,31,32);
 
 fill(0);
 stroke(0);
 beginShape();
 vertex(400,318);
 bezierVertex(433,357,419,406,387,437);
 bezierVertex(360,455,340,457,296,425);
 endShape();
 
 noFill();
 stroke(0);
 bezier(400,318,375,302,360,311,342,333);
 
 fill(0); // little black ground
 ellipse(338,344,29,23);
 
 noFill();  // middle long line
 stroke(0);
 beginShape();
 vertex(296,425);
 bezierVertex(264,388,260,350,301,305);
 bezierVertex(368,217,375,205,401,78); 
 endShape();
 
 fill(75,68,136);  // ball on longline
 noStroke();
 arc(382,158,50,43,4*PI/7,8*PI/5);
 
 fill(0);      // ball on lone line
 noStroke();
 arc(382,158,50,43,11*PI/7,18*PI/7);
 
 fill(0);    //people in black
 noStroke();
 beginShape();
 vertex(319,146);
 vertex(263,139);
 vertex(279,110);
 bezierVertex(290,113,299,113,310,111);
 vertex(319,146);
 endShape();
 
 fill(75,68,136); //people in blue
 noStroke();
 beginShape();
 vertex(279,110);
 vertex(300,73);
 vertex(310,111);
 bezierVertex(290,113,299,113,279,110);
 endShape();
 
 fill(0); // human head
 noStroke();
 ellipse(301,56,42,38);

 noFill();  // right hand
 stroke(0);
 beginShape();
 vertex(279,110);
 bezierVertex(249,105,244,98,243,84);
 bezierVertex(252,59,253,46,245,30);
 endShape(); 
 
 noFill(); //left hand
 stroke(0);
 bezier(310,111,355,99,355,80,345,37);
 
 fill(75,68,136);
 noStroke();
 arc(350,73,32,32,4*PI/7,3*PI/2);
 
 fill(0);
 noStroke();
 arc(350,73,32,32,3*PI/2,18*PI/7);
 
 fill(0);        //  right middle black
 noStroke();
 beginShape();
 vertex(600,177);
 vertex(581,215);
 bezierVertex(595,220,602,215,609,203);
 bezierVertex(613,194,612,186,602,177);
 endShape();
 
 fill(75,68,136);   // left middle blue
 noStroke();
 beginShape();
 vertex(600,177);
 vertex(581,213);
 bezierVertex(572,208,561,199,572,180); 
 bezierVertex(574,174,590,169,602,177); 
 endShape();
 
 fill(75,68,136);  //first line blue
 noStroke();
 beginShape();
 vertex(472,174);
 vertex(434,191);
 bezierVertex(441,203,450,206,458,202);
 bezierVertex(468,198,475,190,472,174);
 endShape();
 
 fill(0);       //first line black
 noStroke();
 beginShape();
 vertex(472,174); 
 vertex(434,191);
 bezierVertex(428,180,440,162,453,165);
 bezierVertex(464,163,470,169,472,174);
 endShape();
 
 noStroke();    //third ball
 fill(0);
 arc(461,268,28,28,5*PI/6,11*PI/6);
 fill(75,68,136);
 arc(461,268,28,28,11*PI/6,17*PI/6);
 
 fill(75,68,136);   //4th ball
 arc(622,378,43,43,3*PI/7,3*PI/2);
 fill(0);
 arc(622,378,42,42,3*PI/2,17*PI/7);
 
 fill(75,68,136);  //5th ball
 arc(730,349,43.5,43.5,PI/3,4*PI/3);
 fill(0);
 arc(730,349,45,45,4*PI/3,7*PI/3);
 
 beginShape();        //right 6th ball
 vertex(731,169);
 bezierVertex(735,143,757,124,780,123);
 bezierVertex(805,125,823,144,825,169);
 bezierVertex(789,160,770,163,731,169);
 endShape();
 
 fill(75,68,136);      //right 6th ball
 beginShape();
 vertex(731,169);
 bezierVertex(735,200,747,212,779,216);
 bezierVertex(811,212,827,187,825,169);
 bezierVertex(789,160,770,163,731,169);
 endShape();
 
 arc(146,315,43,43,PI/8,9.5*PI/8);   //left 7th ball
 fill(0);
 arc(146,315,43,43,9.5*PI/8,16.7*PI/8);
 
 bezier(268,446,258,430,238,439,240,461);
 
 fill(75,68,136);
 beginShape();
 vertex(268,446);
 bezierVertex(279,465,272,478,258,480);
 bezierVertex(249,481,242,473,240,461);
 vertex(268,446);
 endShape();
 
 fill(0);         //middle black triangle
 beginShape();
 vertex(215,34);
 vertex(179,100);
 vertex(136,24);
 bezierVertex(164,16,200,23,215,34);
 endShape();
 
 fill(75,68,136);  //middle blue triangle
 beginShape();
 vertex(248,200);
 vertex(223,150);
 vertex(179,100);
 vertex(130,184);
 vertex(166,196);
 vertex(215,201);
 vertex(248,200);
 endShape();
 
 fill(0);
 beginShape();
 vertex(248,200);
 vertex(223,150);
 vertex(270,198);
 vertex(248,200);
 endShape();

 bezier(166,196,174,178,217,178,222,201);
 
 noFill();
 stroke(0);
 bezier(166,196,159,203,151,216,150,229);
 bezier(222,201,229,212,235,228,235,237);
 
 noStroke();
 
 fill(75,68,136);
 beginShape();
 vertex(86,248);
 vertex(97,270);
 vertex(69,291);
 vertex(41,260);
 bezierVertex(55,250,72,247,86,248);
 endShape();
 
 fill(0);
 beginShape();
 vertex(86,248);
 vertex(97,270);
 vertex(116,256);
 bezierVertex(108,251,95,247,86,248);
 endShape();
 beginShape();
 vertex(89,333);
 vertex(69,291);
 vertex(35,321); 
 bezierVertex(49,331,70,337,89,333);
 endShape();
 
 beginShape();
 vertex(150,479);
 vertex(135,453);
 vertex(85,371);
 bezierVertex(128,366,166,372,201,384);
 vertex(135,453);
 vertex(109,475);
 endShape();
 
 fill(75,68,136);
 beginShape();
 vertex(150,479);
 vertex(109,475);
 vertex(71,515);
 vertex(169,513);
 vertex(150,479); 
 endShape();
 
 noFill();
 stroke(0);
 line(71,515,44,513);
 line(169,513,200,510);
 
 noStroke();
 fill(0);
 beginShape();
 vertex(186,544);
 vertex(169,513);
 vertex(71,515);
 vertex(39,552);
 bezierVertex(76,566,160,561,186,544);
 endShape();
 
 beginShape();
 vertex(0,0);
 vertex(58,0);
 vertex(63,205);
 vertex(0,106);
 vertex(0,0);
 endShape();
 
 beginShape();
 vertex(197,0);
 bezierVertex(224,14,262,15,286,0);
 bezierVertex(323,24,379,27,421,0);
 endShape();
 
 beginShape(); //niddle down black triangle
 vertex(258,570);
 vertex(193,553);
 vertex(187,570);
 endShape();
 
 beginShape();
 vertex(361,527);
 bezierVertex(310,522,299,496,328,481);
 bezierVertex(379,468,399,492,361,527);
 endShape();
 
 fill(75,68,136);
 bezier(361,527,328,545,330,568,366,570);
 
 beginShape();
 vertex(361,527);
 bezierVertex(385,529,401,550,395,566);
 vertex(366,570);
 vertex(361,527);
 endShape();
 
 beginShape();  //right down blue triangle
 vertex(505,570);
 bezierVertex(529,540,595,480,623,461);
 bezierVertex(621,497,622,540,626,570);
 endShape();
 
 fill(0);
 bezier(366,570,374,563,390,563,402,570);
 
 bezier(711,570,716,553,749,553,753,570);
 
 bezier(840,531,825,529,823,510,840,503);
 
 beginShape();
 vertex(840,379);  //1
 vertex(791,374);  //2
 vertex(802,353);  //3
 vertex(840,354);  //4
 vertex(840,379);  //1
 endShape();
 
 beginShape();
 vertex(840,328);
 vertex(817,323);
 vertex(828,296);
 vertex(840,328);
 endShape();
 
 beginShape();
 vertex(840,280);
 vertex(802,276);
 vertex(804,267);
 vertex(840,269);
 vertex(840,280);
 endShape();
 
 fill(75,68,136);
 beginShape();
 vertex(840,280);
 vertex(802,276);
 vertex(795,316);
 vertex(817,323);
 vertex(828,296);
 vertex(840,328);
 vertex(840,280);
 endShape();
 
 fill(102,99,66);
 beginShape();
 vertex(840,354);
 vertex(802,353);
 vertex(817,323);
 vertex(840,328);
 vertex(840,354);
 endShape();
 
 fill(117,51,37);
 bezier(0,216,24,250,27,310,0,346);
 
 fill(0);
 ellipse(757,274,23,19);
 
 ellipse(853,79,32,35);
 
 beginShape();
 vertex(787,0);
 vertex(840,0);
 vertex(840,10);
 bezierVertex(829,11,802,8,787,0);
 endShape();
 
 beginShape();
 vertex(707,122);
 vertex(669,124);
 vertex(690,101);
 vertex(706,83);
 bezierVertex(695,72,675,70,665,75);
 vertex(690,101);
 endShape();
 
 
 beginShape();
 vertex(803,40);
 vertex(746,108);
 vertex(697,32);  // connect right
 bezierVertex(723,36,785,35,803,40);
 endShape();
 
 beginShape();
 vertex(592,27);  //connect left
 vertex(497,121);
 vertex(450,18);
 vertex(592,27);
 endShape();
 
 arc(643,26,76,70,PI/20,PI);
 arc(643,26,27,23,PI,2*PI);
 
 fill(75,68,136);
 arc(643,26,30,30,0,PI);
 
 noFill();
 stroke(0);
 bezier(606,27,609,13,615,2,620,0);
 bezier(678,29,677,4,664,0,649,16);
 
 beginShape();
 vertex(840,459);
 bezierVertex(822,464,799,491,799,515);
 bezierVertex(798,538,820,556,840,548);
 endShape();
 
 
 
 
 stroke(0);
 strokeWeight(2);
 line(802,353,781,350);
 line(802,276,769,275);
 line(0,476,15,463);
 line(0,495,17,491);
 line(697,33,678,32);
 line(592,27,610,27);
 
 line(753,433,673,499);  // rice signal R1
 line(753,472,665,476);
 line(730,507,676,441);
 line(701,507,709,432);
 
 line(478,514,426,515);  // rice signal R2
 line(475,531,430,501);
 line(452,538,451,488);
 line(434,532,473,493);
 
 line(461,86,417,117);   // rice signal R3
 line(462,101,417,102);
 line(452,123,420,86);
 line(429,128,438,78);
 
 line(328,170,293,206);   //rice signal R4
 line(334,185,287,188);
 line(327,208,295,168);
 line(307,213,312,164);
 
 line(251,246,184,294);   // rice signal R5
 line(250,269,182,266);
 line(245,299,195,243);
 line(215,300,220,249);
 
 line(130,51,98,87);      //rice signal R6
 line(137,75,90,73);
 line(132,95,87,49);
 line(107,107,111,20);
 
 

}


