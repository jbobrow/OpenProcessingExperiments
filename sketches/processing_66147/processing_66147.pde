
//setup
size(450, 400);
background(250, 245, 226);
strokeWeight(1);
smooth();

//color_variables
int r;
int g;
int b;

  r = 245;
  g = 101;
  b = 69;

//part1
noStroke();
fill(r, g, b);
ellipse(0, 2, 8, 10);

//line+balls1
stroke(0);
strokeWeight(1);

fill(0);
  arc(26, 15, 10, 10, 3 * PI / 4, 7 * PI / 4);
  arc(5, 45, 25, 25, -PI / 4, 3 * PI/4);
  ellipse(0, 83, 4, 13);
  
  
fill(r, g, b);
  arc(26, 15, 10, 10, -PI / 4, 3 * PI/4);
  arc(5, 45, 25, 25, 3 * PI / 4, 7 * PI / 4);
noStroke();
  ellipse(0, 127, 4, 10);

stroke(0);
strokeWeight(2);
  line(40, 0, 26, 15);
  line(26, 15, 13, 37);

//line+balls2
fill(0);
  arc(91, 55, 27, 30, -PI / 4, 3 * PI / 4);
  arc(85, 125, 19, 25, 3 * PI / 4, 7 * PI / 4);
  arc(80, 195, 27, 20, -PI / 4, 3 * PI / 4);
  arc(110, 230, 13, 15, 3 * PI / 4, 7 * PI / 4);
  arc(155, 190, 50, 40, -PI / 4, 3 * PI / 4);
  arc(170, 125, 25, 20, 3 * PI / 4, 7 * PI / 4);
  //leaves
  arc (55, 272, 35, 65, -PI / 4, 3 * PI / 4);
  //?// arc (97, 296, 90, 85, 3 * PI / 4, 7 * PI / 4);

fill(r, g, b);
  arc(91, 55, 27, 30, 3 * PI / 4, 7 * PI / 4);
  arc(85, 125, 19, 25, -PI / 4, 3 * PI / 4);
  arc(80, 195, 27, 20, 3 * PI / 4, 7 * PI / 4);
  arc(110, 230, 13, 15, -PI / 4, 3 * PI / 4);
  arc(155, 190, 50, 40, 3 * PI / 4, 7 * PI / 4);
  arc(170, 125, 25, 20, -PI / 4, 3 * PI / 4);
  

strokeWeight(2);
  line(105, 0, 91, 41);
  line(89, 71, 85, 115);
  line(85, 137, 80, 185);
  line(80, 207, 68, 250);
  line(68, 250, 106, 230);
  line(116, 233, 130, 265);
  line(130, 265, 155, 210);
  line(160, 170, 170, 136);
  line(170, 116, 170, 45);
  
//barbell1
fill(0);
  ellipse(135, 3, 17, 20);
  ellipse(135, 45, 22, 15);
strokeWeight(2);
  line(135, 12, 135, 45);

//topSwirl
fill(0);
  arc(280, 12, 50, 50, 3 * PI / 4, 7 * PI / 4);
  arc(265, 60, 20, 15, 3 * PI / 4, 7 * PI / 4);
  arc(280, 190, 30, 25, 3 * PI / 4, 7 * PI / 4);
  ellipse(335, 125, 33, 30);

fill(r, g, b);
  arc(280, 12, 50, 50, -PI / 4, 3 * PI / 4);
  arc(265, 60, 20, 15, -PI / 3, 3 * PI / 4);
  arc(280, 190, 30, 25, -PI / 3, 3 * PI / 4);
  //?// add swirl line

//bottomSwirl
fill(0);
  arc(310, 320, 25, 30, 3 * PI / 4, 7 * PI / 4);
  ellipse(250, 295, 22, 25);

fill(r, g, b);
  arc(310, 320, 25, 30, -PI / 3, 3 * PI / 4);
  //?// add swirl line

//barbells2
fill(0);
  ellipse(420, 120, 20, 20);
  ellipse(420, 160, 18, 18);
  ellipse(285, 225, 18, 20);
  ellipse(315, 230, 12, 14);
  ellipse(405, 260, 15, 17);
  ellipse(410, 290, 20, 15);
  ellipse(405, 5, 10, 8);
  ellipse(370, 7, 20, 20);
  
strokeWeight(2);
  line(420, 120, 420, 160);
  line(285, 225, 315, 230);
  line(405, 260, 410, 290);
  line(368, 7, 350, 0);

//stars
  line(187, 215, 180, 265);
  line(162, 235, 212, 243);
  line(170, 220, 205, 265);
  line(198, 220, 165, 255);
  
  line(340, 210, 425, 210);
  line(380, 180, 380, 250);
  line(350, 190, 410, 230);
  line(405, 180, 355, 240);

//bluetriangle
fill(101, 111, 170);
stroke(0);
strokeWeight(1);
triangle(385, 400, 410, 400, 425, 360);

//yellowBug
stroke(0);
strokeWeight(10);
fill(252, 242, 35);
triangle(0, 310, 0, 375, 55, 366);
//?// add curvey legs

