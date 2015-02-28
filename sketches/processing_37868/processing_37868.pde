
//Andy Warhol Mickey Mouse

size(400,400);

//orange shape
noStroke();
fill(203,99,0);
beginShape();
vertex(80,0);
vertex(200,0);
vertex(200,90);
vertex(110,110);
vertex(80,0);
endShape();

beginShape();
vertex(80,200);
vertex(200,200);
vertex(200,290);
vertex(110,310);
vertex(80,200);
endShape();

beginShape();
vertex(280,0);
vertex(400,0);
vertex(400,90);
vertex(310,110);
vertex(280,0);
endShape();

beginShape();
vertex(280,200);
vertex(400,200);
vertex(400,290);
vertex(310,310);
vertex(280,200);
endShape();

//pink shape
fill(219,130,172);
beginShape();
vertex(0,0);
vertex(80,0);
vertex(110,110);
vertex(200,90);
vertex(200,140);
vertex(70,160);
vertex(0,60);
vertex(0,0);
endShape();

beginShape();
vertex(200,0);
vertex(280,0);
vertex(310,110);
vertex(400,90);
vertex(400,140);
vertex(270,160);
vertex(200,60);
vertex(200,0);
endShape();

beginShape();
vertex(0,200);
vertex(80,200);
vertex(110,310);
vertex(200,290);
vertex(200,340);
vertex(70,360);
vertex(0,260);
vertex(0,200);
endShape();

beginShape();
vertex(200,200);
vertex(280,200);
vertex(310,310);
vertex(400,290);
vertex(400,340);
vertex(270,360);
vertex(200,260);
vertex(200,200);
endShape();

//blue shape
fill(136,196,198);
beginShape();
vertex(200,140);
vertex(200,200);
vertex(40,200);
vertex(35,155);
vertex(200,140);
endShape();

beginShape();
vertex(400,140);
vertex(400,200);
vertex(240,200);
vertex(235,155);
vertex(400,140);
endShape();

beginShape();
vertex(200,240);
vertex(200,400);
vertex(40,400);
vertex(35,355);
vertex(200,340);
endShape();

beginShape();
vertex(400,240);
vertex(400,400);
vertex(240,400);
vertex(235,355);
vertex(400,340);
endShape();

//purple shape
fill(198,136,198);
beginShape();
vertex(0,60);
vertex(70,150);
vertex(35,155);
vertex(40,200);
vertex(0,200);
vertex(0,60);
endShape();

beginShape();
vertex(200,60);
vertex(270,150);
vertex(235,155);
vertex(240,200);
vertex(200,200);
vertex(200,60);
endShape();

beginShape();
vertex(0,260);
vertex(70,350);
vertex(35,355);
vertex(40,400);
vertex(0,400);
vertex(0,260);
endShape();

beginShape();
vertex(200,260);
vertex(270,350);
vertex(235,355);
vertex(240,400);
vertex(200,400);
vertex(200,260);
endShape();

//mickey mouse TL

smooth();
noFill();
stroke(0,0,0);
strokeWeight(2);


//snout
beginShape();
curveVertex(130,140);
curveVertex(145,110);
curveVertex(175,105);
curveVertex(180,130);
curveVertex(140,145);
curveVertex(110,140);
curveVertex(75,115);
curveVertex(50,80);
endShape();

beginShape();
curveVertex(75,150);
curveVertex(70,120);
curveVertex(82,112);
curveVertex(95,130);
endShape();

//jaw
beginShape();
curveVertex(145,110);
curveVertex(125,145);
curveVertex(100,160);
curveVertex(85,157);
curveVertex(77,140);
curveVertex(90,100);
endShape();

//pants
fill(188,46,21);
noStroke();
beginShape();
curveVertex(100,175);
curveVertex(90,200);
curveVertex(95,180);
curveVertex(160,165);
curveVertex(190,180);
curveVertex(195,200);
curveVertex(175,150);
endShape();
stroke(136,196,198);
strokeWeight(1);
ellipse(175,185,10,20);

fill(0,0,0);
stroke(0,0,0);
strokeWeight(2);

//mouth
beginShape();
curveVertex(145,90);
curveVertex(115,144);
curveVertex(95,155);
curveVertex(85,145);
curveVertex(85,125);
curveVertex(90,100);
endShape();

