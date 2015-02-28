
int e=0;
int w=0;
int u=0;
int t=0;

void setup(){   

size (800, 600); 

}

void draw (){
background (0);  

{ 
   fill (131,0, random (255),237);
   ellipse (e,317,100,100);  
e=e+6;
if (e >= width + 100) {
  e=-100; 
 }


{ 
   fill (222,8,9);
   ellipse (u,195,100,100);  
u=u+2;
if (u >= width + 100) {
  u=-100; 
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
   ellipse (t,72,100,100);  
t=t+4;
if (t >= width + 100) {
  t=-100; 
 }

{ for (int x = 2; x < 650; x= x+3);{   
for (int x = 4; x < 800; x= x+25){  
 for (int y=0; y <800; y= y +23){ 
  
 fill (8,random (255 ),5,123);
  
rect (x,y,20,20);
 
 
 }
}
}
}
}
}
}
}
}
                
