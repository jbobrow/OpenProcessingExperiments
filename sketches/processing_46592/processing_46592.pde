
int e=0;
int w=0;
int u=0;
int r=0;
int t=0;
int p=0;

void setup(){   

size (750, 700);
}

void draw (){
background (0); 

{ 
   fill (131,0, random (255),237);
   ellipse (e,217,400,400);   
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
     fill (215,19,103,180);
   ellipse (r,290,530,530);  
   r=r+28;
if (r >= width + 100) {
  r=-100; 
 }
 { 
   fill (15,19,103,210);
   ellipse (w,521,220,220);  
w=w+12;
if (w >= width + 100) {
 w=-100; 
 }
  { 
   fill (211,176,34);
  ellipse (p,421,70,70);   
  p=p+18;
if (p >= width + 100) {
  p=-150; 
 }
 { 
   fill (58,212, 55);
   ellipse (t,72,300,300);  
t=t+4;
if (t >= width + 100) {
  t=-100; 
 }

{ for (int x = 2; x < 650; x= x+3);{   
for (int x = 4; x < 800; x= x+25){  
 for (int y=0; y <800; y= y +23){ 
  
 fill (224,208,208);
  
line(x,y,y,315);
 
 
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

