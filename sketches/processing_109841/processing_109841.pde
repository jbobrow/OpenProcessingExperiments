
size(300,300);
background(80, 83, 232);
int D = 20;
int C= 30;
//D is the diameter
//C is the center point

ellipse(C, C, D, D);
ellipse (C+100, C+100, D+100, D+100);

//part 2 below

D = D+100;
C= C+100;
ellipse(C, C, D, D);

//part 3 below
D = D/2;
C= C/2;
ellipse(C, C, D, D);


//above is part 1, ellipse & background, below is part 2
//three different colored shapes 

fill(32, 224, 152);
triangle(width/2, height/2-50, width/2+50, height/2, width/2-50, height/2);

fill(40, 224, 32);
rect(width/2-50, height /2-20, 100, 40);

fill(224, 202, 32);
ellipse(width/2, height/2, 50, 50);


//below are the lines (part 3)

line(145, 145, 180, 145);
line(145, 145*1.1, 180, 145*1.1);
line(145, 145*1.3, 180, 145*1.3);
line(145, 145*1.6, 180, 145*1.6);
line(145, 145*2.0, 180, 145*2.0);





