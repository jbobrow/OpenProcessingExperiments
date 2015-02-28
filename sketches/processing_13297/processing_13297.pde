
// happy coding ~
size(200,200);

// 케로케로케로케로

background(#ffffff);

int[] a={10,20,30,40,50,60,70,80,90};
int[] b={100,200,300,400,500,600,700,800,900};

//배경
fill(#B8D5F0);
noStroke();
for(int x=2; x<220; x=x+7)
for(int y=100; y<220; y=y+7)
{
  ellipse(x,y,4,7);
} 

fill(#CADB37);
noStroke();
for(int x=4; x<220; x=x+7)
for(int y=100; y<220; y=y+7)
{
  ellipse(x,y,2,4);
} 

//왼팔
stroke(0);
strokeWeight(1);
fill(#2d3a5b);
beginShape();
vertex(a[6],b[0]+60);
vertex(a[2],b[1]+10);
vertex(a[3]+5,b[1]+10);
vertex(a[7]+5,b[0]+60);
endShape(CLOSE);

//오른팔
strokeWeight(1);
fill(#2d3a5b);
beginShape();
vertex(b[0]+30,b[0]+60);
vertex(b[0]+70,b[1]+10);
vertex(b[0]+55,b[1]+10);
vertex(b[0]+15,b[0]+60);
endShape(CLOSE);

//왼쪽귀
strokeWeight(1);
fill(#bd9c44);
beginShape();
vertex(12,55);
vertex(85,59);
vertex(25,155);
vertex(-15,135);
endShape(CLOSE);

//오른쪽귀
strokeWeight(1);
fill(#bd9c44);
beginShape();
vertex(188,55);
vertex(115,59);
vertex(175,155);
vertex(215,135);
endShape(CLOSE);

//머리
strokeWeight(1);
fill(#e1cd87);
ellipse(100,75,180,170);


//몸통
strokeWeight(1);
fill(#2d3a5b);
ellipse(100,220,75,170);

//몸통2
strokeWeight(1);
fill(#ffffff);
ellipse(100,220,45,150);

//얼굴
strokeWeight(1);
fill(#2d3a5b);
ellipse(100,85,183,150);

//얼굴2
strokeWeight(1);
fill(#FFFFFF);
ellipse(100,97,170,130);

//왼쪽눈
strokeWeight(1);
fill(255,255,255);
ellipse(55,55,60,60);

strokeWeight(1);
fill(#000000);
ellipse(67,55,35,35);

strokeWeight(1);
fill(#FFFFFF);
ellipse(62,50,15,15);

strokeWeight(1);
fill(#FFFFFF);
ellipse(75,62,10,10);

//오른쪽눈
strokeWeight(1);
fill(255,255,255);
ellipse(145,55,60,60);

strokeWeight(1);
fill(#000000);
ellipse(133,55,35,35);

strokeWeight(1);
fill(#FFFFFF);
ellipse(127,50,15,15);

strokeWeight(1);
fill(#FFFFFF);
ellipse(140,62,10,10);

//아래계급장
strokeWeight(1);
fill(#f0d645);
beginShape();
vertex(85,185);
vertex(100,202);
vertex(85,202);
endShape(CLOSE);

strokeWeight(1);
fill(#65b464);
beginShape();
vertex(115,185);
vertex(100,202);
vertex(115,202);
endShape(CLOSE);

//위계급장
strokeWeight(1);
fill(#f0d645);
beginShape();
vertex(90,-2);
vertex(100,10);
vertex(100,-2);
endShape(CLOSE);

strokeWeight(1);
fill(#65b464);
beginShape();
vertex(110,-2);
vertex(100,10);
vertex(100,-2);
endShape(CLOSE);

//볼
line(45,100,44,105);
line(55,100,55,105);
line(65,100,66,105);

line(135,100,134,105);
line(145,100,145,105);
line(155,100,156,105);

//입
strokeWeight(1);
fill(#d6a0a4);
ellipse(100,130,30,40);

