
size(200,200);
//background
background(#00BFFF);

fill(255);
noStroke();
for(int x=5; x<200; x=x+10)
for(int y=5; y<200; y=y+10)
{
ellipse(x,y,5,5);
}

int[] a={0,30,80,100};
int[] b={120,170,200};

fill(#FFFACD);
noStroke();
beginShape();
vertex(a[3],a[3]);
vertex(a[2],a[0]);
vertex(b[0],a[0]);
vertex(a[3],a[3]);
endShape();

beginShape();
vertex(a[3],a[3]);
vertex(a[0],a[2]);
vertex(a[0],b[0]);
vertex(a[3],a[3]);
endShape();

beginShape();
vertex(a[3],a[3]);
vertex(b[2],a[2]);
vertex(b[2],b[0]);
vertex(a[3],a[3]);
endShape();

beginShape();
vertex(a[3],a[3]);
vertex(a[0],a[1]);
vertex(a[0],a[0]);
vertex(a[1],a[0]);
vertex(a[3],a[3]);
endShape();

beginShape();
vertex(a[3],a[3]);
vertex(a[0],b[1]);
vertex(a[0],b[2]);
vertex(a[1],b[2]);
vertex(a[3],a[3]);
endShape();


beginShape();
vertex(a[3],a[3]);
vertex(b[2],a[1]);
vertex(b[2],a[0]);
vertex(b[1],a[0]);
vertex(a[3],a[3]);
endShape();

beginShape();
vertex(a[3],a[3]);
vertex(b[2],b[1]);
vertex(b[2],b[2]);
vertex(b[1],b[2]);
vertex(a[3],a[3]);
endShape();


stroke(0);
int[] x={10,20,30,40,50,60,70,80,90,100};
int[] y={110,120,130,140,150,160,170,180,190,200};
int[] z={15,55,115,145};

//body
fill(#8B4513);
ellipse(x[9],y[9],x[7],y[7]);

//ear
ellipse(x[4],x[4],40,40);
ellipse(y[4],x[4],40,40);

fill(#D2B48C);
ellipse(z[1],z[1],20,20);
ellipse(z[3],z[1],20,20);

//face
fill(#8B4513);
ellipse(x[9],x[9],140,120);

//eye
fill(0);
ellipse(x[9]-40,x[8],5,5);
ellipse(x[9]+40,x[8],5,5);

//nose
fill(#D2B48C);
ellipse(x[9],y[1],50,50);

beginShape();
vertex(x[8],y[2]);
vertex(x[9],z[2]);
vertex(y[0],y[2]);
endShape();

fill(0);
ellipse(x[9],y[0],x[1],z[0]);

//cheek 
fill(#FF4500);
ellipse(x[9]+50,y[0],20,5);
ellipse(x[9]-50,y[0],20,5);



save("sujin.png");
                
                
