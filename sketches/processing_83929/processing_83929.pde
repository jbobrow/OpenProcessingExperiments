
//posiciones franjas
int posicion7=0;
int posicion6=40;
int posicion5=80;
int posicion4=120;
int posicion3=160;
int posicion2=200;
int posicion1=240;
int posicion=280;
void setup (){
noStroke();
size (200,200);

}
void draw(){
  //oscurecer franjas
if (mousePressed) {
   fill(0);
   rect(0, 0, 200, 200);
 }
 //crear franjas
fill (random(234),random(724),random(234),5);
rect(posicion,0,20,200);
posicion=(posicion+199)%200;
fill (random(456),random(111),random(345),5);
rect(posicion3,0,20,200);
posicion3=(posicion3+199)%200;
fill (random(734),random(456),random(123),5);
rect(posicion4,0,20,200);
posicion4=(posicion4+199)%200;
fill (random(250),random(100),random(780),5);
rect(posicion5,0,20,200);
posicion5=(posicion5+199)%200;
fill (random(300),random(100),random(340),5);
rect(posicion6,0,20,200);
posicion6=(posicion6+199)%200;
fill (random(123),random(456),random(789),5);
rect(posicion7,0,20,200);
posicion7=(posicion7+199)%200;
if (mousePressed) {
   fill(255, 255, 255, 1);
   ellipse((mouseX), (mouseY), 20, 20);
}
{
 
}
}

