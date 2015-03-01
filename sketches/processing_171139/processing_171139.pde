

void setup (){
size (400,400);
background (255,255,53);
frameRate (10);
}
int x;
int y;
int lato=50;
float a = 0.0;
float s =0.0;
void draw (){

  a = a + 0.04;
s= cos(a)+2;
x= 0;
y=0;   
 

for( int r=0; r<10; r++ ){
  fill( random(253), random(255), random (56));
s = cos(a)*2;
  
  translate(width/2, height/2);
  scale(s); 
rect(x,y,lato,lato);
x=x+lato;
for (int s=0; s<10; s++);
fill( random(253), random(255), random (56));
s = cos(a)*2;
  
  translate(width/2, height/2);
  scale(s); 
rect(x,y+50,lato,lato);
x=x+lato;


}
}





