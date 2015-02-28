
void setup(){
  size(400,400);
  noCursor();
}
void draw(){
  background(255);
  extrimitats();
  cara();
  cuerpo();
}
void cara(){
  fill(145,146,149);//gris
ellipse(mouseX,mouseY,95,110);//cara
fill(3,46,160);
rect(mouseX-17,mouseY-25,9,14,4.5);//rectangle n3 cara
fill(3,46,160);
rect(mouseX-48,mouseY-5,95,5); //barra blaba cara
  rect(mouseX-10,mouseY-50,20,20,2);
  fill(82,79,79);
ellipse(mouseX,mouseY-40,18,18);//ull cara
fill(3,46,160);
rect(mouseX-6,mouseY-25,20,14,7);//rectangle sensor vermell
fill(3,46,160);
rect(mouseX-40,mouseY-25,20,14,7);//rectangle 1
rect(mouseX+30,mouseY-25,10,14,7);//rectangle 2
fill(250,mouseX,mouseY);
ellipse(mouseX+4,mouseY-18,12,12);//sensor vermell cara
fill(82,79,79);
ellipse(mouseX+24,mouseY-18,15,15);//tub sensor cara
fill(0);
ellipse(mouseX+26,mouseY-23,10,10);//sensor negre cara
}
void cuerpo(){
  fill(255);
  rect(mouseX-48,mouseY+5,95,107);//cos
//quad(115,175,145,175,136,203,125,203);
fill(145,146,149);//gris
rect(mouseX-48,mouseY+112,95,10);
fill(3,46,160);//blau
stroke(2);
rect(mouseX-11,mouseY+40,20,45,5);//rectangle central cos Blau
fill(255);
//quad(125,203,136,203,146,230,115,230);
fill(255);
rect(mouseX-44,mouseY+10,14,72,7);//rectangle gran cos esquerra
rect(mouseX+28,mouseY+10,14,72,7);//rectangle gran cos dreta
rect(mouseX-27,mouseY+35,12,45,6);//rectangle petit cos esquerra
rect(mouseX+12,mouseY+35,12,45,6);//rectangle petit cos dreta
fill(3,46,160);
ellipse(mouseX,mouseY+100,20,20);// esfera cos abaix
ellipse(mouseX+38,mouseY+100,15,15);//esfera cos dreta
fill(3,46,160);
rect(mouseX-52/2,mouseY+10,52,5,2.5);//barra blava cos 1
rect(mouseX-52/2,mouseY+18,52,5,2.5);//barra blava cos 2
rect(mouseX-52/2,mouseY+26,52,5,2.5);//barra blava cos 3
rect(mouseX-44,mouseY+85,12,23,6);//rectangle petit cos esquerra
fill(255);
rect(mouseX-6,mouseY+43,10,20,2);//rectangle petit 1 cos central
rect(mouseX-6,mouseY+65,10,18,2);//rectangle petit 2 cos central
rect(mouseX-28,mouseY+90,14,14,7);//1
rect(mouseX+13,mouseY+90,14,14,7);//2
rect(mouseX-28,mouseY+82,14,6,2);//1.1
rect(mouseX+13,mouseY+82,14,6,2);//1.2
}
void extrimitats(){
  fill(255);
//triangle(77,140,95,200,105,170);
//triangle(77,140,60,200,95,200);//pota esquerra
//triangle(180,140,170,200,160,160);
//triangle(183,140,170,200,200,200);//pota esquerra
strokeWeight(1);
  rect(mouseX-65,mouseY+10,25,53,4);//braç part superior esquerra
  rect(mouseX+45,mouseY+10,20,53,4);//braç part superior dreta
rect(mouseX-60,mouseY+63,19,33);//braç 2 esquerra
rect(mouseX+45,mouseY+63,13,33);//braç 2 dreta
fill(3,46,160);//blau
rect(mouseX-60,mouseY+63,5,33);
rect(mouseX+53,mouseY+63,5,33);
fill(255);
rect(mouseX-65,mouseY+95,25,27,4);
rect(mouseX+40,mouseY+95,23,27,4);
fill(3,46,160);
//ellipse(125,203,7,7);//esfera pota principal
//ellipse(136,203,7,7);//esfera pota principal
rect(mouseX-62,mouseY+105,7,7,2);//quadrat pota esquerra
rect(mouseX+53,mouseY+105,7,7,2);//quadrat pota dreta
fill(57,58,59);
//rect(125,215,10,15);
}
