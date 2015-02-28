
// happy coding ~
size(200,200);

background(#fff8dc);
//머리
fill(#808000);
rect(0,0,50,30);
rect(55,0,50,35);
rect(110,0,50,35);
rect(165,0,50,30);

//눈
fill(0,0,0);
rect(30,60,45,5);
rect(120,60,45,5);

//코
ellipse(90,90,10,5);
ellipse(110,90,10,5);

//홍조
fill(#ff1493);
ellipse(40,110,30,10);
ellipse(160,110,30,10);

//입
fill(255,0,0);
ellipse(100,150,50,70);

//콧물
beginShape();
fill(255,255,0);
vertex(90,120);
vertex(110,100);
vertex(90,90);
endShape(CLOSE);                    
