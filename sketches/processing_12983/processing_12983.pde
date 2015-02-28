
size(200,200);
background(#FFCE00);

//배경
stroke(#FFB600);
strokeWeight(10);
float r=90;
beginShape();
for(float a=0; a<360; a=a+10) {
fill(#FFCE00);
  vertex(100+cos(radians(a))*r, 115+sin(radians(a))*r);
  vertex(100+cos(radians(a+10))*r*0.8, 115+sin(radians(a+10))*r*0.8);
}
endShape(CLOSE);


strokeWeight(6);
stroke(0);
//얼굴
fill(#FFDBA6);
beginShape();
vertex(154,119.5);
vertex(156,155);
vertex(127,187);
vertex(78,186);
vertex(45,148);
vertex(55,106);
endShape(CLOSE);


//얼굴그림자
noStroke();
fill(#F7C486);
beginShape();
vertex(154-3,119.5-3);
vertex(156-3,155-3);
vertex(127-3,187-3);
vertex(78+3,186-3);
vertex(65,171-5);
vertex(86,175);
vertex(120,175);
vertex(135,155);
vertex(130,135);
vertex(117-10,145);
vertex(55,113);
endShape(CLOSE);

stroke(0);
strokeWeight(6);


//가면
fill(0);
beginShape();
vertex(80-10,20);
vertex(95-10,65);
vertex(108-10,62);
vertex(128-10,64);
vertex(139-10,70);
vertex(160-10,25);
vertex(165-10,120);
vertex(117-10,133);
vertex(63-10,109);
endShape(CLOSE);

//오른쪽눈
fill(255);
stroke(255);
beginShape();
vertex(132,113);
vertex(115,103);
vertex(140,87);
endShape(CLOSE);

//왼쪽눈
beginShape();
vertex(88-7,111);
vertex(78-7,82);
vertex(105-7,103);
endShape(CLOSE);

//입
stroke(0);
strokeWeight(3);
line(85,153,91,150);
line(91,150,112,152);
line(112,152,117,149);

stroke(#75542f);
strokeWeight(5);
//입그림자
line(95,165,105,165);
line(95,165,105,166.5);

//끝~
noStroke();
fill(0);
rect(0,0,200,10);
rect(0,196,200,4);
strokeWeight(10);

for(int x=0; x<=20; x++)
{
ellipse(x*10,196,5,5);
ellipse(x*10,10,5,5);
}

                
                                
