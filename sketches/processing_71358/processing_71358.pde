
float x1 = 200;
float y1 = 100;
float x2 = 225;
float y2 = 120;
float x3 = 250;
float y3 = 140;
float x4 = 180;
float y4 = 170;
float x5 = 210;
float y5 = 190;
float x6 = 210;
float y6 = 220;
float x7 = 250;
float y7 = 240;
float x8 = 215;
float y8 = 260;
float x9 = 300;
float y9 = 280;
float x10 = 225;
float y10 = 300;
float x11 = 270;
float y11 = 320;
float x12 = 300;
float y12 = 340;
float x13 = 380;
float y13 = 360;
float x14 = 285;
float y14 = 385;
float x15 = 320;
float y15 = 405;
float x16 = 360;
float y16 = 420;
float x17 = 400;
float y17 = 440;
float x18 = 340;
float y18 = 452;
float x19 = 360;
float y19 = 465;
float x20 = 360;
float y20 = 475;
float x21 = 375;
float y21 = 485;
float speed1 = 10;
float speed2 = 7;
float speed3 = 8;
float speed4 = 9.5;
float speed5 = 7.25;
float speed6 = 6;
float speed7 = 9;
float speed8 = 6.8;
float speed9 = 10.25;
float speed10 = 8.2;
float speed11 = 7.2;
float speed12 = 5.8;
float speed13 = 9.2;
float speed14 = 7.9;
float speed15 = 6.9;
float speed16 = 5.6;
float speed17 = 4.6;
float speed18 = 3.6;
float speed19 = 3.2;
float speed20 = 3;
float speed21 = 1;
float x;
float y;
float easing = .08;

