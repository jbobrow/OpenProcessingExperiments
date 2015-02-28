
color beige=color(245,240,198);
color carpet=color(245,72,112);

size(500,500);
background(255,255,255);
noStroke();
fill (beige);

/*Background*/
for (int i = 0; i <width; i=i+7) {
  for (int j=0;j<height;j=j+7) {
    ellipse(i, j, 5,5);
  }
}

/*Carpet*/
    for (int u=0;u<width;u=u+7) {
      for (int v=325;v<375;v=v+7) {
   fill(carpet);
    ellipse(u, v, 5,5);
      }
}

for (int u=0;u<width;u=u+7) {
      for (int v=325;v<330;v=v+7) {
   fill(152,237,26);
    ellipse(u, v, 5,5);
      }
}

/*Mademoiselle Chatte*/
fill(0,0,0);
noStroke();
quad(100,400,95,335,110,325,117,330);
beginShape();
vertex(98,400);
vertex(88,407);
vertex(78,355);
vertex(91,310);
endShape();
triangle(100,400,80,415,115,417);
triangle(95,333,110,322,93,310);
quad(86,407,81,412,68,355,68,310);
triangle(66,355,66,310,46,285);
triangle(44,285,20,290,48,295);
triangle(112,323,80,296,105,283);
quad(79,294,70,289,62,299,70,300);
quad(70,302,79,296,78,302,70,307);
triangle(95,287,95,271,115,278);
triangle(117,281,107,289,108,283);
triangle(89,286,89,291,84,288);
beginShape();
vertex(81,261);
vertex(81,275);
vertex(92,290);
vertex(94,270);
endShape();
triangle(79,275,79,260,62,280);
triangle(79,258,67,245,69,269);
triangle(60,281,69,269,50,265);
beginShape();
vertex(78,276);
vertex(66,280);
vertex(66,285);
vertex(84,293);
vertex(83,280);
endShape();


translate(-15, 15);
/*Monsieur Chat*/
beginShape();
vertex(135,270);
vertex(140,255);
vertex(155,250);
vertex(155,292);
vertex(145,290);
endShape();
beginShape(TRIANGLE_FAN);
vertex(157,292);
vertex(157,250);
vertex(167,290);
vertex(177,270);
vertex(172,255);
endShape();
triangle(157,250,172,255,165,230);
triangle(140,253,155,248,148,230);
triangle(168,340,152,293,168,291);
quad(169,340,169,290,175,275,190,295);
triangle(169,342,184,311,184,365);
quad(170,382,169,344,184,367,175,387);
quad(170,383,175,388,175,395,165,395);
beginShape();
vertex(185,310);
vertex(185,395);
vertex(190,400);
vertex(205,338);
vertex(190,297);
endShape();

beginShape();
vertex(191,295);
vertex(225,310);
vertex(225,345);
vertex(218,375);
vertex(200,370);
vertex(207,338);
endShape();

beginShape();
vertex(227,310);
vertex(250,330);
vertex(260,363);
vertex(220,375);
vertex(227,345);
endShape();

beginShape();
vertex(220,378);
vertex(260,365);
vertex(260,392);
vertex(220,392);
endShape();
triangle(218,378,218,392,203,392);
triangle(201,392,218,377,200,372);




