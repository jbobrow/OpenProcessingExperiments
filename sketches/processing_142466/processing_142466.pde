
int b;
int a;
background(255,255,255);
size(560,480);
a=(width/14);
b=(height/12);
strokeWeight(3);

fill(255,255,0);
triangle(a,2*b,a*3,7*b,6*a,5.5*b);
triangle(13*a,2*b,11*a,7*b,8*a,5.5*b);

fill(0);
triangle(a,2*b,2*a,4.3*b,3*a,3.4*b);
triangle(13*a,2*b,12*a,4.3*b,11*a,3.4*b);

fill(255,255,0);
ellipse(7*a,8*b,10*a,8*b);
noFill(); //boca
ellipse(6*a,9.5*b,a*2,b);
ellipse(8*a,9.5*b,a*2,b);
noStroke();
fill(255,255,0); //nariz
rect(4.5*a,8.5*b,5*a,b);
fill(0);
triangle(6.5*a,8.5*b,7.5*a,8.5*b,7*a,9*b);
ellipse(a*4.5,8*b,a,b); //ojos
ellipse(9.5*a,8*b,a,b);
stroke(0); //mejillas
fill(255,0,0);
ellipse(4*a,10*b,a,b);
ellipse(10*a,10*b,a,b);
fill(255,255,255);
ellipse(4.6*a,7.8*b,a/2,b/2);
ellipse(9.4*a,7.8*b,a/2,b/2);



