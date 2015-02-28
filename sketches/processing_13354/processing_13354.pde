
size(200,200);

background(#95629d);
noStroke();
for(int a=10; a<200; a=a+10){
  for(int b=10; b<200; b=b+10){
  fill(#261d30);  
  ellipse(a,b,5,5);
  }
}
int[] x={20,40,60,80,100,120,140,160,180,200};
int[] y={10,30,50,70,90,110,130,150,170,190};


//head
fill(#c98530);
ellipse(y[5]-10,x[3],y[5]-10,y[3]);

//ear
noStroke();
ellipse(y[6],y[2],x[1],x[1]);
ellipse(y[3],y[2],x[1],x[1]);
fill(#f1d023);
ellipse(x[6],y[2],x[0],x[0]);
ellipse(x[2],y[2],x[0],x[0]);

//hat
fill(#41475f);
beginShape();
vertex(y[5]-10,7);
vertex(x[5],x[1]+5);
vertex(x[3],x[1]+5);
endShape(CLOSE);

beginShape();
vertex(x[5],x[1]+5);
vertex(165,x[2]+5);
vertex(y[1]+5,x[2]+5);
vertex(x[3],x[1]+5);
endShape(CLOSE);

fill(#f8a73c);
beginShape();
vertex(x[5],x[1]+5);
vertex(x[3],x[1]+5);
vertex(84,x[1]);
vertex(117,x[1]);
endShape(CLOSE);

//eye
fill(1);
ellipse(x[3],y[4],y[0],y[0]);
ellipse(x[5],y[4],y[0],y[0]);

//mouth
fill(225);
ellipse(x[4],102,y[1],x[0]);

fill(1);
ellipse(x[4],x[4],5,5);

