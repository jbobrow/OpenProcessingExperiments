
size(200,200);

background(#32CD32);
noStroke();
for(int a=20; a<200; a=a+20) {
for(int b=20; b<200; b=b+20) {
fill(#7FFF00);
rect(a,b,10,10);
 } 
}

int[ ] x={50,80};
int[ ] y={90,110,150};
fill(#FFFF00);
ellipse(90,90,y[2],y[2]);

fill(#DAA520);
ellipse(x[0]-10,y[0],40,15);
ellipse(y[2],y[0],40,15);

fill(#8B4513);
ellipse(x[0],y[0],30,10);
ellipse(y[2]-10,y[0],30,10);

fill(0);
ellipse(105,y[1],5,5);
ellipse(85,y[1],2,2);


fill(#FF8C00);
beginShape();
vertex(x[0]+20,y[2],50);
vertex(y[2]-20,y[1]+10,x[0]+30);
vertex(y[2]-10,y[1]-10,y[1]+20);
endShape(CLOSE);
              
