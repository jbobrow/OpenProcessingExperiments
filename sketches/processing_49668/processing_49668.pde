
size(640,360);
background(230,216,190);

//top left triangle
smooth();
int l=255;
int m=52;
int n=50;
fill(l,m,n);
stroke(l,m,n);
triangle(0,0,0,69, 265, 0);


//ellipse
smooth();
stroke(0);
fill(25,22,23);
ellipse(567,212,712,712);

//red rectangle
smooth();
int a=250;
int b=37;
int c=33;

stroke(a,b,c);
fill(a,b,c);
quad(393,-6,443,16,347,238,298,217);



//shape next to red rectangle
smooth();
int x=231;
int y=219;
int z=202;

fill(x,y,z);
stroke(x,y,z);

beginShape();
vertex(442,16);
vertex(482,0);
vertex(538,0);
vertex(468,169);
vertex(368,191);
endShape(CLOSE);

//triangle on top of red
smooth();
stroke(146,136,106);
triangle(443,16,407,0,484,0);

//grey custom shape
smooth();
int e=184;
int f=184;
int g=182;

fill(e,f,g);
stroke(e,f,g);

beginShape();
vertex(87,347);
vertex(640,224);
vertex(640,300);
vertex(367,360);
vertex(90,360);
endShape(CLOSE);


// yellow rectangle
smooth();
int r=231;
int s=189;
int t=90;

stroke(r,s,t);
fill(r,s,t);
smooth();

beginShape();
vertex(173,235);
vertex(592,143);
vertex(634,330);
vertex(540,351);
vertex(517,251);
vertex(193,323);
endShape(CLOSE);





