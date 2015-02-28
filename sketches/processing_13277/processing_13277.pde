
size (200,200);
  
background( #ffffff );
 



//얼굴
fill( #FFF3E7 );
beginShape();
vertex(40,60);
vertex(40,160);
vertex(160,160);
vertex(160,60);
endShape();

//코
rect(95,90,6,35);
 
//눈
strokeWeight(1);
fill( #000000 );
int[] x={70,130};
ellipse(x[0],100,10,10);
ellipse(x[1],100,10,10);

//얼굴2
strokeWeight(1);
stroke( #000000 );
fill( #FFF3E7 );
beginShape();
vertex(x[5],x[0]);
bezierVertex(160,60,190,40,160,20);
bezierVertex(160,20,130,10,100,10);
bezierVertex(100,10,70,10,40,20);
bezierVertex(40,20,10,40,40,60);
endShape();

//입
beginShape();
fill( #FFD1A4 );
vertex(x[5],x[0]);
bezierVertex(80,135,85,145,95,147);
bezierVertex(95,147,100,150,110,145);
bezierVertex(110,145,115,143,120,135);
bezierVertex(120,135,110,135,80,135);
endShape();

//뺨
noStroke();
fill( #FFD1A4 );
ellipse(60,115,10,10);
ellipse(140,115,10,10);

//옷
stroke( #000000 );
noFill();
beginShape();
vertex(x[3],x[0]);
bezierVertex(70,160,85,190,100,160);
bezierVertex(100,160,115,190,130,160);
endShape();

strokeWeight(3);
stroke( #ff0000 );
beginShape();
vertex(x[2],x[0]);
bezierVertex(85,165,100,180,115,165);
endShape();

strokeWeight(1);
stroke( #000000);
line(60,160,50,200);
line(140,160,150,200);
