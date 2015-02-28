
size (270, 390, P2D);
background (230, 213, 99);
smooth();

//kreis oben rechts
fill(234,145,71);
stroke(155,89,34);
ellipse(270, 0, 100,100);
noFill();
smooth();
ellipse(270,0,104,104);
ellipse(270,0,106,106);
ellipse(270,0,107,107);
ellipse(270,0,108,108);
ellipse(270,0,111,111);
ellipse(270,0,114,114);
ellipse(270,0,118,118);
ellipse(270,0,125,125);

//rote Rechtecke unten rechts
noStroke();
  fill (214, 26, 25);
rect (135, 340, 135, 50);
  fill (214, 26, 25);
rect (170, 310, 100, 80);
  fill (214, 26, 25, 220);
rect (200, 270, 90, 120);
  fill (214, 26, 25, 220);
rect (240, 255, 30, 135);
   fill (170, 49, 49, 220);
rect (170, 340, 100, 50);
   fill (185, 49,49, 220);
rect (200, 310, 70, 80);
   fill (124, 31, 31, 220);
rect (200, 340, 70, 50);

//schwarzes Rechteck unten
  fill (3, 0, 0);
rect (220, 360, 43, 30);

//Dreieck schwarz langes
triangle(150, 240, 240, 135, 245, 150); 

//kleine dreiecke
beginShape();
vertex(232,146);
vertex(226,143);
vertex(221,142);
vertex(223,157);
vertex(210,155);    
vertex(211,170);
vertex(200,170);
vertex(200,183);
vertex(189,180);
vertex(191,192);
endShape();

fill(0);
//schwarzes dreieck mitte
  triangle(200, 94, 150, 103, 170, 220);
//kleines drüber
  triangle(160, 75, 176, 107, 180, 76);
//kleines roter drüber
  fill(240,60,60);
  triangle(170, 75, 185, 50, 194, 56);

//links oben dreieck
fill(124, 63, 35);
triangle(5, 0, 40, 0, 145, 60);

//linien unten rot
stroke(149, 48, 48);
line(13, 324, 118, 353);
line(14, 326, 119, 355);
line(16, 328, 121, 357);

//linien mitte rot
strokeWeight(2);
line(50, 285, 109, 329);
line(52, 283, 111, 326);

strokeWeight(1);
line(97, 285, 128, 305);
line(98, 283, 130, 304);

//schienen
noStroke();
fill(3,0,0);
triangle(20, 390, 37, 390, 160, 265);
quad(0, 340, 0, 345, 130, 280, 122, 280);

// rote Viereck, mitte beim kleinen dreieck
fill(190,15,30);
quad(160,212,179,201,179,224,170,223);
  
//drei blaue Vierecke links
  fill(8,26,77);
quad(0,186,12,186,12,192,0,192);
  fill(10,26,77);
quad(0,166,12,166,12,173,0,173);
  fill(8,26,77);
quad(0,145,12,145,12,152,0,152);
  
//kreise
  fill(8,10,44);
  ellipse(210,143,22,22);
   
  fill(227,72,44);
  noStroke();
  ellipse(239,213,18,18);

//großes dreieck
noStroke();
stroke(162, 20,20);

beginShape();
fill(130,5,15);        
vertex(90, 285);
vertex(107,65);

vertex(70, 65);
vertex(65, 93);

fill(240,175,50); 
vertex(30, 93);
endShape();

//kleines dreieck auf großem
noStroke();
fill(0);
triangle(66,105, 80,43, 47,40);

//linien über großen dreieck
smooth();
stroke(0);
strokeWeight(0.7);
beginShape (LINES);
vertex (32,195);
vertex (134,176);
vertex (33,199);
vertex (138,187);

vertex (34,203);
vertex (140,198);
vertex (35, 207);
vertex (144,212);
vertex (35.5,211);
vertex (142,225);

stroke(240, 51,51);

vertex (37,197);
vertex (135, 179);
vertex (37.5,201);
vertex (139,193);

vertex (37.5, 205);
vertex (142,203);
endShape();

//mast unten links
noStroke();
fill(108,77,39);
beginShape();
vertex(22,287);
vertex(27,287);
vertex(27,225);
vertex(22,230);
endShape();

stroke(1);
fill(4,34,85);
beginShape (LINES);
vertex(5,235);
vertex(40,255);
vertex(5,233);
vertex(41, 253);

strokeWeight(1.2);
vertex(8,255);
vertex(38,275);
vertex(8,253);
vertex(39,273);

//rote striche
strokeWeight(0.5);
stroke(1);
vertex(8,240);
vertex(14,231);
vertex(14,231);
vertex(15,242);

vertex(29,254);
vertex(31,250);
vertex(31,250);
vertex(32,250);
vertex(32,255);
vertex(36,246);
endShape();

//dicker brauner Balken unten
  fill(43,19,7);
  quad(0, 287, 225, 287, 225, 280, 0, 280);

strokeWeight(0.9);
line(135,135, 210, 116);

//Kurven am großen dreieck
   noFill();
   stroke(0);
   arc(100,132,38,38,-PI/2, PI/2);
    
   stroke(241,59,86);
   arc(100,132,42,42,-PI/2, PI/2);
    
   stroke(241,59,86);
   arc(100,132,34,34,-PI/2, PI/2);

//halbkreis unten
   fill(247,197,98);
   stroke(0);
   arc(188,310,22,22, -PI,0);
   
//drei driecke unten mitte
fill(0);
triangle(145,342, 148,324, 140,322);
fill(234,191,80);
triangle(165,342, 168,320, 160,318);
fill(214, 26, 25);
triangle(153,342, 155,329, 160,342);

fill(0);
triangle(210,270, 212,264, 215,270);

fill(0);
triangle(223,257, 228,257, 225,270);

fill(0);
triangle(247,267, 253,250, 253,252);

beginShape(LINES);
vertex(35,40);
vertex(90,45);
vertex(36,38);
vertex(90,43);
stroke(232,67,21);
vertex(37,36);
vertex(90,40);
endShape();

