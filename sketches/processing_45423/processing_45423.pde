
nt d=0;
int i=0;
int e=0;
int w=0;
int u=0;
int t=0;
int q=0;
int s=0;

void setup(){  

size (800, 600); 
}

void draw (){
background (0); 
{ 
   fill (131,0, random (255),237);
   ellipse (317,e,150,150); 
e=e+6;
if (e >= width + 100) {
  e=-100; 
 }


{ 
   fill (131,0, random (255),237);
   ellipse (457,q,78,78);  
q=q+2;
if (q >= width + 100) {
  q=-100; 
 }

{ 
   fill (222,8,9);
   ellipse (u,195,60,60);  
u=u+2;
if (u >= width + 100) {
  u=-100; 
 }
 
 { 
   fill (254,255,3);
   ellipse (195,i,60,60);   
i=i+3;
if (i >= height + 100) {
  i=-100; 
 }
 
 fill (58,212,355);
   ellipse (d,350,50,50);  
d=d+24;
if (d >= width + 100) {
  d=-100; 
 }
 
 { 
   fill (254,205,3);
   ellipse (635,s,60,60);   
s=s+33;
if (s >=height + 100) {
  s=-100; 
 }
 { 
   fill (15,19,103);
   ellipse (w,441,100,100);   
w=w+8;
if (w >= width + 100) {
  w=-100; 
 }
 { 
   fill (58,212, 55);
   ellipse (t,72,50,50);   
t=t+4;
if (t >= width + 100) {
  t=-100; 
 }

{ for (int x = 2; x < 650; x= x+3);{   
for (int x = 4; x < 800; x= x+25){  // formula for   900 limite y hasta donde va a crecer
 for (int y=0; y <800; y= y +23){
 fill (8,random (255 ),5);
  
rect (x,y,13,13);
 
 
 }
}
}
}
}
 }
 
}
}
}
}
}
}
                
