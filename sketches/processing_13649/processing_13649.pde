
size(200,200);
// 
background(255);

//얼굴
noStroke();
fill(252,198,248);
ellipse(100,90,140,140);
//귀
fill(252,198,248);
beginShape();
vertex(65,30);
vertex(40,75);
vertex(25,25);
endShape(CLOSE);

beginShape();
vertex(130,30);
vertex(160,65);
vertex(175,30);
endShape(CLOSE);

//귓구멍
fill(5,1,4);
beginShape();
vertex(55,35);
vertex(40,55);
vertex(35,35);
endShape(CLOSE);

beginShape();
vertex(140,35);
vertex(160,55);
vertex(165,35);
endShape(CLOSE);


//다리
fill(186,17,91);
beginShape();
vertex(85,160);
vertex(60,170);
vertex(115,160);
vertex(145,170);
endShape(CLOSE);


stroke(1);
for(int a= 50; a>0;)
{
  fill(a,125,180);
  a=a-10;
  ellipse(70,70,a,a);
  ellipse(130,70,a,a);
}

//입
fill(186,17,91);
beginShape();
vertex(95,115);
vertex(110,115);
vertex(103,125);
endShape(CLOSE);


save("work.png");




                
                
