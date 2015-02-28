

                // happy coding ~
size(200,200);
background(245,220,150);

//얼굴형
fill(23,102,0);
stroke(6);
beginShape();
vertex(160,30);
vertex(150,150);
vertex(40,150);
vertex(30,30);

endShape(CLOSE);

//머리
fill(420,18,2);
beginShape();
vertex(30,40);
vertex(160,40);
vertex(150,150);
vertex(170,150);
vertex(180,10);
vertex(20,10);


endShape(CLOSE);
//눈
fill(25);
ellipse(50,80,15,15);
ellipse(140,80,15,15);
//눈알
fill(255);
ellipse(50,80,7,7);
ellipse(140,80,7,7);


//눈썹
strokeWeight(5);
line(40,60,60,60);
line(130,60,150,60);

//입
strokeWeight(1);
fill(520,15,2);
rect(50,120,50,20);
//코
fill(255);
ellipse(90,100,5,5);
ellipse(70,100,5,5);

//몸뚱이
fill(0,160,255);
strokeWeight(3);
rect(70,150,60,50);
//손
beginShape();
vertex(70,150);
vertex(40,170);
vertex(30,130);
vertex(15,135);
vertex(30,190);
vertex(40,190);
vertex(70,170);
endShape(CLOSE);

beginShape();
vertex(130,150);
vertex(165,170);
vertex(180,130);
vertex(190,135);
vertex(170,190);
vertex(130,170);
endShape(CLOSE);


//주먹
fill(420,18,2);
strokeWeight(5);
ellipse(20,125,25,25);
ellipse(187,125,25,25);

