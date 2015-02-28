
 // first try 
 // leah dubuc
 

size(520,680);
  background(232,145,30);
  
stroke(93,60,16);//jacket outline
  strokeWeight(6); 
  smooth();
fill(239,250,204);
beginShape();
  vertex(0,500);
  vertex(15,460);
  vertex(334,437);
  vertex(470,580);
  vertex(395,500);
  vertex(600,490);
  vertex(600,700);
  vertex(-5,700);
  vertex(-5,500);
endShape();

stroke(93,60,16);//shirt outline
  strokeWeight(7);
  smooth();
  fill(239,250,204);
beginShape();
  vertex(80,395);
  vertex(50,405);
  vertex(25,470);
  vertex(290,680);
  vertex(370,550);
  vertex(350,578);
  vertex(325,470);
endShape();

  line(340,535,300,610); // inner shirt lines
  line(300,610,257,545);
  line(257,545,212,618);
  line(230,584,55,445);
  line(55,445,75,435);
  line(250,565,285,680); // inner shirt lines
  line(0,550,65,660);
  line(65,660,125,590);
  line(125,590,65,680);
  line(470,580,500,610);
  line(500,610,460,635);
  line(390,580,520,700); // end outer jacket lines
  
// face outer line  
stroke(93,60,16);
  strokeWeight(7);
  smooth();
  fill(234,188,118);
beginShape(); 
  vertex(275,532); // bottom neck small
  vertex(255,544); //bottom neck right 
  vertex(139,515); //bottom neck left
  vertex(75,460); //bottom neck
  vertex(82,420); //top neck
  vertex(85,360); //hair behind ear
  vertex(36,255); //hair back
  vertex(20,135); //hair back
  vertex(65,50); //hair back
  vertex(100,25); // hair
  vertex(200,35); // hair
  vertex(270,65); //indent hair
  vertex(265,70); //indent hair
  vertex(365,210); //forehead
  vertex(362,260); //sideface
  vertex(365,300); //sideface
  vertex(330,420); //sideface
  vertex(320,480); //sideface
  vertex(307,520); //jaw
  vertex(300,525); //jaw
  vertex(265,530); //jaw
  vertex(200,510); //jaw
  //vertex(150,480); //left side face
  vertex(100,420); //left side face
  vertex(92,360); //leftsideface
  vertex(65,320); //outer ear
  vertex(42,260); //outer ear
  vertex(50,220); //top outer ear
  vertex(65,200); //top outer ear
  vertex(78,200); //top outer ear
  vertex(90,204); //indent ear
  vertex(110,235); //indent ear 
endShape();

stroke(239,250,204,140);
strokeWeight(4); //highlights on face
  line(120,187,240,213);
  line(140,196,195,160);
  

stroke(93,60,16);
  strokeWeight(7);
  smooth();
  fill(234,188,118);
fill(90,63,20);
beginShape(); //hair inner part
  vertex(265,70);
  vertex(145,195);
  vertex(162,155);
  vertex(125,209);
  vertex(123,199);
  vertex(116,213);
  vertex(110,200);
  vertex(103,212);
  vertex(78,200);//ear part
  vertex(65,195);
  vertex(65,200);
  vertex(52,217);
  vertex(35,200);
  vertex(25,137);
  vertex(65,50);
  vertex(97,27);
  vertex(197,35);
  vertex(263,56); //part above indent
endShape();
 
beginShape(); //little part of hair i missed
  vertex(35,205);
  vertex(39,244);
  vertex(46,210);
endShape();
   noFill();

stroke(93,60,16);
  strokeWeight(6);
  smooth();
  fill(255,255,255);
beginShape();//left eye
  curveVertex(130,245); //start top left eye
  curveVertex(130,245);
  curveVertex(160,232);
  curveVertex(180,230);
  curveVertex(200,236);
  curveVertex(220,255);
  curveVertex(220,260); //end top left eye
  curveVertex(195,271);
  curveVertex(180,271);
  curveVertex(165,267);
  curveVertex(130,245);
  curveVertex(130,245); //end bottom left eye
  endShape();
  
