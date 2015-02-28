

void setup() {
  size (500,500);
  background(#56888e);
  stroke(255);
  frameRate(7);
  
  
 fill(#422810);  triangle(143,232,147,263,173,250);//brownline
 fill(#397c82);  triangle(145,237,150,257,170,248);
 fill(#5C3707);  triangle(160,260,120,330,180,328);//brown
 fill(#38218F);  triangle(160,260,146,286,173,301);//blue

  for (int j=155; j<215; j+=10){
    colorMode(HSB);
  fill(random(0,250),random(50,80),random(50,100)); ///random colors
  rect(j,300,10,74);
 } //rect2


 fill(#422810);  triangle(252,28,264,78,286,60);//brown
 fill(#000000);  triangle(245,88,321,40,324,86);//blackline
 fill(#397c82);  triangle(264,78,315,51,319,83);
  for (int k=242; k<292; k+=8){
    colorMode(HSB);
  fill(random(200,360),random(100,260),random(50,200)); ///random colors
  rect(k,75,8,72);
  } //rect3
  
  
  
}





void draw() {


   
 ellipseMode(CENTER);
noStroke(); 
fill(#78AFB8); ellipse(120,85,150,150);
fill(#CFBE28); ellipse(120,85,130,130);

 //blackpoints

  noStroke(); fill(20);

// x 80~155 y 25~130
   ellipse(80 , 68 , 3,3);   ellipse(83 , 47 , 3,3);
   ellipse(88 , 98 , 3,3);   ellipse(92 , 119, 3,3);
   ellipse(99 , 38 , 3,3);   ellipse(81 , 123, 3,3);
   ellipse(103, 70 , 3,3);   ellipse(106, 28 , 3,3);
   ellipse(110, 59 , 3,3);   ellipse(118, 41 , 3,3);
   ellipse(125, 66 , 3,3);   ellipse(132, 34 , 3,3);
   ellipse(149, 120, 3,3);   ellipse(155, 51 , 3,3);
   ellipse(162, 79 , 3,3);   ellipse(72 , 86 , 3,3);
   ellipse(95 , 55 , 3,3);   ellipse(151, 34 , 3,3);
   ellipse(177, 103, 3,3);   ellipse(128, 141, 3,3);
   ellipse(100, 140, 3,3);   ellipse(117, 148, 3,3);
   ellipse(160, 130, 3,3);   ellipse(80 , 111, 3,3);
   ellipse(62 , 69 , 3,3);   ellipse(178, 65 , 3,3);
   ellipse(122, 99 , 3,3);   ellipse(122, 125, 3,3);
   ellipse(140, 66 , 3,3);   ellipse(149, 97 , 3,3);
   ellipse(156, 105, 3,3);   ellipse(66 , 115, 3,3);
   ellipse(134, 52 , 3,3);   ellipse(173, 118, 3,3);
   ellipse(103, 98 , 3,3);   ellipse(140, 110, 3,3);
   ellipse(178, 93 , 3,3);   ellipse(62 , 96 , 3,3);
   ellipse(90 , 80 , 3,3);   ellipse(164, 53 , 3,3);
   ellipse(142, 84 , 3,3);   ellipse(110, 112, 3,3);
   ellipse(87 , 135, 3,3);   ellipse(142, 136, 3,3);
   ellipse(140, 142, 3,3);   ellipse(72 , 49 , 3,3);
   ellipse(116, 139, 3,3);   ellipse(126, 56 , 3,3);
   ellipse(163, 65 , 3,3);   ellipse(97 , 33 , 3,3);
   ellipse(92 , 94 , 3,3);   ellipse(169, 98 , 3,3);
   ellipse(116, 82 , 3,3);   ellipse(100, 59 , 3,3);
   ellipse(138, 100, 3,3);   ellipse(89 , 45 , 3,3);

   ellipse(176, 81 , 3,3);   ellipse(108 , 127, 3,3);
   ellipse(163, 94 , 3,3);   ellipse(166 ,113 , 3,3);
   ellipse(65 , 82 , 3,3);   ellipse(123, 29 , 3,3);
   ellipse(178, 82 , 3,3);   ellipse(110, 49 , 3,3);
   
   fill(#5C3707);
   ellipse(120 ,90 , 5,5);

  
 stroke(200);

noFill();      triangle(110,185,85,199,92,218);//whiteline
fill(#7C23A1); triangle(75,170,51,240,99,240);//purple
fill(#CFBE28);  triangle(75,170,68,192,85,199);//yellow

 
 rectMode(CORNER); 
  for (int i=68; i<105; i+=6){
    colorMode(HSB);
  fill(random(360),random(30,200),random(50,200)); ///random colors
  rect(i,218,6,58);
  } //rect1
 

 

 fill(#38218F);  ellipse(320,167,32,32);//blue
 
 fill(#635019);              triangle(393,104,385,139,401,142);
 noFill(); strokeWeight(3);  triangle(392,144,345,213,418,239); 
 stroke(#66366B); strokeWeight(1.9); 
 line(392,145,372,174);
 line(346,213,418,239);
 line(400,173,418,239);
 
 strokeWeight(0.2); stroke(180);
 
  for (int k=368; k<421; k+=9){
    colorMode(HSB);
  fill(random(0,250),random(50,150),random(50,200)); ///random colors
  rect(k,193,9,70);
  } //rect4
 

 //moon
 noFill();
 beginShape();
vertex(174,300);
bezierVertex(194,231, 275,192, 367,263);
bezierVertex(280,240, 243,227, 174,300);
endShape();
 
  
 fill(#6E2987); rect(278,225,5,20);
  stroke(200); strokeWeight(0.5);
 line(192,268, 207,271);
 line(197,270, 213,256);
 line(208,250, 218,260);
 line(244,231, 255,251);
 fill(#F069D3); quad(239,234, 247,251, 255,251, 244,231);
 fill(#CFBE28); quad(310,249, 323,252, 337,244, 321,237);
 fill(#2B5DCF); triangle(323,252, 368,265, 337,244);
 line(220,263, 254,280);
 line(254,280, 277,281);
 line(277,281, 256,251);
 line(277,271, 307,271);
 line(307,271, 279,248);
 line(309,271, 335,257);
 line(251,240, 279,235);
 
 //little moon
 
 fill(#CFBE28);
 beginShape();
vertex(197,218);
bezierVertex(185,232, 210,247, 217,240);
bezierVertex(190,237, 207,203, 197,218);
endShape();
 fill(#453711);
 beginShape();
vertex(200,215);
bezierVertex(194,222, 194,227, 196,232);
bezierVertex(204,229, 203,224, 200,215);
endShape();


 fill(#2A2E40);
 beginShape();
vertex(230,205);
bezierVertex(227,220, 243,233, 247,227);
bezierVertex(230,210, 230,190, 230,205);
endShape();
line(233,219,239,217);

//long squares
fill(#543014);
rect(253,248,2,60); rect(253,318,2,6);
rect(274,246,3,80); rect(274,336,3,8);
rect(305,249,2,50); rect(305,309,2,5);

 
 fill(#2A2E40);  ellipse(460,250,10,10);
 fill(#453711);  ellipse(460,270,6,6);
 
 
//little quads
quad(345,42, 355,44, 354,47, 344,46);
fill(#286d72); quad(366,52, 375,55, 375,58, 365,56);
quad(389,62, 395,71, 392,73, 387,65);
fill(#165357); quad(411,84, 416,91, 413,93, 408,86);
quad(422,108, 425,108, 425,116, 422,116);
quad(377,38, 383,40, 382,42, 376,40);
fill(#165357); quad(401,52, 405,56, 404,58, 400,54);
quad(417,74, 420,72, 422,78, 419,79);
fill(180); quad(401,38, 408,40, 407,42, 403,41);
quad(424,55, 429,59, 428,61, 423,57);
quad(428,95, 431,94, 434,102, 431,101);
quad(437,81, 440,80, 441,84, 438,85);



//wave
stroke(240);
fill(#754D3F);
beginShape();
curveVertex(423,265);curveVertex(423,265);
curveVertex(412,280);curveVertex(396,290);
curveVertex(372,303);curveVertex(362,327);
curveVertex(366,350);curveVertex(360,370);
curveVertex(340,383);curveVertex(310,393);
curveVertex(300,403);curveVertex(297,422);
curveVertex(310,422);curveVertex(310,422);
curveVertex(321,408);curveVertex(353,397);
curveVertex(375,376);curveVertex(387,325);
curveVertex(400,308);curveVertex(425,296);
curveVertex(439,271);curveVertex(439,271);
curveVertex(423,265);curveVertex(423,265);
endShape();


fill(#9E7162);
beginShape();
curveVertex(432,270);curveVertex(432,270);
curveVertex(420,291);curveVertex(390,307);
curveVertex(378,326);curveVertex(372,351);
curveVertex(362,380);curveVertex(340,394);
curveVertex(320,400);
curveVertex(303,422);curveVertex(310,422);
curveVertex(321,408);curveVertex(353,397);
curveVertex(375,376);curveVertex(387,325);
curveVertex(400,308);curveVertex(425,296);
curveVertex(442,272);
curveVertex(432,270);curveVertex(432,270);
endShape();


fill(#D4B28D);
beginShape();
curveVertex(366,355);curveVertex(366,355);
curveVertex(360,370);curveVertex(340,383);
curveVertex(310,393);curveVertex(300,403);
curveVertex(297,422);
curveVertex(304,422);curveVertex(304,422);
curveVertex(308,414);curveVertex(319,402);
curveVertex(359,387);curveVertex(372,360);
curveVertex(366,355);curveVertex(366,355);
endShape();

fill(#591694);
quad(432,269, 442,270, 432,290, 423,289);


fill(150); ellipse(63,429,40,40);
fill(#9E7162); ellipse(63,429,35,35);
fill(#754D3F); ellipse(118,395,60,60);
fill(50); ellipse(118,395,37,37);
fill(100); ellipse(118,395,30,30);
fill(#CFBE28); triangle(412,391,419,403,407,399);


/*
  strokeWeight();
  fill(# );
  ellipse();
  triangle();
  rect();
  quad();
  point();
  line();
*/

  
 println(mouseX+" : "+mouseY);

  
}




