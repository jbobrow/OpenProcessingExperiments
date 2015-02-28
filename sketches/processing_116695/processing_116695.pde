
void setup(){
  size(600,600);//tamany de la pàgina
  background(255);//color de fons

}
void draw(){
  //Forma cara
  fill(#EFA050);//color cara
  stroke(#EFA050);//color contorn
  rect(80,100,340,400,100);//cuadrat cara
  ellipse(250,490,240,50);
  ellipse(250,495,220,50);
  ellipse(250,500,180,50);
  ellipse(250,505,160,50);
  ellipse(250,510,140,50);
  ellipse(250,515,120,50);
  
  //ORELLES
  ellipse(80,275,50,100);//orelles
  ellipse(420,275,50,100);//orelles
  fill(#000000);
  ellipse(425,310,10,10);
  ellipse(75,310,10,10);
   
  
 //ULLS
  fill(#FFFFFF);//color ulls
  stroke(#FFFFFF);//color contorn
  ellipse(175,275,70,50);//ull blanco
  ellipse(330,275,70,50);//ull blanco2
  fill(#027729);//color ulls
  stroke(#FFFFFF);//color contorn
  ellipse(175,275,30,30);//ull1
  ellipse(330,275,30,30);//ull2
  fill(#000000);//color ulls
  stroke(#000000);//color contorn
  ellipse(175,275,10,10);//ull1
  ellipse(330,275,10,10);//ull2
  
  //BOCA
  fill(#751717);
  noStroke();
  rect(175,400,150,30);
  rect(175,430,145,10);
  triangle(175,440,190,440,190,460);
  rect(190,440,115,20);
  triangle(300,440,300,460,320,440);
    
        //dents ADALT
        fill(#ffffff);
        stroke(#000000);
        rect(187,400,15,20);
        rect(202,400,15,20);
        rect(217,400,15,20);
        rect(232,400,22,25);//pinyus
        rect(252,400,22,25);//pinyus
        rect(274,400,15,20);
        rect(289,400,15,20);
        rect(304,400,15,20);
      
        //dents ABAIX
        rect(197,440,15,20);
        rect(212,440,15,20);
        rect(227,440,15,20);
        rect(242,440,15,20);
        rect(257,440,15,20);
        rect(272,440,15,20);
        rect(287,440,15,20);
  
  //LLABIS
  fill(#C84F4F);
  
  ellipse(252,400,150,10);
  ellipse(248,460,100,10);
  
  //"Rodona"
  noFill();
  stroke(#C84F4F);
  arc(252, 420, 152, 100, 0, PI+QUARTER_PI, OPEN);
  arc(251, 420, 152, 100, 0, PI+QUARTER_PI, OPEN);
  arc(250, 420, 152, 100, 0, PI+QUARTER_PI, OPEN);
  arc(249, 420, 152, 100, 0, PI+QUARTER_PI, OPEN);
  arc(248, 420, 152, 100, 0, PI+QUARTER_PI, OPEN);
  arc(247, 420, 152, 100, 0, PI+QUARTER_PI, OPEN);
  arc(246, 420, 152, 100, 0, PI+QUARTER_PI, OPEN);
  arc(245, 420, 152, 100, 0, PI+QUARTER_PI, OPEN);
  arc(244, 420, 152, 100, 0, PI+QUARTER_PI, OPEN);
  
  //"començament rodona llabis esquerra"
  fill(#EFA050);
  stroke(#EFA050);
  rect(170,365,25,30);
  rect(195,365,10,20);
  
  //"acabament rodona llabis dreta"
  noFill();
  stroke(#C84F4F);
  line(319,400,319,420);
  line(320,400,320,420);
  line(321,400,321,420);
  line(322,400,322,420);
  line(323,400,323,420);
  line(324,400,324,420);
  line(325,400,325,420);
  line(326,400,326,420);
  line(327,400,327,420);
  
  //"acabament rodona llabis abaix"
  line(218,460,280,460);
  line(218,461,280,461);
  line(218,462,280,462);
  line(218,463,280,463);
  line(218,464,280,464);
  line(218,465,279,465);
  line(218,466,278,466);
  line(218,467,277,467);
  line(220,468,273,468);
  
  //CABELLS
  fill(#000000);
  stroke(0);
  triangle(78,50,95,20,115,50);
  triangle(115,50,135,20,155,50);
  triangle(155,50,175,20,195,50);
  triangle(195,50,215,20,235,50);
  triangle(235,50,255,20,275,50);
  triangle(275,50,295,20,315,50);
  triangle(315,50,335,20,355,50);
  triangle(355,50,375,20,395,50);
  triangle(395,50,410,20,423,50);
  //cabell de darrera
  triangle(95,50,115,20,135,50);
  triangle(135,50,155,20,175,50);
  triangle(175,50,195,20,215,50);
  triangle(215,50,235,20,255,50);
  triangle(255,50,275,20,295,50);
  triangle(295,50,315,20,335,50);
  triangle(335,50,355,20,375,50);
  triangle(375,50,395,20,415,50);
  stroke(0);
  rect (77,50,2,170);
  rect (79,50,2,167);
  rect (82,50,2,164);
  rect (85,50,2,161);
  rect (88,50,2,158);
  rect (91,50,2,155);
  rect (94,50,2,152);
  rect (97,50,2,149);
  rect (100,50,2,146);
  rect (103,50,2,143);
  rect (105,50,2,139);
  rect (108,50,2,136);
  rect (111,50,2,133);
  rect (114,50,2,130);
  rect (117,50,2,127);
  rect (120,50,2,124);
  rect (120,50,265,124);
  stroke(#FFFFFF);
  rect (150,50,2,127);
  stroke(0);
  rect (152,50,2,126);
  rect (200,50,2,126);
  stroke(#FFFFFF);
  rect (202,50,2,128);
  stroke(0);
  rect (385,50,2,125);
  rect (388,50,2,128);
  rect (391,50,2,131);
  rect (394,50,2,134);
  rect (397,50,2,137);
  rect (400,50,2,140);
  rect (402,50,2,143);
  rect (404,50,2,146);
  rect (406,50,2,149);
  rect (408,50,2,152);
  rect (410,50,2,155);
  rect (412,50,2,158);
  rect (414,50,2,161);
  rect (416,50,2,164);
  rect (418,50,2,167);
  rect (420,50,2,170);
  
  //NAS
  noFill();
  stroke(0);
  curve(254, 262, 251, 297, 223,323, 258, 340);
  curve(223,323,230,331,240,338,251,339);
  line(251,248,251,298);
  fill(#000000);
  ellipse(248,328,10,5);
  
  
  //CELLES
  fill(#000000);
  //Esquerra
  ellipse(155,229,13,13);
  ellipse(149,231,11,11);
  ellipse(146,233,9,9);
  ellipse(143,236,7,7);
  ellipse(140,239,5,5);
  ellipse(137,240,3,3);
  
  rect(155,220,50,15,20);
  
  ellipse(205,229,15,15);
  ellipse(207,230,15,15);
  ellipse(209,231,15,15);
  ellipse(211,232,15,15);
  ellipse(213,233,15,15);
  ellipse(215,234,15,15);
  ellipse(217,235,15,15);
  
  //Dreta
  ellipse(306,229,15,15);
  ellipse(303,231,15,15);
  ellipse(300,233,15,15);
  ellipse(297,236,15,15);
  
  rect(307,220,50,15,20);
  
  ellipse(357,229,13,13);
  ellipse(360,231,11,11);
  ellipse(363,233,9,9);
  ellipse(366,236,7,7);
  ellipse(369,239,5,5);
  ellipse(372,240,3,3);
  
println(mouseX+","+mouseY);
}


