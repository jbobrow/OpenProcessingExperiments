
size(200,200);


background(255);
stroke(252,222,222);
strokeWeight(5);
for(float a=0; a<3.14*2; a=a+0.1){
point(100,100);
line(100,100,100+150*sin(a), 100+150*cos(a));
}



strokeWeight(5);
stroke(100);
fill(244,212,219);
beginShape();
vertex(20,200);
vertex(20,60);
vertex(60,60);
vertex(60,110);
vertex(150,110);
vertex(150,60);
vertex(190,60);
vertex(190,200);
endShape();


strokeWeight(1);
stroke(100);
fill(255);
ellipse(60,140,30,30);
ellipse(150,140,30,30);

fill(100);
ellipse(65,140,20,20);
ellipse(155,140,20,20);


fill(232,152,168);
stroke(232,152,168);
ellipse(110,170,5,5);
line(110,170,110,200);


//수염좌우
stroke(150);
line(130,180,170,170);
line(130,185,170,185);
line(130,190,170,200);

line(90,180,50,170);
line(90,185,50,185);
line(90,190,50,200);


                
