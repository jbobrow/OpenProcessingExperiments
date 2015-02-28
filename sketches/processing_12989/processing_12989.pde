
// happy coding ~
size(200,200);

background(20);
strokeWeight(4);

//star
fill(100);
float r=110;
beginShape();
//for(float a=0; a<PI*2; a=a+PI*.25) {
for(int a=0; a<360; a=a+60)  {
vertex(100+cos(radians(a))*r,
       100+sin(radians(a))*r);
  vertex(100+cos(radians(a+30))*r*0.5,
       100+sin(radians(a+30))*r*0.5);

}
endShape(CLOSE);
//ear
fill(60);
ellipse(68,45,30,30);
ellipse(130,45,30,30);
//face
fill(60);
ellipse( 100, 90, 120, 100 );
fill( 0 );
ellipse(70,80,10,20);
ellipse(130,80,10,20);
//mouth
fill(60);
ellipse(100,120,150,60);
strokeWeight(2);
ellipse(80,115,10,10);
ellipse(120,115,10,10);
strokeWeight(1);
line(50,128,150,128);
//tooth
fill(255);
beginShape();
vertex(60,128);
vertex(60,135);
vertex(70,135);
vertex(70,128);
endShape(CLOSE);

fill(255);
beginShape();
vertex(125,128);
vertex(125,135);
vertex(135,135);
vertex(135,128);
endShape(CLOSE);

//hama
stroke( #d80101 );
fill( #d80101 );
strokeWeight(2);
line( 20,150,20,160 );
line( 10,160,30,160 );
ellipse( 20,170,10,10 );
line( 33,160,33,180 );
line( 33,170,38,170 );
rect( 160,166,10,10 );
line( 180,160,180,180 );
line( 180,170,185,170 );
       
                
