
float gaga;
float gaga1;
float ballon;
int cor;
void setup() {
  size(562, 400);
  smooth ();
}

void draw() {
  background(204, 255, 249);
  gaga=gaga+1;
  gaga1=gaga1+0.5;
  ballon=ballon+0.2;
  //sol 
  noStroke();
  fill(255, 206, 0);
  ellipse(50, 50, 60, 60);
  //rio
  fill(190, 252, 229);
  rect(369, 266, 193, 193);  

  //montanha verde escura
  fill(0, 200, 80);
  ellipse(300, 457, 777, 574);
  //rio
  fill(151, 255, 253);
  ellipse(495, 352, 311, 168);
  //montanha verde clara
  fill(174, 245, 154);
  ellipse(80, 468, 770, 574);
  //nuvem 7

  fill(255);
  ellipse (117+gaga1, 30, 20, 15);
  ellipse(132+gaga1, 21, 25, 15);
  ellipse(131+gaga1, 31, 20, 15);
  ellipse(147+gaga1, 30, 20, 15); 

  //nuvem 8

  fill(255);
  ellipse (146+gaga1, 87, 20, 15);
  ellipse(161+gaga1, 78, 25, 15);
  ellipse(160+gaga1, 88, 20, 15);
  ellipse(176+gaga1, 87, 20, 15); 
  //nuvem 3

  fill(255);
  ellipse (-293+gaga, 68, 20, 15);
  ellipse(-278+gaga, 59, 25, 15);
  ellipse(-279+gaga, 69, 20, 15);
  ellipse(-263+gaga, 68, 20, 15);
  //nuvem 4

  fill(255);
  ellipse (-223+gaga, 86, 20, 15);
  ellipse(-208+gaga, 77, 25, 15);
  ellipse(-209+gaga, 87, 20, 15);
  ellipse(-193+gaga, 86, 20, 15);  
  //balao

  fill(254, 0, 0);
  beginShape();
  curveVertex(169+ballon, 18);
  curveVertex(169+ballon, 18);
  curveVertex(193+ballon, 26);
  curveVertex(205+ballon, 50);
  curveVertex(193+ballon, 82);
  curveVertex(178+ballon, 109);
  curveVertex(174+ballon, 112);
  curveVertex(174+ballon, 125);
  curveVertex(163+ballon, 125);
  curveVertex(163+ballon, 112);
  curveVertex(158+ballon, 109);
  curveVertex(146+ballon, 82);
  curveVertex(134+ballon, 50);
  curveVertex(144+ballon, 26);
  curveVertex(169+ballon, 18);  
  curveVertex(169+ballon, 18);

  endShape();

  //nuvem 1
  fill(255, 255, 255);
  ellipse (230+gaga1, 70, 20, 15);
  ellipse(245+gaga1, 60, 30, 15);
  ellipse(243+gaga1, 70, 20, 15);
  ellipse(259+gaga1, 69, 20, 15);

  //nuvem 2

  fill(255);
  ellipse (300+gaga1, 86, 20, 15);
  ellipse(314+gaga1, 77, 25, 15);
  ellipse(313+gaga1, 87, 20, 15);
  ellipse(329+gaga1, 86, 20, 15);



  //nuvem 5

    fill(255);
  ellipse (-166+gaga, 55, 20, 15);
  ellipse(-151+gaga, 46, 25, 15);
  ellipse(-152+gaga, 56, 20, 15);
  ellipse(-136+gaga, 55, 20, 15);  
  //nuvem 6

  fill(255);
  ellipse (-92+gaga, 26, 20, 15);
  ellipse(-77+gaga, 17, 25, 15);
  ellipse(-78+gaga, 27, 20, 15);
  ellipse(-62+gaga, 26, 20, 15);  

  //nuvem 9

  fill(255);
  ellipse (-15+gaga, 112, 20, 15);
  ellipse(-0+gaga, 103, 25, 15);
  ellipse(-1+gaga, 113, 20, 15);
  ellipse(14+gaga, 113, 20, 15);

  //nuvem 10

  fill(255);
  ellipse (389+gaga1, 78, 20, 15);
  ellipse(404+gaga1, 69, 25, 15);
  ellipse(403+gaga1, 79, 20, 15);
  ellipse(419+gaga1, 78, 20, 15);

  //arvore 1
  fill(221, 255, 159);
  rect(221, 256, 11, 30);
  ellipse(213, 251, 35, 35);
  ellipse(241, 251, 35, 35);
  ellipse(226, 228, 35, 35);

  //arvore 2
  fill(129, 125, 72);
  rect(201, 302, 7, 19);
  ellipse(195, 298, 23, 23);
  ellipse(204, 283, 23, 23);
  ellipse(213, 298, 23, 23);
  //arvore 2
  fill(#007e1a);
  rect(244, 342, 6, 16);
  ellipse(239, 339, 19, 19);
  ellipse(254, 339, 19, 19);
  ellipse(246, 327, 19, 19);

  //arvore 4
  fill(221, 255, 159);
  rect(140, 354, 11, 30);
  ellipse(145, 326, 35, 35);
  ellipse(132, 349, 35, 35);
  ellipse(160, 349, 35, 35);

  //arvore 5
  fill(129, 125, 72);
  rect(76, 323, 7, 19);
  ellipse(70, 319, 23, 23);
  ellipse(88, 319, 23, 23);
  ellipse(79, 304, 23, 23);
  //arvore 6
  fill(#007e1a);
  rect(44, 344, 6, 16);
  ellipse(46, 329, 19, 19);
  ellipse(39, 341, 19, 19);
  ellipse(54, 341, 19, 19);
  //arvore 7
  fill(129, 125, 72);
  rect(55, 222, 11, 30);
  ellipse(47, 217, 35, 35);
  ellipse(75, 217, 35, 35);
  ellipse(60, 194, 35, 35);

  //arvore 8
  fill(221, 255, 159);
  rect(110, 236, 7, 19);
  ellipse(113, 217, 23, 23);
  ellipse(104, 232, 23, 23);
  ellipse(122, 232, 23, 23);

  //barco
  fill(38, 157, 187);
  stroke(255, 165, 21);
  strokeWeight(2);
  line(463+ballon, 332, 463+ballon, 354);
  noStroke();

  quad(446+ballon, 356, 503+ballon, 356, 489+ballon, 370, 461+ballon, 370);
  triangle(467+ballon, 333, 485+ballon, 343, 467+ballon, 353);

  //reflecção barco   
  fill(0, 0, 0, 20);
  stroke(255, 165, 21, 60);
  strokeWeight(2);
  line(464+ballon, 383, 464+ballon, 505);
  noStroke();
  fill(38, 157, 187, 60);
  quad(462+ballon, 370, 491+ballon, 370, 505+ballon, 383, 447+ballon, 383);
  triangle(463+ballon, 383, 486+ballon, 393, 468+ballon, 403);

  if (gaga==900)
    gaga=-500;
  if (gaga1==900)
    gaga1=-400;
}
