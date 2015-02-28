
// wow _hye jeong :D
size(200,200);
smooth();

//물결
for(int x=0; x<200; x=x+1) {
   float d=2*sin(x*0.5+1)+110;
   stroke(d+10,d,d);
   line(x,0,x,200);
   stroke(#FAF5E8);
   line(x,0,x,d);
   line(x,0,x,d+10);
   line(x,0,x,d+30); 
   line(x,0,x,d+50);
}
                
       
//얼굴형+귀
noStroke();
fill(#4F3434);
ellipse(100,110,100,95);
ellipse(55,65,45,45);
ellipse(145,65,45,45);

//얼굴
fill(255);
ellipse(80,105,50,55);
ellipse(80+40,105,50,55);
ellipse(100,135,70,35);

//눈
fill(#4F3434);
ellipse(83,120,15,25);
ellipse(118,120,15,25);

//코
ellipse(100,136,20,10);

//다리
rect(90,160,6,40);
rect(90+15,160,6,40);

//몸통
beginShape();
  vertex(90,152);
  vertex(77,192);
  vertex(123,192);
  vertex(110,152);
endShape(close);

//손
strokeWeight(4);
stroke(#4F3434);
line(90,155,75,165);
line(75,165,90,180);
line(110,155,125,165);
line(125,165,110,180);

//입
strokeWeight(2);
line(88,143,100,150);
line(100,150,112,143);

//눈썹
line(81,105,81,110);
line(81+4,105,81+4,110);
line(116,105,116,110);
line(116+4,105,116+4,110);

noStroke();

//눈동자
fill(255);
beginShape();
  vertex(92,115);
  vertex(82,120);
  vertex(92,125);
endShape(close);

//눈동자2
beginShape();
vertex(92+34,115);
vertex(82+34,120);
vertex(92+34,125);
endShape(close);

//옷
fill(255,0,0);
beginShape();
  vertex(80,180);
  vertex(75,195);
  vertex(125,195);
  vertex(120,180);
endShape(close);

rect(90,152,2,30);
rect(90+18,152,2,30);

//단추
fill(255);
ellipse(91,185,5,5);
ellipse(91+18,185,5,5);


//리본
fill(255,225,0);
triangle(100,156,94,152,94,160);
triangle(100,156,106,152,106,160);
                                                                        
