
// 귀여운 곰돌이
size(200,200);


//배경
background(#F4D087);

strokeWeight(0.5);
stroke(96,56,17);
fill(#F6921D);
float r=200;
beginShape();
for(float a=0; a<360; a=a+8) {
  vertex(100+cos(radians(a))*r, 120+sin(radians(a))*r);
  vertex(100+cos(radians(a+180))*r*0.5, 120+sin(radians(a+180))*r*0.5);
}
endShape(CLOSE);

//귀
strokeWeight(4);
stroke(96,56,17);
fill(117,76,39);
ellipse(50,95,45,45);
ellipse(150,95,45,45);

strokeWeight(3);
stroke(96,56,17);
fill(142,70,16);
ellipse(50,95,28,28);
ellipse(150,95,28,28);

//얼굴
strokeWeight(4);
stroke(96,56,17);
fill(117,76,39);
ellipse(100,150,125,125);


//눈
strokeWeight(3);
stroke(96,56,17);
fill(244,210,181);
ellipse(70,127,25,29);

strokeWeight(1);
stroke(50);
fill(96,56,17);
ellipse(70,127,16,18);

strokeWeight(4);
stroke(96,56,17);
line(115,127,133,120);
line(115,127,133,134);

//코
strokeWeight(2);
stroke(96,56,17);
fill(73,41,14);
ellipse(100,150,32,20);

strokeWeight(4);
stroke(96,56,17);
line(100,162,100,190);

//입
line(75,177,100,190);
line(100,190,125,177);

//손
strokeWeight(4);
stroke(96,56,17);
fill(117,76,39);
ellipse(35,190,45,32);
line(48,185,48,200);
line(35,185,35,200);
line(22,185,22,200);

ellipse(165,190,45,32);
line(152,185,152,200);
line(165,185,165,200);
line(178,185,178,200);



