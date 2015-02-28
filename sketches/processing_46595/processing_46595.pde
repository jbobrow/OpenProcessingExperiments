
int e=0;
int w=0;
int u=0;
int r=0;
int t=0;

void setup(){  

size (650, 640); 
}

void draw (){
background (0); 

{ 
   fill (131,0, random (255),237);
   ellipse (e,417,300,300);   
e=e+6;
if (e >= width + 100) {
  e=-100; 
 }


{ 
   fill (222,8,9);
   ellipse (u,195,234,234);   
u=u+2;
if (u >= width + 100) {
  u=-100; 
 }
 {
     fill (215,19,103);
   ellipse (r,341,530,530);   
r=r+28;
if (r >= width + 100) {
  r=-100; 
 }
 { 
   fill (15,19,103);
   ellipse (w,541,170,170);   
w=w+8;
if (w >= width + 100) {
  w=-100; 
 }
 { 
   fill (58,212, 55,200);
   ellipse (t,72,300,300);   
t=t+4;
if (t >= width + 100) {
  t=-100; 
 }

 stroke (240,210,39);     
strokeWeight (1);    

strokeWeight (2); 
for (int i=0; i<650; i+= 10){ 
  line (325,i,0,325);    
}

for (int i=0; i<650; i+= 10){ 
  line (650,325,325,i);     
}
 
 }

}
}
}
}
}




                
