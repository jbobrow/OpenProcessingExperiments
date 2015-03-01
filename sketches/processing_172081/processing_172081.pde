

int x;
int y;

float a = 0.1;
float s =0.0;
void draw (){
 
  a = a + 0.02;
s= cos(a)+1;
x= 0;
y=0;  
  
 
for( int r=0; r<10; r++ ){
  fill( random(253), random(255), random (56));
s = cos(a)*2;
   
  translate(width/2, height/2);
  scale(s);
ellipse( x,y,20,30);
for (int s=0; s<10; s++);
fill( random(253), random(255), random (56));
s = cos(a)*3;
   
  translate(width/2, height/2);
  scale(s);
ellipse(x,y+20,40,50);
 
 
}
}

