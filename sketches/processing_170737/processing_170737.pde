
int value = 152;
int value2 = 251;
int value3 = 152;
int rodo1 = 247;
int rodo2 = 307;
int rodo3 = 60;
int rodo4 = 40;
int d1 = 217;
int d3 = 276;
int d4 = 306;
int d5 = 223;
int d6 = 295;
int d7 = 319;
int d8 = 231;
int d9 = 291;
int d10 = 324;
int d11 = 239;
int d12 = 288;
int d13 = 325;
int d14 = 247;
int d15 = 287;
int d16 = 326;
int d17 = 256;
int d18 = 287;
int d19 = 325;
int d20 = 264;
int d21 = 291;
int d22 = 323;
int d23 = 272;
int d24 = 295;
int d25 = 318;
int color1 =255;
int color2 = 240;
int l1 = 0;
int l2 = 0;
int l3 = 0;
int l4 = 0;
int l5 = 0;
int l6 = 0 ;
int l7 = 0;
int l8 = 0;
int l9 = 0;
int l10 = 0;
int l11 = 0;
int l12 = 0;
int l13 = 0;
int l14 = 0;
int l15 = 0;
int l16 = 0;

void setup(){
  size(500, 500);
}
void draw(){
  
  background(0,0,255);
  //ULLS i esfera de la cara
  strokeWeight(1);  // Default
  fill (255,222,173);
  ellipse(250,250,250,250);
  ellipse(200,210, 35,35);
  ellipse(300,210,35,35);
  fill (255,255,240);
  ellipse(300,210,35,mouseY/30);
  ellipse(200,210, 35,mouseY/30);
  fill(value,value2,value3);
  ellipse(300,210,15,mouseY/30);
  ellipse(200,210,15,mouseY/30);
  point(200,210);
  point(300,210);
  ///Cabell

  strokeWeight(3);  // Default
  fill (0,0,0);
  beginShape () ;
  vertex(317,105);
  vertex(296,112);
  vertex(270,99);
  vertex(241,113);
  vertex(215,105);
  vertex(195,124);
  vertex(173,116);
  vertex(163,145);
  vertex(158,164);
  vertex(178,148);
  vertex(199,160);
  vertex(229,148);
  vertex(241,158);
  vertex(268,144);
  vertex(287,156);
  vertex(304,145);
  vertex(324,157);
  vertex(351,175);
  endShape(CLOSE);
  //celles
  strokeWeight(1);  // Default
  fill(0,0,0);
  triangle(187,170,177,186,220,198);
  triangle(307,170,317,186,274,198);
  //BOCA
  strokeWeight(1);  // Default
  fill(255,255,255);
  ellipse(rodo1,rodo2,rodo3,rodo4);
  line(d1,d4,d3,d4);
  line(d5,d6,d5,d7);
  line(d8,d9,d8,d10);
  line(d11,d12,d11,d13);
  line(d14,d15,d14,d16);
  line(d17,d18,d17,d19);
  line(d20,d21,d20,d22);
  line(d23,d24,d23,d25);

  
  //Orelles
  strokeWeight(1);  // Default
  fill (255,222,173);
  beginShape () ;
  vertex(366,207);
  vertex(384,186);
  vertex(385,237);
  vertex(375,252);
  endShape();
   beginShape () ;
  vertex(134,207);
  vertex(116,186);
  vertex(117,237);
  vertex(126,252);
  endShape();
  line(126,210,126,235);
  line(376,213,376,238);
  //NAS
  strokeWeight(1);  // Default
  beginShape () ;
  vertex(264,222);
  vertex(264,246);
  vertex(278,253);
  vertex(264,262);
  vertex(244,262);
  vertex(230,253);
  vertex(244,246);
  vertex(244,222);
  endShape();
  //perilla
  
  fill (0,0,0);
  beginShape () ;
  vertex(237,373);
  vertex(237,354);
  vertex(263,354);
  vertex(263,373);
  vertex(247,375);
  vertex(237,373);
  vertex(262,373);
  vertex(252,374);
  vertex(248,374);
  endShape();
  //ralles
   
  line(l1,l2,l3,l4);
  line(l5,l6,l7,l8);
  line(l9,l10,l11,l12);
  line(l13,l14,l15,l16);
  

   
}
void mousePressed() {
    value = 255;
    value2 = 27;
    value3 = 50;
    rodo1 = 247; 
    rodo2 = 307;
    rodo3 = 80;
    rodo4 = 60;
    d1= 0;
    d3=0;
    d6 = 284;
    d7= 331;
    d9=280;
    d10=333;
    d12=278;
    d13=336;
    d18=279;
    d15=277;
    d19=337;
    d16=338;
    d21=280;
    d22=333;
    d24=284;
    d25=330;
   l1 = 317;
   l2 = 251;
   l3 = 299;
   l4 = 272;
   l5 = 336;
   l6 = 250;
   l7 = 303;
   l8 = 287;
   l9 = 348;
   l10 = 258;
   l11 = 313;
   l12 = 296;
   l13 = 347;
   l14 = 272;
   l15 = 326;
   l16 = 295;
}
void mouseReleased() {
 value = 152;
 value2 = 251;
 value3 = 152;
 rodo1 = 247;
 rodo2 = 307;
 rodo3 = 60;
 rodo4 = 40;
 d1 = 217;
 d3 = 276;
 d4 = 306;
 d5 = 223;
 d6 = 295;
 d7 = 319;
 d8 = 231;
 d9 = 291;
 d10 = 324;
 d11 = 239;
 d12 = 288;
 d13 = 325;
 d14 = 247;
 d15 = 287;
 d16 = 326;
 d17 = 256;
 d18 = 287;
 d19 = 325;
 d20 = 264;
 d21 = 291;
 d22 = 323;
 d23 = 272;
 d24 = 295;
  d25 = 318;
}




