
int w=0;
int r=0;
int v=0;
int e=0;
int direccion = 30;
int u=0;
int t=0;

void setup(){  

size (800, 636); 
}

void draw (){
background (0);  
 smooth();
{ 
   fill (229,219,21);
   ellipse (e,317,100,100);  
e=e+6;
if (e >= width + 100) {
  e=-100; 
 }{ 
   fill (229,19,21);
   ellipse (w,565,100,100);  
w=w+14;
if (w >= width + 100) {
  w=-100; 
 }{ 
   fill (229,219,21);
   ellipse (r,685,100,100);  
r=r+3;
if (r >= width + 100) {
  r=-100; 
 }
{ 
   fill (101,77,211);
   ellipse (u,440,100,100);   
u=u+2;
if (u >= width + 100) {
  u=-100; 
 }
 
{ 
fill (152,61,148);
  ellipse(v, height/3.25, 100, 100);
  v = v+direccion;
  
 if (v >= width || v <= 0 ){
    direccion = direccion*-1;
}
   
}

 { 
   fill (234,101,24);
   ellipse (t,72,100,100);   
t=t+4;
if (t >= width + 100) {
  t=-100; 
 }

{ for (int x = 2; x < 650; x= x+3);{   
for (int x = 4; x < 800; x= x+25){ 
 for (int y=0; y <800; y= y +123){ 
  
 fill (8,random (255 ),5);
  
rect (x,y,20,20);
 
 
 }
}
}
}
}
}
}
}
}                               } 
