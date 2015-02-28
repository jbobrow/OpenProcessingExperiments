
//By Ellen Wang
//Samurai Jack vs. AKU


int jackX;
int jackY;

int GojackX;
int GojackY;


void setup(){
  size(800,600);
  smooth();
  jackX = 400;
  jackY = 600;
  
  GojackX = 6;
  GojackY = 5;
  


}

void draw(){
  background(120,92,68);
  noStroke();
smooth();

fill(121,95,70);
ellipse(200,420,1130,830);

fill(120,93,66);
ellipse(240,420,1120,820);

fill(148,101,57);
ellipse(220,420,1180,800);

fill(157,105,60);
ellipse(220,450,900,700);

fill(171,100,58);
ellipse(230,450,840,680);

fill(179,89,54);
ellipse(230,450,830,670);

fill(219,83,49);
ellipse(230,450,820,660);


fill(230, 94, 54);
ellipse(230, 450, 800, 650);

fill(232,94,58);
ellipse(235,450,750,620);

fill(235,117,76);
ellipse(240,450,600,560);

fill(240,150,107);
ellipse(245,450,540,535);

fill(243,164,124);
ellipse(250,550,460,520);



//AKU

  noStroke();
  fill(17, 13, 11);
  quad(0,600,800,600,800,500,0,500);
quad(185, 262, 240, 260, 327, 500, 175, 500);

beginShape();
vertex(209, 330);
vertex(157, 320);
vertex(171, 300);
vertex(162, 315);
vertex(188, 313);
vertex(187, 298);
vertex(127, 282);
vertex(150, 238);
vertex(162, 236);
vertex(140, 279);
vertex(188, 286);
vertex(188, 272);
vertex(155, 268);
vertex(179, 228);
vertex(192, 225);
vertex(167, 263);
vertex(193, 262);
vertex(238, 261);
vertex(271, 247);
vertex(243, 215);
vertex(260, 220);
vertex(283, 250);
vertex(241, 270);
vertex(247, 282);
vertex(297, 251);
vertex(276, 225);
vertex(290, 228);
vertex(307, 253);
vertex(248, 294);
vertex(250, 300);
vertex(274, 298);
vertex(272, 281);
vertex(279, 304);
vertex(240, 319);

endShape(CLOSE);

noStroke();

fill(70,35,31);
beginShape();
vertex(218,313);
bezierVertex(229,325,221,339,214,327);
bezierVertex(213,339,224,339,225,335);
bezierVertex(229,351,214,356,231,363);
bezierVertex(218,350,245,357,228,386);
bezierVertex(233,384,242,367,238,358);
bezierVertex(241,355,241,360,241,366);
bezierVertex(251,350,234,350,232,332);
bezierVertex(237,334,237,325,235,320);
bezierVertex(235,325,235,328,230,327);
bezierVertex(228,326,230,317,231,311);
endShape(CLOSE);

fill(117,41,24);
beginShape();
vertex(198,288);
bezierVertex(184,280,194,254,200,254);
bezierVertex(193,266,209,265,201,250);
bezierVertex(198,237,202,235,208,234);
bezierVertex(195,243,213,253,206,240);
bezierVertex(220,246,202,260,212,263);
bezierVertex(213,263,213,261,213,259);
bezierVertex(218,265,218,268,217,273);
vertex(220,273);
bezierVertex(220,267,217,258,223,255);
bezierVertex(220,265,233,265,224,252);
bezierVertex(222,248,220,244,225,239);
bezierVertex(225,254,234,235,222,233);
bezierVertex(241,231,230,249,230,253);
bezierVertex(231,270,242,260,234,256);
bezierVertex(250,257,245,286,233,284);

endShape(CLOSE);

fill(226,69,40);
bezier(194,280,189,260,225,279,214,286);
bezier(224,284,213,270,243,261,241,274);

//AKU EYES

fill(0);
ellipse(227+(jackX/100),272+(jackY/150),8,5);
ellipse(205+(jackX/100),276+(jackY/150),8,6);

if(jackX>=180 && jackY>=270 && jackX<=300 && jackY<=500){
  fill(0);
  bezier(194,280,189,260,225,279,214,286);
  bezier(224,284,213,270,243,261,241,274);
}

fill(0);

beginShape();
vertex(194,280);
bezierVertex(203,278,208,284,209,286);
bezierVertex(208,285,196,290,194,280);
endShape(CLOSE);

bezier(197,270,212,265,218,278,216,281);
bezier(222,276,225,268,229,265,238,268);

beginShape();
vertex(224,284);
bezierVertex(228,278,236,273,242,273);
bezierVertex(243,282,226,287,224,284);
endShape(CLOSE);




fill(90,63,26);
beginShape();
vertex(205,287);
bezierVertex(202,282,210,282,220,284);
bezierVertex(229,279,235,280,232,284);
bezierVertex(262,269,262,326,232,312);
bezierVertex(225,311,224,311,212,318);
bezierVertex(188,335,171,280,206,287);
endShape(CLOSE);

beginShape();
vertex(214,285);
bezierVertex(218,280,217,276,218,272);
vertex(219,271);
bezierVertex(219,276,223,280,225,283);
vertex(221,287);
endShape(CLOSE);

fill(0);
beginShape();
vertex(229,292);
bezierVertex(254,273,257,314,235,307);
bezierVertex(226,306,220,307,214,312);
bezierVertex(183,328,180,282,209,293);
bezierVertex(215,295,220,297,229,292);
endShape(CLOSE);

stroke(70,35,31);
noFill();
strokeWeight(2);
beginShape();
vertex(229,292);
bezierVertex(254,273,257,314,235,307);
bezierVertex(226,306,220,307,214,312);
bezierVertex(183,328,180,282,209,293);
bezierVertex(215,295,220,297,229,292);
endShape(CLOSE);
noStroke();

fill(127,62,34);
bezier(220,286,226,280,240,284,222,291);
bezier(222,291,199,290,212,282,220,286);

stroke(66,35,32);
line(214,287,219,288);
line(222,287,226,285);

fill(121,56,28);
strokeWeight(1);

beginShape();
vertex(207,315);
bezierVertex(208,308,207,304,200,296);
bezierVertex(208,301,212,305,215,312);
endShape(CLOSE);

beginShape();
vertex(231,307);
bezierVertex(231,300,232,296,241,290);
bezierVertex(237,296,236,303,238,308);
endShape(CLOSE);

beginShape();
vertex(209,294);
bezierVertex(220,296,225,295,230,291);
vertex(235,307);
bezierVertex(228,307,220,305,211,314);
endShape(CLOSE);

line(208,304,234,301);
line(217,294,216,304);
line(223,294,226,302);
line(220,309,219,303);
line(226,307,226,302);



beginShape();
vertex(205,292);
bezierVertex(210,300,206,308,203,310);
bezierVertex(206,308,212,302,211,294);
endShape(CLOSE);

beginShape();
vertex(228,291);
bezierVertex(230,300,236,301,240,301);
bezierVertex(235,300,233,297,234,289);
endShape(CLOSE);

noStroke();
  
  
  
  //JACK-----------------------------------------------------------
  
  jackX += GojackX;
  jackY += GojackY;
  
  if(jackX >= 760){ 
    GojackX = -6;
  }
  if(jackX <= 0){
    GojackX = 6;
  }
  if(jackY >= 600){
    GojackY = -5;
  }
  if(jackY <= 50){
    GojackY = 5;
  }
 

  if( jackX < 740 && jackX > 10 && jackY < 585 && jackY > 70){
  //JACK MOVING
  fill(255);
  noStroke();
  beginShape();
  vertex(jackX,jackY);
  vertex(jackX+50,jackY);
  vertex(jackX+20,jackY-20);
  vertex(jackX+25,jackY-25);
  vertex(jackX+35,jackY-20);
  vertex(jackX+40,jackY-40);
  vertex(jackX+8,jackY-40);
  vertex(jackX+5,jackY-30);
  vertex(jackX+10,jackY-25);
  vertex(jackX,jackY-20);
  endShape(CLOSE);
  
  fill(250,236,161);
  quad(jackX+15,jackY-50,jackX+15,jackY-40,jackX+22,jackY-40,jackX+22,jackY-50);
  fill(0);
  triangle(jackX+14,jackY-51,jackX+23,jackY-51,jackX+19,jackY-48);
  stroke(0);
  strokeWeight(2);
  line(jackX+18,jackY-53,jackX+18,jackY-50);
  
  strokeWeight(3);
  line(jackX+32,jackY-40,jackX+31,jackY-30);
  stroke(200,223,243);
  line(jackX+32,jackY-40,jackX+35,jackY-65);
  
  strokeWeight(1);
  stroke(165,151,146);
  line(jackX+8,jackY-40,jackX+19,jackY-30);
  line(jackX+19, jackY-30, jackX+30, jackY-35);
  line(jackX+30, jackY-35, jackX+21, jackY-20);
  strokeWeight(3);
  line(jackX+10, jackY, jackX+15, jackY-18);
  } else if(jackX <= 10){
   //JACK LEFT
  fill(255);
  noStroke();
  beginShape();
  vertex(jackX,jackY+15);
  vertex(jackX+25,jackY-20);
  vertex(jackX+30,jackY-25);
  vertex(jackX+40,jackY-20);
  vertex(jackX+45,jackY-40);
  vertex(jackX+13,jackY-40);
  vertex(jackX+10,jackY-30);
  vertex(jackX+15,jackY-25);
  vertex(jackX,jackY-40);
  endShape(CLOSE);
  
  fill(250,236,161);
  quad(jackX+20,jackY-50,jackX+20,jackY-40,jackX+27,jackY-40,jackX+27,jackY-50);
  fill(0);
  triangle(jackX+19,jackY-51,jackX+28,jackY-51,jackX+24,jackY-48);
  stroke(0);
  strokeWeight(2);
  line(jackX+23,jackY-53,jackX+23,jackY-50);
  
  strokeWeight(3);
  line(jackX+37,jackY-40,jackX+36,jackY-30);
  stroke(200,223,243);
  line(jackX+37,jackY-40,jackX+40,jackY-65);
  
  strokeWeight(1);
  stroke(165,151,146);
  line(jackX+13,jackY-40,jackX+24,jackY-30);
  line(jackX+24, jackY-30, jackX+35, jackY-35);
  line(jackX+35, jackY-35, jackX+26, jackY-20);
  strokeWeight(3);
  line(jackX, jackY-3, jackX+20, jackY-18);
  } else if (jackY >=590){
   //JACK ONGROUND
  fill(255);
  noStroke();
  beginShape();
  vertex(jackX+3,jackY-15);
  vertex(jackX-15,jackY);
  vertex(jackX+49,jackY);
  vertex(jackX+25,jackY-10);
  vertex(jackX+25,jackY-15);
  vertex(jackX+35,jackY-10);
  vertex(jackX+40,jackY-30);
  vertex(jackX+8,jackY-30);
  vertex(jackX+5,jackY-20);
  vertex(jackX+10,jackY-15);
  
  endShape(CLOSE);
  
  fill(250,236,161);
  quad(jackX+15,jackY-40,jackX+15,jackY-30,jackX+22,jackY-30,jackX+22,jackY-40);
  fill(0);
  triangle(jackX+14,jackY-41,jackX+23,jackY-41,jackX+19,jackY-38);
  stroke(0);
  strokeWeight(2);
  line(jackX+18,jackY-43,jackX+18,jackY-40);
  
  strokeWeight(3);
  line(jackX+35,jackY-30,jackX+27,jackY-20);
  stroke(200,223,243);
  line(jackX+35,jackY-30,jackX+52,jackY-50);
  
  strokeWeight(1);
  stroke(165,151,146);
  line(jackX+8,jackY-30,jackX+19,jackY-20);
  line(jackX+19, jackY-20, jackX+30, jackY-25);
  line(jackX+30, jackY-25, jackX+21, jackY-10);
  strokeWeight(3);
  line(jackX+5, jackY, jackX+15, jackY-10);
  } else if(jackX >= 740){
  
  //JACK RIGHT
  fill(255);
  noStroke();
  beginShape();
  vertex(jackX+50,jackY);
  vertex(jackX+50,jackY-50);
  vertex(jackX+20,jackY-20);
  vertex(jackX+25,jackY-25);
  vertex(jackX+35,jackY-20);
  vertex(jackX+38,jackY-45);
  vertex(jackX+8,jackY-35);
  vertex(jackX+5,jackY-30);
  vertex(jackX+10,jackY-25);
  vertex(jackX+20,jackY-15);
  endShape(CLOSE);
  
  fill(250,236,161);
  quad(jackX+15,jackY-50,jackX+15,jackY-40,jackX+22,jackY-40,jackX+22,jackY-50);
  fill(0);
  triangle(jackX+14,jackY-51,jackX+23,jackY-51,jackX+19,jackY-48);
  stroke(0);
  strokeWeight(2);
  line(jackX+18,jackY-53,jackX+18,jackY-50);
  
  strokeWeight(3);
  line(jackX+32,jackY-40,jackX+31,jackY-30);
  stroke(200,223,243);
  line(jackX+32,jackY-40,jackX+35,jackY-65);
  
  strokeWeight(1);
  stroke(165,151,146);
  line(jackX+8,jackY-36,jackX+19,jackY-30);
  line(jackX+19, jackY-30, jackX+30, jackY-35);
  line(jackX+30, jackY-35, jackX+21, jackY-20);
  strokeWeight(3);
  line(jackX+48, jackY-30, jackX+25, jackY-20);
  }else if(jackY <= 70){
  
  //JACK UP
  fill(255);
  noStroke();
  beginShape();
  vertex(jackX,jackY-10);
  vertex(jackX+50,jackY-10);
  vertex(jackX+20,jackY-20);
  vertex(jackX+25,jackY-25);
  vertex(jackX+35,jackY-20);
  vertex(jackX+40,jackY-40);
  vertex(jackX+12,jackY-40);
  vertex(jackX+10,jackY-60);
  vertex(jackX-5,jackY-60);
  vertex(jackX+5,jackY-30);
  vertex(jackX+10,jackY-25);
  vertex(jackX-5,jackY-25);
  endShape(CLOSE);
  
  fill(250,236,161);
  quad(jackX+15,jackY-50,jackX+15,jackY-40,jackX+22,jackY-40,jackX+22,jackY-50);
  fill(0);
  triangle(jackX+14,jackY-51,jackX+23,jackY-51,jackX+19,jackY-48);
  stroke(0);
  strokeWeight(2);
  line(jackX+18,jackY-53,jackX+18,jackY-50);
  
  strokeWeight(3);
  line(jackX+34,jackY-38,jackX+28,jackY-30);
  stroke(200,223,243);
  line(jackX+35,jackY-40,jackX+50,jackY-60);
  
  stroke(165,151,146);
  strokeWeight(3);
  line(jackX+25, jackY-11, jackX+18, jackY-23);
  line(jackX+14,jackY-25,jackX+18,jackY-38);
  } 
  
  
  if(jackX>=180 && jackY>=270 && jackX<=300 && jackY<=500){
  
  
  //JACK CUT
  stroke(255);
  strokeWeight(.5);
  noFill();
  arc(jackX+37, jackY-35, 50, 50, TWO_PI-PI/2, TWO_PI);
  arc(jackX+37, jackY-35, 40, 40, TWO_PI-PI/2, TWO_PI);
  strokeWeight(1);
  line(jackX+27, jackY-35, jackX+70, jackY-50);
  line(jackX+27, jackY-35, jackX+60, jackY-70);
  
  stroke(255,0,0);
  fill(0);
  
  beginShape();
  vertex(jackX+45,jackY-30);
  vertex(jackX+45,jackY-38); 
  vertex(jackX+55,jackY-42);
  vertex(jackX+50,jackY-39);
  vertex(jackX+70,jackY-41); 
  vertex(jackX+55,jackY-37);
  vertex(jackX+125,jackY-35);
  vertex(jackX+55,jackY-33);
  vertex(jackX+70,jackY-29);
  vertex(jackX+50,jackY-31);
  vertex(jackX+55,jackY-28);
  endShape(CLOSE);
  
  ellipse(jackX+72,jackY-25,2,2);
  ellipse(jackX+78,jackY-22,1,1);
  ellipse(jackX+75,jackY-45,3,3);
  ellipse(jackX+50,jackY-65,3,3);
  ellipse(jackX+65,jackY-70,1,1);
  
  fill(255);
  noStroke();
  beginShape();
  vertex(jackX,jackY);
  vertex(jackX+50,jackY);
  vertex(jackX+20,jackY-20);
  vertex(jackX+25,jackY-25);
  vertex(jackX+35,jackY-20);
  vertex(jackX+40,jackY-40);
  vertex(jackX+8,jackY-40);
  vertex(jackX+5,jackY-30);
  vertex(jackX+10,jackY-25);
  vertex(jackX,jackY-20);
  endShape(CLOSE);
  
  fill(250,236,161);
  quad(jackX+15,jackY-50,jackX+15,jackY-40,jackX+22,jackY-40,jackX+22,jackY-50);
  fill(0);
  triangle(jackX+14,jackY-51,jackX+23,jackY-51,jackX+19,jackY-48);
  stroke(0);
  strokeWeight(2);
  line(jackX+18,jackY-53,jackX+18,jackY-50);
  
  strokeWeight(3);
  line(jackX+37,jackY-35,jackX+25,jackY-35);
  stroke(200,223,243);
  line(jackX+37,jackY-35,jackX+60,jackY-35);
  
  strokeWeight(1);
  stroke(165,151,146);
  line(jackX+8,jackY-40,jackX+19,jackY-30);
  line(jackX+19, jackY-30, jackX+30, jackY-35);
  line(jackX+30, jackY-35, jackX+21, jackY-20);
  strokeWeight(3);
  line(jackX+10, jackY, jackX+15, jackY-18);
  }
  
  
  
  
  println("x: "+mouseX + " y: " + mouseY);
  
}


