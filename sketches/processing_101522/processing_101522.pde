
size(400, 400);
background(255,244,219);

int a = height/4; 
int b = height/2; 
int c = 3*height/4; 
int d = width/4; 
int e = width/2; 
int f = 3*width/4; 

//DIVISÓRIAS
stroke(0);
strokeWeight(1);
line(0, a, width, a); //linha 1
line(0, b, width, b); //linha 2
line(0, c, width, c); //linha 3
line(d, 0, d, height); //coluna 1
line(e, 0, e, height); //coluna 2
line(f, 0, f, height); //coluna 3

//TRIÂNGULOS
stroke(60,111,59);
strokeWeight(3);
fill(255,200);
//coluna 1:
triangle(0,0,a/2,0,0,d/2); 
triangle(0,3*b/4,0,5*b/4,d/2,b); 
triangle(0,height,0,7*b/4,d/2,height);
//coluna 2:
triangle(3*e/4,0,5*e/4,0,e,b/4);
quad(3*e/4,b,e,3*b/4,5*e/4,b,e,5*b/4);
triangle(3*e/4,height,5*e/4,height,e,7*b/4);
//coluna 3:
triangle(7*e/4,0,width,0,width,a/2);
triangle(width,3*b/4,7*e/4,b,width,5*e/4);
triangle(7*e/4,height,width,height,width,7*b/4);



//CÍRCULOS
noStroke();
fill(229,208,9,240);
//coluna 1:
ellipse(d,a,d,a);
ellipse(d,c,d,a);
//coluna 2:
ellipse(f,a,d,a);
ellipse(f,c,d,a);

//ELIPSES
stroke(5,77,175);
strokeWeight(2);
noFill();
//coluna 1:
ellipse(d,a/4,d/7,a/3);
ellipse(d,7*a/4,d/7,a/3);
ellipse(d,9*a/4,d/7,a/3);
ellipse(d,15*a/4,d/7,a/3);
//coluna 2:
ellipse(f,a/4,d/7,a/3);
ellipse(f,7*a/4,d/7,a/3);
ellipse(f,9*a/4,d/7,a/3);
ellipse(f,15*a/4,d/7,a/3);
//linha 1:
ellipse(d/4,a,d/3,a/7);
ellipse(7*d/4,a,d/3,a/7);
ellipse(9*d/4,a,d/3,a/7);
ellipse(15*d/4,a,d/3,a/7);
//linha 2:
ellipse(d/4,c,d/3,a/7);
ellipse(7*d/4,c,d/3,a/7);
ellipse(9*d/4,c,d/3,a/7);
ellipse(15*d/4,c,d/3,a/7);

//TRAÇOS
stroke(116,4,4);
strokeWeight(5);
//coluna 1:
line(38,38,55,55);
line(38,162,55,145);
line(38,238,55,255);
line(38,362,55,345);
//coluna 2:
line(162,38,145,55);
line(162,162,145,145);
line(162,238,145,255);
line(162,362,145,345);
//coluna 3:
line(238,38,255,55);
line(238,162,255,145);
line(238,238,255,255);
line(238,362,255,345);
//coluna 4:
line(362,38,345,55);
line(362,162,345,145);
line(362,238,345,255);
line(362,362,345,345);

//PONTOS
stroke(211,139,21,220);
//coluna 1:
strokeWeight(15);
point(0,0);
point(0,b);
point(0,height);
strokeWeight(9);
point(0,a);
point(0,c);
//coluna 2:
strokeWeight(9);
point(d,0);
point(d,b);
point(d, height);
//coluna 3:
strokeWeight(15);
point(e,0);
point(e,b);
point(e, height);
strokeWeight(9);
point(e,a);
point(e,c);
//coluna 4:
strokeWeight(9);
point(f,0);
point(f,b);
point(f,height);
//coluna 5:
strokeWeight(9);
point(width,d);
point(width,f);
strokeWeight(15);
point(width,0);
point(width,b);
point(width,height);

//CONTORNO
stroke(60,111,59);
strokeWeight(2);
noFill();
rect(0,0,width-1,height-1);