beginShape();//right eye
  curveVertex(270,255);//start top right eye
  curveVertex(270,255);
  curveVertex(283,239);
  curveVertex(295,230);
  curveVertex(324,231);
  curveVertex(350,250);
  curveVertex(350,256);//end top right eye
  curveVertex(320,269);
  curveVertex(300,267);
  curveVertex(285,263);
  curveVertex(270,255);
  curveVertex(270,255);//end bottom right eye
  endShape();
  
noFill(); 
curve(215,330,263,221,350,210,470,271); //eyebrow right
curve(240,260,220,217,130,205,90,240); //eyebrow left

stroke(60,41,12);  //inner eye
  strokeWeight(6);
  smooth();
  fill(93,60,16); 
 ellipse(175,247,31,31);//left pupil
 ellipse(306,249,29,29);//right pupils
stroke(239,250,204);
  strokeWeight(4);
  line (305,249,310,250); // light in right eye
  line(309,250,313,249);
  strokeWeight(3);
  line(307,243,311,242);
   
stroke(93,60,16); //line below eye
 strokeWeight(2);
 line(225,270,160,315);
 
stroke(93,60,16); //line out of ear
  strokeWeight(6);
  line(95,270,170,410);

stroke(255,219,100); //inner nose color
  strokeWeight(25);
  line(243,240,276,375);
  
stroke(93,60,16);  //nose
  strokeWeight(6);
  smooth();
  line(225,235,261,384);
  strokeWeight(2);
  line(267,280,287,357);//right side nose
  strokeWeight(3);
  line(287,357,315,375);//right nostril top
  line(315,375,300,390);//right nostril bottom
  line(300,390,290,393);//right nostril indent
  strokeWeight(4);
  line(290,393,220,394);
  line(220,394,204,375);//mid nostril left
  line(204,375,215,360);//top nostril left
  line(204,375,190,430);//cheek line left
  line(311,380,317,415);//cheek line right
  line(244,395,252,419);//left side lip top thing
  line(257,395,267,423);//middle lip indent
  line(273,395,283,420); //right side lip top indent

fill(209,164,105);
strokeWeight(5);
beginShape();
  curveVertex(205,430);//start left upper lip curve
  curveVertex(205,430);  
  curveVertex(215,428);
  curveVertex(245,418);
  curveVertex(265,427);
  curveVertex(267,428); //midpoint upper lip curve
  curveVertex(267,427);
  curveVertex(283,420);
  curveVertex(300,430);
  curveVertex(300,430);//end point right upper lip curve
endShape();

strokeWeight(6); // mouth opening
line(312,431,202,430);

stroke(93,60,16); // bottom lip
  strokeWeight(5);
beginShape();
  curveVertex(308,431);
  curveVertex(308,431);
  curveVertex(278,443);
  curveVertex(270,445);
  curveVertex(245,444);
  curveVertex(202,430);
  curveVertex(202,430);
endShape();

fill(232,136,73);//right cheek definition and color
beginShape();
  vertex(267,260);
  vertex(315,290);
  vertex(336,274);
stroke(232,136,73);
  vertex(308,365); // line down side face
  vertex(290,352);
  vertex(267,260);
endShape();

stroke(240,162,46); //shadow on left side nose
fill(240,162,46);
beginShape();
  vertex(228,273);
  vertex(215,285);
  vertex(202,370);
  vertex(216,354);
  vertex(226,365);
  vertex(210,375);
  vertex(222,390);
  vertex(257,384);
  vertex(228,273);
endShape();

beginShape(); //shadow on upper left cheek
  vertex(120,240);
  vertex(165,285);
  vertex(190,288);
  vertex(160,310);
  vertex(130,290);
  vertex(165,350);
  vertex(134,330);
  vertex(110,285);
  vertex(120,240);
