
//malevich farmer in the field remix
//matthew endler
//gradient code appropriated from Ira Greenberg's Simple Linear Gradient(http://processing.org/learning/basics/lineargradient.html)

int Y_AXIS = 1;
int X_AXIS = 2;


void setup(){
  noStroke();
  size(246,414);
  background(78,113,155);
 
//head
  fill(161,36,8);
  arc(122, 26, 32, 52, PI,TWO_PI);
  
  fill(240);
  ellipse(122,26,24,48);
  
  fill(183,143,58);
 // arc(122, 26, 24, 48, PI/2, 3_PI/2); how do I make a half-circle?
  
  fill(29,42,14);
  ellipse(118,22,2,2);
  ellipse(126,22,2,2);
  
  fill(44,77,112);
  triangle(120,38,124,38,122,22);
  ellipse(122,43,6,4);
 
//background
  fill(78,255,155);
  rect(91,222,4,28);
  
  fill(208,157,39);
  beginShape();
  vertex(67,366);
  vertex(194,200);
  vertex(246,204);
  vertex(246,216);
  vertex(175,377);
  endShape(CLOSE);
  
  fill(161,55,7);
  beginShape();
  vertex(0,414);
  vertex(14,414);
  vertex(53,367);
  vertex(0,362);
  endShape(CLOSE);
  
  fill(202,105,73);
  beginShape();
  vertex(14,414);
  vertex(53,367);
  vertex(64,369);
  vertex(66,365);
  vertex(177,378);
  vertex(162,414);
  endShape(CLOSE);
  
   fill(144,28,5);
  beginShape();
  vertex(162,414);
  vertex(177,378);
  vertex(246,390);
  vertex(246,414);
  endShape(CLOSE);
  
  fill(220);
  beginShape();
  vertex(174,377);
  vertex(202,314);
  vertex(246,318);
  vertex(246,390);
  endShape(CLOSE);
  
  fill(25,45,65);
  beginShape();
  vertex(246,318);
  vertex(202,314);
  vertex(246,216);
  endShape(CLOSE);
  
  
  
  
//gradientboxes
  color b1 = color(0,0,0);
  color b2 = color(255,255,255);
  setGradient(56,67,128,126,b1,b2,X_AXIS);
  setGradient(72,197,106,98,b2,b1,X_AXIS);
  
//gradientmasks
  fill(255,255,255);
  rect(112,44,20,42);
  
  fill(161,36,8);
  rect(122,44,10,42);
  
  fill(161,36,8);
  beginShape();
  vertex(147,192);
  vertex(176,164);
  vertex(175,130);
  vertex(165,137);
  endShape(CLOSE);
  
  fill(208,157,39);
  beginShape();
  vertex(175,130);
  vertex(165,137);
  vertex(172,118);
  vertex(175,118);
  endShape(CLOSE);
  
  fill(131,132,134);
  beginShape();
  vertex(172,118);
  vertex(175,118);
  vertex(174,109);
  endShape(CLOSE);
  
  fill(31,73,71);
  beginShape();
  vertex(0,362);
  vertex(0,341);
  vertex(77,257);
  vertex(71,296);
  vertex(91,296);
  vertex(91,331);
  vertex(64,369);
  endShape(CLOSE);
  
  fill(185,55,25);
  beginShape();
  vertex(69,267);
  vertex(26,266);
  vertex(88,214);
  vertex(77,256);
  endShape(CLOSE);
  
  fill(0);
  beginShape();
  vertex(69,267);
  vertex(26,266);
  vertex(0,285);
  vertex(0,342);
  endShape(CLOSE);
    
  fill(230);
  beginShape();
  vertex(0,285);
  vertex(0,248);
  vertex(92,190);
  vertex(95,196);
  vertex(88,214);
  endShape(CLOSE);
  
  fill(207,166,38);
  beginShape();
  vertex(92,190);
  vertex(0,248);
  vertex(0,222);
  vertex(88,173);
  endShape(CLOSE);
  
  fill(25,75,65);
  beginShape();
  vertex(0,222);
  vertex(88,173);
  vertex(81,149);
  vertex(0,178);
  endShape(CLOSE);
  
  fill(190,80,40);
  beginShape();
  vertex(0,178);
  vertex(0,148);
  vertex(21,170);
  endShape(CLOSE);
  
  fill(230);
  beginShape();
  vertex(21,170);
  vertex(81,149);
  vertex(72,119);
  vertex(56,120);
  vertex(34,101);
  vertex(0,101);
  vertex(0,107);
  vertex(38,142);
  vertex(6,154);
  endShape(CLOSE);
  
  fill(171,65,23);
  beginShape();
  vertex(56,120);
  vertex(34,101);
  vertex(56,100);
  endShape(CLOSE);
  
  fill(10);
  beginShape();
  vertex(0,148);
  vertex(6,154);
  vertex(38,142);
  vertex(0,107);
  endShape(CLOSE);
  
  fill(208,157,39);
  beginShape();
  vertex(176,296);
  vertex(163,242);
  vertex(195,200);
  vertex(197,297);
  endShape(CLOSE);
  
  fill(35,76,80);
  beginShape();
  vertex(163,242);
  vertex(148,193);
  vertex(222,119);
  vertex(246,116);
  vertex(246,132);
  endShape(CLOSE);
  
  fill(28,59,77);
  beginShape();
  vertex(246,204);
  vertex(194,200);
  vertex(246,133);
  endShape(CLOSE);
  
  fill(165,45,15);
  beginShape();
  vertex(185,155);
  vertex(180,127);
  vertex(194,118);
  vertex(223,118);
  endShape(CLOSE);
  
  fill(10);
  beginShape();
  vertex(192,118);
  vertex(187,91);
  vertex(197,91);
  vertex(208,119);
  endShape(CLOSE); 
  
  fill(150);
  beginShape();
  vertex(208,119);
  vertex(213,119);
  vertex(202,91);
  vertex(197,91);
  endShape(CLOSE); 
  
  fill(168,55,11);
  beginShape();
  vertex(202,91);
  vertex(214,92);
  vertex(229,117);
  vertex(213,119);
  endShape(CLOSE);
  
  fill(100);
  beginShape();
  vertex(229,117);
  vertex(214,92);
  vertex(229,91);
  vertex(245,115); 
  endShape(CLOSE);
  
  fill(225,215,215);
  beginShape();
  vertex(246,115); 
  vertex(229,91);
  vertex(246,92);
  endShape(CLOSE);
  
  fill(84,106,85);
  rect(220,90,26,2);
  fill(157,120,80);
  rect(188,88,58,2);
  
  fill(18,60,118);
  beginShape();
  vertex(189,88);
  vertex(184,73);
  vertex(192,73);
  vertex(202,88); 
  endShape(CLOSE);
  
  fill(50,100,100);
  beginShape();
  vertex(202,88);
  vertex(192,73);
  vertex(199,72);
  vertex(211,88); 
  endShape(CLOSE);
  
  fill(200);
  beginShape();
  vertex(211,88);
  vertex(199,72);
  vertex(206,72);
  vertex(217,88); 
  endShape(CLOSE);
  
  fill(2,39,81);
  beginShape();
  vertex(217,88);
  vertex(206,72);
  vertex(215,71);
  vertex(228,88); 
  endShape(CLOSE);
  
  fill(48,91,98);
  beginShape();
  vertex(228,88);
  vertex(215,71);
  vertex(224,71);
  vertex(240,88); 
  endShape(CLOSE);
  
  fill(0);
  beginShape();
  vertex(240,88);
  vertex(212,57);
  vertex(234,57);
  vertex(246,68); 
  vertex(246,87);
  endShape(CLOSE);
  
  fill(131,58,25);
  beginShape();
  vertex(246,68);
  vertex(234,57);
  vertex(246,57);
  endShape(CLOSE);
  
  fill(64,120,117);
  beginShape();
  vertex(224,71);
  vertex(207,71);
  vertex(198,57);
  vertex(212,57);
  endShape(CLOSE);  
  
  fill(178,146, 31);
  beginShape();
  vertex(207,71);
  vertex(198,57);
  vertex(188,57);
  vertex(198,71);
  endShape(CLOSE);  
  
  fill(25,56,111);
  beginShape();
  vertex(198,71);
  vertex(191,71);
  vertex(186, 61);
  vertex(190,60);
  endShape(CLOSE);
  
  fill(52, 106, 108);
  
  beginShape();
  vertex(191,71); 
  vertex(186, 61);
  vertex(180,61);
  vertex(185,73);
  endShape(CLOSE);
  
  
  
  fill(150,75,75);
  beginShape();
  vertex(190,60);
  vertex(176,61);
  vertex(175,58);
  vertex(188,57);
  endShape(CLOSE);
 
 fill(132,103,43);
beginShape();
vertex(180, 64);
vertex(177,64);
vertex(176,61);
vertex(179,61);
endShape(CLOSE);

fill(14, 56,96);
beginShape();
vertex(177,64);
vertex(174,59);
vertex(169,59);
vertex(172,64);
endShape(CLOSE);

fill(148,68,59);
beginShape();
vertex(170,60);
vertex(161,61);
vertex(161,59);
vertex(166,58);
vertex(170,58);
endShape(CLOSE);

 
  
  //fill(165,51,30);
  //rect(187,76,5,10);
  
//belt
  fill(76,92,151);
  beginShape();
  vertex(93,193);
  vertex(93,222);
  vertex(95,222);
  vertex(95,207);
  vertex(97,207);
  vertex(97,193);
  endShape(CLOSE);
  
  
  //arms
  fill(0);
  beginShape();
  vertex(56,66);
  vertex(58,240);
  vertex(62,239);
  vertex(63,84);
  endShape(CLOSE);
  
  fill(255);
  beginShape();
  vertex(62,239);
  vertex(63,84);
  vertex(74,126);
  vertex(74,238);
  endShape(CLOSE);
  
  fill(0);
  beginShape();
  vertex(175,109);
  vertex(181,81);
  vertex(183,235);
  vertex(176,236);
  endShape(CLOSE);
  
  fill(255);
  beginShape();
  vertex(181,82);
  vertex(186,67);
  vertex(194,154);
  vertex(193,234);
  vertex(183,235);
  endShape(CLOSE);
  
//hands
  fill(255,255,255);
  beginShape();
  vertex(62,240);
  vertex(56,252);
  vertex(60,262);
  vertex(65,265);
  vertex(68,264);
  vertex(67,260);
  vertex(65,255);
  vertex(67,250);
  vertex(69,254);
  vertex(72,257);
  vertex(72,249);
  endShape(CLOSE);
  
  beginShape();
  vertex(181,235);
  vertex(177,241);
  vertex(176,246);
  vertex(176,250);
  vertex(179,250);
  vertex(182,245);
  vertex(184,245);
  vertex(184,249);
  vertex(180,255);
  vertex(180,259);
  vertex(186,261);
  vertex(192,252);
  vertex(193,244);
  vertex(192,239);
  vertex(189,234);
  endShape(CLOSE);
  
  fill(100);
  rect(176,235,17,1);
  
  
//LEGS
  fill(0);
  beginShape();
  vertex(104,386);
  vertex(89,396);
  vertex(87,400);
  vertex(91,404);
  vertex(97,405);
  vertex(113,396);
  vertex(114,395);
  vertex(115,389);
  endShape(CLOSE);
  
  fill(139,1,1);
  beginShape();
  vertex(104,386);
  vertex(89,396);
  vertex(87,400);
  vertex(91,404);
  vertex(94,404);
  vertex(110,395);
  vertex(112,393);
  vertex(113,387);
  endShape(CLOSE);
  
  fill(0);
  beginShape();
  vertex(127,390);
  vertex(140,401);
  vertex(149,405);
  vertex(155,402);
  vertex(157,397);
  vertex(156,394);
  vertex(144,387);
  endShape(CLOSE);
  
  fill(139,1,1);
  beginShape();
  vertex(130,388);
  vertex(142,398);
  vertex(151,404);
  vertex(155,402);
  vertex(157,397);
  vertex(156,394);
  vertex(144,387);
  endShape(CLOSE);
  
  fill(15,25,65);
  rect(91,296,6,93);
  rect(125,296,6,93);
  
  fill(57,82,137);
  rect(97,296,7,93);
  rect(131,296,7,93);
  
  fill(255);
  rect(103,296,16,93);
  beginShape();
  vertex(138,296);
  vertex(138,389);
  vertex(152,389);
  vertex (154,296);
  endShape(CLOSE);
  
 
 
 
 
 
 
 
 
 
 
}




//extra code for gradient to work
void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ){
  // calculate differences between color components 
  float deltaR = red(c2)-red(c1);
  float deltaG = green(c2)-green(c1);
  float deltaB = blue(c2)-blue(c1);

  // choose axis
  if(axis == Y_AXIS){
    /*nested for loops set pixels
     in a basic table structure */
    // column
    for (int i=x; i<=(x+w); i++){
      // row
      for (int j = y; j<=(y+h); j++){
        color c = color(
        (red(c1)+(j-y)*(deltaR/h)),
        (green(c1)+(j-y)*(deltaG/h)),
        (blue(c1)+(j-y)*(deltaB/h)) 
          );
        set(i, j, c);
      }
    }  
  }  
  else if(axis == X_AXIS){
    // column 
    for (int i=y; i<=(y+h); i++){
      // row
      for (int j = x; j<=(x+w); j++){
        color c = color(
        (red(c1)+(j-x)*(deltaR/h)),
        (green(c1)+(j-x)*(deltaG/h)),
        (blue(c1)+(j-x)*(deltaB/h)) 
          );
        set(j, i, c);
      }
    }  
  }
}


