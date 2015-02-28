
size(800,600);
background(0,113,185);
int a;
int b;
int c;
int d;
int e;
int f;
int g;
int h;

a=(width/2);
b=(height/3);
c=(height/8);
d=(a/10);
e=(a/2);
f=(a/6);
g=(a/20);
h=(width/13);

//cos:
stroke(255);
fill(255);
ellipse(width/2,height/2,a,a);

//ala dreta:
beginShape();
stroke(255);
strokeWeight(6);
fill(255);
curveVertex(e+a-d,height/2.5);
curveVertex(e+a-d,height/2.5);
curveVertex(width-a/3.5,height/2.4);
curveVertex(width-a/4,height/2);
curveVertex(e+a-d,height/2+c);
curveVertex(e+a-d,height/3+c);
endShape();

//ala esquerra:
beginShape();
stroke(255);
strokeWeight(6);
fill(255);
curveVertex(e+d,height/2.5);
curveVertex(e+d,height/2.5);
curveVertex(a/3.5,height/2.4);
curveVertex(a/4,height/2);
curveVertex(e+d,height/2+c);
curveVertex(e+d,height/3+c);
endShape();

//boca:
stroke(60);
strokeWeight(6);
arc(a,height/2+d,2.1*h,255,PI/400,PI);
line(a-h,height/2+d,a+h,height/2+d);

stroke(117,18,38);
strokeWeight(6);
fill(117,18,38);
arc(a,height/2+d,2*h,250,PI/400,PI);

//ulls:
stroke(50);
fill(50);
strokeWeight(1);
ellipse(a-d,height/2-f/1.6,d+g/2,f+g/2);
ellipse(a+d,height/2-f/1.6,d+g/2,f+g/2);

stroke(255);
fill(255);
ellipse(a-d,height/2-f/1.2,d/3,f/3);
ellipse(a+d,height/2-f/1.2,d/3,f/3);

//celles:
stroke(50);
strokeWeight(6);
beginShape();
curveVertex(a-2*d,b+g);
curveVertex(a-2*d,b+g);
curveVertex(a-d,height/2-f);
curveVertex(a,b+g);
curveVertex(a+d,height/2-f);
curveVertex(a+2*d,b+g);
curveVertex(a+2*d,b+g);
endShape();

//dents:
strokeWeight(1);
stroke(255);
fill(255);
beginShape();
curveVertex(a-h,height/2+d);
curveVertex(a-h,height/2+d);
curveVertex(a-3*h/4,height/2+d+g*1.5);
curveVertex(a-h/2,height/2+d);

curveVertex(a-h/4,height/2+d+g*1.5);
curveVertex(a,height/2+d);

curveVertex(a+h/4,height/2+d+g*1.5);
curveVertex(a+h/2,height/2+d);

curveVertex(a+3*h/4,height/2+d+g*1.5);
curveVertex(a+h,height/2+d);
curveVertex(a+h,height/2+d);
endShape();

//llengua:
stroke(230,58,118);
fill(230,58,118);
arc(a,2.9*height/4,h,200,PI/400,PI);


