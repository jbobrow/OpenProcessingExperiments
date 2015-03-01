
int blocksize = 15;
int i = 0;
int j = 0;
float x;
float z;
void setup(){
     size (800, 450);
     

}

void draw(){
    background(255);
    println (mouseX + "," + mouseY);
    
    //firma
    fill(0,0,0);
    textSize(15);
    text("Albert Esteve Lopez",600,400);
    
    //caracteristicas relleno continentes
    stroke(0);
    fill (0);
    strokeWeight(1);
    stroke(0, 0, 0);
    
    //america
    beginShape();
     
        vertex(70,90);
        vertex(80,80);
        vertex(175,85);
        vertex(172,65);
        vertex(210,35);
        vertex(236,39);
        vertex(215,70);
        vertex(235,100);
        vertex(228,112);
        vertex(245,155);
        vertex(205,190);
        vertex(180,198);
        vertex(175,210);
        vertex(180,222);
        vertex(195,222);
        vertex(190,235); 
        vertex(205,235);
        vertex(250,222);
        vertex(285,255);
        vertex(235,330);
        vertex(235,350);
        vertex(230,355);
        vertex(217,335);
        vertex(215,285);
        vertex(202,275);
        vertex(187,255);
        vertex(190,240);
        vertex(160,210);
        vertex(130,180);
        vertex(135,131);
        vertex(115,115);
        vertex(95,100);
        vertex(70,95);
       
    endShape();
   
     beginShape();
    
     vertex(230,65);
     vertex(245,40);
     vertex(285,35);
     vertex(290,40);
     vertex(285,45);
     vertex(280,75);
     vertex(265,80);
     vertex(260,90);
     vertex(250,80);
     vertex(245,65);
     vertex(235,70);
     
     
    
    endShape();
    
    
    //islas america
    beginShape();
    
     vertex(200,205);
     vertex(210,200);
     vertex(212,203);
     vertex(203,209);
       
    endShape();
    
    beginShape();
    
     vertex(60,180);
     vertex(65,182);
     vertex(62,186);
     
    endShape();
    
    beginShape();
    
     vertex(70,185);
     vertex(81,189);
     vertex(85,188);
     vertex(90,190);
     vertex(91,196);
     vertex(82,194);
     vertex(70,192);
    
    endShape();
    
    beginShape();
    
     vertex(120,300);
     vertex(125,305);
     vertex(122,309);
     vertex(118,305);
    
    endShape();
    
    beginShape();
    
     vertex(130,308);
     vertex(133,312);
     vertex(130,316);
     vertex(125,310);
    
    endShape();
    
    beginShape();
    
     vertex(222,205);
     vertex(221,210);
     vertex(237,212);
     vertex(222,205);
    
    endShape();
    
    //europa
    beginShape();
     
     
     vertex(353,139);
     vertex(371,128);
     vertex(370,122);
     vertex(375,118);
     vertex(376,121);
     vertex(394,122);
     vertex(394,118);
     vertex(409,112);
     vertex(408,106);
     vertex(396,112);
     vertex(394,105);
     vertex(401,99);
     vertex(396,94);
     vertex(388,108);
     vertex(378,120);
     vertex(377,113);
     vertex(366,114);
     vertex(366,106);
     vertex(384,83);
     vertex(404,78);
     vertex(433,84);
     vertex(427,93);
     vertex(417,90);
     vertex(423,99);
     vertex(445,85);
     vertex(460,83);
     vertex(451,73);
     vertex(459,66);
     vertex(480,56);
     vertex(480,62);
     vertex(459,75);
     vertex(473,79);
     vertex(484,70);
     vertex(502,76);
     vertex(505,69);
     vertex(540,56);
     vertex(562,62);
     vertex(548,72);
     vertex(602,77);
     vertex(611,67);
     vertex(615,77);
     vertex(645,81);
     vertex(686,78);
     vertex(705,90);
     vertex(686,95);
     vertex(689,105);
     vertex(649,111);
     vertex(650,119);
     vertex(636,135);
     vertex(634,121);
     vertex(639,112);
     vertex(614,114);
     vertex(606,119);
     vertex(598,130);
     vertex(609,126);
     vertex(611,142);
     vertex(602,141);
     vertex(587,154);
     vertex(587,164);
     vertex(579,168);
     vertex(577,159);
     vertex(570,163);
     vertex(571,184);
     vertex(546,199);
     vertex(552,208);
     vertex(541,214);
     vertex(534,209);
     vertex(538,218);
     vertex(537,218);
     vertex(544,225);
     vertex(537,230);
     vertex(544,232);
     vertex(545,241);
     vertex(560,244);
     vertex(558,251);
     vertex(542,245);
     vertex(522,223);
     vertex(530,222);
     vertex(518,197);
     vertex(519,187);
     vertex(515,189);
     vertex(512,193);
     vertex(501,202);
     vertex(500,213);
     vertex(489,215);
     vertex(479,196);
     vertex(480,185);
     vertex(444,179);
     vertex(449,189);
     vertex(457,188);
     vertex(463,194);
     vertex(456,202);
     vertex(439,207);
     vertex(423,177);
     vertex(418,178);
     vertex(419,188);
     vertex(428,207);
     vertex(428,208);
     vertex(436,213);
     vertex(450,212);
     vertex(427,246);
     vertex(430,260);
     vertex(423,264);
     vertex(421,279);
     vertex(405,297);
     vertex(388,296);
     vertex(375,261);
     vertex(379,255);
     vertex(380,246);
     vertex(372,230);
     vertex(364,223);
     vertex(339,221);
     vertex(330,214);
     vertex(329,187);
     vertex(355,165);
     vertex(374,164);
     vertex(377,173);
     vertex(415,173);
     vertex(410,169);
     vertex(402,160);
     vertex(401,169);
     vertex(395,167);
     vertex(393,156);
     vertex(384,144);
     vertex(380,145);
     vertex(389,154);
     vertex(386,159);
     vertex(379,163);
     vertex(382,156);
     vertex(372,149);
     vertex(362,151);
     vertex(345,166);
     vertex(340,150);
     vertex(352,150);
     vertex(353,146);
     vertex(349,141);
      
    endShape();
    
    //islas oceano pacifico

    beginShape();
    
     vertex(553,238);
     vertex(554,227);
     vertex(563,220);
     vertex(570,229);
     vertex(565,240);
     vertex(553,238);
     
    endShape();
    
    beginShape();
    
     vertex(571,240);
     vertex(575,228);
     vertex(581,230);
     vertex(577,242);
     vertex(571,240);
     
    endShape();
    
    beginShape();
    
     vertex(592,244);
     vertex(591,233);
     vertex(619,241);
     vertex(624,251);
     vertex(592,244);     
     
    endShape();
    
    beginShape();
    
     vertex(561,299);
     vertex(563,287);
     vertex(559,287);
     vertex(559,273);
     vertex(591,252);
     vertex(607,263);
     vertex(608,254);
     vertex(612,253);
     vertex(631,283);
     vertex(619,307);
     vertex(606,305);
     vertex(587,289);
     vertex(586,294);
     vertex(561,299);
      
     
    endShape();
    
    beginShape();
    
     vertex(651,319);
     vertex(662,306);
     vertex(659,295);
     vertex(670,300); 
     vertex(672,312);
     vertex(658,327);   
     vertex(651,324);
     vertex(651,319);
     
    endShape();
    
    beginShape();
    
     vertex(587,171);
     vertex(603,162);
     vertex(608,147);
     vertex(617,151);
     vertex(608,169);
     vertex(592,176);
     vertex(587,171);
     
     
    endShape();
    
    beginShape();
    
     vertex(617,144);
     vertex(631,138);
     vertex(633,142);
     vertex(621,147);
     vertex(617,144);
     
    endShape();
    
    beginShape();
    
     vertex(605,178);
     vertex(608,189);
     vertex(613,187);
     vertex(605,178);
     
    endShape();
    
    beginShape();
    
     vertex(432,272);
     vertex(435,262);
     vertex(444,254);
     vertex(448,256);
     vertex(441,279);
     vertex(432,272);
     
    endShape();
   
    //reino unido
    beginShape();
    
     vertex(350,132);
     vertex(352,126);
     vertex(346,118);
     vertex(350,114);
     vertex(351,120);
     vertex(359,126);
     vertex(359,133);
     vertex(350,132);
     
    endShape();
    
    beginShape();
    
     vertex(337,132);
     vertex(341,124);
     vertex(345,128);
     vertex(342,132);
     vertex(337,132);
     
    endShape();
    
    //illa
    beginShape();
    
     vertex(317,95);
     vertex(332,92);
     vertex(338,97);
     vertex(324,105);
     vertex(317,95);
     
    endShape();
    
    //mar muerta
    
    fill (255);
    strokeWeight(1);
    stroke(255);
    
    beginShape();
    
     vertex(407,155);
     vertex(408,147);
     vertex(413,142);
     vertex(417,148);
     vertex(420,147);
     vertex(421,142);
     vertex(427,142);
     vertex(431,151);
     vertex(414,150);
     vertex(407,155);     
     
    endShape();
    
    beginShape();
    
     vertex(449,164);  
     vertex(448,148);
     vertex(455,146);
     vertex(451,153);
     vertex(455,164);
     vertex(449,164);
     
    endShape();
    
    beginShape();
    
     vertex(465,152);
     vertex(465,147);
     vertex(470,145);
     vertex(471,153);
     vertex(465,152);
     
    endShape();
    
    //parte blanca america
    beginShape();
    
     vertex(243,111);
     vertex(219,107);
     vertex(216,129);
     vertex(209,120);
     vertex(191,113);
     vertex(198,101);
     vertex(213,101);
     vertex(215,85);
     vertex(222,86);
     vertex(220,98);
     
    endShape();
    
    
    //colores luces

   stroke(255);
   fill (255);
    frameRate(15);
    //bucle llums nocturnes
     j = 0;
     while(j < height ){
       i = 0;
       while(i < width ){
        
          ellipse(random(185,230) ,random(110,160) ,1,1);
          ellipse(random(120,280) ,random(80,180) ,1,1);
          ellipse(random(175,280) ,random(250,350) ,1,1);
          ellipse(random(50,800) ,random(0,450) ,1,1);
          ellipse(random(330,360) ,random(150,170) ,1,1);
          ellipse(random(300,500) ,random(100,150) ,1,1);
          ellipse(random(350,380) ,random(125,170) ,1,1);
          ellipse(random(570,660) ,random(125,190) ,1,1);
          ellipse(random(588,630) ,random(143,190) ,1,1);
          ellipse(random(535,650) ,random(225,300) ,1,1);
          ellipse(random(475,505) ,random(180,215) ,1,1);
          ellipse(random(360,425) ,random(80,105) ,1,1);
          ellipse(random(400,465) ,random(135,200) ,1,1);
      
        
          i = i + 200;
        }
      j = j + 200;
     }     
  
 
     
}


