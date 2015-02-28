
//Homework 2 - Jan 20
//51-757 Programming in the Arts with Processing
//Zoe Lu copyright Spring 2012, PA 15213

float x,y,w;
int stkW;
color bgC = color(234, 224, 173);
color tC = color(223, 205, 158);
color yC = color(126, 158, 107);
color lC = color(251, 226, 202);
color stkC = color(255, 243, 186);
//initial x, y, w
x=200;
y=200;
w=40;

//canvas setting
size(400, 400);
background(bgC);

//ellipse boundary 
fill(tC);
strokeWeight(30);
stroke(stkC);
ellipse(200, 200, 6*w, 6*w);


//background
int i,j,s;
s=15;
for(i=0;i<x;i+=s){
  for(j=0;j<y;j+=s){
    stroke(255,255,255);
    strokeWeight(2);
    line(i,j,i+1.5*s, j+3*s);
  }
}

for(i=int(2*x);i>x;i-=s){
  for(j=0;j<y;j+=s){
    stroke(255,255,255);   
    strokeWeight(3);
    line(i,j,i-1.5*s,j+3*s);
  }
}

for(i=int(x);i>0;i-=s){
  for(j=int(y);j<2*y;j+=s){
    stroke(255,255,255);
    strokeWeight(3);
    line(i,j,i-1.5*s,j+3*s);
  }
}

for(i=int(x);i<2*x;i+=s){
  for(j=int(y);j<2*y;j+=s){
    stroke(255,255,255);
    strokeWeight(2);
    line(i,j,i+1.5*s, j+3*s);
  }
}

//T
//seetings
stkW=3;
strokeWeight(stkW);
stroke(stkC);
fill(tC);
//needed points
beginShape();
  vertex(x-3.46*w, y-w);
  vertex(x-.86*w, y+w);
  vertex(x-.86*w, y+3*w);  
  vertex(x-1.73*w, y+1.86*w);  
  vertex(x-1.73*w, y+3*w);    
  vertex(x-2.6*w, y+3*w);  
  vertex(x-2.6*w, y+.86*w);  
  vertex(x-3.46*w, y);  
  vertex(x-3.46*w, y-w);  
endShape();  

//Y
//settings
stroke(stkC);
fill(yC);
//needed points
beginShape();
  vertex(x-1.73*w, y-3*w);
  vertex(x, y);
  vertex(x+1.73*w, y-3*w);
  vertex(x+3.46*w, y-w);
  vertex(x+1.73*w, y);
  vertex(x+.86*w, y+w);
  vertex(x+.86*w, y+3*w);
  vertex(x-.86*w, y+3*w);
  vertex(x-.86*w, y+w);
  vertex(x-1.73*w, y);
  vertex(x-3.46*w, y-w);
  vertex(x-1.73*w, y-3*w);
endShape();  

//L
//settings
fill(lC);
//needed points
beginShape();
  vertex(x+1.73*w, y);
  vertex(x+3.46*w, y-w);
  vertex(x+1.73*w, y+2.14*w);  
  vertex(x+3.46*w, y+2.14*w);
  vertex(x+3.46*w, y+3*w);
  vertex(x+.86*w, y+3*w); 
  vertex(x+.86*w, y+2.14*w); 
  vertex(x+1.73*w, y);  
endShape();
