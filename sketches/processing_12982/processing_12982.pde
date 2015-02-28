
// happy coding ~
size(300,300);

// 코딩 너는 무엇이더냐......+ㅂ +

background(20,150,0);



//얼굴몸통
fill(255,50,100);
strokeWeight(5);
beginShape();
vertex(50,70);
vertex(180,70);
vertex(180,240);
vertex(50,240);
endShape(CLOSE);

//눈썹
strokeWeight(3);
line(81,95,81,103);
line(81+7,95,81+7,103);
line(142,95,142,103);
line(142+7,95,142+7,103);

//눈
fill(0,0,0);
ellipse(85,120,6,8);
ellipse(145,120,6,8);

//코
strokeWeight(5);
fill(250,190,0);
ellipse(115,170,80,50);
//콧구멍
fill(0,0,0);
ellipse(100,170,5,5);
ellipse(130,170,5,5);

//귀
fill(255,50,100);
strokeWeight(5);
beginShape();
vertex(60,40);
vertex(65,60);
vertex(50,60);
endShape(CLOSE);

beginShape();
vertex(170,40);
vertex(180,60);
vertex(165,60);
endShape(CLOSE);

      
                