void setup(){
  size(800,500);
}
void draw(){
  background(0,125,205);
  if (keyPressed){
    if (key == CODED){
      if (keyCode == UP){
        y1 -= 2;
        y2 -= 2;
        y3 -= 1.9;
        y4 -= 1.8;
        y5 -= 1.7;
        y6 -= 1.6;
        y7 -= 1.5;
        y8 -= 1.4;
        y9 -= 1.3;
        y10 -= 1.2;
        y11 -= 1.1;
        y12 -= 1;
        y13 -= .9;
        y14 -= .8;
        y15 -= .7;
        y16 -= .6;
        y17 -= .5;
        y18 -= .4;
        y19 -= .3;
        y20 -= .2;
        y21 -= .1;
      } else if (keyCode == DOWN){
        y1 += 2;
        y2 += 2;
        y3 += 1.9;
        y4 += 1.8;
        y5 += 1.7;
        y6 += 1.6;
        y7 += 1.5;
        y8 += 1.4;
        y9 += 1.3;
        y10 += 1.2;
        y11 += 1.1;
        y12 += 1;
        y13 += .9;
        y14 += .8;
        y15 += .7;
        y16 += .6;
        y17 += .5;
        y18 += .4;
        y19 += .3;
        y20 += .2;
        y21 += .1;
      }
    }
    if (key == 'l'){
      background(40,0,60);
      noFill();
      stroke(255,255,185);
      //lightning1
      strokeWeight(5);
      beginShape();
      vertex(70,0);
      vertex(79,10);
      vertex(55,40);
      vertex(70,50);
      vertex(65,54);
      vertex(68,64);
      endShape();
      strokeWeight(4);
      beginShape();
      vertex(68,64);
      vertex(61,76);
      vertex(68,83);
      vertex(40,98);
      vertex(54,120);
      vertex(52,143);
      endShape();
      strokeWeight(3);
      beginShape();
      vertex(52,143);
      vertex(58,148);
      vertex(55,153);
      vertex(69,162);
      vertex(74,177);
      vertex(87,180);
      endShape();
      strokeWeight(2);
      beginShape();
      vertex(87,180);
      vertex(79,194);
      vertex(86,220);
      vertex(84,225);
      vertex(106,230);
      vertex(95,245);
      vertex(100,250);
      vertex(97,257);
      vertex(105,267);
      vertex(96,271);
      vertex(86,284);
      endShape();
      strokeWeight(1);
      beginShape();
      vertex(86,284);
      vertex(90,294);
      vertex(87,300);
      vertex(95,305);
      vertex(90,309);
      vertex(94,313);
      vertex(95,322);
      vertex(101,323);
      vertex(97,329);
      vertex(96,339);
      vertex(86,344);
      vertex(83,349);
      endShape();
      //lightning1,branch1
      strokeWeight(3);
      beginShape();
      vertex(68,83);
      vertex(74,94);
      vertex(80,88);
      vertex(85,93);
      vertex(95,94);
      endShape();
      strokeWeight(2);
      beginShape();
      vertex(95,94);
      vertex(97,110);
      vertex(107,118);
      vertex(103,122);
      vertex(104,126);
      vertex(100,139);
      vertex(107,146);
      vertex(114,148);
      vertex(117,156);
      vertex(125,149);
      vertex(145,164);
      endShape();
      strokeWeight(1);
      beginShape();
      vertex(145,164);
      vertex(159,166);
      vertex(155,172);
      vertex(157,179);
      vertex(154,186);
      vertex(159,191);
      vertex(158,197);
      vertex(148,204);
      vertex(155,211);
      vertex(150,217);
      vertex(150,222);
      endShape();
      //lightning4
      strokeWeight(6);
      beginShape();
      vertex(684,0);
      vertex(679,30);
      vertex(662,50);
      vertex(680,70);
      vertex(675,79);
      vertex(682,84);
      endShape();
      strokeWeight(5);
      beginShape();
      vertex(682,84);
      vertex(681,96);
      vertex(688,106);
      vertex(688,122);
      vertex(697,135);
      vertex(692,156);
      endShape();
      strokeWeight(4);
      beginShape();
      vertex(692,156);
      vertex(708,163);
      vertex(705,168);
      vertex(699,177);
      vertex(704,192);
      vertex(700,197);
      endShape();
      strokeWeight(3);
      beginShape();
      vertex(700,197);
      vertex(670,214);
      vertex(656,240);
      vertex(654,245);
      vertex(665,250);
      vertex(664,260);
      vertex(669,265);
      vertex(663,272);
      vertex(670,287);
      vertex(666,291);
      vertex(656,306);
      endShape();
      strokeWeight(2);
      beginShape();
      vertex(656,306);
      vertex(660,319);
      vertex(657,325);
      vertex(665,330);
      vertex(680,334);
      vertex(675,348);
      endShape();
      strokeWeight(1);
      beginShape();
      vertex(675,348);
      vertex(680,358);
      vertex(672,364);
      vertex(676,372);
      vertex(674,380);
      endShape();
      //lightning4,branch1
      strokeWeight(5);
      beginShape();
      vertex(679,30);
      vertex(686,37);
      vertex(697,38);
      vertex(699,51);
      vertex(711,49);
      vertex(730,62);
      vertex(738,62);
      endShape();
      strokeWeight(4);
      beginShape();
      vertex(738,62);
      vertex(735,72);
      vertex(740,90);
      vertex(770,110);
      vertex(793,102);
      vertex(800,107);
      endShape();
      //lightning4,branch2
      strokeWeight(2);
      beginShape();
      vertex(656,240);
      vertex(646,242);
      vertex(645,252);
      vertex(639,258);
      vertex(629,256);
      vertex(627,270);
      vertex(617,280);
      vertex(617,286);
      vertex(610,293);
      vertex(617,318);
      endShape();
      strokeWeight(1);
      beginShape();
      vertex(617,318);
      vertex(603,329);
      vertex(595,329);
      vertex(592,336);
      vertex(593,342);
      vertex(586,349);
      vertex(584,365);
      vertex(580,368);
      vertex(570,378);
      vertex(573,390);
      vertex(571,385);
      vertex(576,392);
      vertex(576,401);
      vertex(581,403);
      vertex(587,409);
      vertex(582,415);
      vertex(585,421);
      vertex(582,425);
      endShape();
    }
  }
  x1 += speed1;
  if (x1 > 270 || x1 < 130){
    speed1 = -speed1;
  }
  x2 += speed2;
  if (x2 > 290 || x2 < 150){
    speed2 = -speed2;
  }
  x3 += speed3;
  if (x3 > 300 || x3 < 160){
    speed3 = -speed3;
  }
  x4 += speed4;
  if (x4 > 320 || x4 < 180){
    speed4 = -speed4;
  }
  x5 += speed5;
  if (x5 > 340 || x5 < 200){
    speed5 = -speed5;
  }
  x6 += speed6;
  if (x6 > 350 || x6 < 210){
    speed6 = -speed6;
  }
  x7 += speed7;
  if (x7 > 355 || x7 < 215){
    speed7 = -speed7;
  }
  x8 += speed8;
  if (x8 > 355 || x8 < 215){
    speed8 = -speed8;
  }
  x9 += speed9;
  if (x9 > 365 || x9 < 225){
    speed9 = -speed9;
  }
  x10 += speed10;
  if (x10 > 360 || x10 < 220){
    speed10 = -speed10;
  }
  x11 += speed11;
  if (x11 > 370 || x11 < 230){
    speed11 = -speed11;
  }
  x12 += speed12;
  if (x12 > 380 || x12 < 240){
    speed12 = -speed12;
  }
  x13 += speed13;
  if (x13 > 380 || x13 < 260){
    speed13 = -speed13;
  }
  x14 += speed14;
  if (x14 > 395 || x14 < 285){
    speed14 = -speed14;
  }
  x15 += speed15;
  if (x15 > 405 || x15 < 295){
    speed15 = -speed15;
  }
  x16 += speed16;
  if (x16 > 400 || x16 < 310){
    speed16 = -speed16;
  }
  x17 += speed17;
  if (x17 > 400 || x17 < 330){
    speed17 = -speed17;
  }
  x18 += speed18;
  if (x18 > 390 || x18 < 340){
    speed18 = -speed18;
  }
  x19 += speed19;
  if (x19 > 385 || x19 < 355){
    speed19 = -speed19;
  }
  x20 += speed20;
  if (x20 > 380 || x20 < 360){
    speed20 = -speed20;
  }
  x21 += speed21;
  if (x21 > 378 || x21 < 362){
    speed21 = -speed21;
  }
  //twister
  noStroke();
  fill(178,158,158);
  beginShape();
  vertex(x21,y21);
  bezierVertex(x21+30,y21+4,x21+40,y21+4,x21+70,y21);
  bezierVertex(x21+40,y21+10,x21+30,y21+10,x21,y21);
  endShape();
  fill(158,138,138);
  beginShape();
  vertex(x20,y20);
  bezierVertex(x20+10,y20+4,x20+60,y20+4,x20+70,y20);
  bezierVertex(x20+60,y20+10,x20+5,y20+10,x20,y20);
  endShape();
  fill(188,168,168);
  beginShape();
  vertex(x19,y19);
  bezierVertex(x19+20,y19+4,x19+50,y19+4,x19+70,y19);
  bezierVertex(x19+50,y19+10,x19+5,y19+10,x19,y19);
  endShape();
  fill(172,152,152);
  beginShape();
  vertex(x18,y18);
  bezierVertex(x18+5,y18+4,x18+75,y18+4,x18+80,y18);
  bezierVertex(x18+75,y18+15,x18+5,y18+15,x18,y18);
  endShape();
  fill(156,136,136);
  beginShape();
  vertex(x17,y17);
  bezierVertex(x17+10,y17+4,x17+70,y17+4,x17+80,y17);
  bezierVertex(x17+70,y17+12,x17+10,y17+12,x17,y17);
  endShape();
  fill(168,148,148);
  beginShape();
  vertex(x16,y16);
  bezierVertex(x16+20,y16+7,x16+80,y16+7,x16+100,y16);
  bezierVertex(x16+80,y16+22,x16+20,y16+22,x16,y16);
  endShape();
  fill(180,160,160);
  beginShape();
  vertex(x15,y15);
  bezierVertex(x15+30,y15+7,x15+80,y15+7,x15+110,y15);
  bezierVertex(x15+80,y15+18,x15+30,y15+18,x15,y15);
  endShape();
  fill(192,172,172);
  beginShape();
  vertex(x14,y14);
  bezierVertex(x14+10,y14+7,x14+120,y14+7,x14+130,y14);
  bezierVertex(x14+120,y14+24,x14+10,y14+24,x14,y14);
  endShape();
  fill(182,162,162);
  beginShape();
  vertex(x13,y13);
  bezierVertex(x13+40,y13+7,x13+120,y13+7,x13+160,y13);
  bezierVertex(x13+120,y13+30,x13+40,y13+30,x13,y13);
  endShape();
  fill(172,152,152);
  beginShape();
  vertex(x12,y12);
  bezierVertex(x12+20,y12+7,x12+160,y12+7,x12+180,y12);
  bezierVertex(x12+160,y12+25,x12+20,y12+25,x12,y12);
  endShape();
  fill(162,142,142);
  beginShape();
  vertex(x11,y11);
  bezierVertex(x11+5,y11+7,x11+205,y11+7,x11+200,y11);
  bezierVertex(x11+205,y11+20,x11+5,y11+20,x11,y11);
  endShape();
  fill(152,132,132);
  beginShape();
  vertex(x10,y10);
  bezierVertex(x10+15,y10+7,x10+205,y10+7,x10+220,y10);
  bezierVertex(x10+205,y10+27,x10+15,y10+27,x10,y10);
  endShape();
  fill(176,156,156);
  beginShape();
  vertex(x9,y9);
  bezierVertex(x9+5,y9+10,x9+205,y9+10,x9+210,y9);
  bezierVertex(x9+205,y9+22,x9+5,y9+22,x9,y9);
  endShape();
  fill(200,180,180);
  beginShape();
  vertex(x8,y8);
  bezierVertex(x8+10,y8+10,x8+220,y8+10,x8+230,y8);
  bezierVertex(x8+220,y8+32,x8+10,y8+32,x8,y8);
  endShape();
  fill(182,162,162);
  beginShape();
  vertex(x7,y7);
  bezierVertex(x7+40,y7+10,x7+190,y7+10,x7+230,y7);
  bezierVertex(x7+190,y7+25,x7+40,y7+25,x7,y7);
  endShape();
  fill(168,148,148);
  beginShape();
  vertex(x6,y6);
  bezierVertex(x6+30,y6+10,x6+210,y6+10,x6+240,y6);
  bezierVertex(x6+210,y6+30,x6+30,y6+30,x6,y6);
  endShape();
  fill(154,134,134);
  beginShape();
  vertex(x5,y5);
  bezierVertex(x5+20,y5+15,x5+240,y5+15,x5+260,y5);
  bezierVertex(x5+240,y5+45,x5+20,y5+45,x5,y5);
  endShape();
  fill(172,152,152);
  beginShape();
  vertex(x4,y4);
  bezierVertex(x4+10,y4+15,x4+290,y4+15,x4+300,y4);
  bezierVertex(x4+290,y4+35,x4+10,y4+35,x4,y4);
  endShape();
  fill(190,170,170);
  beginShape();
  vertex(x3,y3);
  bezierVertex(x3+10,y3+30,x3+320,y3+30,x3+340,y3);
  bezierVertex(x3+320,y3+45,x3+10,y3+45,x3,y3);
  endShape();
  fill(170,150,150);
  beginShape();
  vertex(x2,y2);
  bezierVertex(x2+20,y2+20,x2+340,y2+20,x2+360,y2);
  bezierVertex(x2+340,y2+50,x2+20,y2+50,x2,y2);
  endShape();
  fill(150,130,130);
  beginShape();
  vertex(x1,y1);
  bezierVertex(x1+20,y1+20,x1+380,y1+20,x1+400,y1);
  bezierVertex(x1+380,y1+40,x1+20,y1+40,x1,y1);
  endShape();
  fill(150,130,130);
  beginShape();
  vertex(x1,y1-5);
  bezierVertex(x1+20,y1-17,x1+380,y1-17,x1+400,y1-5);
  bezierVertex(x1+380,y1-27,x1+20,y1-27,x1,y1-5);
  endShape();
}
void mouseMoved(){
  fill(70);
  x += (mouseX-x)*easing;
  y += (mouseY-y)*easing;
  beginShape();
  vertex(x,y-10);
  vertex(x+34,y-2);
  vertex(x+40,y-22);
  vertex(x+66,y-14);
  vertex(x+83,y+18);
  vertex(x+15,y+60);
  vertex(x-8,y+24);
  endShape(CLOSE);
}

