
int width=400;
int height=400;
float x,y,v,q,w,e,r,c,b;
color coulface=color(131,65,3);
boolean bzz=false;
color oeil=color(0);
color bl=color(255);
float X= mouseX;
float Y=mouseY;
float hf,lf;



void setup() {
  size(width,height);
  background(0);
  frameRate(20);
}

void draw() {
  fill(40,100);
  rect(0,0,width,height);//fond
  fill(1,101,175);


  //BRAS
  fill(250,190,68);
  beginShape();
  curveVertex(33,228);
  curveVertex(33,228);
  curveVertex(48,274);
  curveVertex(87,253);
  curveVertex(93,238);
  curveVertex(104,224);
  curveVertex(290,223);
  curveVertex(306,248);
  curveVertex(323,264);
  curveVertex(345,270);
  curveVertex(366,235);
  curveVertex(396,300);
  curveVertex(375,321);
  curveVertex(354,328);
  curveVertex(346,325);
  curveVertex(307,296);
  curveVertex(262,284);
  curveVertex(124,281);
  curveVertex(108,281);
  curveVertex(83,291);
  curveVertex(35,329);
  curveVertex(2,312);
  curveVertex(0,298);
  curveVertex(35,230);
  endShape();

  //CORPS
  rect(130,276,130,180);

  //manches

  fill(95,0,0);//gauche
  beginShape();
  curveVertex(27,195);
  curveVertex(27,195);
  curveVertex(33,224);
  curveVertex(1,296);
  curveVertex(1,266);
  curveVertex(27,195);
  endShape();

  beginShape();//droite
  curveVertex(360,236);
  curveVertex(360,236);
  curveVertex(371,192);
  curveVertex(399,241);
  curveVertex(395,295);
  curveVertex(360,230);
  endShape();
  //ouverture toge

    rect(175,300,25,100);


  //mains
  beginShape();
  fill(coulface);
  //gauche
  curveVertex(27,197); 
  curveVertex(27,197); 
  curveVertex(31,178);
  curveVertex(31,161);
  curveVertex(44,148);
  curveVertex(49,131);
  curveVertex(59,125);
  curveVertex(67,107);
  curveVertex(81,96);
  curveVertex(74,84);
  curveVertex(60,87);
  curveVertex(51,106);
  curveVertex(46,106);
  curveVertex(36,94);
  curveVertex(33,79);
  curveVertex(28,68);
  curveVertex(25,35);
  curveVertex(23,22);
  curveVertex(10,4);
  curveVertex(4,3);
  curveVertex(6,15);
  curveVertex(6,35);
  curveVertex(12,52);
  curveVertex(16,74);
  curveVertex(2,42);
  curveVertex(1,144);
  curveVertex(4,149);
  curveVertex(5,243);
  curveVertex(27,197); 
  curveVertex(25,198);


  endShape();

//droite
  beginShape();
  curveVertex(374,191);
  curveVertex(374,191);
  curveVertex(373,175);
  curveVertex(362,161);
  curveVertex(352,138);
  curveVertex(325,136);
  curveVertex(324,123);
  curveVertex(338,110);
  curveVertex(356,121);
  curveVertex(376,74);
  curveVertex(382,18);
  curveVertex(397,3);
  curveVertex(399,36);
  curveVertex(390,62);
  curveVertex(398,49);
  curveVertex(399,142);
  curveVertex(395,167);
  curveVertex(390,235);
  curveVertex(390,235);
  endShape();

  //flamme
  noStroke();


  fill(255,248,82,200);
  ellipse(200,45,15,40);
  fill(1,11,46,200);
  ellipse(200,45,5,10);

  fill(100);
  rect(190,45,20,15);

  //foulard
  fill(0,9,103);

  beginShape();

  curveVertex(222,283);
  curveVertex(219,333);
  curveVertex(246,323);
  curveVertex(265,255);
  curveVertex(274,233);
  curveVertex(296,217);
  curveVertex(301,195);
  curveVertex(284,157);
  curveVertex(200,57);
  curveVertex(84,174);
  curveVertex(89,216);
  curveVertex(107,223);
  curveVertex(117,240);
  curveVertex(122,270);
  curveVertex(136,316);
  curveVertex(158,332);
  curveVertex(160,284);
  curveVertex(194,253);
  curveVertex(157,248);
  curveVertex(229,240);
  endShape();

  //flare de la flamme
  fill(255,248,82,70);
  c=c+b;
  b=4;
  if(c>35) {
    c=c*-1;
  }

  ellipse(199,38,c,c);

  //face
  fill(coulface);
  strokeWeight(1);
  stroke(0);
  beginShape();
  curveVertex(149,22);
  curveVertex(157,111);
  curveVertex(153,128);
  curveVertex(136,122);
  curveVertex(131,132);
  curveVertex(133,165);
  curveVertex(149,182);
  curveVertex(160,275);
  curveVertex(169,290);
  curveVertex(174,309);
  curveVertex(192,317);
  curveVertex(214,303);
  curveVertex(219,284);
  curveVertex(225,269);
  curveVertex(240,168);
  curveVertex(253,159);
  curveVertex(257,145);
  curveVertex(247,120);
  curveVertex(232,126);
  curveVertex(232,106);
  curveVertex(198,97);
  curveVertex(158,111);
  curveVertex(115,179);
  endShape();

  smooth();
  //barbe
  fill(0);

  beginShape();
  curveVertex(173,291);
  curveVertex(185,290);
  curveVertex(181,316);
  curveVertex(183,334);
  curveVertex(183,359);
  curveVertex(188,366);
  curveVertex(195,355);
  curveVertex(200,314);
  curveVertex(205,292);
  curveVertex(190,304);
  curveVertex(164,268);
  endShape();
  smooth();

  //yeux
  q=213;
  w=142;
  e=35;
  r=173;
  fill(bl);
  ellipse(q,w,e,e);//droit
  ellipse(r,w,e,e);//gauche
  
  //sourcils
  strokeWeight(17);
  stroke(coulface);
  line(194,140,225,124);
  line(191,139,163,123);
  strokeWeight(10);
  stroke(0);
  line(194,140,225,124);
  line(191,139,163,123);
  strokeWeight(1);

  //iris
  noStroke();
  fill(oeil);
  ellipse(q,w+3,10,10);
  ellipse(r,w+3,10,10);
 
  //reflet
  fill(255);
  ellipse(q+1,w+1,3,3);
  ellipse(r+1,w+1,3,3);


  //nez bouche et traits
  stroke(1);
  noFill();
  beginShape();
  curveVertex(201,163);
  curveVertex(201,163);
  curveVertex(199,246);
  curveVertex(182,246);
  curveVertex(187,166);
  curveVertex(193,104);
  endShape();
  beginShape();
  curveVertex(186,140);
  curveVertex(202,179);
  curveVertex(213,209);
  curveVertex(200,237);
  curveVertex(174,259);
  endShape();
  beginShape();
  curveVertex(211,156);
  curveVertex(187,184);

  curveVertex(168,208);
  curveVertex(180,233);
  curveVertex(214,261);
  endShape();

  beginShape();
  curveVertex(154,283);
  curveVertex(168,273);
  curveVertex(191,264);
  curveVertex(212,277);
  curveVertex(250,302);
  endShape();
  line(174,235,166,268);
  line(209,236,214,264);



  if (bzz) {


    fill(255,255,0,60);
    noStroke();
    ellipse(mouseX+50,mouseY+20, 100,100 );
     ellipse(mouseX-50,mouseY+20,100,100 );

    //RAYON

    strokeWeight(e/2);
    stroke(255,244,13,60);
    line(q,w+10,mouseX+50,mouseY);
    line(r,w+10,mouseX-50,mouseY);
    strokeWeight(1);
    stroke(0);

    //tu es un sanglier
    if(mouseY>145&&mouseY<175) {
      background(loadImage("cochon.jpg"));
    }
  }
}
void mousePressed() {
  println("X: "+mouseX+"  Y: "+mouseY);
  bzz=true;
  oeil=(255);
  bl=(0);
}
void mouseReleased() {
  bzz=!bzz;
  oeil=(0);
  bl=(255);
}


