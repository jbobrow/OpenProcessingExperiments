
  int cuadrado;
 int x=0;
 int y=0;
int speed=2;

void setup(){ 
size(200, 200); 
 }
 
void draw(){
  
float col=random(255);

background(255);
smooth();
noStroke();
fill (30,30,30,20);
ellipse(width/2,height/2,col,col);
cuadrado = 10; 
fill (0,col,col);
rect(x,y,cuadrado,cuadrado);
x=x+speed;
if(x>=width){
speed=speed*-1;
y=y+10;
}
else if (x<=-10){
speed=abs(speed);
y=y+10;
}
if (y>=height){
x=0;
y=0;
}
}

