
    // happy coding ~
size(200,200);

background(255,0,200);
fill(255,255,0);
noStroke();
for(int a=3; a<210; a=a+15)
for(int b=3; b<210; b=b+15)
{
ellipse(a,b,10,10);
}


//얼굴
fill(250,0,150);
strokeWeight(4);
stroke(3);
ellipse(100,110,170,175);


//안대줄
stroke(5);
strokeWeight(5);
line(185,105,30,60);


//눈
fill(0);
ellipse(60,100,40,40);

fill(#FFFFFF);
ellipse(60,100,40-20,40-20);
fill(#FFFFFF);
ellipse(70,110,40-30,40-30);


//안대
fill(0,250,200);
ellipse(60+80,100,40+10,40+10);


//안대무늬


strokeWeight(7);
line(150,90,150,110);
line(130,90,150,90);
line(130+5,100,150,100);


//코

stroke(3);
strokeWeight(3);
line(90,120,80,140);
line(80,140,90,150);


//입
strokeWeight(4);
int[]x={130};           
int[]y={160};

line(x[0],y[0],80,170);




         
                                                
