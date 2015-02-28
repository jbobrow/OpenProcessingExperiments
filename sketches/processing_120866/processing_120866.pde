
//aurea
float s1=.001; //velocidad del giro
float f1=-HALF_PI; //establece la posicion en radianes
float x1, x2, x3, x4, y1, y2, y3, y4;
float r1, r2, r3, r4, r5, r6, r7, r8;
  float a1= .618; //factores de proporcion
  float a2= .382; //
  float posicionX; // variable para resumir ubicacion en X
  float posicionY; // variable para resumir ubicacion en Y
  
void setup() {
size (618, 382);
background(100);
stroke(180);
}
void draw() {
  float w= width;
  float h= height;
  f1-=s1;
  //centros de los circulos
x1= w*a1;
x2= x1+((w-x1)*a2);
x3= x2-((x2-x1)*a2);
x4=x3+((x2-x3)*a2);
y1= h*a1;
y2= y1+((h-y1)*a2);
y3= y2-((y2-y1)*a2);
y4= y3+((y2-y3)*a2);
 //radios
r1= x1;
r2= y1;
r3= h-y1;
r4= x2-x1;
r5= x3-x1;
r6= y3-y1;
r7= x2-x4; 
r8= y2-y4; 
        //variables de posicion y radio
  float pX=x1;
  float pY=h;
  float r=r1;
line(x1, 0, x1, h);
line(x1, y1, w, y1);
line(x2, y1, x2, h);
line(x2, y2, x1, y2);
line(x3, y2, x3, y1);
line(x3, y3, x2, y3);
line(x4, y3, x4, y2);
line(x4, y4, x3, y4);
if (f1<-3.14){
pY=y1;
r=r2;
}
if (f1<-4.71){
pX=x2;
r=r3;
}
if (f1<-6.32){
pY=y2;
r=r4;
}
if (f1<-7.85){
pX=x3;
r=r5;
}
if (f1<-9.42){
pY=y3;
r=r6;
}
if (f1<-10.99){
pX=x4;
r=r7;
}
if (f1<-12.56){
pY=y4;
r=r8;
}
if (f1<-14.13){
s1=0;
}
posicionX= pX+sin(f1)*r;
posicionY=pY+cos(f1)*r;
point (posicionX, posicionY);
}
/*pivotes y radio
1  x1, h, r1
2  x1, y1, r2
3  x2, y1, r3
4  x2, y2, r4
5  x3, y2, r5
6  x3, y3, r6
*/