//head
beginShape();
curveVertex(140,175);
curveVertex(145,80);
curveVertex(100,45);
curveVertex(55,70);
curveVertex(50,115);
curveVertex(80,150);
curveVertex(55,120);
curveVertex(60,100);
curveVertex(75,95);
curveVertex(90,100);
curveVertex(90,100);
curveVertex(88,75);
curveVertex(98,57);
curveVertex(122,60);
curveVertex(132,75);
curveVertex(132,75);
curveVertex(133,65);
curveVertex(145,80);
curveVertex(160,175);
endShape();

//eyes
ellipse(143,92,7,35);
ellipse(130,96,10,35);

//ears
ellipse(25,75,55,65);
ellipse(80,25,70,55);

//body
beginShape();
curveVertex(85,100);
curveVertex(75,150);
curveVertex(75,170);
curveVertex(85,185);
curveVertex(100,195);
curveVertex(150,190);
curveVertex(160,165);
curveVertex(125,145);
curveVertex(124,149);
curveVertex(100,160);
curveVertex(85,157);
curveVertex(75,145);
curveVertex(50,150);
endShape();

//nose
stroke(0,0,0);
ellipse(180,100,17,17);
ellipse(175,110,12,12);
strokeWeight(6);
beginShape();
curveVertex(180,50);
curveVertex(185,95);
curveVertex(173,112);
curveVertex(100,100);
endShape();

//arm
strokeWeight(13);
line(73,150,73,200);

//tongue
noStroke();
fill(152,48,29);
beginShape();
curveVertex(90,100);
curveVertex(86,135);
curveVertex(90,149);
curveVertex(96,154);
curveVertex(105,145);
curveVertex(50,100);
endShape();

stroke(0,0,0);
strokeWeight(2);
beginShape();
curveVertex(75,140);
curveVertex(87,135);
curveVertex(97,145);
curveVertex(85,160);
endShape();

//mickey mouse TR

smooth();
noFill();
stroke(0,0,0);
strokeWeight(2);


//snout
beginShape();
curveVertex(330,140);
curveVertex(345,110);
curveVertex(375,105);
curveVertex(380,130);
curveVertex(340,145);
curveVertex(310,140);
curveVertex(275,115);
curveVertex(250,80);
endShape();

beginShape();
curveVertex(275,150);
curveVertex(270,120);
curveVertex(282,112);
curveVertex(295,130);
endShape();

//jaw
beginShape();
curveVertex(345,110);
curveVertex(325,145);
curveVertex(300,160);
curveVertex(285,157);
curveVertex(277,140);
curveVertex(290,100);
endShape();

//pants
fill(188,46,21);
noStroke();
beginShape();
curveVertex(300,175);
curveVertex(290,200);
curveVertex(295,180);
curveVertex(360,165);
curveVertex(390,180);
curveVertex(395,200);
curveVertex(375,150);
endShape();
stroke(136,196,198);
strokeWeight(1);
ellipse(375,185,10,20);

fill(0,0,0);
stroke(0,0,0);
strokeWeight(2);

//mouth
beginShape();
curveVertex(345,90);
curveVertex(315,144);
curveVertex(295,155);
curveVertex(285,145);
curveVertex(285,125);
curveVertex(290,100);
endShape();

//head
beginShape();
curveVertex(340,175);
curveVertex(345,80);
curveVertex(300,45);
curveVertex(255,70);
curveVertex(250,115);
curveVertex(280,150);
curveVertex(255,120);
curveVertex(260,100);
curveVertex(275,95);
curveVertex(290,100);
curveVertex(290,100);
curveVertex(288,75);
curveVertex(298,57);
curveVertex(322,60);
curveVertex(332,75);
curveVertex(332,75);
curveVertex(333,65);
curveVertex(345,80);
curveVertex(360,175);
endShape();

//eyes
ellipse(343,92,7,35);
ellipse(330,96,10,35);

//ears
ellipse(225,75,55,65);
ellipse(280,25,70,55);

//body
beginShape();
curveVertex(285,100);
curveVertex(275,150);
curveVertex(275,170);
curveVertex(285,185);
curveVertex(300,195);
curveVertex(350,190);
curveVertex(360,165);
curveVertex(325,145);
curveVertex(324,149);
curveVertex(300,160);
curveVertex(285,157);
curveVertex(275,145);
curveVertex(250,150);
endShape();

//nose
stroke(0,0,0);
ellipse(380,100,17,17);
ellipse(375,110,12,12);
strokeWeight(6);
beginShape();
curveVertex(380,50);
curveVertex(385,95);
curveVertex(373,112);
curveVertex(300,100);
endShape();

//arm
strokeWeight(13);
line(273,150,273,200);

