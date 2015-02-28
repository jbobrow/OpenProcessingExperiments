
// happy coding ~
size(200,200);

//얼굴
background(0,200,255);
stroke(255,180,100);

for( float a=0; a<PI*2; a=a+0.001 ) {
  point(100 + sin(a)*100, 0 + cos(a*80)*200 );
}


//눈  
stroke(50);
strokeWeight(5,5);
ellipse(40,100,5,5);
ellipse(160,100,5,5);

//코
strokeWeight(1,1);
line(100,118,100,100);
ellipse(95,120,5,5);
ellipse(105,120,5,5);

//눈썹
fill(255,250,10);
stroke(255,150,10);
beginShape();
vertex(30,80);
vertex(30,85);
vertex(50,85);
vertex(50,80);
endShape(CLOSE);
beginShape();
vertex(170,80);
vertex(170,85);
vertex(150,85);
vertex(150,80);
endShape(CLOSE);

//머리카락
fill(255,250,10);
stroke(255,150,10);
ellipse(10,20,60,60);
ellipse(60,10,60,60);
ellipse(110,10,60,60);
ellipse(150,10,60,60);
ellipse(200,20,60,60);


//홍조
fill(255,30,100);
stroke(200,0,0);
ellipse(35,130,30,30);
ellipse(165,130,30,30);
ellipse(165,130,20,20);
ellipse(35,130,20,20);
ellipse(165,130,10,10);
ellipse(35,130,10,10);

//입
stroke(50);
point(40,160);
point(160,160);
line(40,160,160,160);
fill(255);
beginShape();
vertex(100,160);
vertex(100,165);
vertex(120,165);
vertex(120,160);
vertex(100,160);
vertex(100,165);
vertex(80,165);
vertex(80,160);
endShape(CLOSE);

//' - '


                
                
