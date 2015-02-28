
void setup() {
  size (600, 600);
  background(255);
  smooth();
  strokeWeight(8);

  curve(900, 1200, 0, 350, 2300, 500, 8000, 1000);
  line(300, 0, 320, 310);
  
  //top left filler
beginShape();
fill(252, 66, 69);
vertex(300, 0);
vertex(0, 0);
vertex(0, 180);
vertex(305, 110);
endShape();

  //top left spine
  beginShape();
  fill(34, 60, 198);
  vertex(280, 115);
  vertex(260, 40);
  vertex(200, 80);
  vertex(170, 42);
  vertex(0, 180);
  vertex(0, 220);
  vertex(320, 150);
  endShape(); 
  //left middle box  
  beginShape();
  fill(75, 87, 149);
  vertex(305, 110);
  vertex(160, 155);
  vertex(210, 310);
  vertex(320, 310);
  endShape();
  //left medium box
  beginShape();
  fill(94, 239, 92);
  vertex(163, 170);
  vertex(0, 220);
  vertex(0, 345);
  vertex(205, 310);
  endShape();
  //left triangle
  beginShape();
  fill(36, 198, 34);
  vertex(0, 0);
  vertex(70, 120);
  vertex(0, 180);
  endShape();
  //left bottom triangle
  beginShape();
  fill(255, 72, 0);
  vertex(100, 325);
  vertex(60, 160);
  vertex(0, 220);
  vertex(0, 345);
  endShape();
  //little left box
  beginShape();
  fill(247, 67, 137);
  vertex(168, 180);
  vertex(145, 188);
  vertex(155, 220);
  vertex(175, 212);
  endShape();
  //leftR middle box
    beginShape();
  fill(41, 255, 75);
  vertex(168, 180);
  vertex(190, 173);
  vertex(203, 205);
  vertex(175, 212);
  endShape();
  //right background shape
  beginShape();
  fill(9, 30, 234);
  vertex(300, 0);
  vertex(600, 0);
  vertex(600, 328);
  vertex(320, 310);
  endShape();
  //right side box
  beginShape();
  fill(234, 121, 0);
  vertex(310, 150);
  vertex(390, 50);
  vertex(600, 180);
  vertex(600, 320);
  vertex(320, 310);
  endShape();
    //right middle box  
  beginShape();
  fill(191, 51, 2);
  vertex(308, 130);
  vertex(430, 145);
  vertex(410, 315);
  vertex(320, 310);
  endShape();
  //middle left mini
  beginShape();
  fill(43, 175, 0);
  vertex(308, 170);
  vertex(286, 171);
  vertex(288, 210);
  vertex(309, 210);
  endShape();
  //middle mini right
    beginShape();
    fill(72, 255, 238);
  vertex(308, 170);
  vertex(345, 171);
  vertex(346, 210);
  vertex(310, 210);
  endShape();
  //right mini left
  beginShape();
  fill(211, 113, 234);
  vertex(415, 230);
  vertex(402, 229);
  vertex(398, 260);
  vertex(397, 268);
  vertex(410, 268);
  endShape();
  //right mini right
    beginShape();
  fill(152, 250, 131);
  vertex(423, 230);
  vertex(450, 234);
  vertex(446, 265);
 vertex(420, 268);
  endShape();
  //right circle
  noFill();
  ellipse(450, 130, 120, 118);
  //right bottom box
  beginShape();
  fill(252, 255, 77);
  vertex(600, 290);
  vertex(560, 292);
  vertex(557, 320);
  vertex(600, 320);
 endShape();
 //left bottom blue
 beginShape();
 fill(77, 176, 255);
 vertex(100, 333);
 vertex(160, 480);
 vertex(130, 600);
 vertex(0, 600);
 vertex(0, 351);
 endShape();
 //bottom orange
 beginShape();
 fill(245, 139, 0);
 vertex(103, 333);
 vertex(163, 480);
 vertex(260, 472);
 vertex(254, 430);
 vertex(230, 430);
 vertex(270, 315);
 vertex(200, 313);
 endShape(CLOSE);
  //bottom green
 beginShape();
 fill(209, 82, 201);
 vertex(270, 315);
 vertex(600, 328);
 vertex(600, 600);
 vertex(280, 600);
 endShape();
 //green bottom
 beginShape();
 fill(254, 255, 72);
 vertex(163, 483);
 vertex(260, 475);
 vertex(265, 519);
 vertex(230, 520);
 vertex(245, 600);
vertex(133, 600); 
 endShape(); 
 //pink bottom
 beginShape();
 fill(219, 73, 83);
 vertex(265, 522);
 vertex(232, 523);
 vertex(247, 600);
 vertex(310, 600);
 endShape(CLOSE);
 //blue bottom middle
 beginShape();
 fill(44, 136, 227);
 vertex(267, 522);
 vertex(315, 520);
 vertex(360, 312);
 vertex(270, 315);
vertex(230, 429);
 vertex(255, 430);
 endShape(CLOSE);
  //bottom green
 beginShape();
fill(82, 252, 123);
 vertex(331, 450);
 vertex(355, 320);
 vertex(600, 335);
vertex(600, 420);
vertex(540, 440);
vertex(450, 490);
endShape();
 //mini orange
 beginShape();
 fill(255, 229, 23);
 vertex(267, 525);
 vertex(310, 600);
 vertex(340, 600);
 vertex(380, 525);
 endShape(CLOSE);
 //bottom box
 beginShape();
 fill(214, 15, 28);
 vertex(319, 520);
 vertex(331, 450);
 vertex(450, 450);
 vertex(450, 520);
 endShape(CLOSE);
 //right pink
 beginShape();
 fill(255, 131, 160);
 vertex(557, 332);

 vertex(554, 340);
 vertex(600, 355);
  vertex(600, 340);
 endShape();

 //left circle
 fill(250, 96, 240);
 ellipse(0, 400, 150, 170);

 
 
 
 




//middle reinforcer lines
line(177, 212, 168, 180);
  line(300, 0, 320, 310);
}