//tongue
noStroke();
fill(152,48,29);
beginShape();
curveVertex(290,100);
curveVertex(286,135);
curveVertex(290,149);
curveVertex(296,154);
curveVertex(305,145);
curveVertex(250,100);
endShape();

stroke(0,0,0);
strokeWeight(2);
beginShape();
curveVertex(275,140);
curveVertex(287,135);
curveVertex(297,145);
curveVertex(285,160);
endShape();
//mickey mouse

smooth();
noFill();
stroke(0,0,0);
strokeWeight(2);


//snout
beginShape();
curveVertex(130,140);
curveVertex(145,110);
curveVertex(175,105);
curveVertex(180,130);
curveVertex(140,145);
curveVertex(110,140);
curveVertex(75,115);
curveVertex(50,80);
endShape();

beginShape();
curveVertex(75,150);
curveVertex(70,120);
curveVertex(82,112);
curveVertex(95,130);
endShape();

//jaw
beginShape();
curveVertex(145,110);
curveVertex(125,145);
curveVertex(100,160);
curveVertex(85,157);
curveVertex(77,140);
curveVertex(90,100);
endShape();

//pants
fill(188,46,21);
noStroke();
beginShape();
curveVertex(100,175);
curveVertex(90,200);
curveVertex(95,180);
curveVertex(160,165);
curveVertex(190,180);
curveVertex(195,200);
curveVertex(175,150);
endShape();
stroke(136,196,198);
strokeWeight(1);
ellipse(175,185,10,20);

fill(0,0,0);
stroke(0,0,0);
strokeWeight(2);

//mouth
beginShape();
curveVertex(145,90);
curveVertex(115,144);
curveVertex(95,155);
curveVertex(85,145);
curveVertex(85,125);
curveVertex(90,100);
endShape();

//head
beginShape();
curveVertex(140,175);
curveVertex(145,80);
curveVertex(100,45);
curveVertex(55,70);
curveVertex(50,115);
curveVertex(80,150);
curveVertex(55,120);
curveVertex(60,100);
curveVertex(75,95);
curveVertex(90,100);
curveVertex(90,100);
curveVertex(88,75);
curveVertex(98,57);
curveVertex(122,60);
curveVertex(132,75);
curveVertex(132,75);
curveVertex(133,65);
curveVertex(145,80);
curveVertex(160,175);
endShape();

//eyes
ellipse(143,92,7,35);
ellipse(130,96,10,35);

//ears
ellipse(25,75,55,65);
ellipse(80,25,70,55);

//body
beginShape();
curveVertex(85,100);
curveVertex(75,150);
curveVertex(75,170);
curveVertex(85,185);
curveVertex(100,195);
curveVertex(150,190);
curveVertex(160,165);
curveVertex(125,145);
curveVertex(124,149);
curveVertex(100,160);
curveVertex(85,157);
curveVertex(75,145);
curveVertex(50,150);
endShape();

//nose
stroke(0,0,0);
ellipse(180,100,17,17);
ellipse(175,110,12,12);
strokeWeight(6);
beginShape();
curveVertex(180,50);
curveVertex(185,95);
curveVertex(173,112);
curveVertex(100,100);
endShape();

//arm
strokeWeight(13);
line(73,150,73,200);

//tongue
noStroke();
fill(152,48,29);
beginShape();
curveVertex(90,100);
curveVertex(86,135);
curveVertex(90,149);
curveVertex(96,154);
curveVertex(105,145);
curveVertex(50,100);
endShape();

stroke(0,0,0);
strokeWeight(2);
beginShape();
curveVertex(75,140);
curveVertex(87,135);
curveVertex(97,145);
curveVertex(85,160);
endShape();

//mickey mouse

smooth();
noFill();
stroke(0,0,0);
strokeWeight(2);


//snout
beginShape();
curveVertex(130,140);
curveVertex(145,110);
curveVertex(175,105);
curveVertex(180,130);
curveVertex(140,145);
curveVertex(110,140);
curveVertex(75,115);
curveVertex(50,80);
endShape();

beginShape();
curveVertex(75,150);
curveVertex(70,120);
curveVertex(82,112);
curveVertex(95,130);
endShape();

//jaw
beginShape();
curveVertex(145,110);
curveVertex(125,145);
curveVertex(100,160);
curveVertex(85,157);
curveVertex(77,140);
curveVertex(90,100);
endShape();

