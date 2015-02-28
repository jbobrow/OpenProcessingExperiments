
void setup() {
  background(#181818);
  size(1080, 720);
  noLoop();
  smooth();
}

void draw() {
  translate(-425,-100);
  drawAbberation();
  translate(300, 65);
  scale(.75);
  drawAbberation();
  scale(.55);
  translate(750, 405);
  drawAbberation();
  scale(.7);
  translate(500, 150);
  drawAbberation();
  translate(-750, -490);
  drawBow();
  translate(950, 495);
  scale(.6);
  drawBow();
}

void mousePressed(){
  println("(" + mouseX + ", " + mouseY + ")");
}

void drawAbberation() {
  color flesh = color(185, 140, 75);
  fill(flesh);
  stroke(#000000);
  
  //draw tail
  int deltaX = 90;
  int deltaY = 100;
  beginShape();
  curveVertex(465+deltaX, 416+deltaY);
  curveVertex(478+deltaX, 446+deltaY);
  curveVertex(479+deltaX, 479+deltaY);
  curveVertex(469+deltaX, 505+deltaY);
  curveVertex(447+deltaX, 536+deltaY);
  curveVertex(436+deltaX, 589+deltaY);
  curveVertex(447+deltaX, 629+deltaY);
  curveVertex(489+deltaX, 657+deltaY);
  curveVertex(545+deltaX, 656+deltaY);
  curveVertex(572+deltaX, 641+deltaY);
  curveVertex(574+deltaX, 624+deltaY);
  curveVertex(559+deltaX, 622+deltaY);
  curveVertex(529+deltaX, 631+deltaY);
  curveVertex(496+deltaX, 621+deltaY);
  curveVertex(478+deltaX, 603+deltaY);
  curveVertex(476+deltaX, 568+deltaY);
  curveVertex(503+deltaX, 546+deltaY);
  curveVertex(531+deltaX, 510+deltaY);
  curveVertex(542+deltaX, 472+deltaY);
  curveVertex(543+deltaX, 444+deltaY);
  curveVertex(478+deltaX, 447+deltaY);
  endShape(CLOSE);
  
  //draw wings 
  //wing one
  beginShape();
  curveVertex(477+deltaX, 320+deltaY);
  curveVertex(461+deltaX, 313+deltaY);
  curveVertex(445+deltaX, 300+deltaY);
  curveVertex(430+deltaX, 274+deltaY);
  curveVertex(381+deltaX, 300+deltaY);
  curveVertex(366+deltaX, 315+deltaY);
  curveVertex(373+deltaX, 318+deltaY);
  curveVertex(377+deltaX, 316+deltaY);
  curveVertex(387+deltaX, 311+deltaY);
  curveVertex(395+deltaX, 309+deltaY);
  curveVertex(399+deltaX, 319+deltaY);
  curveVertex(402+deltaX, 327+deltaY);
  curveVertex(408+deltaX, 328+deltaY);
  curveVertex(413+deltaX, 323+deltaY);
  curveVertex(422+deltaX, 315+deltaY);
  curveVertex(429+deltaX, 315+deltaY);
  curveVertex(434+deltaX, 320+deltaY);
  curveVertex(438+deltaX, 334+deltaY);
  curveVertex(443+deltaX, 336+deltaY);
  curveVertex(449+deltaX, 335+deltaY);
  curveVertex(453+deltaX, 324+deltaY);
  curveVertex(459+deltaX, 321+deltaY);
  curveVertex(461+deltaX, 314+deltaY);
  endShape(CLOSE);
  //wing2
  translate(175, 0);
  deltaX +=845;
  beginShape();
  curveVertex(-477+deltaX, 320+deltaY);
  curveVertex(-461+deltaX, 313+deltaY);
  curveVertex(-445+deltaX, 300+deltaY);
  curveVertex(-430+deltaX, 274+deltaY);
  curveVertex(-381+deltaX, 300+deltaY);
  curveVertex(-366+deltaX, 315+deltaY);
  curveVertex(-373+deltaX, 318+deltaY);
  curveVertex(-377+deltaX, 316+deltaY);
  curveVertex(-387+deltaX, 311+deltaY);
  curveVertex(-395+deltaX, 309+deltaY);
  curveVertex(-399+deltaX, 319+deltaY);
  curveVertex(-402+deltaX, 327+deltaY);
  curveVertex(-408+deltaX, 328+deltaY);
  curveVertex(-413+deltaX, 323+deltaY);
  curveVertex(-422+deltaX, 315+deltaY);
  curveVertex(-429+deltaX, 315+deltaY);
  curveVertex(-434+deltaX, 320+deltaY);
  curveVertex(-438+deltaX, 334+deltaY);
  curveVertex(-443+deltaX, 336+deltaY);
  curveVertex(-449+deltaX, 335+deltaY);
  curveVertex(-453+deltaX, 324+deltaY);
  curveVertex(-459+deltaX, 321+deltaY);
  curveVertex(-461+deltaX, 314+deltaY);
  endShape(CLOSE);
  deltaX -=845;
  translate(-175, 0);
  
  //draw legs
  //leg one
  scale(.9);
  deltaX+=70;
  deltaY+=100;
  beginShape();
  curveVertex(473+deltaX, 429+deltaY);
  curveVertex(454+deltaX, 416+deltaY);
  curveVertex(409+deltaX, 437+deltaY);
  curveVertex(380+deltaX, 490+deltaY);
  curveVertex(382+deltaX, 546+deltaY);
  curveVertex(411+deltaX, 567+deltaY);
  curveVertex(435+deltaX, 568+deltaY);
  curveVertex(444+deltaX, 591+deltaY);
  curveVertex(438+deltaX, 624+deltaY);
  curveVertex(414+deltaX, 641+deltaY);
  curveVertex(392+deltaX, 665+deltaY);
  curveVertex(437+deltaX, 674+deltaY);
  curveVertex(467+deltaX, 669+deltaY);
  curveVertex(482+deltaX, 647+deltaY);
  curveVertex(490+deltaX, 600+deltaY);
  curveVertex(486+deltaX, 552+deltaY);
  curveVertex(477+deltaX, 538+deltaY);
  curveVertex(460+deltaX, 526+deltaY);
  curveVertex(466+deltaX, 498+deltaY);
  curveVertex(482+deltaX, 479+deltaY);
  curveVertex(492+deltaX, 473+deltaY);
  curveVertex(505+deltaX, 464+deltaY);
  curveVertex(456+deltaX, 415+deltaY);
  endShape(CLOSE);
  //leg two
  deltaX += 1020;
  beginShape();
  curveVertex(-473+deltaX, 429+deltaY);
  curveVertex(-454+deltaX, 416+deltaY);
  curveVertex(-409+deltaX, 437+deltaY);
  curveVertex(-380+deltaX, 490+deltaY);
  curveVertex(-382+deltaX, 546+deltaY);
  curveVertex(-411+deltaX, 567+deltaY);
  curveVertex(-435+deltaX, 568+deltaY);
  curveVertex(-444+deltaX, 591+deltaY);
  curveVertex(-438+deltaX, 624+deltaY);
  curveVertex(-414+deltaX, 641+deltaY);
  curveVertex(-392+deltaX, 665+deltaY);
  curveVertex(-437+deltaX, 674+deltaY);
  curveVertex(-467+deltaX, 669+deltaY);
  curveVertex(-482+deltaX, 647+deltaY);
  curveVertex(-490+deltaX, 600+deltaY);
  curveVertex(-486+deltaX, 552+deltaY);
  curveVertex(-477+deltaX, 538+deltaY);
  curveVertex(-460+deltaX, 526+deltaY);
  curveVertex(-466+deltaX, 498+deltaY);
  curveVertex(-482+deltaX, 479+deltaY);
  curveVertex(-492+deltaX, 473+deltaY);
  curveVertex(-505+deltaX, 464+deltaY);
  curveVertex(-456+deltaX, 415+deltaY);
  endShape(CLOSE);
  deltaX-=1090;
  deltaY-=100;
  scale(1.11);
  
  //draw arms
  //arm one
  deltaX-=25;
  deltaY+=30;
  beginShape();
  curveVertex(494+deltaX, 251+deltaY);
  curveVertex(486+deltaX, 251+deltaY);
  curveVertex(473+deltaX, 257+deltaY);
  curveVertex(463+deltaX, 277+deltaY);
  curveVertex(462+deltaX, 300+deltaY);
  curveVertex(459+deltaX, 329+deltaY);
  curveVertex(445+deltaX, 356+deltaY);
  curveVertex(435+deltaX, 369+deltaY);
  curveVertex(423+deltaX, 381+deltaY);
  curveVertex(413+deltaX, 404+deltaY);
  curveVertex(420+deltaX, 430+deltaY);
  curveVertex(435+deltaX, 436+deltaY);
  curveVertex(445+deltaX, 436+deltaY);
  curveVertex(452+deltaX, 433+deltaY);
  curveVertex(448+deltaX, 424+deltaY);
  curveVertex(443+deltaX, 413+deltaY);
  curveVertex(452+deltaX, 414+deltaY);
  curveVertex(461+deltaX, 413+deltaY);
  curveVertex(463+deltaX, 407+deltaY);
  curveVertex(458+deltaX, 400+deltaY);
  curveVertex(454+deltaX, 391+deltaY);
  curveVertex(458+deltaX, 380+deltaY);
  curveVertex(472+deltaX, 346+deltaY);
  curveVertex(482+deltaX, 326+deltaY);
  curveVertex(483+deltaX, 317+deltaY);
  curveVertex(481+deltaX, 302+deltaY);
  curveVertex(485+deltaX, 284+deltaY);
  curveVertex(492+deltaX, 271+deltaY);
  curveVertex(495+deltaX, 267+deltaY);
  endShape(CLOSE);
  //arm two
  deltaX+=1070;
  beginShape();
  curveVertex(-494+deltaX, 251+deltaY);
  curveVertex(-486+deltaX, 251+deltaY);
  curveVertex(-473+deltaX, 257+deltaY);
  curveVertex(-463+deltaX, 277+deltaY);
  curveVertex(-462+deltaX, 300+deltaY);
  curveVertex(-459+deltaX, 329+deltaY);
  curveVertex(-445+deltaX, 356+deltaY);
  curveVertex(-435+deltaX, 369+deltaY);
  curveVertex(-423+deltaX, 381+deltaY);
  curveVertex(-413+deltaX, 404+deltaY);
  curveVertex(-420+deltaX, 430+deltaY);
  curveVertex(-435+deltaX, 436+deltaY);
  curveVertex(-445+deltaX, 436+deltaY);
  curveVertex(-452+deltaX, 433+deltaY);
  curveVertex(-448+deltaX, 424+deltaY);
  curveVertex(-443+deltaX, 413+deltaY);
  curveVertex(-452+deltaX, 414+deltaY);
  curveVertex(-461+deltaX, 413+deltaY);
  curveVertex(-463+deltaX, 407+deltaY);
  curveVertex(-458+deltaX, 400+deltaY);
  curveVertex(-454+deltaX, 391+deltaY);
  curveVertex(-458+deltaX, 380+deltaY);
  curveVertex(-472+deltaX, 346+deltaY);
  curveVertex(-482+deltaX, 326+deltaY);
  curveVertex(-483+deltaX, 317+deltaY);
  curveVertex(-481+deltaX, 302+deltaY);
  curveVertex(-485+deltaX, 284+deltaY);
  curveVertex(-492+deltaX, 271+deltaY);
  curveVertex(-495+deltaX, 267+deltaY);
  endShape(CLOSE);
  deltaX-=1045;
  deltaY-=30;
  
  //draw torso
  deltaX-=238;
  deltaY-=185;
  scale(1.75);
  beginShape();
  curveVertex(477+deltaX, 251+deltaY);
  curveVertex(471+deltaX, 278+deltaY);
  curveVertex(464+deltaX, 309+deltaY);
  curveVertex(462+deltaX, 341+deltaY);
  curveVertex(460+deltaX, 368+deltaY);
  curveVertex(452+deltaX, 396+deltaY);
  curveVertex(449+deltaX, 424+deltaY);
  curveVertex(462+deltaX, 445+deltaY);
  curveVertex(482+deltaX, 457+deltaY);
  curveVertex(513+deltaX, 457+deltaY);
  curveVertex(531+deltaX, 442+deltaY);
  curveVertex(538+deltaX, 418+deltaY);
  curveVertex(534+deltaX, 394+deltaY);
  curveVertex(526+deltaX, 374+deltaY);
  curveVertex(522+deltaX, 347+deltaY);
  curveVertex(520+deltaX, 320+deltaY);
  curveVertex(517+deltaX, 299+deltaY);
  curveVertex(514+deltaX, 284+deltaY);
  curveVertex(507+deltaX, 276+deltaY);
  curveVertex(471+deltaX, 274+deltaY);
  endShape(CLOSE);
  scale(4/7.0);
  deltaX+=238;
  deltaY+=185;
  arc(604, 652, 275, 275, ((2.0/5)*PI)+PI, ((3.0/5)*PI)+PI);
  
  //draw head
  scale(1.2);
  fill(flesh);
  stroke(#000000);
  ellipse(500, 250, 90, 100);
  fill(#990000);
  arc(500, 250, 70, 70, 0-radians(5), radians(185));
  drawEye(465, 235, 6);
  drawEye(535, 235, 6);
  fill(#FF5555);
  stroke(#000000);
  beginShape();
  vertex(470, 245);
  bezierVertex(468, 255, 468, 255, 480, 255);
  vertex(520, 255);
  bezierVertex(532, 255, 532, 255, 530, 245);
  endShape(CLOSE);
  fill(#FFFFFF);
  for (int k=0; k<5; k++) {
    ellipse(470+6+(12*k), 255 + int(random(0-3)), 9, 12);
  }
  /*
  noStroke();
  scale(1.111);
  fill(flesh);
  beginShape();
  vertex(465, 253);
  bezierVertex(530, 240, 530, 245, 532, 265);
  vertex(535, 265);
  vertex(540, 243);
  vertex(465, 244);
  endShape(CLOSE);
  noFill();
  stroke(#000000);
  bezier(465, 253, 530, 240, 530, 245, 532, 265);
  scale(.9);
  line(480, 223, 520, 223);
  line(490, 219, 510, 219);
  arc(500, 250, 80, 93, radians(75), radians(105));
  scale(1);
  */
}

void drawEye(int x, int y, int r) {
  fill(#000000);
  stroke(#000000);
  ellipse(x, y, 2*r, 2*r);
  fill(#FFFFFF);
  stroke(#FFFFFF);
  ellipse(x-(int(r*.4)), y-(int(r*.4)), int(r*.2), int(r*.2));
}

void drawBow(){
  fill(#FF9999);
  triangle(540, 340, 540-sqrt(sq(75)-sq(50)), 340-sqrt(sq(75)-sq(50)), 540-75, 340);
  triangle(540, 340, 540+sqrt(sq(75)-sq(50)), 340+sqrt(sq(75)-sq(50)), 540+75, 340);
  ellipse(540, 340, 50, 50);
}                               
