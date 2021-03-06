
void setup(){
  size(315,450,P2D);
  background(254,235,141);
  smooth();
}

void draw(){
  background(254,235,141);
  smooth();

//Große Dreiecke mit Farbverläufen

  beginShape();
  fill(29,9,10);
  vertex(174,111);
  fill(107,46,54);
  vertex(217,100);
  fill(10,39,73);
  vertex(189,229);
  endShape();
  
  beginShape();
  fill(27,17,5);
  vertex(183,83);
  fill(114,67,0);
  vertex(202,84);
  fill(210,141,0);
  vertex(197,111);
  endShape();
  
  stroke(223,130,60);
  
  beginShape();
  fill(41,7,6);
  vertex(22,80);
  fill(194,22,22);
  vertex(106,77);
  fill(249,169,0);
  vertex(94,320);
  endShape();
  
  stroke(27,29,8);
  
  beginShape();
  fill(185,152,83);
  vertex(51,48);
  fill(33,66,71);
  vertex(84,51);
  fill(13,22,39);
  vertex(64,123);
  endShape();
  
  fill(254,235,141);
  quad(22,105,60,105,56,75,17,75);
//Linien unten
   stroke(161,93,20); 
   line(18,381,128,407);
   
   stroke(161,93,20); 
   line(18,379,128,405);
   
   stroke(161,93,20); 
   line(18,377,128,403);
   
//zwei Linen von unten
   stroke(96,30,8); 
   line(55,326,114,377);
   
   stroke(96,30,8);
   line(59,326,116,375);
   
   stroke(176,117,23);
   line(102,326,143,351);
   
   stroke(176,117,23);
   line(105,326,144,349);
   
//Linien mitte links
   stroke(164,146,62);
   line(39,238,144,270);
   
   stroke(164,146,62);
   line(37,233,147,250);
   
   stroke(164,146,62);
   line(36,228,143,228);
   
   stroke(164,146,62);
   line(34,225,147,211);
   
   stroke(164,146,62);
   line(33,223,142,197);
   
   stroke(223,157,71);
   line(41,236,139,260);
   
   stroke(223,157,71);
   line(42,231,143,241);
   
   stroke(223,157,71);
   line(41,225,147,219);
   
   stroke(223,157,71);
   line(40,222,143,201);
   
//Linien mitte, rechst
   stroke(153,121,46);
   line(251,273,234,295);
   
   line(253,274,236,296);
   
   line(255,275,238,297);
   
   line(257,276,240,299);
   
   stroke(210,118,55);
   line(237,273,257,291);
   
   line(235,275,256,294);
   
   line(234,277,254,295);
   
   stroke(210,118,55);
   line(233,279,253,297);
   
   line(231,280,252,299);
   
   fill(38,46,9,220);
   noStroke();
   quad(0,404,117,326,125,326,0,408);

//senkrechtes Viereck
  fill(177,114,17);
  quad(27,247,32,243,32,320,27,320);

  fill(113,77,17);
  triangle(255,174,253,163,264,165); 
 
  fill(186,99,6);
  stroke(93,44,32);
  triangle(263,167,262,155,274,156);
  
  fill(145,88,17);
  noStroke();
  triangle(246,183,243,172,257,172);
  
  fill(93,44,32);
  triangle(236,192,233,183,246,183);
  
  fill(65,44,13);
  triangle(222,192,236,192,224,204);
  
  fill(36,11,0);
  triangle(26,450,166,304,45,450);
  
  fill(25,17,15);
  triangle(156,268,284,146,287,166);
  
//Dreieck, oben, links
  fill(96,50,1);
  triangle(22,0,61,0,172,64);
  
  //Dreiecke auf roten Vierecken
  fill(219,40,46);
  triangle(288,273,296,273,293,292);
  
  fill(135,60,55);
  triangle(300,282,305,282,302,292);
  
  fill(199,128,12);
  triangle(260,295,266,295,264,310);
  
  fill(254,170,12);
  triangle(183,365,190,361,186,386);
  
  fill(202,105,0);
  triangle(172,372,177,386,167,386);
  
  fill(35,65,75);
  triangle(156,368,163,370,159,386);
  
//rotes kleines Dreieck mittig
  fill(208,58,25);
  triangle(192,83,211,50,219,59);
  
  //rote Vierecke, unten, rechts
  fill(241,110,20);
  quad(278,292,315,292,315,450,278,450);
 
  fill(196,69,28,220);
  quad(149,386,315,386,315,450,149,450);
  
  fill(214,26,25);
  quad(200,352,315,352,315,450,200,450);
  
  fill(214,26,25,220);
  quad(234,310,315,310,315,450,234,450);
  
  fill(186,21,20);
  quad(200,386,234,386,234,450,200,450);
  
  fill(159,21,22);
  quad(234,386,315,386,315,450,234,450);
  
  fill(198,22,22);
  quad(234,352,315,352,315,386,234,386);
  
  

//dicker brauner Balken unten
  fill(43,19,7);
  quad(0,319,265,319,265,326,0,326);
  
// rote Viereck, mitte
  fill(190,15,30);
  quad(178,227,199,219,196,247,187,245);
  
  // schwarzes Rechteck unten, rechts
  fill(39,9,9);
  quad(254,416,302,416,302,450,254,450);
  
  //drei blaue Vierecke oben, rechts
  fill(100,118,122);
  quad(0,196,17,196,17,202,0,202);
  
  fill(55,82,99);
  quad(0,176,17,176,17,183,0,183);
  
  fill(19,61,101);
  quad(0,155,17,155,17,162,0,162);

//klein Vierecke
  fill(22,67,86);
  quad(135,281,142,283,141,288,135,287);

  fill(188,109,32);
  stroke(114,16,13);
  quad(184,240,198,227,197,235,186,244);
  
  fill(100,77,25);
  noStroke();
  quad(143,305,147,307,147,311,143,310);  
  
  fill(22,69,95);
  noStroke();
  quad(213,309,218,309,217,313,214,313); 
  
  fill(245,118,3);
  quad(71,304,76,306,72,310,68,308);
  
  fill(61,35,18);
  triangle(244,304,247,310,243,310);
  
//kreise
  fill(3,55,94);
  ellipse(247,156,22,22);
  
  fill(227,72,44);
  noStroke();
  ellipse(286,228,20,20);

//kleiner runder Kreis, rot, links,
   fill(227,72,44);
   noStroke();
   ellipse(118,299,6,6);
  
  fill(169,119,58);
  stroke(71,32,0);
  ellipse(188,289,36,36);
   
// Linien an kleinen Dreiecken, unten   
   stroke(133,77,0);
   line(155,362,159,386);
   
   line(165,363,159,385);
   
   line(146,364,170,369);
   
   line(182,357,186,385);
   
   line(191,354,186,386);
   
   line(177,364,196,358);

   line(176,363,196,356);
   
   stroke(88,94,46);
   line(155,135,235,121);
   
// Linen oben, rechts   
   stroke(123,78,19);
   line(34,47,101,53);
   
   line(34,45,101,51);
   
   line(35,42,101,49);
   
   stroke(140,137,58);
   line(34,46,101,52);
   
   line(34,44,101,51);
   
   stroke(163,143,93);
   line(9,255,52,280);
   
   line(9,256,51,281);
   
   line(10,255,52,280);
   
   line(9,257,51,283);
   
   stroke(62,77,96);
   line(12,288,46,308);
   
   line(13,287,47,307);
   
   stroke(148,127,106);
   line(12,290,45,309);
   
// rote Linien
   stroke(222,116,64);
   line(11,263,19,254);
   
   line(17,266,19,254);
   
   line(34,275,40,269);
   
   line(40,269,39,281);
   
   line(39,281,47,273);
   
   line(47,273,46,285);
   
   line(13,295,23,286);
   
   line(21,301,23,286);
   
   line(33,305,40,300);
   
   line(37,309,40,299);
   
   line(209,139,232,152);
   
   line(232,152,207,149);
   
   line(205,159,228,169);
   
   line(228,169,203,168);
   
// alle Kurven
   noFill();
   stroke(129,106,26);
   arc(102,135,40,40,-PI/2, PI/2);
   
   stroke(241,159,86);
   arc(102,135,44,44,-PI/2, PI/2);
   
   stroke(241,159,86);
   arc(102,135,36,36,-PI/2, PI/2);
   
   fill(247,197,98);
   stroke(129,89,0);
   arc(219,352,25,25, -PI,0);
   
// große Ellipse oben, rechts   
   fill(203,144,68);
   ellipse(305,-14,104,104);
   
   noFill();
   ellipse(305,-14,105,105);
   
   ellipse(305,-14,108,108);
   
   ellipse(305,-14,111,111);
   
   ellipse(305,-14,114,114);
 
   ellipse(305,-14,117,117);
   
   ellipse(305,-14,122,122);
   
   ellipse(305,-14,128,128);
   
   fill(255,229,139);
   noStroke();
   quad(179,274,191,273,197,304,184,306);
   
   quad(172,285,203,280,205,294,174,298);
   
   stroke(185,84,38);
   line(178,266,185,313);
   
   line(183,264,191,312);
   
   line(190,264,197,310);
   
   line(164,285,211,279);
   
   line(165,292,212,285);
   
   line(166,298,212,292);
   
}