//pants
fill(188,46,21);
noStroke();
beginShape();
curveVertex(100,175);
curveVertex(90,200);
curveVertex(95,180);
curveVertex(160,165);
curveVertex(190,180);
curveVertex(195,200);
curveVertex(175,150);
endShape();
stroke(136,196,198);
strokeWeight(1);
ellipse(175,185,10,20);

fill(0,0,0);
stroke(0,0,0);
strokeWeight(2);

//mouth
beginShape();
curveVertex(145,90);
curveVertex(115,144);
curveVertex(95,155);
curveVertex(85,145);
curveVertex(85,125);
curveVertex(90,100);
endShape();

//head
beginShape();
curveVertex(140,175);
curveVertex(145,80);
curveVertex(100,45);
curveVertex(55,70);
curveVertex(50,115);
curveVertex(80,150);
curveVertex(55,120);
curveVertex(60,100);
curveVertex(75,95);
curveVertex(90,100);
curveVertex(90,100);
curveVertex(88,75);
curveVertex(98,57);
curveVertex(122,60);
curveVertex(132,75);
curveVertex(132,75);
curveVertex(133,65);
curveVertex(145,80);
curveVertex(160,175);
endShape();

//eyes
ellipse(143,92,7,35);
ellipse(130,96,10,35);

//ears
ellipse(25,75,55,65);
ellipse(80,25,70,55);

//body
beginShape();
curveVertex(85,100);
curveVertex(75,150);
curveVertex(75,170);
curveVertex(85,185);
curveVertex(100,195);
curveVertex(150,190);
curveVertex(160,165);
curveVertex(125,145);
curveVertex(124,149);
curveVertex(100,160);
curveVertex(85,157);
curveVertex(75,145);
curveVertex(50,150);
endShape();

//nose
stroke(0,0,0);
ellipse(180,100,17,17);
ellipse(175,110,12,12);
strokeWeight(6);
beginShape();
curveVertex(180,50);
curveVertex(185,95);
curveVertex(173,112);
curveVertex(100,100);
endShape();

//arm
strokeWeight(13);
line(73,150,73,200);

//tongue
noStroke();
fill(152,48,29);
beginShape();
curveVertex(90,100);
curveVertex(86,135);
curveVertex(90,149);
curveVertex(96,154);
curveVertex(105,145);
curveVertex(50,100);
endShape();

stroke(0,0,0);
strokeWeight(2);
beginShape();
curveVertex(75,140);
curveVertex(87,135);
curveVertex(97,145);
curveVertex(85,160);
endShape();

//mickey mouse BL

smooth();
noFill();
stroke(0,0,0);
strokeWeight(2);


//snout
beginShape();
curveVertex(130,340);
curveVertex(145,310);
curveVertex(175,305);
curveVertex(180,330);
curveVertex(140,345);
curveVertex(110,340);
curveVertex(75,315);
curveVertex(50,280);
endShape();

beginShape();
curveVertex(75,350);
curveVertex(70,320);
curveVertex(82,312);
curveVertex(95,330);
endShape();

//jaw
beginShape();
curveVertex(145,310);
curveVertex(125,345);
curveVertex(100,360);
curveVertex(85,357);
curveVertex(77,340);
curveVertex(90,300);
endShape();

//pants
fill(188,46,21);
noStroke();
beginShape();
curveVertex(100,375);
curveVertex(90,400);
curveVertex(95,380);
curveVertex(160,365);
curveVertex(190,380);
curveVertex(195,400);
curveVertex(175,350);
endShape();
stroke(136,196,198);
strokeWeight(1);
ellipse(175,385,10,20);

fill(0,0,0);
stroke(0,0,0);
strokeWeight(2);

//mouth
beginShape();
curveVertex(145,290);
curveVertex(115,344);
curveVertex(95,355);
curveVertex(85,345);
curveVertex(85,325);
curveVertex(90,300);
endShape();

//head
beginShape();
curveVertex(140,375);
curveVertex(145,280);
curveVertex(100,245);
curveVertex(55,270);
curveVertex(50,315);
curveVertex(80,350);
curveVertex(55,320);
curveVertex(60,300);
curveVertex(75,295);
curveVertex(90,300);
curveVertex(90,300);
curveVertex(88,275);
curveVertex(98,257);
curveVertex(122,260);
curveVertex(132,275);
curveVertex(132,275);
curveVertex(133,265);
curveVertex(145,280);
curveVertex(160,375);
endShape();

//eyes
ellipse(143,292,7,35);
ellipse(130,296,10,35);

