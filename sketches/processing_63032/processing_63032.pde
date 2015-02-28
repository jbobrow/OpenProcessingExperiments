
size(500, 500);
background(0);
smooth();

for (float a=2; a<=500; a = a+a*4) {
 for (float b=1; b<=8; b = b+.3) {
beginShape();
noStroke();
fill(255, 20);
//vertex(a*3,a*3);
//vertex(a*6,a*3);
//bezierVertex( a*6, a*3, a*6, a*4,a*7, a*4);
//bezierVertex(  a*7, a*4,a*7, a*3, a*8,a*5);

/*line(a*2, a*2, a*6, a*2);
arc(a*7, a*2, a*2, a*2, 0, PI);
line(a*8, a*2, a*10, a*2);
line(a*10, a*2, a*10, a*10);
line(a*10, a*10, a*5, a*10);
arc(a*5, a*10, a*2, a*2, PI, TWO_PI);
line(a*2,a*10, a*4,a*10);
line(a*2,a*10,a*2, a*2);
*/
vertex(a*2,a*2);
vertex(a*6,a*2);
curveVertex(a*6, a*2);
curveVertex(a*6, a*2);
curveVertex(a*7, a*b);
curveVertex(a*8, a*2);
curveVertex(a*8, a*2);
vertex(a*8, a*2);
vertex(a*10,a*2);
vertex(a*10,a*10);
vertex(a*5,a*10);
curveVertex(a*5,a*10);
curveVertex(a*5,a*10);
curveVertex(a*4,a*b);
curveVertex(a*3,a*10);
curveVertex(a*3,a*10);
vertex(a*3,a*10);
vertex(a*2,a*10);
vertex(a*2,a*2);



endShape();
}
}


