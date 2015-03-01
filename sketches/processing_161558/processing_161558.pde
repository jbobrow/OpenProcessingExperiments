
circleArray c;
mask m;
elliBack e;

void setup(){
  size(600,800);
  background(#22e39b);
  
  c=new circleArray(5,4);
  m=new mask();
  e=new elliBack();
}
void draw(){
  e.display();
  c.display();
  m.display();
}
 class circleArray {
   float r;
   float a;
 
  circleArray(float dia, float space){
    r=dia;
    a=space;  
  }
  
  void display(){
    for(int i=0;i<=600;i+=a){
      for(int j=0;j<=800;j+=a){
        noStroke();
        fill(255);
        ellipse(i*a,j*a,r,r);
      }
    }
  }
 }
class elliBack{
  void display(){
    noStroke();
    fill(#ff8174);
    ellipse(421,58,620,620);
    
    noStroke();
    fill(#ff5f6a,40);
    ellipse(199,660,480,480);
    
    noStroke();
    fill(#36eaff,20);
    ellipse(400,400,280,280);
  
  
  
  }




}
class mask{
  void display(){
    smooth();
    noStroke();
    fill(255);
    beginShape();
    curveVertex(58,  816);
    curveVertex(58,  816);
    curveVertex(42,  646);
    curveVertex(97,  540);
    curveVertex(127, 455);
    curveVertex(176, 392);
    curveVertex(203, 327);
    curveVertex(197, 228);
    curveVertex(194, 166);
    curveVertex(217, 118);
    curveVertex(273, 71);
    curveVertex(345, 87);
    curveVertex(385, 125);
    curveVertex(397, 179);
    curveVertex(402, 222);
    curveVertex(430, 315);
    curveVertex(486, 386);
    curveVertex(536, 450);
    curveVertex(566, 556);
    curveVertex(586, 694);
    curveVertex(585, 842);
    curveVertex(634, 820);
    curveVertex(646, 377);
    curveVertex(634, -29);
    curveVertex(-18, -29);
    curveVertex(-53, 388);
    curveVertex(-29, 839);
    curveVertex(58,  816);
    curveVertex(58,  816);
    endShape();
    
    noStroke();
    fill(255);
    beginShape();
    curveVertex(223, 131);
    curveVertex(223, 131);
    curveVertex(245, 109);
    curveVertex(286, 108);
    curveVertex(309, 129);
    curveVertex(313, 143);
    curveVertex(325, 152);
    curveVertex(334, 162);
    curveVertex(324, 173);
    curveVertex(308, 176);
    curveVertex(288, 173);
    curveVertex(278, 173);
    curveVertex(270, 179);
    curveVertex(265, 191);
    curveVertex(266, 202);
    curveVertex(271, 204);
    curveVertex(277, 199);
    curveVertex(283, 190);
    curveVertex(295, 193);
    curveVertex(319, 192);
    curveVertex(329, 188);
    curveVertex(332, 190);
    curveVertex(333, 209);
    curveVertex(316, 236);
    curveVertex(309, 248);
    curveVertex(311, 255);
    curveVertex(310, 263);
    curveVertex(304, 271);
    curveVertex(271, 294);
    curveVertex(255, 294);
    curveVertex(248, 286);
    curveVertex(231, 267);
    curveVertex(227, 260);
    curveVertex(225, 244);
    curveVertex(216, 213);
    curveVertex(215, 211);
    curveVertex(217, 193);
    curveVertex(230, 191);
    curveVertex(236, 193);
    curveVertex(243, 196);
    curveVertex(251, 192);
    curveVertex(252, 184);
    curveVertex(245, 177);
    curveVertex(237, 178);
    curveVertex(225, 180);
    curveVertex(218, 179);
    curveVertex(217, 166);
    curveVertex(223, 131);
    curveVertex(223, 131);
    endShape();  
    
    noStroke();
    fill(104,51,35);
    beginShape();
    curveVertex(251, 242);
    curveVertex(251, 242);
    curveVertex(256, 242);
    curveVertex(265, 236);
    curveVertex(275, 234);
    curveVertex(276, 230);
    curveVertex(276, 230);
    curveVertex(280, 244);
    curveVertex(275, 250);
    curveVertex(264, 254);
    curveVertex(251, 242);
    curveVertex(251, 242);
    endShape();

    noStroke();
    fill(104,51,35);
    beginShape();
    curveVertex(251, 242);
    curveVertex(251, 242);
    curveVertex(256, 242);
    curveVertex(265, 236);
    curveVertex(275, 234);
    curveVertex(276, 230);
    curveVertex(276, 230);
    curveVertex(280, 244);
    curveVertex(275, 250);
    curveVertex(264, 254);
    curveVertex(251, 242);
    curveVertex(251, 242);
    endShape();
    
    noStroke();
    fill(104,51,35);
    beginShape();
    curveVertex(254, 271);
    curveVertex(254, 271);
    curveVertex(268, 275);
    curveVertex(272, 273);
    curveVertex(278, 264);
    curveVertex(283, 261);
    curveVertex(289, 260);
    curveVertex(293, 253);
    curveVertex(293, 253);
    curveVertex(283, 256);
    curveVertex(258, 259);
    curveVertex(246, 257);
    curveVertex(242, 255);
    curveVertex(239, 258);
    curveVertex(241, 260);
    curveVertex(246, 261);
    curveVertex(262, 262);
    curveVertex(273, 265);
    curveVertex(273, 265);
    curveVertex(269, 268);
    curveVertex(261, 269);
    curveVertex(254, 271);
    curveVertex(254, 271);
    endShape();
    
    noStroke();
    fill(104,51,35);
    beginShape();
    curveVertex(234, 202);
    curveVertex(234, 202);
    curveVertex(239, 198);
    curveVertex(245, 199);
    curveVertex(245, 199);
    curveVertex(241, 203);
    curveVertex(234, 202);
    curveVertex(234, 202);
    endShape();
    
    noStroke();
    fill(104,51,35);
    beginShape();
    curveVertex(293, 202);
    curveVertex(293, 202);
    curveVertex(308, 196);
    curveVertex(308, 196);
    curveVertex(305, 202);
    curveVertex(293, 202);
    curveVertex(293, 202);
    endShape();
    
    
    noStroke();
    fill(255);
    beginShape();
    curveVertex(283, 185);
    curveVertex(283, 185);
    curveVertex(289, 182);
    curveVertex(301, 182);
    curveVertex(301, 182);
    curveVertex(289, 188);
    curveVertex(283, 185);
    curveVertex(283, 185);
    endShape();
    
    noStroke();
    fill(255);
    beginShape();
    curveVertex(229, 185);
    curveVertex(229, 185);
    curveVertex(235, 181);
    curveVertex(235, 181);
    curveVertex(243, 185);
    curveVertex(243, 185);
    curveVertex(229, 185);
    curveVertex(229, 185);
    endShape();
        
    noStroke();
    fill(255);
    beginShape();
    curveVertex(267, 315);
    curveVertex(267, 315);
    curveVertex(266, 320);
    curveVertex(269, 342);
    curveVertex(247, 357);
    curveVertex(229, 373);
    curveVertex(219, 400);
    curveVertex(215, 406);
    curveVertex(211, 405);
    curveVertex(212, 401);
    curveVertex(210, 399);
    curveVertex(209, 402);
    curveVertex(196, 423);
    curveVertex(211, 442);
    curveVertex(274, 458);
    curveVertex(313, 458);
    curveVertex(359, 425);
    curveVertex(359, 425);
    curveVertex(350, 427);
    curveVertex(344, 419);
    curveVertex(344, 419);
    curveVertex(349, 393);
    curveVertex(349, 345);
    curveVertex(341, 339);
    curveVertex(320, 335);
    curveVertex(297, 336);
    curveVertex(267, 315);
    curveVertex(267, 315);
    endShape();
    
    noStroke();
    fill(255);
    beginShape();
    curveVertex(137, 742);
    curveVertex(137, 742);
    curveVertex(137, 718);
    curveVertex(144, 706);
    curveVertex(167, 695);
    curveVertex(180, 692);
    curveVertex(190, 702);
    curveVertex(207, 732);
    curveVertex(185, 751);
    curveVertex(165, 770);
    curveVertex(165, 770);
    curveVertex(160, 756);
    curveVertex(173, 727);
    curveVertex(160, 733);
    curveVertex(155, 741);
    curveVertex(148, 741);
    curveVertex(146, 736);
    curveVertex(160, 718);
    curveVertex(168, 709);
    curveVertex(168, 709);
    curveVertex(144, 717);
    curveVertex(137, 742);
    curveVertex(137, 742);
    endShape();
    
    noStroke();
    fill(255);
    beginShape();
    curveVertex(305, 734);
    curveVertex(305, 734);
    curveVertex(273, 718);
    curveVertex(242, 701);
    curveVertex(242, 701);
    curveVertex(267, 727);
    curveVertex(272, 736);
    curveVertex(260, 737);
    curveVertex(247, 726);
    curveVertex(218, 711);
    curveVertex(195, 697);
    curveVertex(191, 685);
    curveVertex(192, 676);
    curveVertex(180, 671);
    curveVertex(166, 671);
    curveVertex(155, 660);
    curveVertex(158, 646);
    curveVertex(161, 636);
    curveVertex(185, 627);
    curveVertex(225, 638);
    curveVertex(243, 644);
    curveVertex(259, 657);
    curveVertex(272, 660);
    curveVertex(288, 674);
    curveVertex(303, 688);
    curveVertex(305, 698);
    curveVertex(295, 699);
    curveVertex(265, 682);
    curveVertex(263, 689);
    curveVertex(271, 697);
    curveVertex(292, 715);
    curveVertex(305, 734);
    curveVertex(305, 734);
    endShape();
  }
}


