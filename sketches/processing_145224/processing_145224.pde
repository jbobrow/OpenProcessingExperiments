
float x, y;
float v = random(2,2);
float vy= random(2,2);



void setup(){
  size(500,500);
  x = random(width);
  y = random(height);
  //noCursor();
}
void draw(){
  background(255);
  extrimitats();
  cara();
  cuerpo();
  x = x+v;
  y = y + vy;
  limits();
  
  

 
  
}
void cara(){
  fill(145,146,149);//gris
ellipse(x,y,95,110);//cara
fill(3,46,160);
rect(x-17,y-25,9,14,4.5);//rectangle n3 cara
fill(3,46,160);
rect(x-48,y-5,95,5); //barra blaba cara
  rect(x-10,y-50,20,20,2);
  fill(82,79,79);
ellipse(x,y-40,18,18);//ull cara
fill(0,46,160);
rect(x-6,y-25,20,14,7);//rectangle sensor vermell
fill(3,46,160);
rect(x-40,y-25,20,14,7);//rectangle 1
rect(x+30,y-25,10,14,7);//rectangle 2
fill(250,0,0);
ellipse(x+4,y-18,12,12);//sensor vermell cara
if (x < width/2) {
fill(x,y,0);
ellipse(x+4,y-18,12,12);//sensor vermell cara
}
fill(82,79,79);
ellipse(x+24,y-18,15,15);//tub sensor cara
fill(0);
ellipse(x+26,y-23,10,10);//sensor negre cara
}
void cuerpo(){
  fill(255);
  rect(x-48,y+5,95,107);//cos
//quad(115,175,145,175,136,203,125,203);
fill(145,146,149);//gris
rect(x-48,y+112,95,10);
fill(3,46,160);//blau
stroke(2);
rect(x-11,y+40,20,45,5);//rectangle central cos Blau
fill(255);
//quad(125,203,136,203,146,230,115,230);
fill(255);
rect(x-44,y+10,14,72,7);//rectangle gran cos esquerra
rect(x+28,y+10,14,72,7);//rectangle gran cos dreta
rect(x-27,y+35,12,45,6);//rectangle petit cos esquerra
rect(x+12,y+35,12,45,6);//rectangle petit cos dreta
fill(3,46,160);
ellipse(x,y+100,20,20);// esfera cos abaix
ellipse(x+38,y+100,15,15);//esfera cos dreta
fill(3,46,160);
rect(x-52/2,y+10,52,5,2.5);//barra blava cos 1
rect(x-52/2,y+18,52,5,2.5);//barra blava cos 2
rect(x-52/2,y+26,52,5,2.5);//barra blava cos 3
rect(x-44,y+85,12,23,6);//rectangle petit cos esquerra
fill(255);
rect(x-6,y+43,10,20,2);//rectangle petit 1 cos central
rect(x-6,y+65,10,18,2);//rectangle petit 2 cos central
rect(x-28,y+90,14,14,7);//1
rect(x+13,y+90,14,14,7);//2
rect(x-28,y+82,14,6,2);//1.1
rect(x+13,y+82,14,6,2);//1.2
}
void extrimitats(){
  fill(255);
//triangle(77,140,95,200,105,170);
//triangle(77,140,60,200,95,200);//pota esquerra
//triangle(180,140,170,200,160,160);
//triangle(183,140,170,200,200,200);//pota esquerra
strokeWeight(1);
  rect(x-65,y+10,25,53,4);//braç part superior esquerra
  rect(x+45,y+10,20,53,4);//braç part superior dreta
rect(x-60,y+63,19,33);//braç 2 esquerra
rect(x+45,y+63,13,33);//braç 2 dreta
fill(3,46,160);//blau
rect(x-60,y+63,5,33);
rect(x+53,y+63,5,33);
fill(255);
rect(x-65,y+95,25,27,4);
rect(x+40,y+95,23,27,4);
fill(3,46,160);
//ellipse(125,203,7,7);//esfera pota principal
//ellipse(136,203,7,7);//esfera pota principal
rect(x-62,y+105,7,7,2);//quadrat pota esquerra
rect(x+53,y+105,7,7,2);//quadrat pota dreta
fill(57,58,59);
//rect(125,215,10,15);
}
void mousePressed(){
  v = random(-5,5);
  vy = random(-5,5);
  x = mouseX;
  y = mouseY;

}

void limits(){
    if (x+130/2 > width || x-130/2 < 0) {
    v = -v;
  }

  if (y+240/2 > height || y-100/2 < 0) {
    vy = -vy;
  }
}

