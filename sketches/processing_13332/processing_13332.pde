
size(200,200)
background(#FFCE00);





//배경
stroke(#FFB600);
strokeWeight(10);
float r=90;
beginShape();
for(float a=0; a<360; a=a+10) {
fill(#FFCE00);
  vertex(100+cos(radians(a))*r, 115+sin(radians(a))*r);
  vertex(100+cos(radians(a+10))*r*0.8, 115+sin(radians(a+10))*r*0.8);
}
endShape(CLOSE);

int[] a={100,130,11,180,15,185,20};
int[] b={70,90,40,130,10,110};
int[] c={87,160,30,113,158,25};
 

//얼굴
stroke(150);
strokeWeight(10);
fill(150);
ellipse(a[0],a[0],a[1],b[5]);

//뒤막대기
beginShape();
vertex(a[3],a[4],a[5],a[6]);
vertex(a[5],a[6],a[5],a[6]);
vertex(a[6],a[5],a[4],a[3]);
vertex(a[4],a[3],a[3],a[4]);
endShape(CLOSE);

beginShape();
vertex(a[6],a[4],a[3],a[3]);
vertex(a[3],a[3],a[5],a[5]);
vertex(a[5],a[5],a[4],a[6]);
vertex(a[4],a[4],a[6],a[6]);
endShape(CLOSE);

//눈,코
fill(255);
stroke(255);
int[] e={70,130};
for(int i=0; i<2; i=i+1){
  ellipse(e[i],b[1],b[2],b[2]);
}

ellipse(b[1],b[3],b[4],b[4]);
ellipse(b[5],b[3],b[4],b[4]);
//이빨
fill(150);
stroke(150);
ellipse(c[0],c[1],a[6],c[2]);
ellipse(c[3],c[1],a[6],c[2]);
ellipse(b[0],c[4],a[4],c[5]);
ellipse(a[1],c[4],a[4],c[5]);



                
                