//ears
ellipse(25,275,55,65);
ellipse(80,225,70,55);

//body
beginShape();
curveVertex(85,300);
curveVertex(75,350);
curveVertex(75,370);
curveVertex(85,385);
curveVertex(100,395);
curveVertex(150,390);
curveVertex(160,365);
curveVertex(125,345);
curveVertex(124,349);
curveVertex(100,360);
curveVertex(85,357);
curveVertex(75,345);
curveVertex(50,350);
endShape();

//nose
stroke(0,0,0);
ellipse(180,300,17,17);
ellipse(175,310,12,12);
strokeWeight(6);
beginShape();
curveVertex(180,250);
curveVertex(185,295);
curveVertex(173,312);
curveVertex(100,300);
endShape();

//arm
strokeWeight(13);
line(73,350,73,400);

//tongue
noStroke();
fill(152,48,29);
beginShape();
curveVertex(90,300);
curveVertex(86,335);
curveVertex(90,349);
curveVertex(96,354);
curveVertex(105,345);
curveVertex(50,300);
endShape();

stroke(0,0,0);
strokeWeight(2);
beginShape();
curveVertex(75,340);
curveVertex(87,335);
curveVertex(97,345);
curveVertex(85,360);
endShape();

//mickey mouse BR

smooth();
noFill();
stroke(0,0,0);
strokeWeight(2);

//snout
beginShape();
curveVertex(330,340);
curveVertex(345,310);
curveVertex(375,305);
curveVertex(380,330);
curveVertex(340,345);
curveVertex(310,340);
curveVertex(275,315);
curveVertex(250,280);
endShape();

beginShape();
curveVertex(275,350);
curveVertex(270,320);
curveVertex(282,312);
curveVertex(295,330);
endShape();

//jaw
beginShape();
curveVertex(345,310);
curveVertex(325,345);
curveVertex(300,360);
curveVertex(285,357);
curveVertex(277,340);
curveVertex(290,300);
endShape();

//pants
fill(188,46,21);
noStroke();
beginShape();
curveVertex(300,375);
curveVertex(290,400);
curveVertex(295,380);
curveVertex(360,365);
curveVertex(390,380);
curveVertex(395,400);
curveVertex(375,350);
endShape();
stroke(136,196,198);
strokeWeight(1);
ellipse(375,385,10,20);

fill(0,0,0);
stroke(0,0,0);
strokeWeight(2);

//mouth
beginShape();
curveVertex(345,290);
curveVertex(315,344);
curveVertex(295,355);
curveVertex(285,345);
curveVertex(285,325);
curveVertex(290,300);
endShape();

//head
beginShape();
curveVertex(340,375);
curveVertex(345,280);
curveVertex(300,245);
curveVertex(255,270);
curveVertex(250,315);
curveVertex(280,350);
curveVertex(255,320);
curveVertex(260,300);
curveVertex(275,295);
curveVertex(290,300);
curveVertex(290,300);
curveVertex(288,275);
curveVertex(298,257);
curveVertex(322,260);
curveVertex(332,275);
curveVertex(332,275);
curveVertex(333,265);
curveVertex(345,280);
curveVertex(360,375);
endShape();

//eyes
ellipse(343,292,7,35);
ellipse(330,296,10,35);

//ears
ellipse(225,275,55,65);
ellipse(280,225,70,55);

//body
beginShape();
curveVertex(285,300);
curveVertex(275,350);
curveVertex(275,370);
curveVertex(285,385);
curveVertex(300,395);
curveVertex(350,390);
curveVertex(360,365);
curveVertex(325,345);
curveVertex(324,349);
curveVertex(300,360);
curveVertex(285,357);
curveVertex(275,345);
curveVertex(250,350);
endShape();

//nose
stroke(0,0,0);
ellipse(380,300,17,17);
ellipse(375,310,12,12);
strokeWeight(6);
beginShape();
curveVertex(380,250);
curveVertex(385,295);
curveVertex(373,312);
curveVertex(300,300);
endShape();

//arm
strokeWeight(13);
line(273,350,273,400);

//tongue
noStroke();
fill(152,48,29);
beginShape();
curveVertex(290,300);
curveVertex(286,335);
curveVertex(290,349);
curveVertex(296,354);
curveVertex(305,345);
curveVertex(250,300);
endShape();

stroke(0,0,0);
strokeWeight(2);
beginShape();
curveVertex(275,340);
curveVertex(287,335);
curveVertex(297,345);
curveVertex(285,360);
endShape();