endShape();

beginShape(); // ear shadow
  vertex(100,270);
  vertex(102,245);
  curveVertex(102,245);
  curveVertex(102,245);
  curveVertex(75,220);
  curveVertex(60,260);
  curveVertex(75,300);
  curveVertex(87,310);
  curveVertex(92,302);
  curveVertex(92,302);
  vertex(100,344);
  vertex(119,350);
  vertex(90,268);
  vertex(96,270);
endShape();

stroke(234,143,5);
  fill(234,143,5);
beginShape();//neck shadow
  vertex(90,365);
  vertex(88,420);
  vertex(79,455);
  vertex(143,510);
  vertex(175,495);
  vertex(95,422);
  vertex(90,365);
endShape();

stroke(93,60,16);  //ear inside line
  strokeWeight(4);
  smooth();
  line(90,337,100,350);

stroke(239,250,204,150);
  line(265,80,355,203);
strokeWeight(3);
  line(320,280,337,268);
  line(310,367,290,355);
  line(314,353,325,320);
  line(329,405,340,370);
noFill();
strokeWeight(5);
  curve(290,370,300,440,200,435,100,325);
  line(200,425,240,410);
  line(272,410,303,422);
  line(262,399,271,400);
  line(289,386,297,369);
  line(293,385,300,374);
strokeWeight(4); //highlights on face
  line(301,385,310,375);
  line(105,415,200,505);
  line(100,365,105,415);
  line(200,505,265,525);
  line(265,525,302,520);
  line(149,264,164,273);
  line(164,273,202,279);
  line(162,278,200,284);
  line(262,208,330,193); //line above brow right
  line(326,198,339,198); //little line to the side brow right
  line(250,206,324,189);
  line(105,280,113,239);
  line(105,239,90,217);
  line(90,217,75,210);
  line(75,210,65,220);
  line(65,220,53,260);
  line(53,260,75,310);
  line(75,310,83,315);
  line(83,315,90,310);
  line(80,322,90,320);
  line(109,310,125,350); //small white line with large cheek line left
  line(343,270,350,310);
  line(348,272,353,300);
  line(350,272,358,281);
  line(132,330,170,360);//cheek definition highlights
  line(140,343,175,371);//cheek definition highlights
  line(160,365,176,387);
  line(155,310,150,320);
  line(175,310,160,325);
  
strokeWeight(3);//highlights in hair
  line(132,190,187,116);
  line(210,70,130,180);
  line(160,50,120,150);
  line(135,90,123,120);
  line(130,85,125,100);
  line(120,45,112,80);
  line(90,70,80,150);
  line(95,100,85,180);
  line(60,150,62,180);
  line(40,170,42,190);
  line(55,165,56,175);
  
stroke(95,85,24,200);//lines in shirt
strokeWeight(5);
  line(10,500,95,610);
  line(10,500,5,525);
  line(20,515,10,550);
  line(30,530,20,560);
  line(40,545,30,578);
  line(51,553,42,600);
  line(62,569,55,625);
  line(73,585,65,640);
  line(82,598,79,620);
  line(84,596,100,600);
  line(75,583,110,585);
  line(65,567,110,570);
  line(53,551,100,555);
  line(42,537,65,540);
  
fill(95,85,24,200);//shaded coat section
  beginShape();
    vertex(20,470);
    vertex(305,700);
    vertex(85,690);
    vertex(130,590);
    vertex(22,500);
    vertex(20,470);
  endShape();
 
strokeWeight(6);//liness on right side of shirt
line(335,450,400,520); 
line(333,452,385,530);
line(332,458,370,545);
line(330,464,355,555);
line(330,464,334,449);
strokeWeight(15);
  line(410,535,325,660);
stroke(95,85,24,150);
strokeWeight(10);
  line(330,670,390,600);

