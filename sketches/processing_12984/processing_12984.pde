
size(200,200);


//얼굴
background(245,226,208);

//머리
fill(245,21,18);
strokeWeight(3);
beginShape();
vertex(0,0);
vertex(200,0);
vertex(200,180);
vertex(190,40);
vertex(10,40);
vertex(0,180);
endShape(CLOSE);

//가르마
fill(0);
beginShape();
vertex(100,40);
vertex(102,25);
vertex(104,40);
endShape(CLOSE);

beginShape();
vertex(130,40);
vertex(133,20);
vertex(136,40);
endShape(CLOSE);

//머리장식
fill(135,245,63);
ellipse(180,15,20,15);
ellipse(150,5,20,15);

//눈

fill(0);
ellipse(100-50,80,10,5);
ellipse(100+50,80,10,5);
line(55,78,30,75);
line(145,78,170,75);

//입
line(90,160,110,160);

//주근깨
ellipse(30,120,2,2);
ellipse(50,130,2,2);
ellipse(30,140,2,2);

ellipse(170,120,2,2);
ellipse(150,130,2,2);
ellipse(170,140,2,2);

