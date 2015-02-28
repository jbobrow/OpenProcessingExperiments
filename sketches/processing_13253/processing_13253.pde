
size(200,200);
background(#FCF1D9);
smooth();

noFill();
int[] a={15,30,45,60,75,90,105,120,135,150,165,180,195};

for(int b=0; b<a. length; b=b+1){
  stroke(#72C9F7);
    line(a[b],0,0,a[b]);
    line(a[b],200,200,a[b]);
  stroke(#F3B3F5);
    line(0,a[b],200-a[b],200);
    line(a[b],0,200,200-a[b]);
    line(0,0,200,200);
}

int[] x={20,40,60,80,100,120,140,160,180,200};
int[] y={10,30,50,70,90,110,130,150,170,190};

//head1
noStroke();
fill(#F74545);
beginShape();
vertex(x[4],x[0]);
bezierVertex(170,70,170,140,100,135);
bezierVertex(30,140,30,70,100,20);
endShape();

//head2
beginShape();
vertex(x[4],x[0]);
bezierVertex(170,70,170,140,100,135);
bezierVertex(30,140,30,70,100,20);
endShape();

//shadow
fill(190);
ellipse(x[4],x[8]+4,x[1]+5,y[0]);

//body
fill(#F74545);
beginShape();
  vertex(93,122);
  vertex(77,170);
  vertex(123,170);
  vertex(107,122);
endShape(CLOSE);

//legs
rect(y[4],y[7],6,35);
rect(y[4]+15,y[7],6,35);

//legs+2
fill(#D13434);
rect(y[4]+3,y[8],3,15);
rect(y[4]+18,y[8],3,15);

//arms
fill(#F74545);
beginShape();
  vertex(y[4]+5,y[6]+5);
  vertex(y[3],x[7]+5);
  vertex(x[2]+7,x[7]);
  vertex(x[3]+7,y[6]+5);
endShape(CLOSE);

beginShape();
  vertex(x[4]+5,y[6]+5);
  vertex(y[6],x[7]+5);
  vertex(y[6]+3,x[7]);
  vertex(y[5]+3,y[6]+5);
endShape(CLOSE);

//face
fill(#FAE4D2);
ellipse(x[4],x[4]+5,x[2]+5,x[2]);

//mouth
fill(#F74545);
triangle(x[4],x[5]+5,x[4]+5,y[5]+5,y[4]+5,y[5]+5);

//eyes
fill(50);
ellipse(x[3],x[4]+5,y[0],y[0]);
ellipse(x[5],x[4]+5,y[0],y[0]);
fill(255);
ellipse(x[3]+1,x[4]+4,3,3);
ellipse(x[5]+1,x[4]+4,3,3);

//scarf
fill(#81E00D);
triangle(x[4],135,x[4]+5,145,x[4]-5,145);
triangle(x[4]-10,135,105-10,145,95-10,145);
triangle(x[4]-20,135,105-20,145,95-20,145);
triangle(x[4]+10,135,105+10,145,95+10,145);
triangle(x[4]+20,135,105+20,145,95+20,145);

fill(#62A80C);
triangle(x[4],135,105,145,y[5],135);
triangle(x[4]-10,135,105-10,145,y[5]-10,135);
triangle(x[4]-20,135,105-20,145,y[5]-20,135);
triangle(x[4]+10,135,105+10,145,y[5]+10,135);

//단추
fill(255);
ellipse(x[4],y[7],3,3);
ellipse(x[4],x[7],3,3);

//point
noStroke();
fill(40);
ellipse(94,35,3,5);
ellipse(100,60,3,5);
ellipse(80,50,3,5);
ellipse(113,46,3,5);
ellipse(134,83,3,5);
ellipse(120,65,3,5);
ellipse(60,85,3,5);
ellipse(73,70,3,5);
ellipse(140,100,3,5);
ellipse(60,110,3,5);
                                                                            
