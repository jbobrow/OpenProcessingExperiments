
// happy coding ~
size(200,200);




background(100,190,196);
int[] a={10,20,30,40,50,60,70,80,90,100,110};
int[] b={10,20,30,40,50,60,70,80,90,100,110};

fill(255,70,140);
strokeWeight(2)

//왼쪽귀
beginShape();
vertex(a[2]+3,b[7]);
vertex(a[4],b[4]);
vertex(a[6],60);
endShape(CLOSE);


//오른쪽
beginShape();
vertex(a[10]+12,b[5]+1);
vertex(a[10]+40,b[3]+5);
vertex(a[10]+58,b[7]);
endShape(CLOSE);



//왼팔
beginShape();
vertex(80,143);
vertex(60,160);
vertex(65,165);
vertex(95,140);
endShape(CLOSE);


//팔
beginShape();
vertex(100,143);
vertex(85,170);
vertex(93,173);
vertex(106,145);
endShape(CLOSE);

//다리 
beginShape();
vertex(160,148);
vertex(180,165);
vertex(187,158);
vertex(170,146);
endShape(CLOSE);
//다리 
beginShape();
vertex(170,130);
vertex(180,113);
vertex(186,115);
vertex(180,132);

endShape(CLOSE);


//몸통
fill(255,130,140);
ellipse(125,135,110,35);

//얼굴
fill(255,70,140);
strokeWeight(2)
ellipse(100,100,150,90);
ellipse(70,115,50,25);
ellipse(55,115,5,5);
ellipse(75,115,5,5);
line(65,138,65,128);
//눈
fill(0);
ellipse(50,90,5,5);
ellipse(90,90,5,5);
//볼
fill(255,0,0);
ellipse(30,110,20,8);
ellipse(110,110,20,8);

       
