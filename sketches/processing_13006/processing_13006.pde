
size(200,200);

//보노보노

background(#FFFFF0);
float r = 0;

for(float a = 0; a < PI*25; a = a+0.3) {

  stroke(255,100+(sin(a)+1)*10,0);
  point(25+cos(a)*r, 25+sin(a)*r);
  r = r+0.3;
}
strokeWeight(1);
//몸통
stroke(100);
fill(0,160,255);
ellipse(200,160,110,120);

//팔
stroke(100);
fill(0,160,255);
ellipse(140,165,95,33);
line(149,183,144,170);

//손
stroke(100);
fill(0,160,255);
ellipse(93,164,18,20);

//손가림

noStroke();
fill(0,160,255);
beginShape();
vertex(98,157);
vertex(104,157);
vertex(104,172);
vertex(97,172);
endShape(CLOSE);

//조개
stroke(100);
fill(255,200,200);
ellipse(90,163,10,13);
beginShape();
vertex(75,147);
vertex(92,157);
vertex(92,169);
vertex(75,181.4);
endShape(CLOSE);
ellipse(75,164,17,33);

noStroke();
fill(255,200,200);
beginShape();
vertex(90,156);
vertex(93,159);
vertex(95,165);
vertex(90,171);
endShape(CLOSE);

noStroke();
fill(255,200,200);
beginShape();
vertex(77,148);
vertex(85,154);
vertex(85,173);
vertex(77,180);
endShape(CLOSE);

stroke(100);
line(69,155,79,159);
line(67,163,77,164);
line(68,173,78,170);


//손가락
stroke(100);
fill(0,160,255);
ellipse(93,158,8,8);

//손가락가림
noStroke();
fill(0,160,255);
beginShape();
vertex(98,156);
vertex(92,156);
vertex(93,163);
vertex(97,163);
endShape(CLOSE);

//몸통가림
noStroke();
fill(0,160,255);
beginShape();
vertex(149,183);
vertex(200,183);
vertex(200,152);
vertex(160,152);
endShape(CLOSE);

//얼굴
fill(0,160,255);
stroke(100);
ellipse(150,110,110,100);

//입
strokeWeight(1);

fill(255,100,100);
ellipse(159,120,20,20);
stroke(100);
fill(255,255,255);
ellipse(147,123,22,20);
ellipse(165,111,22,20);

//수염
line(124,130,140,122);
line(128,137,143,125);
line(136,143,145,128);

line(165,104,178,90);
line(167,107,183,96);
line(170,110,188,103);
//코
noStroke();
fill(0);
strokeWeight(5);
ellipse(150,110,15,15);

//눈
noStroke();
ellipse(170,78,5,5);
ellipse(110,120,5,5);
